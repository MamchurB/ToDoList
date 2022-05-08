<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Calendar</title>



    <link rel="shortcut icon" href="https://ignite.apache.org/images/java.png">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">


        <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.css"
              th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.css}" rel="stylesheet"></link>
        <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.print.css"
              th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.print.css}" rel="stylesheet" media="print"></link>
    <link rel="stylesheet" href="/todolist/css/style.css">
</head>

<body class="calendar__body">
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
                <li><a class="sider__link" href="javascript:void(0);" id = "taskList"  >Things</a></li>
                <li><a class="sider__link" id = "List1" href="javascript:void(0);" >ASAP List</a></li>
                <li><a class="sider__link" id = "List2" href="javascript:void(0);" >Projects</a></li>
                <li><a class="sider__link"  href="${path}/calendar" id = "calendarList" >Calendar</a></li>
                <li><a class="sider__link" id = "List3" href="javascript:void(0);" >SOmeday-Maybe List</a></li>
                <li><a class="sider__link" id = "List4" href="javascript:void(0);" >NOtes</a></li>
                <li><a class="sider__link" id = "List5" href="${path}/task/waiting_for" >Waiting-For List</a></li>
                <li><a class="sider__link" href="${path}/user/list" id = "userList"  >Users</a></li>
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
                "Busy Man", 2022. All rights reserved. CrEATEd by Bohdan Mamchur and Vasyl Zyzen
            </div>
        </div>
    </footer>
</div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"
        th:src="@{/webjars/momentjs/2.9.0/min/moment.min.js}" type="text/javascript"></script>
<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
        th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.min.js"
        th:src="@{/webjars/fullcalendar/2.2.5/fullcalendar.min.js}" type="text/javascript"></script>

<%--    <script type="text/javascript" src="${path}/js/jquery.boot.js"></script>--%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
   <script>
      var tasks = ${ events };
      $(document).ready(function () {
         $('#calendar').fullCalendar({
            header: {
               left: 'prev,next today',
               center: 'title',
               right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: '2022-06-01',
            editable: true,
            eventLimit: true,
            events: tasks,
         });
      });
   </script>

<%--<div id='calendar' th:id="calendar"></div>--%>
<script src="./js/burger.js"></script>
<script src="./js/sider.js"></script>

</body>

</html>