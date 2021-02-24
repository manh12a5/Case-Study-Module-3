<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2/24/2021
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SmartPhone</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Product</h2></caption>
        <tr>
            <th>#</th>
            <th>Ngày Đặt hàng</th>
            <th>Thông tin đơn hàng</th>
        </tr>
        <c:forEach var="cart" items="${cart}">
            <tr>
                <td>${cart.getId()}</td>
                <td>${cart.getBeginDate()}</td>
                <td>${cart.getStatus()}</td>
                <td>
                    <a href="/cart?action=delete&id=${cart.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <button>Đặt hàng</button>
</div>
</body>
</html>
