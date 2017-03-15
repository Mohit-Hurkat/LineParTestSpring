<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.test.bean.Student" %>
        <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE INFORMATION</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<link href="<c:url value='/static/css/stylemy.css' />" rel="stylesheet"></link>
    <script>
$(document).ready(function() {
        $("#updateInfo").addClass("active");
});

function Validation() {
	    var x = document.getElementById("updatePassword").value;
	    var y = document.getElementById("confirmPassword").value;
	    if(x!=y){
	    	alert("Password doesn't match.");
	    	 document.getElementById('confirmPassword').value="";
	    	 document.getElementById('updatePassword').value="";
	    	return false;
	    }
	    return true;
	
}
</script>
</head>
<body>
<c:if test="${empty sessionScope.student}"><c:redirect url="/home.jsp" /></c:if> 
<div class="form">
<form:form action="./studentUpdateFinal" method="post" commandName="student">
          <div class="top-row">
          	
          	<div class="field-wrap">
            <form:label path="name" class="active highlight">
           Student name<span class="req">*</span>
            </form:label>
            <form:input path="name" name="updateName"/>
            </div>
            
			<div class="field-wrap">
            <form:label path="email" class="active highlight">            
          Update Email Address<span class="req">*</span>
            </form:label>
            <form:input path="email"  name="updateEmail"/>
          	</div>
          	
            <div class="field-wrap">
            <form:label path="password" class="active highlight">            
            Update Password(0-9,A-Z,a-z required)<span class="req">*</span>
            </form:label>
            <form:input path="password" type="password" name="updatePassword" id="updatePassword"/>
          	</div>  
          	 
          	<div class="field-wrap">
            <form:label path="" class="active highlight">            
           Confirm Password<span class="req">*</span>
            </form:label>
            <form:input path="" type="password" name="confirmPassword" id="confirmPassword" onBlur="Validation();"/>
          	</div>
          	  
          	<div class="field-wrap">
            <form:label path="phone" class="active highlight">            
          Update Phone No (10 digits)<span class="req">*</span>
            </form:label>
            <form:input path="phone" name="updatePhone" pattern="^\d{10}$"/>
            </div>
            
          <input type="submit" class="button button-block" value="Submit">
          </div><!-- top-row -->
</form:form><br>

 <form action="/Student" method="post">
 <input type="submit" class="button-block" value="Back">
 </form>
</div>
</body>
</html>