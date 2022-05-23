<%@ page language="java" contentType="text/html;"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="i18n/messages" />
<html lang="${lang}">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BusyMan - Users</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
	<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
			th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
	<link id="theme" rel="stylesheet" href="${theme}">
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
</head>

<body class="calendar__body">
<div class="wrapper">
	<header class="header">
		<div class="container">

			<div class="header__body">
				<a href="/todolist" class="header__logo">Busy Man</a>
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
		<div class="creator__wrapper">
			<form action="${path}/user/add" method="post" class="creator" id="submitUserForm">
				<div class="creator__header">
					 <fmt:message key="create.user.main" />
					<span class="creator__close"></span>
				</div>
				<div class="creator__body">
					<div class="creator__text"> <fmt:message key="change.user.fullname" /></div>
					<div class="creator__input input">
						<input name="fullName" type="text" placeholder=" <fmt:message key="change.user.holder.fullname" />">
					</div>

					<div class="creator__text"> <fmt:message key="change.user.username" /></div>
					<div class="creator__input input">
						<input name="userName" type="text" placeholder=" <fmt:message key="change.user.holder.username" />">
					</div>

					<div class="creator__text"> <fmt:message key="change.user.password" /></div>
					<div class="creator__input input">
						<input name="password" type="text" placeholder=" <fmt:message key="change.user.holder.password" />">
					</div>

					<div class="creator__text"> <fmt:message key="change.user.email" /></div>
					<div class="creator__input input">
						<input name="email" type="email" placeholder=" <fmt:message key="change.user.holder.email" />">
					</div>
					<div class="creator__text"> <fmt:message key="change.user.role" /></div>

					<div class="creator__select">
						<select name="roleId" id="creator__select">
							<option value = 1 >  <fmt:message key="change.user.role.admin" /> </option>
							<option value = 2 >  <fmt:message key="change.user.role.user" /> </option>
						</select>
					</div>
					<div class="creator__text"> <fmt:message key="change.user.mobile" /></div>
					<div class="creator__input input">
						<input name="mobile" type="number" placeholder=" <fmt:message key="change.user.holder.mobile" />">
					</div>
					<div class="creator__button_wrapper"><button class="creator__button button"> <fmt:message key="create.task.button" /></button></div>
				</div>
			</form>
		</div>
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
		<div class="container">

			<div class="users__wrapper">
				<div class="users">
					<div class="users__header">
						<div class="users__title">
							 <fmt:message key="user.task" />
						</div>
						<div class="users__icons">
							<a class="users__icon users__icon_add icon-add" href="#">

							</a>
							<a onclick="window.location.reload(true);" class="users__icon icon-refresh" href="#">

							</a>
						</div>
					</div>
					<div class="users__body">
						<table class="users__table table">
							<thead class="table__header">
							<tr>
								<th> <fmt:message key="change.user.fullname" /></th>
								<th> <fmt:message key="change.user.userid" /></th>
								<th> <fmt:message key="change.user.username" /></th>
								<th> <fmt:message key="change.user.email" /></th>
								<th> <fmt:message key="change.user.mobile" /></th>
								<th> <fmt:message key="change.user.role" /></th>
								<th> <fmt:message key="change.user.edit" /></th>
								<th> <fmt:message key="change.user.Delete" /></th>
							</tr>
							</thead>

							<c:choose>
							<c:when test="${users.size() > 0}">
							<c:forEach items="${users}" var="user">
								<tbody class="table__body">
							<tr>
								<td class="table__name"> <c:out value="${user.fullName}"/></td>
								<td><c:out value="${user.userId}"/></td>
								<td><c:out value="${user.userName}"/></td>
								<td class="table__mail"><c:out value="${user.email}"/></td>
								<td><c:out value="${user.mobile}"/></td>
								<td><c:out value="${user.role.name}"/></td>

								<td class="table__settings">
									<div class="element__gear table__gear"><a href="${path}\user\edit\ ${user.userId}" class="icon-settings"> </a></div>
								</td>
								<td class="table__settings">
									<div class="element__delete table__delete">
										<a onclick = "deleteData('user', '${user.userId}');" class="icon-delete"></a>
									</div>
								</td>
							</tr>
							</tbody>
							</c:forEach>
								</c:when>
								<c:otherwise>
									<tr align="center">
										<td colspan="8"> <fmt:message key="change.user.emptyuser" /></td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
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
<script src="../js/burger.js"></script>
<script src="../js/sider.js"></script>
<script src="../js/new_user.js"></script>
<script src="../js/jquery.boot.js"></script>
<script src="../js/theme.js"></script>

<script type="text/javascript" src="../js/jquery.save.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</body>

</html>