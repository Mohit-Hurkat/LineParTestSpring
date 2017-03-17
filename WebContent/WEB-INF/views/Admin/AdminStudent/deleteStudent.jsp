<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.bean.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<title>ADMIN STUDENT DELETE</title>
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
		<div class="tab-group">
			<form:form action="adminStudentDelete" commandName="student">
				<div style="color: white;">
					<table border="1" style="width: 100%;">
						<tr>
							<th>Username</th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
						</tr>
						<c:forEach var="studentDisplay" items="${studentDisplayAll}">
							<tr>
								<td>${studentDisplay.username}</td>
								<td>${studentDisplay.name }</td>
								<td>${studentDisplay.email }</td>
								<td>${studentDisplay.phone }</td>
								<td><form:radiobutton path="username" name="username"
										value="${studentDisplay.username}"></form:radiobutton></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br>
				<div id="dis">
					<h1>Please Select an User</h1>
				</div>
				<button type="submit" class="button button-block" id="sub"
					name="delete">Delete</button>
			</form:form>
		</div>
		<br>
<c:import url="../adminBack.jsp" />
	</div>
</body>
</html>