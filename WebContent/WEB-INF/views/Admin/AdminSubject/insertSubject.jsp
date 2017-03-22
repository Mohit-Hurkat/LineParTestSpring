<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN SUBJECT INSERT</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
	<script src="<c:url value='/static/javascript/homepage.js'/>" type="text/javascript"></script>
<script type="text/javascript">
$( document ).ready(function(){
$('.tab a').on('click', function (e) {
	  
	  e.preventDefault();
	  
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  
	  var target = $(this).attr('href');

	  $('.tab-content > div').not(target).hide();
	  
	  $(target).fadeIn(600);
	  
	});	
	});

	</script>
</head>
<body>
<div class="form">
      
      
      <div class="tab-content">
          <h1 class="sign">Insert Subject</h1>
          
          <form:form action="./adminSubjectInsert" method="post" commandName="subject">
          
          <div class="top-row">
          
          	<div class="field-wrap">
            <form:label path="subject">
            Subject Name <span class="req">*</span>
            </form:label>
            <form:input path="subject" type="text" name="subjectName" ></form:input>
            </div>

          
			<div class="field-wrap">
			<form:label class="active" path="start">
           Start Date (mm-dd-yyyy)<span class="req">*</span>
            </form:label>
            <form:input path="start" type="date"></form:input>
          	</div>
          
            <div class="field-wrap">
	        <form:label class="active" path="end">
           	End State(mm-dd-yyyy)<span class="req">*</span>
             </form:label>
            <form:input path="end" type="date"></form:input>
            </div>

          <button type="submit" class="button button-block" name="insert"/>Insert</button>
          </div><!-- top-row -->
          </form:form>

        
       
      </div><!-- tab-content -->
     <br> 		
     <c:import url="../adminBack.jsp" />
</div> <!-- /form -->
</body>
</html>