<%@page import="com.org.dao.UserDao"%>
<%@page import="com.org.dto.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/css/allcss.jsp"%>
<script>
	window.history.forward();
</script>
</head>
<body>
	<%@ include file="components/user-navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>

	<div
		class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5"
		tabindex="-1" role="dialog" id="modalChoice">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-3 shadow">
				<div class="modal-body p-4 text-center">
					<h5 class="mb-0">
						User Action <i class="fa-solid fa-octagon-exclamation"></i>
					</h5>
					<p class="mb-0">Are you sure you want to Logout ?</p>
				</div>
				<div class="modal-footer flex-nowrap p-0">
					<a type="button" href="logout"
						class="btn btn-lg btn-link fs-6 text-decoration-none col-6 py-3 m-0 rounded-0 border-end"
						fdprocessedid="2qsnu"> <strong style="color: red;">logout
							<i class="fa-solid fa-right-from-bracket"></i>
					</strong>
					</a> <a type="button" href="home.jsp"
						class="btn btn-lg btn-link fs-6 text-decoration-none col-6 py-3 m-0 rounded-0"
						data-bs-dismiss="modal" fdprocessedid="msrvfi"><strong>Cancel</strong></a>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>