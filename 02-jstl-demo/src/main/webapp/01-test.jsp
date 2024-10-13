<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<body>
		<!-- "set" es un etiqueta de JSTL Core que nos permite crear variables y asignar valores -->
		<c:set var="stuff" value="<%= new java.util.Date() %>" />
		
		<!-- Muestra el valor de la variable "stuff" -->
		Time on the server is ${stuff}
	</body>
</html>