<html>
	<body>
		<h3>JSP Built-In Objects</h3>
		
		<!-- JSP Expression (solo permite agregar una l�nea de Java): -->
		<!-- "request" es un objeto propio de JSP que contiene datos e informaci�n sobre la petici�n http.
		     Como es propio de JSP, podemos usarlo directamente de esta forma: -->
		Request user agent: <%= request.getHeader("User-Agent") %>
		
		<br/><br/>
		
		Request language: <%= request.getLocale() %>
	</body>
</html>