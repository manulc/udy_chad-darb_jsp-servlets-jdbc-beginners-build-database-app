<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Student Tracker App</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>FooBar University</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
				<input class="add-student-button" type="button" value="Add Student"
					onclick="window.location.href='add-student-form.jsp'; return false;" />
			
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					<!-- "students_list" es un atributo de la petici�n http establecido en el Servlet "StudentControllerServler" -->
					<c:forEach var="student" items="${students_list}">
						<!-- set up a url to update a student -->
						<c:url var="updateLink" value="StudentControllerServlet">
							<!-- Par�metros que viajar�n en la url -->
							<c:param name="command" value="LOAD" />
							<!-- JSP invocar� al m�todo getter de esta propiedad de forma impl�tica -->
							<c:param name="studentId" value="${student.id}" />
						</c:url>
						
						<!-- set up a url to delete a student -->
						<c:url var="deleteLink" value="StudentControllerServlet">
							<!-- Par�metros que viajar�n en la url -->
							<c:param name="command" value="DELETE" />
							<!-- JSP invocar� al m�todo getter de esta propiedad de forma impl�tica -->
							<c:param name="studentId" value="${student.id}" />
						</c:url>
					
						<!-- JSP invocar� a los m�todos getter de estas propiedades de forma impl�tica -->
						<tr>
							<td>${student.firstName}</td>
							<td>${student.lastName}</td>
							<td>${student.email}</td>
							<td>
								<!-- "updateLink" es la variable que se crea para cada estudiante mediante la etiqueta o tag "url" -->
								<a href="${updateLink}">Update</a>
								|
								<!-- "deleteLink" es la variable que se crea para cada estudiante mediante la etiqueta o tag "url" -->
								<a href="${deleteLink}" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>