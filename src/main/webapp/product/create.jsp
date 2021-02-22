<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2/20/2021
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/products">List All Products</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Product</h2>
            </caption>
            <tr>
                <th>Name Product:</th>
                <td>
                    <input type="text" name="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Amount:</th>
                <td>
                    <input type="text" name="amount" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Color:</th>
                <td>
                    <input type="text" name="color" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Description:</th>
                <td>
                    <input type="text" name="description" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Manufacturer:</th>
                <td>
                    <select name="manufacturer">
                        <c:forEach var="manufacturer" items="${manufacturer}">
                            <option value="${manufacturer.getId()}">${manufacturer.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Shop:</th>
                <td>
                    <select name="shop">
                        <c:forEach var="shop" items="${shop}">
                            <option value="${shop.getId()}">${shop.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Image (SRC):</th>
                <td>
                    <input type="text" name="image" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
