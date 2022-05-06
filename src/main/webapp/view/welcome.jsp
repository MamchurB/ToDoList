<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="https://ignite.apache.org/images/java.png">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<%--    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/todolist/css/style.css">

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


    <title>BusyMan - Home</title>
</head>
<body class="main__body">
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
        <div class="creator__wrapper">
            <form action="${path}/task/add" method="post" class="creator" id="submitAddTask" >
                <div class="creator__header">
                    Creating a new task:
                    <span class="creator__close"></span>
                </div>
                <div class="creator__body">
                    <div class="creator__text">Name:</div>
                    <div class="creator__input input">
                        <input name="title" type="text" placeholder="TASK NAME">
                    </div>
                    <div id="input__owner_text" class="creator__text creator__input_owner">Task owner:</div>
                    <div id="input__owner" class="creator__input input creator__input_owner">
                        <input name ="owner" class="input__owner" type="text" placeholder="TASK OWNER">
                    </div>
                    <div class="creator__text">Select type:</div>
                    <div class="creator__select">
                        <select name="taskType" id="creator__select">
                            <option value="asap"> ASAP LIST</option>
                            <option value="someday">SOMEDAY-MAYBE LIST</option>
                            <option value="notes">NOTES</option>
                            <option value="waiting-for">WAITING-FOR LIST</option>
                        </select>

                    </div>
                    <div class="creator__text creator__input_dates dates__invisible">STARTING DATE:</div>
                    <div class="creator__input input creator__input_dates dates__invisible">
                        <input name="start" type="datetime-local" placeholder="STARTING DATE">
                    </div>
                    <div class="creator__text creator__input_dates dates__invisible">ENDING DATE:</div>
                    <div class="creator__input input creator__input_dates dates__invisible">
                        <input name="end" type="datetime-local" placeholder="ENDING DATE">
                    </div>
                    <div class="creator__text">Description:</div>
                    <div class="creator__textarea">
                        <textarea name="description" type="text" placeholder="ENTER DESCRIPTION"></textarea>
                    </div>
                    <div class="creator__button_wrapper"><button class="creator__button button">Create</button></div>
                </div>
            </form>
        </div>
        <div class="sider">
            <ul class="sider__list">
                <li><a class="sider__link" href="javascript:void(0);" id = "taskList"  >Things</a></li>
                <li><a class="sider__link" id = "List1" href="javascript:void(0);" >ASAP List</a></li>
                <li><a class="sider__link" id = "List2" href="javascript:void(0);" >Projects</a></li>
                <li><a class="sider__link"  href="${path}/calendar" id = "calendarList" >Calendar</a></li>
                <li><a class="sider__link" id = "List3" href="javascript:void(0);" >SOmeday-Maybe List</a></li>
                <li><a class="sider__link" id = "List4" href="javascript:void(0);" >NOtes</a></li>
                <li><a class="sider__link" id = "List5" href="${path}/task/list?page=1" >Waiting-For List</a></li>
                <li><a class="sider__link" href="${path}/user/list?page=1" id = "userList"  >Users</a></li>
            </ul>
            <div class="sider__element"></div>
        </div>
        <div class="container container__main">
            <div class="main">
                <div class="main__hello">
                    Hello,  ${pageContext.request.userPrincipal.name}!
                </div>
                <div class="main__date">
                    today is<span> ${today} </span>
                </div>
                <div class="main__row">
                    <div class="main__column main__column_tasks">
                        <div class="main__tasks tasks">
                            <div class="tasks__header">
                                Your upcoming deadlines:
                            </div>
                            <form action="${path}/task/executed"  class="main__elements elements">
                                <c:forEach items="${taskToday}" var="task">
                                    <div class="main__element element">


                                        <c:if test="${task.getTaskExecuted() == 0}">
                                            <label class="element__checkbox checkbox-2">
                                                <input onclick="executedTask('task', '${task.taskId}');" class="checkbox" type="checkbox">
                                                <span></span>
                                            </label>
                                            <div class="element__info">
                                                <div class="element__task-name">
                                                        ${task.getTitle()}
                                                </div>
                                                <div class="element__date">
                                                        ${task.getStart()}
                                                </div>
                                            </div>
                                            <div class="element__settings">
                                                <div class="element__gear">
                                                    <a href="${path}\task\edit\ ${task.taskId}")"><img src="./images/settings.svg" alt="gear"></a>
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
                                                <div class="element__task-name">
                                                        ${task.getTitle()}
                                                </div>
                                                <div class="element__date">
                                                        ${task.getStart()}
                                                </div>
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
                                        <span class="task__add-text">Create A New Task</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="main__column main__column_statistic">
                        <div class="main__statistic statistic">
                            <div class="statistic__header">
                                Your statistic
                            </div>
                            <div class="statistic__textarea">
                                <div>
                                    <input type="hidden" id="bcLabels" value="${bc.bcLabels}"/>
                                    <input type="hidden" id="bcPercents" value="${bc.bcPercents}"/>
                                    <canvas style="padding-bottom: 10px;" id="myPieChart" width="80%" height="80%"></canvas>

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
                "Busy Man", 2022. All rights reserved. CrEATEd by Bohdan Mamchur and Vasyl Zyzen
            </div>
        </div>
    </footer>
</div>
<script src="./js/new_task.js"></script>
<script src="./js/burger.js"></script>

<script src="./js/line_through.js"></script>
<script src="./js/sider.js"></script>
<script type="text/javascript" src="./js/jquery.boot.js"></script>

<script src="./js/chart.js/Chart.min.js"></script>
<script src="./js/sb-admin-charts.js"></script>
<script type="text/javascript" src="./js/jquery.save.js"></script>
</body>
</html>