<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="i18n/messages" />
<html lang="${lang}">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BusyMan - Change Form</title>
	<link id="theme" rel="stylesheet" href="${theme}">
	<link rel="stylesheet" href="/todolist/css/style.css">
</head>

<body class="calendar__body">
<div class="wrapper">
	<header class="header">
		<div class="container">
			<div class="header__body">
				<a href="${path}" class="header__logo">Busy Man</a>
				<nav class="header__menu">
					<ul class="header__list">
						<li><a href="${path}" class="header__link"> <fmt:message key="header.home" /></a></li>
						<li><a href="/todolist/user/about-us" class="header__link"> <fmt:message key="header.about" /></a></li>
						<li><a href="/todolist/user/logout" class="header__link"> <fmt:message key="header.logout" /></a></li>
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
				<li><a class="sider__link"  href="/todolist/task/simple" >  <fmt:message key="sider.simple" /></a></li>
				<li><a class="sider__link"  href="/todolist/task/project" >  <fmt:message key="sider.project" /></a></li>
				<li><a class="sider__link"  href="/todolist/calendar"  >  <fmt:message key="sider.calendar" /></a></li>
				<li><a class="sider__link"  href="/todolist/task/someday_maybe" >  <fmt:message key="sider.someday" /></a></li>
				<li><a class="sider__link"  href="/todolist/task/notes" >  <fmt:message key="sider.notes" /></a></li>
				<li><a class="sider__link"  href="/todolist/task/waiting_for" >  <fmt:message key="sider.waiting" /></a></li>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a class="sider__link" href="/todolist/user/list" id = "userList"  > <fmt:message key="sider.users" /></a></li>
				</security:authorize>

			</ul>
			<div class="sider__element"></div>
		</div>
		<div class="container container__form">
			<div class="form__user">
				<div class="creator__header">
					 <fmt:message key="change.user.header" />
				</div>
				<form:form method="post" class="form-horizontal" action="${path}/user/edit" commandName="userForm" id="submitTaskForm">
					<form:hidden path="userId"/>
					<div class="creator__body">
						<div class="creator__text"> <fmt:message key="change.user.fullname" /></div>
						<div class="creator__input input">
							<form:input class="input" path="fullName" placeholder="Enter Full Name" required="true"/>
						</div>

						<div class="creator__text"> <fmt:message key="change.user.username" /></div>
						<div class="creator__input input">
							<form:input class="input" path="userName" placeholder="Enter User Name" required="true"/>
						</div>

						<form:input type = "hidden" path="password"/>

						<div class="creator__text"> <fmt:message key="change.user.email" /></div>
						<div class="creator__input input">
							<form:input type = "email" class="input" path="email" placeholder="Enter email" required="true"/>
						</div>

						<div class="creator__text"> <fmt:message key="change.user.mobile" /></div>
						<div class="creator__input input">
							<form:input class="input" path="mobile" placeholder="Enter mobile" required="true"/>
						</div>
						<div class="creator__text"> <fmt:message key="change.user.role" /></div>

						<div class="creator__select">
							<select name="roleId" id="creator__select">
								<option value = "1" >  <fmt:message key="change.user.role.admin" /> </option>
								<option value = "2" >  <fmt:message key="change.user.role.user" /> </option>
							</select>
						</div>

							<div class="creator__button_wrapper">
								<form:button value="Save" >
								<button onclick="location.href='/todolist/user/list'"  class="creator__button button"> <fmt:message key="change.user.button" /></button>
								</form:button>
							</div>
							</div>

				</form:form>
			</div>
		</div>
	</main>
	<footer class="footer">
		<div class="container container_footer">
			<div class="footer__social-wrapper">
				<div class="footer__social">
					<div class="footer__facebook"><a href="#" class="icon-facebook"></a></div>
					<div class=" footer__inst"><a href="#" class="icon-inst"> </a> </div>
					<div class="footer__youtube"><a href="#" class="icon-youtube"></a></div>
					<div class="footer__viber"><a href="#" class="icon-viber"></a></div>
					<div class="footer__telegram"><a href="#" class="icon-telega"></a></div>
				</div>
			</div>
			<div class="footer__corp">
				 <fmt:message key="footer" />
			</div>
		</div>
	</footer>
</div>
<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
		th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<script src="/todolist/js/burger.js"></script>
<script src="/todolist/js/sider.js"></script>
</body>

</html>