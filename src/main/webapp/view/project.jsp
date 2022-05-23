<%@ page language="java" contentType="text/html; "
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
<html lang="${lang}">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BusyMan - Project List</title>
  <link id="theme" rel="stylesheet" href="${theme}">
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
            <li><a href="${path}" class="header__link"> <fmt:message key="header.home" /></a></li>
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
  <form class="creator" action="${path}/task/add" method="post" id="submitTaskForm">
  <div class="creator__header">
     <fmt:message key="create.task.header" />
    <span class="creator__close"></span>
  </div>
  <div class="creator__body">
    <div class="creator__text"> <fmt:message key="create.task.name" /></div>
    <div class="creator__input input">
      <input name="title" type="text" placeholder=" <fmt:message key="create.task.holder.name" />">
    </div>

    <input name="taskType" type="hidden" value="project">
    <div class="creator__text"> <fmt:message key="create.task.start" /></div>
    <div class="creator__input input">
      <input id="startDate" name="start" type="datetime-local" placeholder="STARTING DATE">
    </div>
    <div class="creator__text"> <fmt:message key="create.task.end" /></div>
    <div class="creator__input input">
      <input id="endDate"  name="end" type="datetime-local" placeholder="ENDING DATE">
    </div>
    <div class="creator__text"> <fmt:message key="create.task.description" /></div>
    <div class="creator__textarea">
      <textarea name="description" type="text" placeholder=" <fmt:message key="create.task.description" />"></textarea>
    </div>
    <div class="creator__button_wrapper"><button class="creator__button button"> <fmt:message key="create.task.button" /></button></div>
  </div>
  </form>
    </div>
    <div class="add__wrapper" >
      <form class="creator" action="${path}/task/adding_sub_task" method="post">
      <div class="creator__header">
         <fmt:message key="create.task.main" />
        <span class="add__close"></span>
      </div>
      <div class="creator__body">
        <div class="creator__text"> <fmt:message key="create.task.name" /></div>
        <div class="creator__input input">
          <input name="title" type="text" placeholder="TASK NAME">
        </div>

        <input name="taskType" type="hidden" value="project">
        <input name="taskParentId" type="hidden" value="${id}">
        <div class="creator__text"> <fmt:message key="create.task.start" /></div>
        <div class="creator__input input">
          <input id="startDate-pj" name="start" type="datetime-local" placeholder="STARTING DATE">
        </div>
        <div class="creator__text"> <fmt:message key="create.task.end" /></div>
        <div class="creator__input input">
          <input id="endDate-pj" name="end" type="datetime-local" placeholder="ENDING DATE">
        </div>
        <div class="creator__text"> <fmt:message key="create.task.description" /></div>
        <div class="creator__textarea">
          <textarea name="description" type="text" placeholder="ENTER DESCRIPTION"></textarea>
        </div>
        <div class="creator__button_wrapper"><button class="add__button button"> <fmt:message key="create.task.button" /></button></div>
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

<%--        <li>--%>
<%--          <div class="theme sider__link">--%>
<%--             <fmt:message key="sider.theme" />--%>
<%--          </div>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--          <div class="sider__link">--%>
<%--             <fmt:message key="sider.language" />--%>
<%--          </div>--%>
<%--        </li>--%>
      </ul>
      <div class="sider__element"></div>
    </div>
    <div class="container container__project">
      <div class="tasks__project">
        <div class="tasks__header">
           <fmt:message key="project.task" />
        </div>
        <form action="${path}/task/executed"  class="tasks__elements">
          <c:forEach var="task" items="${tasks}" varStatus="loop">
            <c:if test="${task.parentTaskId == null}">
              <c:if test="${task.getTaskExecuted() == 0}">
            <ul class="element__list">
              <div class="project__element project__parent element" data-title = "${task.getDescription()}" aria-haspopup="true">
                <span class="element__triangle icon-triangle"></span>
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
                    <a  href="\todolist\task\edit\ ${task.taskId}" class="icon-settings"></a>
                  </div>
                  <div class="element__delete">
                    <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')" class="icon-delete"></a>
                  </div>
                  <div>
                    <a  onclick="addingTask('task', ${task.taskId})"> <div class="element__add "></div></a>
                  </div>
                </div>
              </div>
              </c:if>
              <c:if test="${task.getTaskExecuted() == 1}">
              <ul class="element__list">
                <div class="project__element project__parent element" data-title = "${task.getDescription()}" aria-haspopup="true">
                  <span class="element__triangle icon-triangle"></span>
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
                      <a  href="\todolist\task\edit\ ${task.taskId}" class="icon-settings"></a>
                    </div>
                    <div class="element__delete">
                      <a href="javascript:void(0);" onclick="deleteData('task', '${task.taskId}')" class="icon-delete"></a>
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
                <div class="project__element element" data-title = "${subTask.getDescription()}" aria-haspopup="true">
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
                      <a href="\todolist\task\edit\ ${subTask.taskId}" class="icon-settings"></a>
                    </div>
                    <div class="element__delete">
                      <a href="javascript:void(0);" onclick="deleteData('task', '${subTask.taskId}')" class="icon-delete"></a>
                    </div>
                  </div>
                </div>
              </li>
              </c:if>
                <c:if test="${subTask.getTaskExecuted() == 1}">
                  <li>
                    <div class="project__element element" data-title = "${subTask.getDescription()}" aria-haspopup="true">
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
                          <a href="\todolist\task\edit\ ${subTask.taskId}" class="icon-settings"></a>
                        </div>
                        <div class="element__delete">
                          <a href="javascript:void(0);" onclick="deleteData('task', '${subTask.taskId}')" class="icon-delete"></a>
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

<script src="../js/burger.js"></script>
<script src="../js/project.js"></script>
<script src="../js/auto_checkBox.js"></script>
<script src="../js/new_project.js"></script>
<script src="../js/project_adder.js"></script>
<script src="../js/line_through.js"></script>
<script src="../js/sider.js"></script>
<script src="../js/theme.js"></script>

<script>dateValidate();</script>

<script type="text/javascript" src="../js/jquery.boot.js"></script>
<script type="text/javascript" src="../js/jquery.save.js"></script>

</body>

</html>