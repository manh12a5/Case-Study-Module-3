<%@ page import="java.util.List" %>
<%@ page import="model.Shop" %><%--
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

<%-- Modal edit --%>
<div class="modal" id="editShop" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit shop</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formEdit" action="/shop?action=edit" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="hidden" id="id" name="id">
                                <input id="name" type="email" class="form-control" placeholder="name" name="name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input id="address" type="email" class="form-control" placeholder="address"
                                       name="address">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="hidden" id="accountId" name="accountId">
                                <input id="phoneNumber" type="email" class="form-control" placeholder="phone number"
                                       name="phoneNumber">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="edit()">Edit</button>
            </div>
        </div>
    </div>
</div>



<%-- Modal create --%>
<div class="modal" id="createShop" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Create new shop</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formCreate" action="/shop?action=create" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="email" class="form-control" placeholder="name" name="nameShop">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="email" class="form-control" placeholder="address"
                                       name="addressShop">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="email" class="form-control" placeholder="phone number"
                                       name="phoneNumberShop">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Account Id</label>
                                <select class="form-select" aria-label="Default select example"
                                        name="nameAccount">
                                    <c:forEach var="c" items="${nameAccount}">
                                        <option value="${c}">${c}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="create()">Save</button>
            </div>
        </div>
    </div>
</div>



<div class="mx-auto bg-dark p-3 text-white text-center display-2">
    <p><i>List shop</i></p>
</div>

<div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#createShop">
                Create
            </button>
            <%--            <button  >Create</button>--%>

            <div class="mt-3">
                <table class="table table-striped table-bordered table-sm">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col" style="text-align:center">Name</th>
                        <th scope="col" style="text-align:center">Address</th>
                        <th scope="col" style="text-align:center">PhoneNumber</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${shop}"  varStatus="loop">
                        <tr>
                            <td style="text-align:center">${p.getName()}</td>
                            <td style="text-align:center">${p.getAddress()}</td>
                            <td style="text-align:center">${p.getPhoneNumber()}</td>
                            <td>
                                <button type="button" onclick="setValue('${p.getId()}', '${p.getName()}', '${p.getAddress()}',
                                        '${p.getPhoneNumber()}', '${p.getAccountId()}')"
                                        class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editShop">
                                    Edit
                                </button>
                            </td>
                            <td>
                                <form action="/shop?action=delete&id=${p.getId()}" method="post" border-color="black">
                                    <button class="btn btn-danger" type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    function create() {
        document.getElementById("formCreate").submit();
    }

    function edit() {
        document.getElementById("formEdit").submit();
    }

    function setValue(id, name, address, phone, accountId) {
        document.getElementById("name").value = name;
        document.getElementById("address").value = address;
        document.getElementById("phoneNumber").value = phone;
        document.getElementById("id").value = id;
        document.getElementById("accountId").value = accountId;
    }
</script>

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
