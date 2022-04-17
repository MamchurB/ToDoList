<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <form:form method="post" class="form-horizontal" action="${path}/task/add" commandName="taskForm" id="submitTaskForm">
        <form:hidden path="taskId"/>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-md-2 control-label">Task Name : </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="taskName" placeholder="Enter Task Name" required="true"/>
                </div>

            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">Is Executed: </label>
                <div class="col-md-4">
                    <form:input class="form-control" path="taskExecuted" placeholder="Enter Exucuted" required="true"/>
                </div>

                <label class="col-md-2 control-label">Dedline : </label>
                <div class="col-md-4">
                    <form:input type = "date" class="form-control" path="dedline" placeholder="Enter Dedline" required="true"/>
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
            <form:button value="Save" class="btn btn-xs btn-default">
                <span class="glyphicon glyphicon-floppy-disk"></span>
                <c:choose>
                    <c:when test="${isNew}"> Save</c:when>
                    <c:otherwise> Update</c:otherwise>
                </c:choose>
            </form:button>
        </div>
    </form:form>
</div>