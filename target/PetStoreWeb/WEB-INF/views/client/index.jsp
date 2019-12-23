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
            <div class="cart">
                <li class="hm-minicart">
                    <div class="hm-minicart-trigger">
                        <span class="item-icon"></span> <span class="item-text">$<c:if
                                test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getAmountTotal() }
                            <span class="cart-item-count"><c:if
                                    test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getQuantityTotal() }</span>
                        </span>
                    </div> <span></span>
                    <div class="minicart">
                        <ul class="minicart-product-list">
                            <c:forEach items="${sessionScope.Cart.getCartLines()}" var="it" varStatus="i">
                                <li><a href="single-product.html" class="minicart-product-image"> <img
                                        src="<c:url value='/template/client/img/${it.getVatNuoiInfo().getHinhanh()}' />"
                                        alt="cart products">
                                </a>
                                    <div class="minicart-product-details">
                                        <h6>
                                            <a href="single-product.html">${it.getVatNuoiInfo().getTenvatnuoi()}</a>
                                        </h6>
                                        <span>$${it.getVatNuoiInfo().getGiatien()} x
                                            ${it.getQuantity()}</span>
                                    </div>
                                    <button class="close">
                                        <i class="fa fa-close"></i>
                                    </button></li>
                            </c:forEach>
                        </ul>
                        <p class="minicart-total">
                            SUBTOTAL: <span>$<c:if
                                    test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getAmountTotal()}</span>
                        </p>
                        <div class="minicart-button">
                            <a href="view-cart" class="li-button li-button-dark li-button-fullwidth li-button-sm">
                                <span>View Full Cart</span>
                            </a>
                            <a href="checkout" class="li-button li-button-fullwidth li-button-sm"> <span>Checkout</span>
                            </a>
                        </div>
                    </div>
                </li>
            </div>
            <div class="clearfix"> </div>
            </div>
            <div class="login_buttons">
                <div class="check_button"><a href="checkout.html">Check out</a></div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            </ul>
            </li>
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
                <select name="" id="">
                    <option value="1000000">Dưới 1 triệu</option>
                    <option value="2000000">Dưới 2 triệu</option>
                    <option value="3000000">Dưới 3 triệu</option>
                    <option value="3000001">Trên 3 triệu</option>
                </select>
            </section>

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
                                        <div>
                                            <li class="add-cart active"><a href="add-to-cart?code=${pet.id}">Add to cart</a></li>
                                            <a href="cart">giỏ hàng</a>
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