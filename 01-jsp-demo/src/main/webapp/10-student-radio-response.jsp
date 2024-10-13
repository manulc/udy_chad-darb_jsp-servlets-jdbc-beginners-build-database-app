<html>
	<head>
		<title>Student Confirmation</title>
	</head>
	<body>
		<!-- "param" es un objeto propio de JSP que nos permite acceder a los campos enviados desde un formulario. -->
		The student is confirmed: ${param.firstName} ${param.lastName}
		
		<br/><br/>
		
		The student's favorite programming language: ${param.favoriteLanguage}
	</body>
</html>