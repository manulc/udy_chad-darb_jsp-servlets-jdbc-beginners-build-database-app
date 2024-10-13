<!-- Every page that uses the JSTL Core tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Every page that uses the JSTL Message Formating I18N (Internationalization) tags must include this reference -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- "set" es un etiqueta de JSTL Core que nos permite crear variables y asignar valores -->
<!-- El locale se obtiene desde la url si viene o, en caso contrario, desde la petición http que haga el navegador. -->
<c:set var="locale" value="${not empty param.locale ? param.locale : pageContext.request.locale}" scope="session"/>

<!-- "setLocale" es un etiqueta de JSTL Message Formating I18N que nos permite establecer el locale -->
<fmt:setLocale value="${locale}"/>

<!-- "setBundle" es un etiqueta de JSTL Message Formating I18N que nos permite establecer los archivos de propiedades
     (paquete o directorio donde se encuentran los archivos + el nombre de los archivos sin el sufijo del locale) -->
<fmt:setBundle basename="com.mlorenzo.jsp.i18n.resources.mylabels"/>

<html>
	<body>
		<!-- Enlaces para cambiar de locale (idioma) -->
		<a href="08-i18n-messages-test.jsp?locale=en_US">English (US)</a>
		|
		<a href="08-i18n-messages-test.jsp?locale=es_ES">Spanish (ES)</a>
		|
		<a href="08-i18n-messages-test.jsp?locale=de_DE">German (DE)</a>
	
		<hr/>
	
		<!-- "message" es un etiqueta de JSTL Message Formating I18N que nos permite obtener un texto a partir de una clave desde un archivo de propiedades. -->
		<!-- El archivo de propiedades usado dependerá del locale definido. -->
		<!-- En este caso muestra el texto asociado a la clave "label.greeting" desde el archivo de propiedades. -->
		<fmt:message key="label.greeting"/> <br/><br/>
		
		<fmt:message key="label.firstname"/> <i>John</i> <br/>
		
		<fmt:message key="label.lastname"/> <i>Doe</i> <br/><br/>
		
		<fmt:message key="label.welcome"/>
		
		<hr/>
		
		Selected locale: ${locale}
	</body>
</html>