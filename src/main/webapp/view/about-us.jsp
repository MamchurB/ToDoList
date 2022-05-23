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
    <title>BusyMan - About Us</title>
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

<%--                <li>--%>
<%--                    <div class="theme sider__link">--%>
<%--                         <fmt:message key="sider.theme" />--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <div class="sider__link">--%>
<%--                         <fmt:message key="sider.language" />--%>
<%--                    </div>--%>
<%--                </li>--%>
            </ul>
            <div class="sider__element"></div>
        </div>
        <div class="about-us">
            <div class="container">
                <div class="about-us__inner">
                    <div class="about-us__block">
                        <div class="about-us__title">
                            Front-end developer
                        </div>
                        <div class="about-us__main">
                            <div class="about-us__img">
                                <img src="../images/max2.png" alt="Max">
                            </div>
                            <div class="about-us__info">
                                <div class="about-us__text">
                                    <span><fmt:message key="about.name.max" /></span> <fmt:message key="about.description.max" />
                                </div>
                                <div class="about-us__mail"><fmt:message key="change.user.email" /> <span>tymchenko.maksym@student.uzhnu.edu.ua</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="about-us__block">
                        <div class="about-us__title">
                            Back-end developer
                        </div>
                        <div class="about-us__main">
                            <div class="about-us__img">
                                <img src="../images/bohdan.jpg" alt="Bodya">
                            </div>
                            <div class="about-us__info">
                                <div class="about-us__text">
                                    <span><fmt:message key="about.name.bohdan" /></span> <fmt:message key="about.description.bohdan" />
                                </div>
                                <div class="about-us__mail"><fmt:message key="change.user.email" /> <span>mamchur.bohdan@student.uzhnu.edu.ua</span></div>
                            </div>
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
<script src="../js/theme.js"></script>
</body>

</html>