<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Notes</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

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
        <div class="creator__wrapper">
            <form action="${path}/task/add" method="post" class="creator" id="submitAddTask">
                <div class="creator__header">
                    Creating a new note:
                    <span class="creator__close"></span>
                </div>
                <input name="taskType" type="hidden" value = "notes">
                <div class="creator__body">
                    <div class="creator__text">Name:</div>
                    <div class="creator__input input">
                        <input name="title" type="text" placeholder="note NAME">
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
        <div class="notes">
            <div class="container container__notes">
                <div class="notes__header">
                    Your Notes:
                </div>
                <div class="notes__row">
                    <c:forEach items="${tasks}" var="task">
                    <div class="notes__column_wrapper">
                        <div class="notes__column">
                            <div class="notes__label">
                            </div>
                            <div class="notes__body">
                                <div class="notes__top notes-top">
                                    <div class="element__settings notes__settings">
                                        <div class="element__gear">
                                            <a href="\todolist\task\edit\ ${task.taskId}"><img src="../images/settings.svg" alt="gear"></a>
                                        </div>
                                        <div class="element__delete">
                                            <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')"><img src="../images/delete.svg" alt="trash bin"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="notes__textarea">
                                    <div class="notes__name">
                                 <span class="notes__info">
                                    Name:
                                 </span>
                                        <span>
                                            <c:out value="${task.getTitle()}"/>
                                 </span>
                                    </div>
                                    <div class="notes__description">
                                        <div class="notes__info">
                                            Description:
                                        </div>
                                        <div>
                                            <c:out value="${task.getDescription()}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="notes__date">${task.getStart()}</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="notes__column_wrapper">
                        <a href="javascript:void(0)" class="notes__new">
                            <div class="notes__column notes__column_new">
                                <div class="notes__label notes__label_new">

                                </div>
                                <div class="notes__body">
                                    <div class="notes__top notes-top">
                                    </div>
                                    <div class="notes__textarea notes__textarea_new">
                                        ADD NOTE
                                    </div>
                                </div>
                            </div>
                        </a>
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
<script src="../js/new-note.js"></script>

<script type="text/javascript" src="../js/jquery.boot.js"></script>
<script type="text/javascript" src="../js/jquery.save.js"></script>

</body>

</html>