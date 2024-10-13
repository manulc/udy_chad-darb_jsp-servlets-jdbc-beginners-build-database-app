<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Every page that uses the JSTL Function tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<body>
		<!-- "set" es un etiqueta de JSTL Core que nos permite crear variables y asignar valores -->
		<c:set var="data" value="Singapore,Tokyo,Mumbai,London"/>
		
		<h3>Split Demo</h3>
		
		<!-- "split" es una etiqueta de JSTL Functions que nos permite separar un string a partir de un delimitador o separador -->
		<c:set var="citiesArray" value="${fn:split(data, ',')}"/>
		
		<!-- "forEach" es un etiqueta de JSTL Core que nos permite iterar sobre colecciones -->
		<c:forEach var="tempCity" items="${citiesArray}">
			${tempCity} <br/>
		</c:forEach>
		
		<h3>Join Demo</h3>
		
		<!-- "join" es una etiqueta de JSTL Functions que nos permite unir los elementos de un array en un string mediante un delimitador -->
		<c:set var="fun" value="${fn:join(citiesArray, '*')}"/>
		
		Result of joining: ${fun}
	</body>
</html>