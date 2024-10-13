package com.mlorenzo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Un Servlet es una clase de Java que extiende de la clase "HttpServlet".

// Mediante esta anotación, podemos personalizar el Servlet.
// Aquí indicamos la ruta asociada al Servlet.
@WebServlet("/TestParamServlet")
public class TestParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestParamServlet() {
    }

    // Este método se ejecutará cada vez que se haga una petición http GET a este Servlet.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: set content type
		response.setContentType("text/html");
		
		// Step 2: get printwriter
		PrintWriter out = response.getWriter();
		
		// Step 3: read configuration params from web.xml
		ServletContext context = getServletContext(); // inherit from HttpServlet
		String maxCartSize = context.getInitParameter("max-shopping-cart-size");
		String projectTeamName = context.getInitParameter("project-team-name");
		
		// Step 4: generate HTML content
		out.println("<html><body>");
		
		out.println("Max cart size: " + maxCartSize);
		out.println("<br/><br/>");
		out.println("Project team name: " + projectTeamName);
		
		out.println("</body></html>");
		
		// PrintWriter extiende de la clase Write que implementa la interfaz Closeable. Por lo tanto, en vez de invocar al
		// método "close" manualmente, otra opción sería usar un bloque try-with-resources sobre el PrintWriter para que se
		// invoque a este método automáticamente.
		out.close();
	}

	// Este método se ejecutará cada vez que se haga una petición http POST a este Servlet.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
