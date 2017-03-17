<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.test.bean.Subject" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN QUESTION INSERT</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
</head>
<body>
<div class="form"> 
      <div class="tab-content">
<h1>Please enter the question</h1>

</div>
 <br>
 <div>
 <form:form action="./adminQuestionInsert" commandName="question">
  You requested to insert a question for the subject: ${subjectIdSession}
 <br>
 Subject ID<form:input path="subjectId"  type="text" name="subject" value="${subjectIdSession}"></form:input>
 Question<form:input path="question" type="text" name="question"></form:input><br>
 Option 1 <form:input path="choice1"  type="text" name="op1"></form:input>
 Option 2 <form:input path="choice2" type="text" name="op2"></form:input>
 Option 3 <form:input path="choice3" type="text" name="op3" ></form:input>
 Option 4 <form:input path="choice4" type="text" name="op4"></form:input>
 <br>
 Answer <form:input path="answer" type="number" min="1" max="4" name="answer"></form:input>
 <br>
<button type="submit" class="button button-block" name="insert">Insert</button>
 </form:form>
  </div>
</div>
</body>
</html>