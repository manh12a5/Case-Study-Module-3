<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/21/2021
  Time: 3:26 PM
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
            <th>Name</th>
            <th>Address</th>
            <th>PhoneNumber</th>
            <th colspan="2"></th>
        </tr>
        <c:forEach var="p" items="${shop}">
            <tr>
                <td>${p.getName()}</td>
                <td>${p.getAddress()}</td>
                <td>${p.getPhoneNumber()}</td>
                <td>
                    <a href="/shop?action=edit&id=${p.getId()}" >Edit</a>
                </td>
                <td>
                    <form action="/shop?action=delete&id=${p.getId()}" method="post">
                        <button type="submit" >Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<div class="w3-container">
    <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">Create</button>
    <div id="id01" class="w3-modal">
        <div class="w3-modal-content w3-animate-top w3-card-4">
            <header class="w3-container w3-teal">
        <span onclick="document.getElementById('id01').style.display='none'"
              class="w3-button w3-display-topright">&times;</span>
                <h2>Create new shop</h2>
            </header>
            <div class="w3-container">
                <form method="post">
                    <table border="1" cellpadding="5">
                        <tr>
                            <th>ID:</th>
                            <td>
                                <input type="text" name="idShop" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Name:</th>
                            <td>
                                <input type="text" name="nameShop" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Address:</th>
                            <td>
                                <input type="text" name="addressShop" size="45"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Phone:</th>
                            <td>
                                <input type="text" name="phoneNumberShop" size="45"/>
                            </td>
                        </tr>

                        <tr>
                            <th>AccountId:</th>
                            <td>
                                <c:forEach var="c" items="${accountId}">
                                    <input type="radio" name="accountIdShop" value="${c}" >${c}<br>
                                </c:forEach>
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
            <footer class="w3-container w3-teal">
                <p>Create</p>
            </footer>
        </div>
    </div>
</div>
</body>
</html>
