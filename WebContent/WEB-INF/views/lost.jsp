<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FINAL</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="<c:url value='/static/javascript/typed.js'/>" type="text/javascript"></script>
    <script src="http://code.responsivevoice.org/responsivevoice.js"></script>
    	<link href="<c:url value='/static/css/stylemy.css' />" rel="stylesheet"></link>
    <script>
    $(document).ready(function() {
    	responsiveVoice.speak("${message}"+"${message1}"+"Let me try and help."+"Click On The Below Links for Navigations.", "UK English Male",{rate:1});
    	
        $("#typed").typed({
            stringsElement: $('#typed-strings'),
            typeSpeed: 30,
            backDelay: 500,
            loop: false,
            contentType: 'html', // or text
            // defaults to false for infinite loop
            loopCount: false,
            callback: function(){ foo(); },
            resetCallback: function() { newTyped(); }
        });

        $(".reset").click(function(){
            $("#typed").typed('reset');
        });


    });

    function newTyped(){ /* A new typed object */ }

    function foo(){ console.log("Callback"); }

    </script>
    <style>
        /* code for animated blinking cursor */
        .typed-cursor{
            opacity: 1;
            font-weight: 100;
            -webkit-animation: blink 0.7s infinite;
            -moz-animation: blink 0.7s infinite;
            -ms-animation: blink 0.7s infinite;
            -o-animation: blink 0.7s infinite;
            animation: blink 0.7s infinite;
        }
        @-keyframes blink{
            0% { opacity:1; }
            50% { opacity:0; }
            100% { opacity:1; }
        }
        @-webkit-keyframes blink{
            0% { opacity:1; }
            50% { opacity:0; }
            100% { opacity:1; }
        }
        @-moz-keyframes blink{
            0% { opacity:1; }
            50% { opacity:0; }
            100% { opacity:1; }
        }
        @-ms-keyframes blink{
            0% { opacity:1; }
            50% { opacity:0; }
            100% { opacity:1; }
        }
        @-o-keyframes blink{
            0% { opacity:1; }
            50% { opacity:0; }
            100% { opacity:1; }
        }
        a{
        font-size: 15px;
        }
    </style>
</head>
<body style="color:#000;">
<div class="form">
    <div class="wrap">
        <h1 id="construct" style="font-family: samarkan;">NAMASTE</h1>

        <div class="type-wrap">
            <div id="typed-strings">
                <span>${message}</span>
                <p>${message1}</p>
                <p>Let me try and help. </p>
				<p>Click On The Below Links for Navigations. </p>
            </div>
            <span id="typed" style="white-space:pre;"></span>
        </div>

        <div class="links">
<c:if test="${not empty sessionScope.studentSession}">
<a href="<c:url value="./student"/>" style="font-size: 25px;">Go Back</a><br>
</c:if>

<c:if test="${not empty sessionScope.adminSession}">
<a href="<c:url value="./admin"/>" style="font-size: 25px;">Go Back</a><br>
</c:if>

<c:if test="${empty sessionScope.adminSession}">
<c:if test="${empty sessionScope.studentSession}">
<a href="<c:url value="/"/>" style="font-size: 25px;">Go Back</a><br>
</c:if>
</c:if>

<br><br>
<a href="https://www.hurkat.in">Mohit Hurkat</a><br><br>
 <a href="https://www.linkedin.com/in/mohithurkat/">Linkedin</a> | <a href="https://www.facebook.com/mohit.hurkat">Facebook</a> | <a href="https://twitter.com/mohithurkat">Twitter</a> | <a href="https://www.instagram.com/bhatakti_aatma/">Instagram</a> | <a href="https://github.com/Mohit-Hurkat/">GitHub</a>
        </div>
    </div>
</div>
</body>
</html>
