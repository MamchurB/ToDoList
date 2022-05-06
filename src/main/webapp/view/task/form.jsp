<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
        th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<div class="panel panel-default">
    <div class="panel-heading">
        <strong>
            <c:choose>
                <c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
                <c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
            </c:choose> Task
        </strong>
    </div>
    <form:form method="post" class="form-horizontal" action="${path}/task/edit" commandName="taskForm" id="submitTaskForm">
        <form:hidden path="taskId"/>
        <form:hidden path="taskExecuted"/>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-md-2 control-label">Task Name : </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="title" placeholder="Enter Task Name" required="true"/>
                </div>

            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">Owner : </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="owner" placeholder="Enter owner" required="true"/>
                </div>

            </div>

            <div class="form-group">
<%--                <label class="col-md-2 control-label">Is Executed: </label>--%>
<%--                <div class="col-md-4">--%>
<%--                    <form:input class="form-control" path="taskExecuted" placeholder="Enter Exucuted" required="true"/>--%>
<%--                </div>--%>

                <label class="col-md-2 control-label">Start : </label>
                <div class="col-md-4">
                    <form:input type = "datetime-local" class="form-control" path="start" placeholder="Enter start task" required="true"/>
                </div>
                <label class="col-md-2 control-label">End : </label>
                <div class="col-md-4">
                    <form:input type = "datetime-local" class="form-control" path="end" placeholder="Enter end task" required="true"/>
                </div>

                <label class="col-md-2 control-label">Description : </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="description" placeholder="Enter description" required="true"/>
                </div>

                <label class="col-md-2 control-label">Task Type: </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="taskType" placeholder="Enter Task Type" required="true"/>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <form:button onclick="location.href='${path}'" value="Save" class="btn btn-xs btn-default">
                <span class="glyphicon glyphicon-floppy-disk"></span>
                <c:choose>
                    <c:when test="${isNew}"> Save</c:when>
                    <c:otherwise>  Update</c:otherwise>
                </c:choose>
            </form:button>
        </div>
    </form:form>
</div>