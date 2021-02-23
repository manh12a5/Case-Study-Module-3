<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2/21/2021
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<html>
<head>
    <title>List Manufacturers</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Manufacturers</h2></caption>
        <tr>
            <div>
                <a href="/manufacturers?action=create">
                    <button>Thêm mới</button>
                </a>
            </div>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th colspan="2"></th>
        </tr>
        <c:forEach var="manufacturer" items="${manufacturer}">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>
                    <a href="/manufacturers?action=edit&id=${manufacturer.getId()}">Edit</a>
                    <a href="/manufacturers?action=delete&id=${manufacturer.getId()}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
