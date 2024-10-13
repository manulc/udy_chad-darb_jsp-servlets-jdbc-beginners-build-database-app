<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// just create some sample data ... normally provided by MVC
	//String[] cities = new String[]{"Mumbai", "Singapore", "Philadelphia"};
	String[] cities = {"Mumbai", "Singapore", "Philadelphia"}; // Otra forma equivalente

	pageContext.setAttribute("myCities", cities);
%>

<html>
	<body>
		<!-- "forEach" es un etiqueta de JSTL Core que nos permite iterar sobre colecciones -->
		<c:forEach var="tempCity" items="${myCities}">
			${tempCity}<br/>
		</c:forEach>
	</body>
</html>