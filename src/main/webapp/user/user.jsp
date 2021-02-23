
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All user account</title>
</head>
<body>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="btn-toolbar">
    <button class="btn btn-primary">New User</button>

</div>
<div class="well">
    <table class="table">
        <thead>
        <tr>
            <th>Full name</th>
            <th>Gmail</th>
            <th>Password</th>
            <th>Birthday</th>
            <th>PhoneNumber</th>
            <th>Address</th>
            <th>Role</th>
            <th>Action</th>
            <th style="width: 36px;"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${user}" var="u">
        <tr>
            <td>${u.fullname}</td>
            <td>${u.email}</td>
            <td>${u.password}</td>
            <td>${u.birthday}</td>
            <td>${u.phoneNumber}</td>
            <td>${u.address}</td>
            <td>${u.role}</td>
            <td>
                <a href="/user?action=edit"><i class="icon-pencil"></i></a>
                <a href="/user?action=delete" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
            </td>
        </tr>
        </c:forEach>

        </tbody>
    </table>
</div>



</body>
</html>
