<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Change Form</title>
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
                        <li><a href="/todolist/user/about-us" class="header__link">About us</a></li>
                        <li><a href="/todolist/user/logout" class="header__link">Log out</a></li>
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
        <div class="container container__form">
            <div class="form__user">
                <div class="creator__header">
                        Editing Task:
                </div>
                <form:form method="post" class="form-horizontal" action="${path}/task/edit" commandName="taskForm" >
                    <form:hidden path="taskId"/>
                    <form:hidden path="taskExecuted"/>
                    <form:hidden path="parentTaskId"/>
                    <div class="creator__body">
                        <div class="creator__text">Task Name:</div>
                        <div class="creator__input input">
                            <form:input class="input" path="title" placeholder="Enter Task Name" />
                        </div>

                        <div class="creator__text">Task Type:</div>
                        <div class="creator__select">
                            <form:select path="taskType"  id="creator__select">
                                <form:option value="simple"> SIMPLE LIST</form:option>
                                <form:option value="someday-maybe">SOMEDAY-MAYBE LIST</form:option>
                                <form:option value="project">PROJECT</form:option>
                                <form:option value="notes">NOTES</form:option>
                                <form:option value="waiting-for">WAITING-FOR LIST</form:option>
                            </form:select>
                        </div>
                            <div id="input__owner_text" class="creator__text">Owner:</div>
                            <div id="input__owner" class="creator__input input">
                                <form:input class="input" path="owner" placeholder="Enter owner" />
                            </div>

                            <div  class="creator__text dates__invisible">Start:</div>
                            <div class="creator__input input dates__invisible">
                                <form:input id="startDate"  type = "datetime-local" class="input" path="start" placeholder="Enter start task" />
                            </div>

                            <div class="creator__text dates__invisible">End:</div>
                            <div class="creator__input input dates__invisible">
                                <form:input id="endDate" type = "datetime-local" class="input" path="end" placeholder="Enter end task" />
                            </div>
                        <div class="creator__text">Description:</div>
                        <div class="creator__textarea">
                            <form:textarea path="description" type="text" placeholder="ENTER DESCRIPTION" />
                        </div>
                        <div class="creator__button_wrapper"><button class="creator__button button">Change</button></div>
                    </div>

                </form:form>
            </div>
        </div>
    </main>
    <footer class="footer">
        <div class="container container_footer">
            <div class="footer__social-wrapper">
                <div class="footer__social">
                    <div class="footer__facebook"><a href="#"><img src="/todolist/images/facebook.svg" alt="facebook"></a></div>
                    <div class="footer__inst"><a href="#"><img src="/todolist/images/inst.svg" alt="inst"></a> </div>
                    <div class="footer__youtube"><a href="#"><img src="/todolist/images/youtube.svg" alt="youtube"></a></div>
                    <div class="footer__viber"><a href="#"><img src="/todolist/images/viber.svg" alt="viber"></a></div>
                    <div class="footer__telegram"><a href="#"><img src="/todolist/images/telega.svg" alt="telega"></a></div>
                </div>
            </div>
            <div class="footer__corp">
                "Busy Man", 2022. All rights reserved. CrEATEd by Mamchur, Zyzen and TYMCHENKO
            </div>
        </div>
    </footer>
</div>
<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
        th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<script src="/todolist/js/burger.js"></script>
<script src="/todolist/js/sider.js"></script>

<script src="/todolist/js/edit-select.js"></script>

<script  src="/todolist/js/date-validator.js"></script>
<script>dateValidate();</script>
</body>

</html>