<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<title>RULES PAGE</title>
<style>
p{
color:white;
}
</style>
</head>
<body>
<c:if test="${empty sessionScope.studentSession}"><c:redirect url="/" /></c:if> 
<div class="form" style="margin: 40px 300px 40px 300px;text-align: center;">
    <div class="wrap">
  <form action="./GiveTestFinal" >
<p>------------Don't Press Anything Until The Test Starts------------</p>
		<p>-------------------INSTRUCTIONS FOR ONLINE EXAM-------------------</p>
		<p>You will be given only 300 seconds to attempt every question</p>
		<p>There will be 10 Questions.</p>
		<p>You can skip a question</p>
		<p>Every question has 4 options out of which only one is correct</p>
		<p>You can't attempt the same test twice</p>
		<p>Once Submitted you can't change your answers</p>
		<p>Each question is of one mark</p>
		<p>Your result will be displayed as per the number of correct questions you have answered in percentage</p>
 		<input type="submit" class="button-block" value="Start">
		</form>
		</div>
</div>
</body>
</html>