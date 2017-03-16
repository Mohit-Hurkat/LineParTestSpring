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
<title>ADMIN SUBJECT UPDATE</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script src="<c:url value='/static/javascript/homepage.js'/>"type="text/javascript"></script>
</head>
<body>
<div class="form">
      
      
      <div class="tab-content">
          <h1 class="sign">Update Subject</h1>
          
          <form:form action="./adminSubjectUpdateFinal" method="post" id="deleteSubject" commandName="subject">
          
         <div class="top-row">
          
          	<div class="field-wrap">
            <form:label path="subject" class="active" >
            Subject Name <span class="req">*</span>
            </form:label>
            <form:input path="subject" type="text" value="${subjectUpdate.subject}" ></form:input>
            </div>

          
			<div class="field-wrap">
			<form:label class="active" path="start">
           Start Date (mm-dd-yyyy)<span class="req">*</span>
            </form:label>
            <form:input path="start" value="${subjectUpdate.start}"></form:input>
          	</div>
          
            <div class="field-wrap" class="active" >
	        <form:label class="active" path="end">
           	End State(mm-dd-yyyy)<span class="req">*</span>
             </form:label>
            <form:input path="end" value="${subjectUpdate.end}"></form:input>
            </div>    
          <button type="submit" class="button button-block" name="update">Update</button>
          </div><!-- top-row -->
          </form:form>

        
       
      </div><!-- tab-content -->
      <br>
   <form action="${pageContext.request.contextPath}/Admin/adminSignIn.jsp" method="post" name="backForm">
 <input type="submit" class="button-block" value="Back">
          </form>   
</div> <!-- /form -->
</body>
</html>