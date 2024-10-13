<html>
	<head>
		<title>Confirmation</title>
	</head>
	<body>
		<%
			// Read form data
			String favLang = request.getParameter("favoriteLanguage");
		
			// Create the cookie
			Cookie cookie = new Cookie("myApp.favoriteLanguage", favLang);
			
			// Set the life span ... total number of seconds
			// Nota: Si no se establece esta propiedad, por defecto es 0 y significa que cuando el navegador se cierre, se elimina
			// automáticamente la cookie.
			cookie.setMaxAge(60 * 60 * 24 * 365); // <-- for one year
			
			// Send cookie to browser
			// "response" es otro objeto propio de JSP y, por lo tanto, puede usarse directamente. Contiene datos e información
			// sobre la respuesta de la petición http.
			response.addCookie(cookie);
		%>
		
		Thanks! We set you favorite programming language to: ${param.favoriteLanguage}
		
		<br/><br/>
		
		<a href="13-cookies-homepage.jsp">Return to homepage.</a>
	</body>
</html>