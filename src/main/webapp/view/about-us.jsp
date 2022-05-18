<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - About Us</title>
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
                                    <span>Tymchenko Maksym</span> - Student of Uzhhorod National University, Faculty of
                                    Information
                                    Technologies,
                                    specialty "Computer Science".
                                </div>
                                <div class="about-us__mail">Email: <span>tymchenko.maksym@student.uzhnu.edu.ua</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="about-us__block">
                        <div class="about-us__title">
                            Designer
                        </div>
                        <div class="about-us__main">
                            <div class="about-us__img">
                                <img src="../images/vasyl.jpg" alt="Vasyl">
                            </div>
                            <div class="about-us__info">
                                <div class="about-us__text">
                                    <span>Vasyl Zyzen</span> - Student of Uzhhorod National University, Faculty of
                                    Information
                                    Technologies,
                                    specialty "Computer Science".
                                </div>
                                <div class="about-us__mail">Email: <span>zyzen.vasyl@student.uzhnu.edu.ua</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="about-us__block">
                        <div class="about-us__title">
                            Back-end developer
                        </div>
                        <div class="about-us__main">
                            <div class="about-us__img">
                                <img src="../images/bodya.jpg" alt="Bodya">
                            </div>
                            <div class="about-us__info">
                                <div class="about-us__text">
                                    <span>Mamchur Bogdan</span> - Student of Uzhhorod National University, Faculty of
                                    Information
                                    Technologies,
                                    specialty "Software engineering".
                                </div>
                                <div class="about-us__mail">Email: <span>mamchur.bohdan@student.uzhnu.edu.ua</span></div>
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
</body>

</html>