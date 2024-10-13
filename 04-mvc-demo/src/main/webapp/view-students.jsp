<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<body>
		<!-- En este caso, "student_list" es un atributo que hemos creado en la petición http usando el Servlet "MvcDemoServlet" -->
		<c:forEach var="student" items="${student_list}">
			${student} <br/>
		</c:forEach>
	</body>
</html>