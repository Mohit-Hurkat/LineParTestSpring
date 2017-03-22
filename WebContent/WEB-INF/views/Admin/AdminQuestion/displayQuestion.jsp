<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.bean.Question"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN QUESTION DISPLAY</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
	<script src="<c:url value='/static/javascript/pdf.js'/>" type="text/javascript"></script>
</head>
<body>
<c:if test="${empty sessionScope.adminSession}"><c:redirect url="/" /></c:if> 
	<div class="form">
		<div class="tab-group">
			<div id="content" style="color: white;">
				<h2>
					Subject ID:
					${subjectIdSession}</h2>
				<table border="1" style="width: 100%;">
					<tr>
						<th>Question Id</th>
						<th>Question</th>
						<th>Answer</th>
					</tr>
			<c:forEach var="questionDisplay" items="${questionDisplayAll}">
					<tr>
						<td>${questionDisplay.questionId}</td>
						<td>${questionDisplay.question}</td>
						<td>${questionDisplay.ans}</td>
					</tr>
								</c:forEach>
				</table>
			</div>
		</div>

		<br> <input type="button" onclick="printDiv('content');"
			class="button-block" id="pdf" value="Print Content"><br>
		<br>
		<c:import url="../adminBack.jsp" />
	</div>
</body>
</html>