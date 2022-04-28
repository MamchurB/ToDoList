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
		<link rel="stylesheet" href="${path}/css/style.css">

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


		<title>BusyMan - Home</title>
	</head>
	<body class="main__body">
	<div class="wrapper">
		<header class="header">
			<div class="container">
				<div class="header__body">
					<a href="${path}" class="header__logo">Busy Man</a>
					<nav class="header__menu">
						<ul class="header__list">
							<li><a href="${path}" class="header__link">Home</a></li>
							<li><a href="" class="header__link">About us</a></li>
							<li><a href="" class="header__link">Contacts</a></li>
						</ul>
					</nav>
					<div class="header__burger">
						<span></span>
					</div>
				</div>
			</div>

		</header>
		<main class="page">
			<div class="sider">
				<ul class="sider__list">

					<li><a class="sider__link" href="javascript:void(0);" id = "taskList"  >Things</a></li>
					<li><a class="sider__link" id = "List1" href="javascript:void(0);" >ASAP List</a></li>
					<li><a class="sider__link" id = "List2" href="javascript:void(0);" >Projects</a></li>
					<li><a class="sider__link" id = "calendarList" href="javascript:void(0);" >Calendar</a></li>
					<li><a class="sider__link" id = "List3" href="javascript:void(0);" >SOmeday-Maybe List</a></li>
					<li><a class="sider__link" id = "List4" href="javascript:void(0);" >NOtes</a></li>
					<li><a class="sider__link" id = "List5" href="${path}/task/list?page=1" >Waiting-For List</a></li>
					<li><a class="sider__link" id = "userList" href="javascript:void(0);" >Users</a></li>
				</ul>
				<div class="sider__element"></div>
			</div>
			<div class="container container__main">
				<div class="main">
					<div class="main__hello">
						Hello,  ${pageContext.request.userPrincipal.name}!
					</div>
					<div class="main__date">
						today is<span> Monday, April 19th 2022</span>
					</div>
					<div class="main__row">
						<div class="main__column main__column_tasks">
							<div class="main__tasks tasks">
								<div class="tasks__deadline">
									Your upcoming deadlines:
								</div>
								<form action="#" method="multipart/form-data" class="tasks__elements">
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>
									<div class="tasks__element element">
										<label class="element__checkbox checkbox-2">
											<input type="checkbox">
											<span></span>
										</label>
										<div class="element__info">
											<div class="element__task-name">
												Task_1
											</div>
											<div class="element__date">
												00.00.2022 00:00
											</div>
										</div>
										<div class="element__settings">
											<div class="element__gear">
												<a href=""><img src="./images/settings.svg" alt="gear"></a>
											</div>
											<div class="element__delete">
												<a href=""><img src="./images/delete.svg" alt="trash bin"></a>
											</div>
										</div>
									</div>

								</form>
							</div>
						</div>
						<div class="main__column main__column_statistic">
							<div class="main__statistic statistic">
								<div class="statistic__header">
									Your statistic
								</div>
								<form action="#" method="multipart/form-data" class="statistic__textarea">
									<textarea></textarea>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer class="footer">
			<div class="container container_footer">
				<div class="footer__social-wrapper">
					<div class="footer__social">
						<div class="footer__facebook"><a href="#"><img src="./images/facebook.svg" alt="facebook"></a></div>
						<div class="footer__inst"><a href="#"><img src="./images/inst.svg" alt="inst"></a> </div>
						<div class="footer__youtube"><a href="#"><img src="./images/youtube.svg" alt="youtube"></a></div>
						<div class="footer__viber"><a href="#"><img src="./images/viber.svg" alt="viber"></a></div>
						<div class="footer__telegram"><a href="#"><img src="./images/telega.svg" alt="telega"></a></div>
					</div>
				</div>
				<div class="footer__corp">
					"Busy Man", 2022. All rights reserved. CrEATEd by Bohdan Mamchur and Vasyl Zyzen
				</div>
			</div>
		</footer>
	</div>
	<script src="./js/burger.js"></script>
	<script src="./js/main.js"></script>
	</body>
<%--		<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
<%--		    <form id="logoutForm" method="POST" action="${path}/logout">--%>
<%--		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--		    </form>--%>
<%--		    <div class="navbar navbar-default navbar-fixed-top">--%>
<%--		    	<div class="container-fluid">--%>
<%--		    		<div class="navbar-header">--%>
<%--		    			<a class="navbar-brand" href="javascript:void(0);">Busy Man</a>--%>
<%--		    		</div>--%>
<%--		    		<div class="collapse navbar-collapse">--%>
<%--		    			<ul class="nav navbar-nav">--%>
<%--		    				<li class="active"><a href="${path}"><span class="glyphicon glyphicon-home"></span> Home</a></li>--%>
<%--		    				<li><a href="javascript:void(0);"><span class="glyphicon glyphicon-info-sign"></span> About</a></li>--%>
<%--		    				<li><a href="javascript:void(0);"><span class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>--%>
<%--		    			</ul>--%>
<%--		    			<ul class="nav navbar-nav navbar-right">--%>
<%--		    				<li>--%>
<%--		    					<a href="javascript:void(0);" onclick="document.forms['logoutForm'].submit()">Welcome ${pageContext.request.userPrincipal.name} | <span class="glyphicon glyphicon-log-out"></span> Logout</a>--%>
<%--		    				</li>--%>
<%--		    			</ul>--%>
<%--		    		</div>--%>
<%--		    	</div>--%>
<%--		    </div>--%>
<%--		    <div class="row">--%>
<%--		    	<div class="menu navbar navbar-default">--%>
<%--		    		<div class="menu-container">--%>
<%--		    			<ul class="nav navbar-nav">--%>
<%--&lt;%&ndash;							<c:forEach items="${listMenu}" var="menu">&ndash;%&gt;--%>
<%--&lt;%&ndash;								<li><a href="#" id = ${menu.getPath()}><span class="glyphicon glyphicon-user"></span> ${menu. getNameMenu()}</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;							</c:forEach>&ndash;%&gt;--%>
<%--							<li><a href="javascript:void(0);" id="taskList"><span class="glyphicon glyphicon-user"></span> Things </a></li>--%>
<%--							<li><a href="javascript:void(0);" id="List3"><span class="glyphicon glyphicon-user"></span> ASAP List </a></li>--%>
<%--							<li><a href="javascript:void(0);" id="List4"><span class="glyphicon glyphicon-user"></span> Project </a></li>--%>
<%--                            <li><a href="javascript:void(0);" id="calendarList"><span class="glyphicon glyphicon-user"></span> Calendar </a></li>--%>
<%--                            <li><a href="javascript:void(0);" id="List7"><span class="glyphicon glyphicon-user"></span> Someday-Maybe List </a></li>--%>
<%--                            <li><a href="javascript:void(0);" id="List8"><span class="glyphicon glyphicon-user"></span> Notes </a></li>--%>
<%--                            <li><a href="javascript:void(0);" id="List9"><span class="glyphicon glyphicon-user"></span> Waiting-For List </a></li>--%>
<%--                            <li><a href="javascript:void(0);" id="userList"><span class="glyphicon glyphicon-user"></span> Users </a></li>--%>
<%--		    			</ul>--%>
<%--		    		</div>--%>
<%--		    	</div>--%>
<%--		    	<div class="container-fluid">--%>
<%--		    		<div class="inner-jsp panel-body" style="margin-left: 170px;">--%>
<%--		    			<c:forEach begin="0" end="2" varStatus="loop">--%>

<%--		    				<div class="col-md-12">--%>
<%--		    					<h2>${heading}</h2>--%>
<%--		    					<p class="text-justify">${description}</p>--%>
<%--		    				</div>--%>
<%--		    			</c:forEach>--%>
<%--		    		</div>--%>
<%--		    	</div>--%>
<%--		    </div>--%>
<%--		    <div class="navbar navbar-default navbar-fixed-bottom">--%>
<%--		    	<div class="container">--%>
<%--		    		<div class="col-md-10 navbar-text text-center">© "Basy Man", 2022. All rights reserved. Crafted by Bohdan Mamchur and Vasyl Zyzen</div>--%>
<%--		    	</div>--%>
<%--		    </div>--%>
<%--		</c:if>--%>
	</body>
</html>