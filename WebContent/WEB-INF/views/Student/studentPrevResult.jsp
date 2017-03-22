<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.bean.Result"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PREVIOUS RESULT</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script src="<c:url value='/static/javascript/pdf.js'/>" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#prevResult").addClass("active");
	});
</script>
<style>
.form {
	text-align: center;
}
</style>
</head>
<body>
<c:if test="${empty sessionScope.studentSession}"><c:redirect url="/" /></c:if> 
	<div class="form">
		<div class="tab-group">
			<div style="color: white;" id="content">
				<h1>Previous Results</h1>
				<table border="1" style="width: 100%;">
					<tr>
						<th>Username</th>
						<th>Subject Id</th>
						<th>Result</th>
						<th>Date</th>
					</tr>
				<c:forEach var="result" items="${resultList}">
					<tr>
						<td>${result.username}</td>
						<td>${result.subject_Id}</td>
						<td>${result.result}</td>
						<td>${result.time_}</td>
					</tr>
		</c:forEach>
				</table>
			</div>
			<br>
		</div>
		<br> <input type="button" onclick="javascript:demoFromHTML();"
			class="button-block" id="pdf" value="Save As Pdf"><br>
		<br>
<c:import url="./studentBack.jsp"/>
	</div>
</body>
</html>