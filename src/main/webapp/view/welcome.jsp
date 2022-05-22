<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">


    <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.css"
          th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.css}" rel="stylesheet"></link>
    <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.print.css"
          th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.print.css}" rel="stylesheet" media="print"></link>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"
            th:src="@{/webjars/momentjs/2.9.0/min/moment.min.js}" type="text/javascript"></script>
    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
    <script src="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.min.js"
            th:src="@{/webjars/fullcalendar/2.2.5/fullcalendar.min.js}" type="text/javascript"></script>

    <script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="stylesheet" href="/todolist/css/style.css">
    <title>Busy Man - Home</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var selItem = localStorage.getItem("locales");
            $('#locales').val(selItem ? selItem : 'en');
            $("#locales").change(function() {
                var selectedOption = $('#locales').val();
                if (selectedOption) {
                    localStorage.setItem("locales", selectedOption);
                    window.location.replace('?lang=' + selectedOption);

                }
            });
        });
    </script>
</head>
<body class="main__body">
<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header__body">
                <a href="${path}" class="header__logo">Busy Man</a>
                <nav class="header__menu">
                    <ul class="header__list">
                        <li><a href="${path}" class="header__link"><spring:message code="header.home" /></a></li>
                        <li><a href="${path}/user/about-us" class="header__link"><spring:message code="header.about" /></a></li>
                        <li><a href="${path}/user/logout" class="header__link"><spring:message code="header.logout" /></a></li>
                    </ul>
                </nav>
                <div style="width: 600px; margin: auto;">
                    <fieldset>
                        <p>
                            <label><spring:message code="chooseLang" /></label> <select
                                id="locales">
                            <option value="en">English</option>
                            <option value="uk">Українська</option>
                        </select>
                        </p>
                    </fieldset>
                    <div style="clear: both"></div>
                </div>
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
                    <spring:message code="create.task.header" />
                    <span class="creator__close"></span>
                </div>
                <div class="creator__body">
                    <div class="creator__text"><spring:message code="create.task.name" /></div>
                    <div class="creator__input input">
                        <input name="title" type="text" placeholder="<spring:message code="create.task.holder.name" />" required>
                    </div>
                    <div id="input__owner_text" class="creator__text creator__input_owner"><spring:message code="create.task.owner" /></div>
                    <div id="input__owner" class="creator__input input creator__input_owner">
                        <input name ="owner" class="input__owner" type="text" placeholder="<spring:message code="create.task.holder.owner" />">
                    </div>
                    <div class="creator__text"><spring:message code="create.task.type" /></div>
                    <div class="creator__select">
                        <select name="taskType" id="creator__select">
                            <option value="simple"> <spring:message code="sider.simple" /></option>
                            <option value="someday"><spring:message code="sider.someday" /></option>
                            <option value="notes"><spring:message code="sider.notes" /></option>
                            <option value="waiting-for"><spring:message code="sider.waiting" /></option>
                        </select>

                    </div>
                    <div class="creator__text dates__invisible"><spring:message code="create.task.start" /></div>
                    <div class="creator__input input dates__invisible">
                        <input id="startDate" name="start" type="datetime-local" placeholder="STARTING DATE">
                    </div>
                    <div class="creator__text dates__invisible"><spring:message code="create.task.end" /></div>
                    <div class="creator__input input dates__invisible">
                        <input id="endDate" name="end" type="datetime-local" placeholder="ENDING DATE">
                    </div>
                    <div class="creator__text"><spring:message code="create.task.description" /></div>
                    <div class="creator__textarea">
                        <textarea name="description" type="text" placeholder="<spring:message code="create.task.holder.description" />"></textarea>
                    </div>
                    <div class="creator__button_wrapper"><button class="creator__button button"><spring:message code="create.task.button" /></button></div>
                </div>
            </form>
        </div>
        <div class="sider">
            <ul class="sider__list">
                <li><a class="sider__link"  href="/todolist/task/simple" > <spring:message code="sider.simple" /></a></li>
                <li><a class="sider__link"  href="/todolist/task/project" > <spring:message code="sider.project" /></a></li>
                <li><a class="sider__link"  href="/todolist/calendar"  > <spring:message code="sider.calendar" /></a></li>
                <li><a class="sider__link"  href="/todolist/task/someday_maybe" > <spring:message code="sider.someday" /></a></li>
                <li><a class="sider__link"  href="/todolist/task/notes" > <spring:message code="sider.notes" /></a></li>
                <li><a class="sider__link"  href="/todolist/task/waiting_for" > <spring:message code="sider.waiting" /></a></li>

                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a class="sider__link" href="/todolist/user/list" id = "userList"  ><spring:message code="sider.users" /></a></li>
                </security:authorize>
            </ul>
            <div class="sider__element"></div>
        </div>
        <div class="container container__main">
            <div class="main">
                <div class="main__hello">
                    <spring:message code="greeting" /> ${pageContext.request.userPrincipal.name}!
                </div>
                <div class="main__date">
                    <spring:message code="today" /><span> ${today} </span>
                </div>
                <div class="main__row">
                    <div class="main__column main__column_tasks">
                        <div class="main__tasks tasks">
                            <div class="tasks__header">
                                <spring:message code="dedline.task" />
                            </div>
                            <form action="${path}/task/executed"  class="main__elements elements">
                                <c:forEach items="${taskToday}" var="task">
                                    <div class="main__element element" data-title = "${task.getDescription()}" aria-haspopup="true">

                                        <c:if test="${task.getTaskExecuted() == 0}">
                                            <label class="element__checkbox checkbox-2">
                                                <input onclick="executedTask('task', '${task.taskId}');" class="checkbox" type="checkbox">
                                                <span></span>
                                            </label>
                                                <div class="element__info">
                                                    <div class="element__task-name">
                                                        <c:out value="${task.getTitle()}"/>
                                                    </div>
                                                    <div class="element__date">
                                                        <c:out value=" ${task.getEnd().substring(11, 16)}"/>&nbsp <c:out value="${task.getEnd().substring(0, 10)}"/>
                                                    </div>
                                                </div>
                                            <div class="element__settings">
                                                <div class="element__gear">
                                                    <a href="${path}\task\edit\ ${task.taskId}"><img src="./images/settings.svg" alt="gear"></a>
                                                </div>
                                                <div class="element__delete">
                                                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')"><img src="./images/delete.svg" alt="trash bin"></a>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:if test="${task.getTaskExecuted() == 1}">
                                            <label class="element__checkbox checkbox-2">
                                                <input onclick="executedTask('task', '${task.taskId}')" checked class="checkbox" type="checkbox">
                                                <span></span>
                                            </label>

                                                <div class="element__info">
                                                    <div class="element__task-name" >
                                                        <c:out value="${task.getTitle()}"/>
                                                    </div>
                                                </div>
                                                <div class="element__date">
                                                    <c:out value=" ${task.getEnd().substring(11, 16)}"/>&nbsp <c:out value="${task.getEnd().substring(0, 10)}"/>
                                                </div>


                                            <div class="element__settings">
                                                <div class="element__gear">
                                                    <a href="${path}\task\edit\ ${task.taskId}" ><img src="./images/settings.svg" alt="gear"></a>
                                                </div>
                                                <div class="element__delete">
                                                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')"><img src="./images/delete.svg" alt="trash bin"></a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                                <div class="task__add">
                                    <div class="task__add_inner">
                                        <span class="task__plus"></span>
                                        <span class="task__add-text"><spring:message code="create.task.main" /></span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="main__column main__column_statistic">
                        <div class="main__statistic statistic">
                            <div class="statistic__header">
                                <spring:message code="statistic" />
                            </div>
                            <div class="statistic__textarea">
                                <div>
                                    <input type="hidden" id="bcLabels" value="${bc.bcLabels}"/>
                                    <input type="hidden" id="bcPercents" value="${bc.bcPercents}"/>
                                    <canvas style="max-width: 100%; padding-bottom: 10px;" id="myPieChart" width="80%" height="80%"></canvas>

                                </div>
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
                    <div class="footer__facebook"><a href="#"><img src="./images/facebook.svg" alt="facebook"></a></div>
                    <div class="footer__inst"><a href="#"><img src="./images/inst.svg" alt="inst"></a> </div>
                    <div class="footer__youtube"><a href="#"><img src="./images/youtube.svg" alt="youtube"></a></div>
                    <div class="footer__viber"><a href="#"><img src="./images/viber.svg" alt="viber"></a></div>
                    <div class="footer__telegram"><a href="#"><img src="./images/telega.svg" alt="telega"></a></div>
                </div>
            </div>
            <div class="footer__corp">
                <spring:message code="footer" />
            </div>
        </div>
    </footer>
</div>
<script  src="./js/date-validator.js"></script>
<script src="./js/new_task.js"></script>
<script src="./js/burger.js"></script>

<script src="./js/line_through.js"></script>
<script src="./js/sider.js"></script>
<script type="text/javascript" src="./js/jquery.boot.js"></script>

<script src="./js/chart.js/Chart.min.js"></script>
<script src="./js/sb-admin-charts.js"></script>
<script type="text/javascript" src="./js/jquery.save.js"></script>

<script>dateValidate();</script>


</body>
</html>