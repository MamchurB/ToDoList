<%@ page language="java" contentType="text/html;"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BusyMan - Users</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
	<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
			th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
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
						<li><a href="${path}" class="header__link">Home</a></li>
						<li><a href="${path}/user/about-us" class="header__link">About us</a></li>
						<li><a href="${path}/user/logout" class="header__link">Log out</a></li>
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
					Creating a new user:
					<span class="creator__close"></span>
				</div>
				<div class="creator__body">
					<div class="creator__text">Full Name:</div>
					<div class="creator__input input">
						<input name="fullName" type="text" placeholder="Enter Full Name">
					</div>

					<div class="creator__text">User Name:</div>
					<div class="creator__input input">
						<input name="userName" type="text" placeholder="Enter User Name">
					</div>

					<div class="creator__text">Password:</div>
					<div class="creator__input input">
						<input name="password" type="text" placeholder="Enter Password">
					</div>

					<div class="creator__text">Email:</div>
					<div class="creator__input input">
						<input name="email" type="email" placeholder="Enter Email">
					</div>
					<div class="creator__text">Role:</div>

					<div class="creator__select">
						<select name="roleId" id="creator__select">
							<option value = 1 > admin </option>
							<option value = 2 > user </option>
						</select>
					</div>
					<div class="creator__text">Mobile:</div>
					<div class="creator__input input">
						<input name="mobile" type="number" placeholder="Enter Mobile">
					</div>
					<div class="creator__button_wrapper"><button class="creator__button button">Create</button></div>
				</div>
			</form>
		</div>
		<div class="sider">
			<ul class="sider__list">
				<li><a class="sider__link"  href="/todolist/task/simple" >Simple List</a></li>
				<li><a class="sider__link"  href="/todolist/task/project" >Projects</a></li>
				<li><a class="sider__link"  href="/todolist/calendar"  >Calendar</a></li>
				<li><a class="sider__link"  href="/todolist/task/someday_maybe" >SOmeday-Maybe List</a></li>
				<li><a class="sider__link"  href="/todolist/task/notes" >NOtes</a></li>
				<li><a class="sider__link"  href="/todolist/task/waiting_for" >Waiting-For List</a></li>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a class="sider__link" href="/todolist/user/list" id = "userList"  >Users</a></li>
				</security:authorize>
			</ul>
			<div class="sider__element"></div>
		</div>
		<div class="container">

			<div class="users__wrapper">
				<div class="users">
					<div class="users__header">
						<div class="users__title">
							User List
						</div>
						<div class="users__icons">
							<a class="users__icon users__icon_add" href="#">
								<img src="../images/add.svg" alt="add ico">
							</a>
							<a onclick="window.location.reload(true);" class="users__icon" href="#">
								<img src="../images/refresh.svg" alt="refresh ico">
							</a>
						</div>
					</div>
					<div class="users__body">
						<table class="users__table table">
							<thead class="table__header">
							<tr>
								<th>Full Name</th>
								<th>User Id</th>
								<th>User Name</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Role</th>
								<th>Edit</th>
								<th>Delete</th>
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
								<td class="table__settings"><a href="${path}\user\edit\ ${user.userId}"><span class="element__gear table__gear"><img
										src="../images/settings.svg" alt="gear"></span></a>
								</td>
								<td class="table__settings"><a onclick = "deleteData('user', '${user.userId}');"><span class="element__delete table__delete"><img
										src="../images/delete.svg" alt="trash bin"></span></a>
								</td>
							</tr>
							</tbody>
							</c:forEach>
								</c:when>
								<c:otherwise>
									<tr align="center">
										<td colspan="8">No Users available</td>
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
					<div class="footer__facebook"><a href="#"><img src="../images/facebook.svg" alt="facebook"></a></div>
					<div class="footer__inst"><a href="#"><img src="../images/inst.svg" alt="inst"></a> </div>
					<div class="footer__youtube"><a href="#"><img src="../images/youtube.svg" alt="youtube"></a></div>
					<div class="footer__viber"><a href="#"><img src="../images/viber.svg" alt="viber"></a></div>
					<div class="footer__telegram"><a href="#"><img src="../images/telega.svg" alt="telega"></a></div>
				</div>
			</div>
			<div class="footer__corp">
				"Busy Man", 2022. All rights reserved. CrEATEd by Mamchur, Zyzen and TYMCHENKO
			</div>
		</div>
	</footer>
</div>
<script src="../js/burger.js"></script>
<script src="../js/sider.js"></script>
<script src="../js/new_user.js"></script>
<script src="../js/jquery.boot.js"></script>
<script type="text/javascript" src="../js/jquery.save.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</body>

</html>