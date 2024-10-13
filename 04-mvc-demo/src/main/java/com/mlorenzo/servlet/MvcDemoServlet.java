package com.mlorenzo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MvcDemoServlet")
public class MvcDemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MvcDemoServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: add data.
		String[] students = {"Susan", "Anil", "Mohamed", "Trupti"};
		
		// Crea un atributo llamado "student_list" en la petición http con el array de estudiantes.
		request.setAttribute("student_list", students);
		
		// Step 2: get request dispatcher.
		// Necesitamos este dispatcher de la petición http para poder redirigir a la vista JSP.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view-students.jsp");
		
		// Step 3: forward the request to JSP.
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
