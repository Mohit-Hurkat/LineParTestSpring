<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT HOME PAGE</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script src="<c:url value='/static/javascript/homepage.js'/>" type="text/javascript"></script>
<script>
var audio = new Audio('../heartbeat.mp3');
audio.play();
</script>
</head>
<body>
<c:if test="${empty sessionScope.studentSession}"><c:redirect url="/" /></c:if> 
	<c:import url="./studentHeader.jsp"/>
	<c:import url="../logout.jsp"/>
</body>
</html>