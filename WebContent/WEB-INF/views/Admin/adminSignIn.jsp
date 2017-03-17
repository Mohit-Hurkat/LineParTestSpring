<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN HOME PAGE</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/admin.css' />" rel="stylesheet"></link>
<script>
	var audio = new Audio('../heartbeat.mp3');
	audio.play();
</script>
</head>
<body>
	<div class="form">
		<ul class="tab-group">
			<li class="tab " id="question"><a>Question</a>
				<ul class="dropdown-content">
					<li style="height: 49px;"></li>

					<li class="float"><a href="./deleteQuestionAdmin">
							Delete Question</a></li>
					<li class="float"><a href="./insertQuestionAdmin">Insert
							Question</a></li>
					<li class="float"><a href="./updateQuestionAdmin">Update
							Question</a></li>
					<li class="float"><a href="./displayQuestionAdmin">
							View Questions</a></li>
				</ul></li>
			<li class="tab" id="updateInfo"><a>Student</a>
				<ul class="dropdown-content">
					<li style="height: 49px;"></li>
					<li class="float"><a href="./deleteStudentAdmin">Delete Student</a></li>
					<li class="float"><a
						href="./viewStudentAdmin">View All
							Students</a></li>
				</ul></li>
			<li class="tab " id="subject"><a>Subject</a>
				<ul class="dropdown-content">
					<li style="height: 49px;"></li>
					<li class="float"><a href="./deleteSubjectAdmin">Delete
							Subject</a></li>
					<li class="float"><a href="./displaySubjectAdmin">Display
							Subject</a></li>
					<li class="float"><a href="./insertSubjectAdmin">Insert
							Subject</a></li>
					<li class="float"><a href="./updateSubjectAdmin">Update
							Subject</a></li>
				</ul></li>
			<li class="tab " id="update"><a>Admin</a>
				<ul class="dropdown-content">
					<li style="height: 49px;"></li>
					<li class="float"><a href="../Admin/AdminAdmin/adminAdmin.jsp">Update
							Admin</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /form -->
	<c:import url="../logout.jsp"/>
</body>
</html>