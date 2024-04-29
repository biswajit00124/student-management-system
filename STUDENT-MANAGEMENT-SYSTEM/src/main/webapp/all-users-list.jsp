<%@page import="com.org.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/css/allcss.jsp"%>
</head>
<body>

	<%@include file="components/user-navbar.jsp"%>
	<h2 class="text-center text-warning bg-secondary text-dark">User
		List Details</h2>
		
		<%String user_deleted = (String) session.getAttribute("deleted"); 
			if(user_deleted != null){%>
				<h3 class="text-center text-success"><%=user_deleted%></h3>	
			<%	session.removeAttribute("deleted");
			}%>
		
		
	<!-- -------------new user added success message------------------------ -->
	<%
	String msg = (String) session.getAttribute("added");
	if (msg != null) {
	%>
	<h3 class="text-center text-success"><%=msg%></h3>
	<%
	session.removeAttribute("added");
	}
	%>
	<!-- -------------new user added success message------------------------ -->
	<br>
	<!-- -----------success message when the user us updated-------------------------- -->
	<%
	String str = (String) session.getAttribute("updated");
	if (str != null) {
	%>
	<p class="fs-4 text-center text-success"><%=str%></p>
	<%
	session.removeAttribute("updated");
	}
	%>
	<!-- -----------success message when the user us updated-------------------------- -->

	<table class="table table-striped">
		<thead style="text-align: center;">
			<tr style="text-align: center;">
				<!-- <th>ID</th> -->
				<th>NAME</th>
				<th>AGE</th>
				<th>EMAIL</th>
				<th>MOBILE</th>
				<th>ACTION</th>
			</tr>
		</thead>
		<tbody>

			<!-- ------------------------code for skipping the current login user-------------------- -->
			<%
			User user_skip = (User) session.getAttribute("userobj");
			%>

			<%
			HttpSession session2 = request.getSession();
			if (session2 != null) {
				UserDao userDao = new UserDao();

				List<User> user_list = userDao.fetchAllUsers();
				for (User user : user_list) {
					if (user.getId() == user_skip.getId()) {
				continue;
					}
			%>
			<!-- ------------------------code for skipping the current login user-------------------- -->
			<tr>
				<%-- <td style="text-align: center;"><%=user.getId()%></td> --%>
				<td style="text-align: center;"><%=user.getName()%></td>
				<td style="text-align: center;"><%=user.getAge()%></td>
				<td style="text-align: center;"><%=user.getEmail()%></td>
				<td style="text-align: center;"><%=user.getMobile()%></td>
				<td style="text-align: center;"><a class="btn btn-success"
					href="update-user.jsp?id=<%=user.getId()%>">update</a> <a
					class="btn btn-danger" href="delete-user.jsp?id=<%=user.getId()%>">delete</a></td>
			</tr>
			<%
			}
			} else {
			response.sendRedirect("error.jsp");
			}
			%>

		</tbody>
	</table>
	



</body>
</html>