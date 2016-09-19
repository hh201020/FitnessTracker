<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Log In</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<style>
body {
	padding-top: 60px; /* 60px to make the container go all the way
      to the bottom of the topbar */
}
</style>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js">
      </script>
    <![endif]-->
<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffeeee;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>

</head>
<body onload='document.f.j_username.focus();'>
	<h3>Fitness Tracker Custom Login Page</h3>
	<c:if test="${not empty error} }">
		<div class="errorblock">
			Your login was unsuccessful. <br />
			Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} }
		</div>
	</c:if>

<c:if test="${param.error != null}"> 
	<p>Invalid username / password</p>
</c:if>
<c:url var="loginUrl" value="/"/> 
<form action="${loginUrl}" method="post">
	<p><label for="username">User:</label></p>
	<input type="text" id="username" name="username"/> 

	<p><label for="password">Password:</label></p>
	<input type="password" id="password" name="password"> 

	<div>
		<input name="submit" type="submit"/>
	</div>
</form>
<!-- 	<form action="j_spring_security_check" name="f" method="post">
		<table>
			<tr>
				<td>User:</td>
				<td><input type="text" name="j_username" value=""></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="j_password" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="reset" name="reset" ></td>
			</tr>
		</table>
	</form>
 -->
</body>
</html>


