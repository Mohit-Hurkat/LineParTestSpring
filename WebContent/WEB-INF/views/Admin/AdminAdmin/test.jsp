<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></script>
	<link href="<c:url value='/static/css/test.css' />" rel="stylesheet"></link>
<script type="text/javascript">
$(document).ready(function() {
var li = document.getElementsByClassName("hola");


for (var i = 0; i < li.length; i++) {
  li[i].addEventListener("click", function() {
    for (var j = 0; j < li.length; j++) {
      li[j].setAttribute("class", "hola");
      this.setAttribute("class", "hola active");
    } 
  });
}
});
</script>
<body>
<c:if test="${empty sessionScope.adminSession}"><c:redirect url="/" /></c:if> 
<ul class="tab-menu">
  <li class="hola active" value="123"><a href="#">First</a></li>
  <li class="hola" value="hell"><a href="#">Second</a></li>
  <li class="hola" value="hell"><a href="#">Third</a></li>
</ul>
<div id="111"><h1>hello111</h1></div>

<div id="222"><h1>hello222</h1></div>

<div id="333"><h1>hello333</h1></div>
</body>
</html>