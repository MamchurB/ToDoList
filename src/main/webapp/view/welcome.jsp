<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="shortcut icon" href="https://ignite.apache.org/images/java.png">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
		<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">

		<link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.css"
			  th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.css}" rel="stylesheet"></link>
		<link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.print.css"
			  th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.print.css}" rel="stylesheet" media="print"></link>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"
				th:src="@{/webjars/momentjs/2.9.0/min/moment.min.js}" type="text/javascript"></script>
		    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
		            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
		<script src="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.min.js"
				th:src="@{/webjars/fullcalendar/2.2.5/fullcalendar.min.js}" type="text/javascript"></script>

		<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
		<title>Welcome</title>
		<style>
			.row {
				margin-top: 50px; margin-left: 0px; margin-right: 0px;
			}
			.menu {
				height: 100%; width: 170px; position: fixed; background-color: #f8f8f8;
			}
			.menu .navbar-nav li {
				width: 100%; border-bottom: 1px solid #e7e7e7;
			}
		</style>
	</head>
	<body>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		    <form id="logoutForm" method="POST" action="${path}/logout">
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    </form>
		    <div class="navbar navbar-default navbar-fixed-top">
		    	<div class="container-fluid">
		    		<div class="navbar-header">
		    			<a class="navbar-brand" href="javascript:void(0);">Busy Man</a>
		    		</div>
		    		<div class="collapse navbar-collapse">
		    			<ul class="nav navbar-nav">
		    				<li class="active"><a href="${path}"><span class="glyphicon glyphicon-home"></span> Home</a></li>
		    				<li><a href="javascript:void(0);"><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
		    				<li><a href="javascript:void(0);"><span class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>
		    			</ul>
		    			<ul class="nav navbar-nav navbar-right">
		    				<li>
		    					<a href="javascript:void(0);" onclick="document.forms['logoutForm'].submit()">Welcome ${pageContext.request.userPrincipal.name} | <span class="glyphicon glyphicon-log-out"></span> Logout</a>
		    				</li>
		    			</ul>
		    		</div>
		    	</div>
		    </div>
		    <div class="row">
		    	<div class="menu navbar navbar-default">
		    		<div class="menu-container">
		    			<ul class="nav navbar-nav">
<%--							<c:forEach items="${listMenu}" var="menu">--%>
<%--								<li><a href="#" id = ${menu.getPath()}><span class="glyphicon glyphicon-user"></span> ${menu. getNameMenu()}</a></li>--%>
<%--							</c:forEach>--%>
							<li><a href="javascript:void(0);" id="taskList"><span class="glyphicon glyphicon-user"></span> Things </a></li>
							<li><a href="javascript:void(0);" id="List3"><span class="glyphicon glyphicon-user"></span> ASAP List </a></li>
							<li><a href="javascript:void(0);" id="List4"><span class="glyphicon glyphicon-user"></span> Project </a></li>
                            <li><a href="javascript:void(0);" id="calendarList"><span class="glyphicon glyphicon-user"></span> Calendar </a></li>
                            <li><a href="javascript:void(0);" id="List7"><span class="glyphicon glyphicon-user"></span> Someday-Maybe List </a></li>
                            <li><a href="javascript:void(0);" id="List8"><span class="glyphicon glyphicon-user"></span> Notes </a></li>
                            <li><a href="javascript:void(0);" id="List9"><span class="glyphicon glyphicon-user"></span> Waiting-For List </a></li>
                            <li><a href="javascript:void(0);" id="userList"><span class="glyphicon glyphicon-user"></span> Users </a></li>
		    			</ul>
		    		</div>
		    	</div>
		    	<div class="container-fluid">
		    		<div class="inner-jsp panel-body" style="margin-left: 170px;">
		    			<c:forEach begin="0" end="2" varStatus="loop">

		    				<div class="col-md-12">
		    					<h2>${heading}</h2>
		    					<p class="text-justify">${description}</p>
		    				</div>
		    			</c:forEach>
		    		</div>
		    	</div>
		    </div>
		    <div class="navbar navbar-default navbar-fixed-bottom">
		    	<div class="container">
		    		<div class="col-md-10 navbar-text text-center">© "Basy Man", 2022. All rights reserved. Crafted by Bohdan Mamchur and Vasyl Zyzen</div>
		    	</div>
		    </div>
		</c:if>
	</body>
</html>