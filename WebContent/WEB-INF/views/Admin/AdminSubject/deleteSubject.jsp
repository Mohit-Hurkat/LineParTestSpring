<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.bean.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN SUBJECT DELETE</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/style1.css' />" rel="stylesheet"></link>
<script type="text/javascript">
    $(document).ready(function(){
    	var $submit = $("#sub").hide();
    	var $submit1 = $("#dis").show();
    	var    $cbs = $("input[type='radio']").click(function() {
            $submit.toggle( $cbs.is(":checked") );
            $submit1.hide();
        });
       });
</script>
</head>
<body>
	<div class="form">
		<div class="tab-group">
			<form:form action="./adminSubjectDelete" method="post"
				id="subjectUpdate" commandName="subject">

				<div style="color: white;">
					<table border="1" style="width: 100%;">
						<tr>
							<th>Subject Id</th>
							<th>Subject Name</th>
							<th>Examination Start Date</th>
							<th>Examination End Date</th>

							<c:forEach var="subjectDisplay" items="${subjectDisplayAll}">
								<tr>
									<td>${subjectDisplay.subjectId}</td>
									<td>${subjectDisplay.subject}</td>
									<td>${subjectDisplay.start}</td>
									<td>${subjectDisplay.end}</td>
									<td><form:radiobutton path="subjectId"
											value="${subjectDisplay.getSubjectId()}"></form:radiobutton></td>
								</tr>
							</c:forEach>
						</tr>
					</table>
				</div>
				<br>
<div id="dis">
 <h1>Please Select a Subject to delete</h1>
 </div>
<button type="submit" class="button button-block" id="sub" name="delete">Delete</button>
			</form:form>
		</div>
		<br>
		<c:import url="../adminBack.jsp" />
	</div>

</body>
</html>