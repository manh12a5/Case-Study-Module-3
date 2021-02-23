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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>List Products</title>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <div class="mx-auto bg-dark p-3 text-white text-center display-2">
        <p><i>List shop</i></p>
    </div>

    <div>
        <div class="w3-container" style="height: 75px">
            <button type="button" class="btn btn-danger" style="margin-left: 135px; margin-top: 10px;"
                    onclick="document.getElementById('id01').style.display='block'">Thêm mới
            </button>
            <%--            <button  >Create</button>--%>
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
    </div>

    <div style="width: 80%; margin: auto;">
        <table class="table table-striped table-bordered table-sm">
            <thead class="thead-dark">
            <tr>
                <th scope="col" style="text-align:center">Name</th>
                <th scope="col" style="text-align:center">Address</th>
                <th scope="col" style="text-align:center">PhoneNumber</th>
                <th scope="col" ></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody >
            <c:forEach var="p" items="${shop}">
                <tr>
                    <td style="text-align:center">${p.getName()}</td>
                    <td style="text-align:center">${p.getAddress()}</td>
                    <td style="text-align:center">${p.getPhoneNumber()}</td>
                    <td>
                        <div class="w3-container" >

                                <%--                        lúc click thì hiển thị cái modal sửa ra  display='block'" --%>
                            <button onclick="document.getElementById('id02' + ${p.getId()}).style.display='block'"
                                    class="btn btn-danger">Sửa
                            </button>

                                <%--                        này là cái modal--%>
                            <div id="id02${p.getId()}" class="w3-modal">


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
                                                        <input type="text" name="nameS" size="45"
                                                               value="${p.getName()}"/>
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
                                                        <input type="hidden" name="account_id"
                                                               value="${p.getAccountId()}"/>
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
                            <button class="btn btn-danger" type="submit">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</body>
</html>
