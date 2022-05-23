<%@ page language="java" contentType="text/html;"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BusyMan - Sign In</title>
	<link id="theme" rel="stylesheet" href="/todolist/css/theme-1.css">
	<link rel="stylesheet" href="/todolist/css/style.css">
</head>
<body>
<div class="wrapper">
	<header class="header">
		<div class="container">
			<div class="header__body">
				<a href=${path} class="header__logo">Busy Man</a>
			</div>
		</div>
	</header>
	<main class="page">
		<div class="container">
			<div class="cover__row">
				<div class="cover__column">
					<div class="cover__image">
						<img src="${path}/images/main.png" alt="ToDoGuy">
					</div>
				</div>
				<div class="cover__column cover__column_input">
					<div class="cover__login-form login-form">
						<div class="login-form__header">
							Login to your account
						</div>
						<div class="login-form__bottom">
							<form method="POST" action="${path}/user/login" >
								<c:if test="${error != null}">
									<div>
										<strong style="width:90%; margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 18px; margin-bottom: 10px;  display:block"
										>${error}</strong>
									</div>
								</c:if>
								<c:if test="${message != null}">
									<div >
										<strong style="width:90%; margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 18px; margin-bottom: 10px; display:block"
												>${message}</strong>
									</div>
								</c:if>
								<div class="login-form__input input">
									<input type="text" name="username" placeholder="ENTER LOGIN">
								</div>
								<div class="login-form__input input">
									<input type="password" name="password" placeholder="ENTER PASSWORD">
								</div>
								<div class="login-form__line">
									<label class="login-form__checkbox checkbox">
										<input type="checkbox" name="remember-me">
										<span>REMEMBER ME</span>
									</label>
									<button class="login-form__button button" type="submit">Login</button>
								</div>
							</form>

							<div class="login-form__text"><a href="${path}/user/registration">No registered yet? SING UP</a></div>
						</div>
						<span class="login-form__label">YOUR PERSONAL TO DO LIST!<br>BE PRODUCTIVE!</span>
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
				"Busy Man", 2022. All rights reserved. CrEATEd by Mamchur and TYMCHENKO
			</div>
		</div>
	</footer>
</div>
<script src="${path}/js/auto_margin.js"></script>
<script src="${path}/js/theme.js"></script>
</body>
</html>