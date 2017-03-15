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
<title>ONLINE TEST</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script src="<c:url value='/static/javascript/test.js'/>" type="text/javascript"></script>
<style type="text/css">
body {
	color: white;
	font-size: 20px;
}

input[type=radio] {
	height: auto;
	width: auto;
	display: inline;
}

#timer_div {
	float: left;
}

.leftRight {
padding: 0px 400px 0px 300px;
	font-size: 50px;
}

a {
	padding: 0px 40px 0px 40px;
	float: left
}

.form {
	overflow: auto;
}
</style>
</head>
<body>
	<%
		ArrayList<Question> ques = (ArrayList<Question>) session.getAttribute("Questions");
		int que = 0;
	%>

	<form action="${pageContext.request.contextPath}/Result" id="test"
		method="post">
		<div class="form">
			<c:forEach var="questions"
							items="${Questions}">
			<div class="question">
				<ol class="mySlides">
					<h3>
						QuestionNo:
						<%=++que%></h3>
					<h3>${questions.question}</h3>
					<li><input type="radio" name="${questions.questionId}"
						value="${questions.choice1}">${questions.choice1}</li>
					<li><input type="radio" name="${questions.questionId}"
						value="${questions.choice2}">${questions.choice2}</li>
					<li><input type="radio" name="${questions.questionId}"
						value="${questions.choice3}">${questions.choice3}</li>
					<li><input type="radio" name="${questions.questionId}"
						value="${questions.choice4}">${questions.choice4}</li>
				</ol>
			</div>
			</c:forEach>
			<div class="leftRight">
				<div class="arrow bounce">
					<a class="fa fa-arrow-down fa-2x" onclick="plusDivs(-1)">&#10094;prev</a>
				</div>
				<div id="timer_div"></div>
				<div class="arrow bounce1">
					<a class="fa fa-arrow-down fa-2x" onclick="plusDivs(1)">next&#10095;</a>
				</div>
				<br>
			</div>
			<br>
			<div id="dis">
				<h1>Please Answer Atleast One Question</h1>
			</div>
		</div>

		<input type="submit" class="button button-block" id="sub"
			value="Finish Test">
	</form>

</body>
</html>