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
<title>ADMIN QUESTION UPDATE</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script type="text/javascript">
	$(document).ready(function() {
		var $submit = $("#sub").hide();
		var $submit1 = $("#dis").show();
		var $cbs = $("input[type='radio']").click(function() {
			$submit.toggle($cbs.is(":checked"));
			$submit1.hide();
		});
	});
</script>
</head>
<body>
	<div class="form">
		<div class="tab-content">
			<h1>Select Questions To be Updated</h1>
		</div>
		<br>
		<div class="form">
			<div class="tab-group">
				<form action="./adminQuestionUpdate">
					<div style="color: white;">
						<table border="1" style="width: 100%;">
							<tr>
								<th>Questions</th>


							</tr>
							<c:forEach var="questionDisplay" items="${questionDisplayAll}">
								<tr>
									<td>${questionDisplay.questionId}</td>
									<td>${questionDisplay.question}</td>
									<td>${questionDisplay.ans}</td>
									<td><form:radiobutton path="questionId"
											value="${questionDisplay.questionId}"></form:radiobutton></td>
								</tr>
							</c:forEach>

						</table>
					</div>
					<br>
					<div id="dis">
						<h1>Please Select a question to Update</h1>
					</div>
					<input type="submit" id="sub">
				</form>
			</div>
			<br>
		</div>
		<c:import url="../adminBack.jsp" />
	</div>
</body>
</html>