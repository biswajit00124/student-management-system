 <%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/css/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>



	<%@ include file="components/user-navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">

						<%
						
						UserDao dao = new UserDao();
						int id = Integer.parseInt(request.getParameter("id"));
						User get_user =(User) dao.fetchUserById(id);
						%>
	
						<p class="fs-4 text-center">Update User Profile</p>
						<p class="fs-4 text-center text-warning">Welcome back <%=get_user.getName()%></p>

						<form action="updateuser" method="post">
							<div class="mb-3">
								<label class="form-label"></label> <input name="id" value="<%=get_user.getId()%>"
									type="hidden" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Name</label> <input name="name" value="<%=get_user.getName()%>"
									type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input name="age" value="<%=get_user.getAge()%>"
									type="tel" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile</label><input name="mobile" value="<%=get_user.getMobile()%>"  
									type="tel" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input value="<%=get_user.getEmail() %>"
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input value="<%=get_user.getPassword()%>"
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html> 