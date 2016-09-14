<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Get Goals Report</title>

</head>
<body>

	<div class="container">

		<table>
			<tr>
				<th>Minutes</th><th>Exercise Minutes</th><th>Activity</th>
			</tr>
			
			<c:forEach items="${goalReports}" var="goalReport">
				<tr>
					<td>${goalReport.goalMinutes}</td><td>${goalReport.exerciseMinutes }</td><td>${goalReport.exerciseActivity }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="jquery-1.8.3.js">
		
	</script>
	<script src="assets/js/bootstrap.js">
		
	</script>
</body>
</html>


