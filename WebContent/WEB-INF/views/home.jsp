<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ONLINE TEST</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<link href="<c:url value='/static/css/stylemy.css' />" rel="stylesheet"></link>
	<script src="<c:url value='/static/javascript/homepage.js'/>" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.tab a').on('click', function(e) {

			e.preventDefault();

			$(this).parent().addClass('active');
			$(this).parent().siblings().removeClass('active');

			var target = $(this).attr('href');
			$('.tab-content > div').not(target).hide();

			$(target).fadeIn(600);

		});
	});
</script>
<%
	session.invalidate();
%>
</head>
<body>
	<div class="form">

		<ul class="tab-group">
			<li class="tab active"><a href="#signup"><spring:message code="label.signUp"></spring:message></a></li>
			<li class="tab"><a href="#login"><spring:message code="label.login"></spring:message></a></li>
		</ul>

		<div class="tab-content">
			<div id="signup">
				<h1 class="sign"><spring:message code="label.signUp"></spring:message></h1>

				<form:form method="post" action="${pageContext.request.contextPath}/signUp/" commandName="student">
				<div class="top-row">
					<div class="field-wrap">
						<form:label path="name"><spring:message code="label.name"></spring:message><span class="req">*</span></form:label> 
						<!-- <input type="text" name="name" pattern="^[a-zA-Z]{2,30}\s[a-zA-Z]{2,30}$" required autocomplete="off" /> -->
						<form:input path="name" />
						<form:errors path="name"></form:errors>
					</div>
					
					<div class="field-wrap">
						<form:label path="email"><spring:message code="label.email"></spring:message><span class="req">*</span></form:label> 
						<!--<input type="email" name="email" required autocomplete="off" /> -->
						<form:input path="email" />
						<form:errors path="email"></form:errors>
					</div>

					<div class="field-wrap">
						<form:label path="phone"><spring:message code="label.phone"></spring:message><span class="req">*</span></form:label> 
						<!--<input type="tel" name="phone" pattern="^\d{10}$" required	autocomplete="off" /> -->
						<form:input path="phone" />
						<form:errors path="phone"></form:errors>
					</div>

					<div class="field-wrap">
						<form:label path="username"><spring:message code="label.username"></spring:message><span class="req">*</span></form:label> 
						<!--<input type="text" name="username" required autocomplete="off" /> -->
						<form:input path="username" />
						<form:errors path="username"></form:errors>
					</div>

					<div class="field-wrap">
						<form:label path="password"><spring:message code="label.password"></spring:message><span class="req">*</span></form:label>
						<!--<input type="password" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$" name="password" required autocomplete="off" /> -->
						<form:input path="password" />
						<form:errors path="password"></form:errors>
					</div>

					<button type="submit" class="button button-block" name="insert"><spring:message code="label.started"></spring:message></button>
					</div>
					<!-- top-row -->
				</form:form>
			</div>

			<div id="login">
				<h1><spring:message code="label.welcome"></spring:message></h1>

				<form:form method="post" action="logIn" commandName="user">

					<div class="field-wrap">
						<form:label path="username"><spring:message code="label.username"></spring:message><span class="req">*</span></form:label>
						<!--<input type="text" name="username" required autocomplete="off">-->
						<form:input path="username" /> 
						<form:errors path="username"></form:errors>
					</div>

					<div class="field-wrap">
						<form:label path="password"><spring:message code="label.password"></spring:message><span class="req">*</span></form:label>
						<!--<input type="password" name="password" required autocomplete="off"> -->
						<form:input path="password" />
						<form:errors path="password"></form:errors>
					</div>

					<p class="forgot">
						<a href="./Lost"><spring:message code="label.forgetPass"></spring:message></a>
					</p>

					<button class="button button-block" name="login"><spring:message code="label.login"></spring:message></button>
				</form:form>
			</div>
			<!-- login -->
		</div>
		<!-- tab-content -->
	<h5 style="text-align:center;"><a href="?lang=en">English</a>|<a href="?lang=de">German</a></h5>
	</div>
	<!-- /form -->
</body>
</html>