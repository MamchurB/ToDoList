<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                <a href="main.html" class="header__logo">Busy Man</a>
                <nav class="header__menu">
                    <ul class="header__list">
                        <li><a href="main.html" class="header__link">Home</a></li>
                        <li><a href="about-us.html" class="header__link">About us</a></li>
                        <li><a href="index.html" class="header__link">Log out</a></li>
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
                <li><a class="sider__link" href="users.html">Users</a></li>
            </ul>
            <div class="sider__element"></div>
        </div>
        <div class="container container__form">
            <div class="form__user">
                <div class="creator__header">
                        Editing Task:
                </div>
                <form:form method="post" class="form-horizontal" action="${path}/task/edit" commandName="taskForm" id="submitTaskForm">
                    <form:hidden path="taskId"/>
                    <form:hidden path="taskExecuted"/>
                    <div class="creator__body">
                        <div class="creator__text">Task Name:</div>
                        <div class="creator__input input">
                            <form:input class="input" path="title" placeholder="Enter Task Name" required="true"/>
                        </div>

                        <div class="creator__text">Owner:</div>
                        <div class="creator__input input">
                            <form:input class="input" path="owner" placeholder="Enter owner" required="true"/>
                        </div>

                        <div class="creator__text">Start:</div>
                        <div class="creator__input input">
                            <form:input type = "datetime-local" class="input" path="start" placeholder="Enter start task" required="true"/>
                        </div>

                        <div class="creator__text">End:</div>
                        <div class="creator__input input">
                            <form:input type = "datetime-local" class="input" path="end" placeholder="Enter end task" required="true"/>
                        </div>

                        <div class="creator__text">Description:</div>
                        <div class="creator__input input">
                            <form:input class="input" path="description" placeholder="Enter description" required="true"/>
                        </div>

                        <div class="creator__text">Task Type:</div>
                        <div class="creator__input input">
                            <form:input class="input" path="taskType" placeholder="Enter Task Type" required="true"/>
                        </div>
                        <form:button onclick="location.href='${path}'" value="Save" >
                        <div class="creator__button_wrapper"><button onclick="location.href='${path}'" class="creator__button button">Change</button></div>
                        </form:button>
<%--                        <div onclick="location.href='${path}'" class="creator__button_wrapper"><button class="creator__button button">Change</button></div>--%>

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
                "Busy Man", 2022. All rights reserved. CrEATEd by Bohdan Mamchur and Vasyl Zyzen
            </div>
        </div>
    </footer>
</div>
<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
        th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<script src="/todolist/js/burger.js"></script>
<script src="/todolist/js/sider.js"></script>
</body>

</html>