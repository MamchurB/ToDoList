<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml"--%>
<%--      >--%>
<%--<head>--%>
<%--    <meta charset='utf-8' content="Cory Sanoy" name="Author" />--%>
<%--    <link rel="shortcut icon" href="https://ignite.apache.org/images/java.png">--%>

<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">--%>
<%--    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet" href="/todolist/css/style.css">--%>

<%--    <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.css"--%>
<%--          th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.css}" rel="stylesheet"></link>--%>
<%--    <link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.print.css"--%>
<%--          th:href="@{/webjars/fullcalendar/2.2.5/fullcalendar.print.css}" rel="stylesheet" media="print"></link>--%>
<%--    <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"--%>
<%--            th:src="@{/webjars/momentjs/2.9.0/min/moment.min.js}" type="text/javascript"></script>--%>
<%--    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"--%>
<%--            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>--%>
<%--    <script src="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.min.js"--%>
<%--            th:src="@{/webjars/fullcalendar/2.2.5/fullcalendar.min.js}" type="text/javascript"></script>--%>

<%--    <script type="text/javascript" src="${path}/js/jquery.boot.js"></script>--%>
<%--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>--%>


<%--    <script>--%>
<%--        var tasks = ${events};--%>
<%--        $(document).ready(function() {--%>
<%--            $('#calendar').fullCalendar({--%>
<%--                header: {--%>
<%--                    left: 'prev,next today',--%>
<%--                    center: 'title',--%>
<%--                    right: 'month,agendaWeek,agendaDay'--%>
<%--                },--%>
<%--                defaultDate: '2022-06-01',--%>
<%--                editable: true,--%>
<%--                eventLimit: true,--%>
<%--                events: tasks,--%>
<%--            });--%>

<%--        });--%>

<%--    </script>--%>

<%--    <style>--%>
<%--        body {--%>
<%--            margin: 40px 10px;--%>
<%--            padding: 0;--%>
<%--            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;--%>
<%--            font-size: 14px;--%>
<%--        }--%>
<%--        #calendar {--%>
<%--            max-width: 900px;--%>
<%--            margin: 0 auto;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id='calendar' th:id="calendar"></div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Calendar</title>

    <link rel="stylesheet" href="/todolist/css/style.css">
    <link rel="shortcut icon" href="https://ignite.apache.org/images/java.png">--%>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">


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
</head>

<body class="calendar__body">
<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header__body">
                <a href="main.html" class="header__logo">Busy Man</a>
                <nav class="header__menu">
                    <ul class="header__list">
                        <li><a href="main.html" class="header__link">Home</a></li>
                        <li><a href="" class="header__link">About us</a></li>
                        <li><a href="" class="header__link">Contacts</a></li>
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
                <li><a class="sider__link" href="">Things</a></li>
                <li><a class="sider__link" href="">ASAP List</a></li>
                <li><a class="sider__link" href="project.html">Projects</a></li>
                <li class="sider__active"><a class="sider__link" href="calendar.html">Calendar</a></li>
                <li><a class="sider__link" href="">SOmeday-Maybe List</a></li>
                <li><a class="sider__link" href="">NOtes</a></li>
                <li><a class="sider__link" href="waiting-for.html">Waiting-For List</a></li>
                <li><a class="sider__link" href="">Users</a></li>
            </ul>
            <div class="sider__element"></div>
        </div>
        <div class="container">

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