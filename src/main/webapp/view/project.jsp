<%@ page language="java" contentType="text/html; "
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BusyMan - Project List</title>
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
        <a href="/todolist" class="header__logo">Busy Man</a>
        <nav class="header__menu">
          <ul class="header__list">
            <li><a href="/todolist" class="header__link">Home</a></li>
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
  <form class="creator" action="${path}/task/add" method="post" id="submitTaskForm">
  <div class="creator__header">
    Creating a new task:
    <span class="creator__close"></span>
  </div>
  <div class="creator__body">
    <div class="creator__text">Name:</div>
    <div class="creator__input input">
      <input name="title" type="text" placeholder="TASK NAME">
    </div>

    <input name="taskType" type="hidden" value="project">
    <div class="creator__text">STARTING DATE:</div>
    <div class="creator__input input">
      <input id="startDate" name="start" type="datetime-local" placeholder="STARTING DATE">
    </div>
    <div class="creator__text">ENDING DATE:</div>
    <div class="creator__input input">
      <input id="endDate"  name="end" type="datetime-local" placeholder="ENDING DATE">
    </div>
    <div class="creator__text">Description:</div>
    <div class="creator__textarea">
      <textarea name="description" type="text" placeholder="ENTER DESCRIPTION"></textarea>
    </div>
    <div class="creator__button_wrapper"><button class="creator__button button">Create</button></div>
  </div>
  </form>
    </div>
    <div class="add__wrapper" >
      <form class="creator" action="${path}/task/adding_sub_task" method="post">
      <div class="creator__header">
        Adding a new task:
        <span class="add__close"></span>
      </div>
      <div class="creator__body">
        <div class="creator__text">Name:</div>
        <div class="creator__input input">
          <input name="title" type="text" placeholder="TASK NAME">
        </div>

        <input name="taskType" type="hidden" value="project">
        <input name="taskParentId" type="hidden" value="${id}">
        <div class="creator__text">STARTING DATE:</div>
        <div class="creator__input input">
          <input id="startDate-pj" name="start" type="datetime-local" placeholder="STARTING DATE">
        </div>
        <div class="creator__text">ENDING DATE:</div>
        <div class="creator__input input">
          <input id="endDate-pj" name="end" type="datetime-local" placeholder="ENDING DATE">
        </div>
        <div class="creator__text">Description:</div>
        <div class="creator__textarea">
          <textarea name="description" type="text" placeholder="ENTER DESCRIPTION"></textarea>
        </div>
        <div class="creator__button_wrapper"><button class="add__button button">Create</button></div>
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
    <div class="container container__project">
      <div class="tasks__project">
        <div class="tasks__header">
          Your projects:
        </div>
        <form action="${path}/task/executed"  class="tasks__elements">
          <c:forEach var="task" items="${tasks}" varStatus="loop">
            <c:if test="${task.parentTaskId == null}">
              <c:if test="${task.getTaskExecuted() == 0}">
            <ul class="element__list">
              <div class="project__element project__parent element">
                <span class="element__triangle"></span>
                <label class="element__checkbox checkbox-2">
                  <input onclick="executedTask('task', '${task.taskId}');" class="checkbox" type="checkbox">
                  <span></span>
                </label>
                <div class="element__info">
                  <div class="element__task-name">
                    <c:out value="${task.title}"/>
                  </div>
                  <div class="element__date">
                    <c:out value="${task.end.substring(11, 16)}"/>&nbsp <c:out value="${task.end.substring(0, 10)}"/>
                  </div>
                </div>
                <div class="element__settings">
                  <div class="element__gear">
                    <a href="\todolist\task\edit\ ${task.taskId}"><img src="../images/settings.svg" alt="gear"></a>
                  </div>
                  <div class="element__delete">
                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')"><img src="../images/delete.svg" alt="trash bin"></a>
                  </div>
<%--                  <c:set var="id" scope="session" value="${task.taskId}"/>--%>
<%--                  <div  class="element__add add">--%>
<%--                  </div>--%>
                  <div>
                    <a  onclick="addingTask('task', ${task.taskId})"> <div class="element__add "></div></a>
                  </div>
                </div>
              </div>
              </c:if>
              <c:if test="${task.getTaskExecuted() == 1}">
              <ul class="element__list">
                <div class="project__element project__parent element">
                  <span class="element__triangle"></span>
                  <label class="element__checkbox checkbox-2">
                    <input onclick="executedTask('task', '${task.taskId}');" checked class="checkbox" type="checkbox">
                    <span></span>
                  </label>
                  <div class="element__info">
                    <div class="element__task-name">
                      <c:out value="${task.title}"/>
                    </div>
                    <div class="element__date">
                      <c:out value="${task.end.substring(11, 16)}"/>&nbsp <c:out value="${task.end.substring(0, 10)}"/>
                    </div>
                  </div>
                  <div class="element__settings">
                    <div class="element__gear">
                      <a href="\todolist\task\edit\ ${task.taskId}"><img src="../images/settings.svg" alt="gear"></a>
                    </div>
                    <div class="element__delete">
                      <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')"><img src="../images/delete.svg" alt="trash bin"></a>
                    </div>
                      <div>
                          <a  onclick="addingTask('task', ${task.taskId})"> <div class="element__add "></div></a>
                      </div>
                  </div>
                </div>
                </c:if>

              <c:forEach var="subTask" items="${tasks}" varStatus="loop">
              <c:if test="${task.taskId == subTask.getParentTaskId()}">

                <c:if test="${subTask.getTaskExecuted() == 0}">
              <li>
                <div class="project__element element">
                  <span class="element__triangle"></span>
                  <label class="element__checkbox checkbox-2">
                    <input onclick="executedTask('task', '${subTask.taskId}');" class="checkbox" type="checkbox">
                    <span></span>
                  </label>
                  <div class="element__info">
                    <div class="element__task-name">
                      <c:out value="${subTask.title}"/>
                    </div>
                    <div class="element__date">
                          <c:out value="${task.end.substring(11, 16)}"/>&nbsp <c:out value="${task.end.substring(0, 10)}"/>
                    </div>
                  </div>
                    <div class="element__settings">
                        <div class="element__gear">
                            <a href="\todolist\task\edit\ ${subTask.taskId}"><img src="../images/settings.svg" alt="gear"></a>
                        </div>
                        <div class="element__delete">
                            <a href="javascript:void(0);" onclick="deleteData('task', '${subTask.taskId}')"><img src="../images/delete.svg" alt="trash bin"></a>
                        </div>
                    </div>
                </div>
              </li>
              </c:if>
                <c:if test="${subTask.getTaskExecuted() == 1}">
                  <li>
                    <div class="project__element element">
                      <span class="element__triangle"></span>
                      <label class="element__checkbox checkbox-2">
                        <input onclick="executedTask('task', '${subTask.taskId}');" checked class="checkbox" type="checkbox">
                        <span></span>
                      </label>
                      <div class="element__info">
                        <div class="element__task-name">
                          <c:out value="${subTask.title}"/>
                        </div>
                        <div class="element__date">
                          <c:out value="${task.end.substring(11, 16)}"/>&nbsp <c:out value="${task.end.substring(0, 10)}"/>
                        </div>
                      </div>
                        <div class="element__settings">
                            <div class="element__gear">
                                <a href="\todolist\task\edit\ ${subTask.taskId}"><img src="../images/settings.svg" alt="gear"></a>
                            </div>
                            <div class="element__delete">
                                <a href="javascript:void(0);" onclick="deleteData('task', '${subTask.taskId}')"><img src="../images/delete.svg" alt="trash bin"></a>
                            </div>
                        </div>
                    </div>
                  </li>
                </c:if>
              </c:if>
              </c:forEach>
            </ul>

          </c:if>
          </c:forEach>
          <div class="task__add task__add_project">
            <div class="task__add_inner">
              <span class="task__plus"></span>
              <span class="task__add-text">Create A New Task</span>
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
<script  src="../js/date-validator.js"></script>

<script src="../js/burger.js"></script>
<script src="../js/project.js"></script>
<script src="../js/auto_checkBox.js"></script>
<script src="../js/new_project.js"></script>
<script src="../js/project_adder.js"></script>
<script src="../js/line_through.js"></script>
<script src="../js/sider.js"></script>

<script>dateValidate();</script>

<script type="text/javascript" src="../js/jquery.boot.js"></script>
<script type="text/javascript" src="../js/jquery.save.js"></script>
</body>

</html>