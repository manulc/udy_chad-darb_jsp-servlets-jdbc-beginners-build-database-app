package com.mlorenzo.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mlorenzo.model.Student;
import com.mlorenzo.service.StudentService;

@WebServlet("/MvcDemoServletTwo")
public class MvcDemoServletTwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MvcDemoServletTwo() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: get the students data from service class (model).
		List<Student> students = StudentService.getStudents();
		
		// Step 2: add student to request object.
		request.setAttribute("student_list", students);
		
		// Step 3: get request dispatcher.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view-students-two.jsp");
		
		// Step 4: forward to JSP.
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
