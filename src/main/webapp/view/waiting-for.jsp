<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<html lang = "${lang}">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Waiting For List</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link id="theme" rel="stylesheet" href="${theme}">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body class="calendar__body">
<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header__body">
                <a href="${path}" class="header__logo">Busy Man</a>
                <nav class="header__menu">
                    <ul class="header__list">
                        <li><a href="${path}" class="header__link"><fmt:message key="header.home" /></a></li>
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
            <form action="${path}/task/add" method="post" class="creator" id="submitAddTask" >
                <div class="creator__header">
                     <fmt:message key="create.task.header" />
                    <span class="creator__close"></span>
                </div>
                <div class="creator__body">
                    <div class="creator__text"> <fmt:message key="create.task.name" /></div>
                    <div class="creator__input input">
                        <input name="title" type="text" placeholder=" <fmt:message key="create.task.holder.name" />">
                    </div>

                    <input name="taskType" type="hidden" value="waiting-for">

                    <div id="input__owner_text" class="creator__text "> <fmt:message key="create.task.owner" /></div>
                    <div id="input__owner" class="creator__input input">
                        <input name ="owner" class="input__owner" type="text" placeholder=" <fmt:message key="create.task.holder.owner" />">
                    </div>
                    <div class="creator__text dates__invisible"> <fmt:message key="create.task.start" /></div>
                    <div class="creator__input input dates__invisible">
                        <input id="startDate" name="start" type="datetime-local" placeholder="STARTING DATE">
                    </div>
                    <div class="creator__text dates__invisible"> <fmt:message key="create.task.end" /></div>
                    <div class="creator__input input dates__invisible">
                        <input id="endDate" name="end" type="datetime-local" placeholder="ENDING DATE">
                    </div>
                    <div class="creator__text"> <fmt:message key="create.task.description" /></div>
                    <div class="creator__textarea">
                        <textarea name="description" type="text" placeholder=" <fmt:message key="create.task.holder.description" />"></textarea>
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
        <div class="container">

            <div class="main__tasks tasks tasks_waiting">
                <div class="tasks__header">
                     <fmt:message key="waiting.task" />
                </div>
                    <form action="${path}/task/executed"  class="tasks__elements">
                        <c:forEach items="${tasks}" var="task">
                    <div class="tasks__element element" data-title = "${task.getDescription()}" aria-haspopup="true">
                        <c:if test="${task.getTaskExecuted() == 0}">
                            <label class="element__checkbox checkbox-2">
                                <input onclick="executedTask('task', '${task.taskId}');" class="checkbox" type="checkbox">
                                <span></span>
                            </label>
                            <div class="element__info element__owner">
                                <div class="element__task-name">
                                     <fmt:message key="create.task.owner" />
                                </div>
                                <div class="element__date">
                                    <c:out value="${task.getOwner()}"/>
                                </div>
                            </div>
                            <div class="element__info element__info_waiting">
                                <div class="element__task-name">
                                    <c:out value="${task.getTitle()}"/>
                                </div>
                                <div class="element__date">
                                    <c:out value=" ${task.getEnd().substring(11, 16)}"/>&nbsp <c:out value="${task.getEnd().substring(0, 10)}"/>
                                </div>
                            </div>
                            <div class="element__settings">
                                <div class="element__gear">
                                    <a href="\todolist\task\edit\ ${task.taskId}" class="icon-settings"></a>
                                </div>
                                <div class="element__delete">
                                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')" class="icon-delete"></a>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${task.getTaskExecuted() == 1}">
                        <label class="element__checkbox checkbox-2">
                            <input onclick="executedTask('task', '${task.taskId}');" checked type="checkbox" class="checkbox">
                            <span></span>
                        </label>
                            <div class="element__info element__owner">
                                <div class="element__task-name">
                                     <fmt:message key="create.task.owner" />
                                </div>
                                <div class="element__date">
                                    <c:out value="${task.getOwner()}"/>
                                </div>
                            </div>
                            <div class="element__info element__info_waiting">
                                <div class="element__task-name">
                                    <c:out value="${task.getTitle()}"/>
                                </div>
                                <div class="element__date">
                                    <c:out value=" ${task.getEnd().substring(11, 16)}"/>&nbsp <c:out value="${task.getEnd().substring(0, 10)}"/>
                                </div>
                            </div>
                            <div class="element__settings">
                                <div class="element__gear">
                                    <a href="\todolist\task\edit\ ${task.taskId}" class="icon-settings"></a>
                                </div>
                                <div class="element__delete">
                                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')" class="icon-delete"></a>
                                </div>
                            </div>
                        </c:if>


                    </div>

                    </c:forEach>
                        <div class="task__add">
                            <div class="task__add_inner">
                                <span class="task__plus"></span>
                                <span class="task__add-text"> <fmt:message key="create.task.header" /></span>
                            </div>
                        </div>
                </form>
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
<script  src="../js/date-validator.js"></script>

<script src="../js/line_through.js"></script>
<script src="../js/new_task.js"></script>
<script src="../js/sider.js"></script>
<script src="../js/burger.js"></script>
<script src="../js/theme.js"></script>


<script type="text/javascript" src="../js/jquery.boot.js"></script>
<script type="text/javascript" src="../js/jquery.save.js"></script>
<script>dateValidate();</script>
</body>

</html>