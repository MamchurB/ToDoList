<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Calendar</title>

    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.2/main.min.css'>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.4.2/main.min.css'>
    <link rel="stylesheet" href="/todolist/css/style.css">
</head>

<body class="calendar__body" translate="no" >
<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header__body">
                <a href="/todolist/" class="header__logo">Busy Man</a>
                <nav class="header__menu">
                    <ul class="header__list">
                        <li><a href="/todolist/" class="header__link">Home</a></li>
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
        <div class="container container__calendar">
            <div id='calendar' th:id="calendar"></div>
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
                "Busy Man", 2022. All rights reserved. CrEATEd by Mamchur, Zyzen and TYMCHENKO
            </div>
        </div>
    </footer>
</div>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>

<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.2/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.4.2/main.min.js'></script>
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<script id="rendered-js" >
    var tasks = ${ events };
    var today = new Date();
    let events = tasks.map(x => {return {title:x.title, start: new Date(x.start),
        end: new Date(x.end),
        description: x.description}})
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ['dayGrid'],
            defaultDate: today,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            selectable: true,
            eventLimit: true,
            eventRender: function (info) {
                var tooltip = new Tooltip(info.el, {
                    title: info.event.extendedProps.description,
                    placement: 'top',
                    trigger: 'hover',
                    container: 'body' });

            },

            events: events
        });
        calendar.render();
    });
    //# sourceURL=pen.js
</script>

<script src="./js/burger.js"></script>
<script src="./js/sider.js"></script>

</body>

</html>