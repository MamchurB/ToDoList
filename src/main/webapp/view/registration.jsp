<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        body {
            background-size: cover;
            display: flex;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                                <form:form method="POST" modelAttribute="userForm">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                <form class="mx-1 mx-md-4" method="POST" action="${path}/user/registration">

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label">Your Full Name</label><br>
                                            <form:input type="text" path="fullName" placeholder="Full Name"
                                                        autofocus="true"></form:input>


                                        </div>

                                        <div class="d-flex flex-row align-items-center mb-4">
                                            <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                            <div class="form-outline flex-fill mb-0">
                                                <label class="form-label">Your User Name</label><br>
                                                <form:input type="text" path="userName" placeholder="User Name"
                                                            autofocus="true"></form:input>
                                                <form:errors path="userName"></form:errors>
                                                    ${usernameError}

                                            </div>

                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" >Your Email</label><br>
                                            <form:input type="text" path="email" placeholder="Email"
                                                        autofocus="true"></form:input>
                                            <form:errors path="email"></form:errors>
                                                ${usernameError}

                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" >Your Mobile</label><br>
                                            <form:input type="text" path="mobile" placeholder="Mobile"
                                                        autofocus="true"></form:input>
                                            <form:errors path="mobile"></form:errors>
                                                ${usernameError}

                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label">Password</label><br>
                                            <form:input type="text" path="password" placeholder="Password"
                                                        autofocus="true"></form:input>
                                            <form:errors path="password"></form:errors>
                                                ${passwordError}

                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" >Repeat your password</label><br>
                                            <form:input type="text" path="passwordConfirm" placeholder="Password"
                                                        autofocus="true"></form:input>
                                            <form:errors path="passwordConfirm"></form:errors>
                                                ${usernameError}

                                        </div>
                                    </div>


                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="submit" class="btn btn-primary btn-lg">Register</button>
                                    </div>

                                </form>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>
