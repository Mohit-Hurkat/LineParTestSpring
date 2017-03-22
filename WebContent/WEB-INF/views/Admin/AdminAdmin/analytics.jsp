<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Analytics</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="<c:url value='/static/css/analytics.css' />" rel="stylesheet"></link>
	<script src="<c:url value='/static/javascript/analytics.js'/>" type="text/javascript"></script>
	<script type="text/javascript">
</script>
</head>
<body>
<div class="form">
		<div class="tab-group">
<!-- <aside class="chart vert">
  <canvas id="canPie" width="300" height="200" data-values='40, 30, 20, 60, 10, 50'>
  </canvas>
  <ol class="legend">
    <li class="key one">One</li>
    <li class="key two">Two</li>
    <li class="key three">Three</li>
    <li class="key four">Four</li>
    <li class="key five">Five</li>
    <li class="key six">Six</li>
  </ol>
</aside> -->
<h1>Subject : ${subjectAnalytics.subject}</h1>
<h3>Top 10 Questions</h3>
<aside class="chart">
  <canvas id="canPeak" width="650" height="300" data-values='${AnalyticsListTop}' style="padding-left:50px;">
    This browser does not support HTML5 Canvas.
  </canvas>
  <ul class="mohit">
  <c:forEach var="question" items="${QuesAnalyticsTop}">
  <li class="mohit1" id="${question.questionId}">${question.analytics}</li>
	</c:forEach>				
  </ul>
  <br>
  <ol class="legend horiz">
    <li class="key one">Question Id:</li>
    <li class="key two" value="${QuesAnalyticsTop[0].questionId}">${QuesAnalyticsTop[0].questionId}</li>
    <li class="key three" value="${QuesAnalyticsTop[1].questionId}">${QuesAnalyticsTop[1].questionId}</li>
    <li class="key four" value="${QuesAnalyticsTop[2].questionId}">${QuesAnalyticsTop[2].questionId}</li>
    <li class="key five" value="${QuesAnalyticsTop[3].questionId}">${QuesAnalyticsTop[3].questionId}</li>
    <li class="key six" value="${QuesAnalyticsTop[4].questionId}">${QuesAnalyticsTop[4].questionId}</li>
    <li class="key seven" value="${QuesAnalyticsTop[5].questionId}">${QuesAnalyticsTop[5].questionId}</li>
    <li class="key eight" value="${QuesAnalyticsTop[6].questionId}">${QuesAnalyticsTop[6].questionId}</li>
    <li class="key nine" value="${QuesAnalyticsTop[7].questionId}">${QuesAnalyticsTop[7].questionId}</li>
    <li class="key ten" value="${QuesAnalyticsTop[8].questionId}">${QuesAnalyticsTop[8].questionId}</li>
    <li class="key eleven" value="${QuesAnalyticsTop[9].questionId}">${QuesAnalyticsTop[9].questionId}</li>
    
  </ol>
</aside>
<br>
<h3>Bottom 10 Questions</h3>
<aside class="chart">
  <canvas id="canPeak2" width="650" height="250" data-values='${AnalyticsListBottom}' style="padding-left:50px;">
    This browser does not support HTML5 Canvas.
  </canvas>
     <ul class="mohit">
  <c:forEach var="question" items="${QuesAnalyticsBottom}">
  <li class="mohit1">${question.analytics}</li>
	</c:forEach>				
  </ul>
  	  <br>	
  <ol class="legend horiz">
   <li class="key one">Question ID:</li>
  <li class="key eleven" value="${QuesAnalyticsBottom[0].questionId}">${QuesAnalyticsBottom[0].questionId}</li>
    <li class="key ten" value="${QuesAnalyticsBottom[1].questionId}">${QuesAnalyticsBottom[1].questionId}</li>
    <li class="key nine" value="${QuesAnalyticsBottom[2].questionId}">${QuesAnalyticsBottom[2].questionId}</li>
    <li class="key eight" value="${QuesAnalyticsBottom[3].questionId}">${QuesAnalyticsBottom[3].questionId}</li>
    <li class="key seven" value="${QuesAnalyticsBottom[4].questionId}">${QuesAnalyticsBottom[4].questionId}</li>
    <li class="key six" value="${QuesAnalyticsBottom[5].questionId}">${QuesAnalyticsBottom[5].questionId}</li>
    <li class="key five" value="${QuesAnalyticsBottom[6].questionId}">${QuesAnalyticsBottom[6].questionId}</li>
    <li class="key four" value="${QuesAnalyticsBottom[7].questionId}">${QuesAnalyticsBottom[7].questionId}</li>
    <li class="key three" value="${QuesAnalyticsBottom[8].questionId}">${QuesAnalyticsBottom[8].questionId}</li>
    <li class="key two" value="${QuesAnalyticsBottom[9].questionId}">${QuesAnalyticsBottom[9].questionId}</li>
   
  </ol>
</aside>
<!-- <aside class="chart">
  <canvas id="canBar" width="300" height="200" data-values='40, 30, 20, 60, 10, 50'>
    This browser does not support HTML5 Canvas.
  </canvas>
  <ol class="legend horiz">
    <li class="key one">One</li>
    <li class="key two">Two</li>
    <li class="key three">Three</li>
    <li class="key four">Four</li>
    <li class="key five">Five</li>
    <li class="key six">Six</li>
  </ol>
</aside> -->
</div>
		<br>
		<c:import url="../adminBack.jsp" />
</div>
</body>
</html>