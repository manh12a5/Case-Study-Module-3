<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2/19/2021
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<html>
<head>
    <title>List Products</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Product</h2></caption>
        <tr>
            <div>
                <a href="/products?action=create">
                    <button>Thêm mới</button>
                </a>
            </div>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Color</th>
            <th>Description</th>
            <th colspan="2"></th>
        </tr>
        <c:forEach var="product" items="${product}">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getAmount()}</td>
                <td>${product.getColor()}</td>
                <td>${product.getDescription()}</td>
                <td>
                    <a href="/products?action=edit&id=${product.getId()}">Edit</a>
                    <a href="/products?action=delete&id=${product.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
