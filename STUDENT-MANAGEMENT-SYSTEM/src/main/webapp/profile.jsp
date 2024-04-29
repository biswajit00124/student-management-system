<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
<%@ include file="components/css/allcss.jsp"%>
</head>
<body>
	<%
	User user = (User) session.getAttribute("userobj");
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {	
	%>
	<%@ include file="components/user-navbar.jsp"%>
	<%-- <%User user1 = (User)session.getAttribute("userobj");  %> --%>
	
	<h3 class="text-center text-success">USER PROFILE PAGE</h3>

	<table class="table table-striped">
		<thead style="text-align: center;">
			<tr style="text-align: center;">
				<!-- <th>ID</th> -->
				<th>NAME</th>
				<th>AGE</th>
				<th>EMAIL</th>
				<th>MOBILE</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%-- <td style="text-align: center;"><%=user.getId()%></td> --%>
				<td style="text-align: center;"><%=user.getName()%></td>
				<td style="text-align: center;"><%=user.getAge()%></td>
				<td style="text-align: center;"><%=user.getEmail()%></td>
				<td style="text-align: center;"><%=user.getMobile()%></td>
			</tr>
		</tbody>
	</table>
	<%} %>

</body>
</html>