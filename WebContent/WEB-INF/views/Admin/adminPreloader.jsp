<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<meta http-equiv="refresh" content="6;url=./admin"/>
	<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdn.rawgit.com/coderitual/odoo/feature/codevember16/lib/odoo.js" type="text/javascript"></script>
<script src="http://code.responsivevoice.org/responsivevoice.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	odoo.default({ el:'.js-odoo', from: 'Hola', to: 'Admin', animationDelay: 1000 });
	responsiveVoice.speak("Welcome Admin", "UK English Male",{rate:0.75});
});
</script>
</head>
<body>
<div class="js-odoo"></div>
</body>
</html>