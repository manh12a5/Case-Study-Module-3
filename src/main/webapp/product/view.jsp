<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Smartphone</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif"/>
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- owl stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
          media="screen">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!-- body -->

<body class="main-layout ">

<!-- loader  -->
<div class="loader_bg">
    <div class="loader"><img src="images/loading.gif" alt="#"/></div>
</div>
<!-- end loader -->

<!-- header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <h2 style="color: red">Product </h2>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/products">Home</a>
                </li>
                <li>
                    <a class="nav-link active" aria-current="page" href="about.html">About Us</a>
                </li>
                <c:if test="${sessionScope.acc != null}">
                    <li>
                        <a class="nav-link active " aria-current="page" >Hello ${sessionScope.acc.fullname}</a>
                    </li>
                    <li>
                        <a class="nav-link active" aria-current="page" href="/login?action=logout">Log out</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li>
                        <a class="nav-link active" aria-current="page" href="/login">Log In</a>
                    </li>
                </c:if>
            </ul>
            <form class="d-flex">
                <input href="/products?action=search" class="form-control me-2" type="search" placeholder="Search"
                       aria-label="Search">
                <button style="height: 40px" class="btn btn-primary me-md-2" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<!-- end header -->

<section class="slider_section">
    <div id="myCarousel" class="carousel slide banner-main" data-ride="carousel">
        <div class="carousel-inner">
            <%--            Ảnh banner 1--%>
            <div class="carousel-item active">
                <img style="width: 1600px; height: 500px" class="first-slide"
                     src="https://cdn.tgdd.vn/2021/02/banner/S21-800-300-800x300-4.png" alt="First slide">
            </div>
            <%--            Ảnh banner 2--%>
            <div class="carousel-item">
                <img style="width: 1600px; height: 500px" class="second-slide"
                     src="https://cdn.tgdd.vn/2021/02/banner/tet-iphone12-800-300-800x300-1.png" alt="Second slide">
            </div>
            <%--            Ảnh banner 3--%>
            <div class="carousel-item">
                <img style="width: 1600px; height: 500px" class="third-slide"
                     src="https://cdn.tgdd.vn/2021/02/banner/800-300-800x300-14.png" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <i class='fa fa-angle-left'></i>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <i class='fa fa-angle-right'></i>
        </a>
    </div>
</section>

<!-- brand -->
<div class="brand">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="titlepage">
                    <h2>Các Sản Phẩm Điện Thoại</h2>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="/products?action=create">
                            <button class="btn btn-primary me-md-2" type="button">Add New Product</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="brand-bg">
        <div class="container">
            <div class="row">
                <c:forEach var="product" items="${product}">
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 margin">
                        <div class="brand_box">
                            <img src=${product.getImage()} alt="img"/>
                            <h3><strong class="red">${product.getPrice()}</strong> ₫</h3>
                            <span>${product.getName()}</span>
                            <p>${product.getDescription()}</p>
                                <%--                            <i><img src="images/star.png"/></i>--%>
                                <%--                            <i><img src="images/star.png"/></i>--%>
                                <%--                            <i><img src="images/star.png"/></i>--%>
                                <%--                            <i><img src="images/star.png"/></i>--%>
                                <%--                            <br>--%>
                            <a href="/products?action=edit&id=${product.getId()}">
                                <button type="button" class="btn btn-danger">Edit</button>
                            </a>
                            <a href="/products?action=delete&id=${product.getId()}">
                                <button type="button" class="btn btn-danger">Delete</button>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                <div class="col-md-12">
                    <a class="read-more">See More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- end brand -->

<!-- footer -->
<footer>
    <div id="contact" class="footer">
        <div class="container">
            <div class="row pdn-top-30">
                <div class="col-md-12 ">
                    <div class="footer-box">
                        <div class="headinga">
                            <h3>Address</h3>
                            <span>Hà Nội</span>
                            <span>Hồ Chí Minh</span>
                            <span>Đã Nẵng</span>
                            <p>(+84) 123456789
                                <br>smartphone@gmail.com</p>
                        </div>
                        <ul class="location_icon">
                            <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>

                        </ul>
                        <div class="menu-bottom">
                            <ul class="link">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>

                                <li><a href="#">Brand </a></li>
                                <li><a href="#">Specials </a></li>
                                <li><a href="#"> Contact us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <p>© 2019 All Rights Reserved. Design By<a href="https://html.design/"> Free Html Templates</a></p>
            </div>
        </div>
    </div>
</footer>
<!-- end footer -->
<!-- Javascript files-->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/plugin.js"></script>
<!-- sidebar -->
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/custom.js"></script>
<!-- javascript -->
<script src="js/owl.carousel.js"></script>
<script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
<script>
    $(document).ready(function () {
        $(".fancybox").fancybox({
            openEffect: "none",
            closeEffect: "none"
        });

        $(".zoom").hover(function () {

            $(this).addClass('transition');
        }, function () {

            $(this).removeClass('transition');
        });
    });
</script>
</body>

</html>
