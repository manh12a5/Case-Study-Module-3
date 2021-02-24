<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/24/2021
  Time: 8:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<head>
    <title>Title</title>
</head>
<body>
<div class="mx-auto bg-dark p-3 text-white text-center display-2">
    <p><i>List shop</i></p>
</div>

<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form style="width: 60px; margin-top: 20px" >
                <input name="action" hidden value="search">
                <input type="search" name="search" style="width: 250px">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <div class="mt-3">
                <table class="table table-striped table-bordered table-sm">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col" style="text-align:center">Name</th>
                        <th scope="col" style="text-align:center">Address</th>
                        <th scope="col" style="text-align:center">PhoneNumber</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${shop}" varStatus="loop">
                    <tr>
                        <td style="text-align:center">${p.getName()}</td>
                        <td style="text-align:center">${p.getAddress()}</td>
                        <td style="text-align:center">${p.getPhoneNumber()}</td>
                    </tr>
                    </c:forEach>
            </div>
        </div>
    </div>
</div>


<script src="https://kit.fontawesome.com/65481ee89b.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
        integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
        integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
        crossorigin="anonymous"></script>
</body>
</html>
