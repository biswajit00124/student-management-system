<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .error-container {
    text-align: center;
  }
  h1 {
    font-size: 3em;
    color: #dc3545;
  }
  p {
    font-size: 1.2em;
    color: #6c757d;
  }
  img {
    width: 300px;
    height: auto;
    margin-top: 20px;
  }
</style>
</head>
<body>
	<div class="error-container">
		<h1>Oops! Something went wrong.</h1>
		<p>We couldn't find the page you're looking for.</p>
		<!-- <img src="https://bit.ly/3xHhzhO"> -->
		<h3><a style="padding: 5px;text-decoration: none;
		background-color: olive;border-radius: 5px;margin:5px;" href="index.jsp">
			click here</a>Please Login to continue</h3>
	</div>
</body>
</html>