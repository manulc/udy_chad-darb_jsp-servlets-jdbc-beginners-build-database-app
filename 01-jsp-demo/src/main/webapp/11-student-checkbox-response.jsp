<html>
	<head>
		<title>Student Confirmation</title>
	</head>
	<body>
		<!-- "param" es un objeto propio de JSP que nos permite acceder a los campos enviados desde un formulario. -->
		The student is confirmed: ${param.firstName} ${param.lastName}
		
		<br/><br/>
		
		Favorite Programming Languages:
		<!-- display list of "favouriteLanguage" -->
		<ul>
			<!-- JSP Scriptlet (Permite agregar varias líneas de Java): -->
			<%
				// Usamos el método "getParameterValues" cuando queremos recuperar más de un valor asociado a un mismo atributo o campo.
				// "request" es un objeto propio de JSP que contiene datos e información sobre la petición http.
				String[] langs = request.getParameterValues("favoriteLanguage");
			
				for(String lang: langs)
					out.println("<li>" + lang + "</li>");
			%>
		</ul>
	</body>
</html>