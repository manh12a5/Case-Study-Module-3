<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/21/2021
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Products</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Shop</h2></caption>
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

                    <%--                Edit        --%>
                <td>
                    <div class="w3-container">

                            <%--                        lúc click thì hiển thị cái modal sửa ra  display='block'" --%>
                        <button onclick="document.getElementById('id02' + ${p.getId()}).style.display='block'"
                                class="w3-button w3-black">Update
                        </button>

                            <%--                        này là cái modal--%>
                        <div id="id02${p.getId()}" class="w3-modal">
                                <%--                            id="id02${p.getId()}"--%>

                            <div class="w3-modal-content w3-animate-top w3-card-4">
                                <header class="w3-container w3-teal">
                                    <span onclick="document.getElementById('id02' + ${p.getId()}).style.display='none'"
                                          class="w3-button w3-display-topright">&times;</span>
                                    <h2>Edit shop</h2>
                                </header>
                                <div class="w3-container">
                                    <form action="/shop?action=edit&id=${p.getId()}" method="post">
                                        <table>
                                            <tr>
                                                <th>Name:</th>
                                                <td>
                                                    <input type="hidden" name="idS" value="${p.getId()}"/>
                                                    <input type="text" name="nameS" size="45" value="${p.getName()}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Address:</th>
                                                <td>
                                                    <input type="text" name="addressS" size="45"
                                                           value="${p.getAddress()}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>PhoneNumber:</th>
                                                <td>
                                                    <input type="hidden" name="account_id" value="${p.getAccountId()}"/>
                                                    <input type="text" name="phoneNumberS" size="45"
                                                           value="${p.getPhoneNumber()}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" text-align="center">
                                                    <input type="submit" value="Save"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                <footer class="w3-container w3-teal">
                                </footer>
                            </div>
                        </div>
                    </div>
                </td>


                <td>
                    <form action="/shop?action=delete&id=${p.getId()}" method="post" border-color="black">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%--Nút thêm mới--%>
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
                <form action="/shop?action=create" method="post">
                    <table>
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
                                <select name="nameAccount">
                                    <c:forEach var="c" items="${nameAccount}">
                                        <option value="${c}">${c}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="1" text-align="center">
                                <input type="submit" value="Save" size="15"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <footer class="w3-container w3-teal">
            </footer>
        </div>
    </div>
</div>
</body>
</html>
