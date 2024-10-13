<html>
	<body>
		<h3>Training Portal</h3>
		
		<!-- Read the favorite programming language cookie -->
		<%
			// The default ... if there are no cookies
			String favLang = "Java";
		
			// Get the cookies from the browser request
			Cookie[] cookies = request.getCookies();
			
			// Find out favorite programming language cookie
			for(Cookie cookie: cookies) {
				if("myApp.favoriteLanguage".equals(cookie.getName())) {
					favLang = cookie.getValue();
					break;
				}
			}
		%>
		
		<!-- Now show a personalized page ... use the "favLang" variable -->
		
		<!-- Show new books for this lang -->
		<h4>New Books for <%= favLang %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		
		<h4>Latest News reports for <%= favLang %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		
		<h4>Hot Jobs for <%= favLang %></h4>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		
		<hr/>
		<a href="13-cookies-personalize-form.html">Personalize this page</a>
	</body>
</html>