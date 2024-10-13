<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Importaciones de Java -->
<%@ page import="java.util.*,com.mlorenzo.jsp.Student" %>

<%
	//just create some sample data ... normally provided by MVC
	List<Student> students = new ArrayList<>();

	students.add(new Student("John", "Doe", false));
	students.add(new Student("Maxwell", "Johnson", false));
	students.add(new Student("Mary", "Smith", true));
	
	pageContext.setAttribute("myStudents", students);
%>

<html>
	<body>
		<table border=1>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Is Gold Customer?</th>
			</tr>
			
			<!-- "forEach" es un etiqueta de JSTL Core que nos permite iterar sobre colecciones -->
			<c:forEach var="tempStudent" items="${myStudents}">
				<tr>
					<!-- Se invoca a los métodos getter de las propiedades de forma implícita -->
					<td>${tempStudent.firstName}</td>
					<td>${tempStudent.lastName}</td>
					<td>${tempStudent.goldCustomer}</td>
				</tr>
			</c:forEach>
		</table>
		
	</body>
</html>