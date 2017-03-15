<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<title>UPDATED</title>
</head>
<body>
<div class="form">
          <h1 class="sign">${studentMessage}</h1>
<c:import url="./studentBack.jsp"/>
</div>
</body>
</html>