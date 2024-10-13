<!DOCTYPE html>
<html>
	<head>
		<title>Update Student</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>FooBar University</h2>
			</div>
		</div>
		
		<div id="container">
			<h3>Update Student</h3>
			
			<form action="StudentControllerServlet" method="GET">
				<input type="hidden" name="command" value="UPDATE" />
				<input type="hidden" name="studentId" value="${student.id}" />
				
				<table>
					<tbody>
						<tr>
							<td><label>First Name:</label></td>
							<td><input type="text" name="firstName" value="${student.firstName}" /></td>
						</tr>
						<tr>
							<td><label>Last Name:</label></td>
							<td><input type="text" name="lastName" value="${student.lastName}" /></td>
						</tr>
						<tr>
							<td><label>Email:</label></td>
							<td><input type="text" name="email" value="${student.email}" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input class="save" type="submit" value="Save" /></td>
						</tr>
					</tbody>
				</table>
			</form>
			
			<p>
				<a href="StudentControllerServlet">Back to List</a>
			</p>
		</div>
	</body>
</html>