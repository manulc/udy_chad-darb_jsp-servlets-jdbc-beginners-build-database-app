<html>
	<body>
		<!-- JSP Declaration (permite definir funciones en Java): -->
		<%!
			String makeItLower(String data) {
				return data.toLowerCase();
			}
		%>
		
		<!-- JSP Expression (solo permite agregar una l�nea de Java): -->
		Lower case "Hello World": <%= makeItLower("Hello World") %>
	</body>
</html>