<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="components/css/allcss.jsp"%>
</head>
<body>

<%User user = (User)session.getAttribute("userobj"); 

	if(user == null){
		response.sendRedirect("login.jsp");
	}
	else{%>
		
<%@ include file="components/user-navbar.jsp" %>
<%-- <%User user1 = (User)session.getAttribute("userobj");  %> --%>

	<h1 class="text-center">Welcome <%=user.getName()%> to Home Page</h1>
	<%}
	
%>
</body>
</html>