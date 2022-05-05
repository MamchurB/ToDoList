<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BusyMan - Users</title>
	<link rel="stylesheet" href="../css/style.css">
</head>

<body class="calendar__body">
<div class="wrapper">
	<header class="header">
		<div class="container">
			<div class="header__body">
				<a href="main.html" class="header__logo">Busy Man</a>
				<nav class="header__menu">
					<ul class="header__list">
						<li><a href="main.html" class="header__link">Home</a></li>
						<li><a href="about-us.html" class="header__link">About us</a></li>
						<li><a href="index.html" class="header__link">Log out</a></li>
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
				<li><a class="sider__link" href="">Things</a></li>
				<li><a class="sider__link" href="">ASAP List</a></li>
				<li><a class="sider__link" href="project.html">Projects</a></li>
				<li><a class="sider__link" href="calendar.html">Calendar</a></li>
				<li><a class="sider__link" href="">SOmeday-Maybe List</a></li>
				<li><a class="sider__link" href="">NOtes</a></li>
				<li><a class="sider__link" href="waiting-for.html">Waiting-For List</a></li>
				<li class="sider__active"><a class="sider__link" href="users.html">Users</a></li>
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
							<a class="users__icon" href="#">
								<img src="../images/add.svg" alt="add ico">
							</a>
							<a class="users__icon" href="#">
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
								<td class="table__name">${user.fullName}</td>
								<td>${user.userId}</td>
								<td>${user.userName}</td>
								<td class="table__mail">${user.email}</td>
								<td>${user.mobile}</td>
								<td>${user.role.name}</td>
								<td class="table__settings"><a href="#"><span class="element__gear table__gear"><img
										src="../images/settings.svg" alt="gear"></span></a>
								</td>
								<td class="table__settings"><a href="#"><span class="element__delete table__delete"><img
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
				"Busy Man", 2022. All rights reserved. CrEATEd by Bohdan Mamchur and Vasyl Zyzen
			</div>
		</div>
	</footer>
</div>
<script src="../js/burger.js"></script>
<script src="../js/sider.js"></script>
</body>

</html>