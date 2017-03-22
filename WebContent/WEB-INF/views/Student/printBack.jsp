<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.bean.PrintResult"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script src="<c:url value='/static/javascript/pdf.js'/>" type="text/javascript"></script>
<style>
#pdf {
	text-align: centre;
}
</style>
</head>
<body>
<c:if test="${empty sessionScope.studentSession}"><c:redirect url="/" /></c:if> 
	<div class="form">
		<div class="tab-group">
				<h1>Test Completed</h1>
				<div id="content" style="color: white;">
					<h2>
						Username: ${sessionStudent.username}</h2>
											<h2>
						Subject: ${Subject.subject}</h2>
					<h2>
						Result: ${testResult} %</h2>
				</div>
				<br>
		</div>
		<div id="editor"></div>
		<input type="button" onclick="javascript:demoFromHTML();"
			class="button-block" id="pdf" value="Save As Pdf"><br>
		<br>
<c:import url="./studentBack.jsp"/>
	</div>
</body>
</html>