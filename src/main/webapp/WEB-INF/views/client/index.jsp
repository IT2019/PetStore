<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">
        <jsp:include page="/WEB-INF/views/client/header.jsp" />



        <body>
            <div class="header-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="user-menu">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                                    <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
                                    <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                                    <li><a href="#"><i class="fa fa-user"></i> Login</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End header area -->
            <div class="site-branding-area">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="logo">
                                <h1>
                                    <a href="./"><img src="${pageContext.request.contextPath}/template/client/img/logo.png"></a>
                                </h1>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="shopping-item">
                                <a href="cart.html">Cart - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End site branding area -->

            <div class="mainmenu-area">
                <div class="container">
                    <div class="row">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index.html">Trang chủ</a></li>
                                <li><a href="shop.html">Shop page</a></li>
                                <li><a href="single-product.html">Single product</a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="#">Category</a></li>
                                <li><a href="#">Others</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End mainmenu area -->

            <div class="slider-area" style="padding-bottom:30px;">
                <!-- Slider -->
                <div class="block-slider block-slider4">
                    <ul class="" id="bxslider-home4">
                        <li>
                            <img src="${pageContext.request.contextPath}/template/client/img/h4-slide.png" alt="Slide">

                        </li>
                        <li><img src="${pageContext.request.contextPath}/template/client/img/h4-slide2.png" alt="Slide">

                        </li>
                        <li><img src="${pageContext.request.contextPath}/template/client/img/h4-slide3.png" alt="Slide">

                        </li>
                        <li><img src="${pageContext.request.contextPath}/template/client/img/h4-slide4.png" alt="Slide">

                        </li>
                    </ul>
                </div>
                <!-- ./Slider -->
            </div>
            <!-- End slider area -->

            <!-- filter-->


            <section>
                <select name="" id="gia">
                    <option value="-1">Tất cả</option>
                    <option value="0">Dưới 1 triệu</option>
                    <option value="1">1tr->2tr</option>
                    <option value="2">2tr->3tr</option>
                    <option value="3">Trên 3 triệu</option>
                </select>
            </section>
            <section>
                <select name="" id="loai">
                    <option value="v.idloai">Tất cả</option>
                    <c:forEach var="loai" items="${loai}" varStatus="status">
                        <option value="${loai.id}">${loai.tenloai}</option>
                    </c:forEach>
                </select>
            </section>
            <!-- <input type="text" id="test" name=""/> -->
            <button id="btnsearch" name="Tìm">Tìm kiếm</button>

            <div class="product-widget-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    Số lượng vật nuôi hiện có:
                    <h1 id="soluong">${pets.size()}</h1>
                    <div class="row">
                        <c:forEach var="pet" items="${pets}" varStatus="status">
                            <div class="col-md-4 contentPage">
                                <div class="single-product-widget">
                                    <div class="single-wid-product">
                                        <a href="single-product.html"><img src="${pageContext.request.contextPath}/template/client/img/product-thumb-3.jpg" alt="" class="product-thumb"></a>
                                        <h2><a href="single-product.html">${pet.tenvatnuoi}</a></h2>
                                        <div class="product-wid-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-wid-price">
                                            <ins>${pet.giatien}</ins> <del>$425.00</del>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <script type="text/javascript">
                        $(function() {
                            var pageSize = 9;
                            showPage = function(page) {
                                $(".contentPage").hide();
                                $(".contentPage").each(function(n) {
                                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                                        $(this).show();
                                });
                            }
                            showPage(1);
                            console.log($("#soluong").html())
                            var totalRows = $("#soluong").html();
                            var btnPage = 3;
                            var iTotalPages = Math.ceil(totalRows / pageSize);
                            var iTotalPages = Math.ceil(totalRows / pageSize);

                            var obj = $('#pagination').twbsPagination({
                                totalPages: iTotalPages,
                                visiblePages: btnPage,
                                onPageClick: function(event, page) {
                                    showPage(page);
                                }
                            });
                        });
                    </script>
                    <div class="row">

                        <ul id="pagination"></ul>
                    </div>

                </div>
            </div>
            <!-- End product widget area -->
            <jsp:include page="/WEB-INF/views/client/footer.jsp" />
            <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
            <script
                src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
                integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
                crossorigin="anonymous"></script>-->
            <script>
                $(document).ready(function ($) {
                    $('#btnsearch').on('click',function(e){
                        e.preventDefault();
                        sendData();
                        
                    });
                });
                function sendData(){
                    let loai= $('#loai').val();
                    let gia= $('#gia').val();
                    $.ajax({
                        type : "GET",
                        contentType : "application/json",
                        url : "${pageContext.request.contextPath}/getdata",
                        data : {
                            loai : loai,
                            gia : gia
                        },
                        dataType : 'json',
                        timeout : 100000,
                        success : function(data) {
                            console.log("SUCCESS: ", data);
                            alert("thanh cong");
                        },
                        error : function(e) {
                            console.log("ERROR: ", e);
                        }
                    });
                }
            </script>