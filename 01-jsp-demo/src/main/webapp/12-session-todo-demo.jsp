<!-- This code performs an import of the package java.util. We make use of the List and ArrayList from this package -->
<%@ page import="java.util.*" %>
<html>
	<body>
		<!-- Step 1: Create HTML Form -->
		<!-- The action will point back to the same JSP. So effectively, we are submitting form data back to ourselves -->
		<form action="12-session-todo-demo.jsp">
			Add new item: <input type="text" name="item"/>
			
			<input type="submit" value="Submit"/>
		</form>
		
		<!-- Step 2: Add new item to "To Do" list -->
		<%
			// Get the TO DO items from the session.
			// This section of code access the JSP session object. The session object is unique for each web user.
			// We attempt to get the TO DO items from the session. We make use of the attribute name "myToDoList".
			// This is basically the key/label to look up data from the session.
			List<String> items = (List<String>) session.getAttribute("myToDoList");
			
			// If the TO DO items doesn't exist, then create a new one.
			if(items == null) {
				items = new ArrayList<String>();
				session.setAttribute("myToDoList", items);
			}
			
			// See if there is form data to add.
			String item = request.getParameter("item");
			
			// Since we're using object references, remember that "items" is a variable that holds a reference to an object.
			// Then it points to the same area of memory that is used by the session. So in effect, the users's session has now been updated with this new entry.
			// No se permiten elementos duplicados.
			if(item != null && !item.trim().equals("") && !items.contains(item))
				items.add(item);
		%>
		
		<!-- Step 3: Display all "To Do" items from session -->
		<hr/>
		<b>To Do List Items:</b> <br/>
		
		<ol>
			<%
				for(String tempItem: items)
					out.println("<li>" + tempItem + "</li>");
			%>
		</ol>
	</body>
</html>