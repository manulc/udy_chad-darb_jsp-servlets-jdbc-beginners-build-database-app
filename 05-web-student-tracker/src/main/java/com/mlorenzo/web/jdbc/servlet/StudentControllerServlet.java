package com.mlorenzo.web.jdbc.servlet;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.mlorenzo.web.jdbc.dao.StudentDao;
import com.mlorenzo.web.jdbc.model.Student;

@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Define datasource/connection pool for Resource Injection.
	// Mediante esta anotación, inyectamos en esta propiedad el DataSource "jdbc/web_student_tracker" definido en el archivo
	// "context.xml" dentro del directorio "META-INF".
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;
	
	private StudentDao studentDao;
	
	// Este método será invocado por el servidor Tomcat justo cuando se inicialice o se cargue por primera vez.
	// Por lo tanto, podemos implementar en este método nuestra inicialización personalizada.
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db dao ... and pass in the conn pool / datasource
		studentDao = new StudentDao(dataSource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// read the command parameter from the request.
		// Utilizamos este parámetro para poder determinar si se debe listar los estudiantes, si se debe agregar un nuevo estudiante,
		// si se debe cargar la información de un estudiante, si se debe actualizar un estudiante o si se debe eliminar un estudiante.
		String command = request.getParameter("command");
		
		// if the command is missing, then default to listing students
		if(command == null)
			command = "LIST";
		
		try {
			// route to the appropriate method
			switch(command) {
				case "LIST":
					listStudents(request, response);
					break;
				case "ADD":
					addStudent(request, response);
					break;
				case "LOAD":
					loadStudent(request, response);
					break;
				case "UPDATE":
					updateStudent(request, response);
					break;
				case "DELETE":
					deleteStudent(request, response);
					break;
				default:
					listStudents(request, response);
			}	
		}
		catch(Exception e) {
			throw new ServletException(e);
		}
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get students from dao
		List<Student> students = studentDao.getStudents();
		
		// add students to the request
		request.setAttribute("students_list", students);
		
		// send do JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		// create a new student object
		Student student = new Student(firstName, lastName, email);
		
		// add the student to the database
		studentDao.addStudent(student);
		
		// redirect to main page (the students list)
		// Nota: Usamos "redirect" en vez de "forward" para evitar el caso de que el usuario recargue la página del navegador 
		// y se vuelva a crear el usuario de nuevo en la base de datos.
		response.sendRedirect(request.getContextPath());
	}
	
	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student id from the request
		String studentId = request.getParameter("studentId");
		
		// get the student from the database
		Student student = studentDao.getStudent(studentId);
		
		// place student in a request attribute
		request.setAttribute("student", student);
		
		// send to JSP page: update-student-form.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		// create a new student object
		Student student = new Student(id, firstName, lastName, email);
		
		// perform update on database
		studentDao.updateStudent(student);
		
		// redirect to main page (the students list)
		// Nota: Usamos "redirect" en vez de "forward" para evitar el caso de que el usuario recargue la página del navegador 
		// y se vuelva a actualizar el usuario de nuevo en la base de datos (En este caso, no afectaría a la base de datos porque
		// la operación de actualización es idempotente pero la sentencia SQL sí se vuelve a ejecutar).
		response.sendRedirect(request.getContextPath());
	}
	
	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student id from the request
		String studentId = request.getParameter("studentId");
		
		// delete student from the database
		studentDao.deleteStudent(studentId);
		
		// redirect to main page (the students list)
		// Nota: Usamos "redirect" en vez de "forward" para evitar el caso de que el usuario recargue la página del navegador 
		// y se vuelva a eliminar el usuario de nuevo en la base de datos (En este caso, no afectaría a la base de datos porque
		// la operación de eliminar es idempotente pero la sentencia SQL sí se vuelve a ejecutar).
		response.sendRedirect(request.getContextPath());
	}
}
