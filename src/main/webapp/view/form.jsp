<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
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
                        <li><a href="/todolist/user/logout" class="header__link"> <fmt:message key="header.logout" />t</a></li>
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
                     <fmt:message key="task.edit" />
                </div>
                <form:form method="post" class="form-horizontal" action="${path}/task/edit" commandName="taskForm" >
                    <form:hidden path="taskId"/>
                    <form:hidden path="taskExecuted"/>
                    <form:hidden path="parentTaskId"/>
                    <div class="creator__body">
                        <div class="creator__text"> <fmt:message key="create.task.holder.name" /></div>
                        <div class="creator__input input">
                            <form:input class="input" path="title" placeholder="Enter Task Name" />
                        </div>

                        <div class="creator__text"> <fmt:message key="create.task.type" /></div>
                        <div class="creator__select">
                            <form:select path="taskType"  id="creator__select">
                                <form:option value="simple">  <fmt:message key="sider.simple" /></form:option>
                                <form:option value="someday-maybe"> <fmt:message key="sider.someday" /></form:option>
                                <form:option value="project"> <fmt:message key="sider.project" /></form:option>
                                <form:option value="notes"> <fmt:message key="sider.notes" /></form:option>
                                <form:option value="waiting-for"> <fmt:message key="sider.waiting" /></form:option>
                            </form:select>
                        </div>
                            <div id="input__owner_text" class="creator__text"> <fmt:message key="create.task.owner" /></div>
                            <div id="input__owner" class="creator__input input">
                                <form:input class="input" path="owner" placeholder="Enter owner" />
                            </div>

                            <div  class="creator__text dates__invisible"> <fmt:message key="create.task.start" /></div>
                            <div class="creator__input input dates__invisible">
                                <form:input id="startDate"  type = "datetime-local" class="input" path="start" placeholder="Enter start task" />
                            </div>

                            <div class="creator__text dates__invisible"> <fmt:message key="create.task.end" /></div>
                            <div class="creator__input input dates__invisible">
                                <form:input id="endDate" type = "datetime-local" class="input" path="end" placeholder="Enter end task" />
                            </div>
                        <div class="creator__text"> <fmt:message key="create.task.description" /></div>
                        <div class="creator__textarea">
                            <form:textarea path="description" type="text" placeholder="ENTER DESCRIPTION" />
                        </div>
                        <div class="creator__button_wrapper"><button class="creator__button button"> <fmt:message key="change.user.button" /></button></div>
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

<script src="/todolist/js/edit-select.js"></script>
<script src="/todolist/js/theme.js"></script>

<script  src="/todolist/js/date-validator.js"></script>
<script>dateValidate();</script>
</body>

</html>