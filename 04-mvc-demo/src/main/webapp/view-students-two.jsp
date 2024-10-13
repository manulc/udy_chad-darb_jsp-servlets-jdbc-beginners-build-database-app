<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<body>
		<h2>Student Table Demo</h2>
		<hr>
		
		<table border=1>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
			
			<!-- En este caso, "student_list" es un atributo que hemos creado en la petición http usando el Servlet "MvcDemoServletTwo" -->
			<c:forEach var="student" items="${student_list}">
				<tr>
					<!-- De forma implítica, JSP invoca a los correspondientes métodos getter de estas propiedades. -->
					<td>${student.firstName}</td>
					<td>${student.lastName}</td>
					<td>${student.email}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>