<html>
	<body>
		<h3>Hello World of JSP</h3>
		
		<!-- JSP Scriptlet (Permite agregar varias líneas de Java): -->
		<%
			for(int i = 1; i <= 5; i++)
				out.println("<br/>I really luv2code: " + i);
		%>
	</body>
</html>