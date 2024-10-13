<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Every page that uses the JSTL Function tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<body>
		<!-- "set" es un etiqueta de JSTL Core que nos permite crear variables y asignar valores -->
		<c:set var="data" value="luv2code"/>
		
		<!-- "lenght" es una etiqueta de JSTL Functions que nos permite obtener la longitud de un string o colección -->
		Length of the string <b>${data}</b>: ${fn:length(data)}
		
		<br/><br/>
		
		<!-- "toUpperCase" es una etiqueta de JSTL Functions que nos permite poner todas las letras de un string en mayúsculas -->
		Uppercase version of string <b>${data}</b>: ${fn:toUpperCase(data)}
		
		<br/><br/>
		
		<!-- "startsWith" es una etiqueta de JSTL Functions que nos permite verificar si un string compienza por una determinada expresión o término -->
		Does the string <b>${data}</b> start with <b>luv?</b>: ${fn:startsWith(data, "luv")}
	</body>
</html>