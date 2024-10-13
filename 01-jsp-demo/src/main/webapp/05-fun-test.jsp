<!-- Podemos realizar importaciones de Java en JSP de esta forma: -->
<%@ page import="com.mlorenzo.jsp.*, java.util.ArrayList" %>
<html>
	<body>
		<!-- JSP Expression (solo permite agregar una l�nea de Java). -->
		<!-- Invocamos un m�todo de nuestra clase "FunUtils" indicando la ruta de paquetes. -->
		Let's have some fun: <%= com.mlorenzo.jsp.FunUtils.makeItLower("FUN FUN FUN") %>
		
		<br/><br/>
		
		<!-- Invocamos un m�todo de nuestra clase "FunUtils" usando las importaciones de paquetes -->
		Let's have some fun: <%= FunUtils.makeItLower("FUN FUN FUN") %>
	</body>
</html>