package com.mlorenzo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// Un Servlet es una clase de Java que extiende de la clase "HttpServlet".

// Mediante esta anotación, podemos personalizar el Servlet.
// Aquí indicamos la ruta asociada al Servlet.
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentServlet() {
    }

    // Este método se ejecutará cada vez que se haga una petición http GET a este Servlet.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	// Este método se ejecutará cada vez que se haga una petición http POST a este Servlet.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: set the content type
		response.setContentType("text/html");
		
		// Step 2: get the printwriter
		PrintWriter out = response.getWriter();
		
		// Step 3: generate the HTML content
		out.println("<html><body>");
		
		// El método "getParameter" del objeto "request" (contiene datos e información de la petición http) nos permite
		// obtener el valor de un parámetro que viaja en la url (GET) o en el cuerpo (POST) de la petición http.
		out.println("The student is confirmed: "
				+ request.getParameter("firstName") + " "
				+ request.getParameter("lastName"));
		
		out.println("</body></html>");
		
		// PrintWriter extiende de la clase Write que implementa la interfaz Closeable. Por lo tanto, en vez de invocar al
		// método "close" manualmente, otra opción sería usar un bloque try-with-resources sobre el PrintWriter para que se
		// invoque a este método automáticamente.
		out.close();
	}

}
