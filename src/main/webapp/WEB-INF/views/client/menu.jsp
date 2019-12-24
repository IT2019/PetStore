<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                            <li><a href="index.html">Trang chủ</a></li>
                            <li><a href="shop.html">Shop page</a></li>
                            <li><a href="single-product.html">Single product</a></li>
                            <li><a href="cart.html">Cart</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                            <li><a href="#">Category</a></li>
                            <li><a href="#">Others</a></li>
                            <li><a href="#">Contact</a></li>
                            <li class="active" style="margin-left: 90px;">

                                <a href="view-cart">
                                   
                                        Giỏ hàng<span class="cart-amunt"> $<c:if test="${sessionScope.Cart == null}">0</c:if>
                                                <c:if test="${sessionScope.Cart != null}">${String.format("%,.0f", sessionScope.Cart.getAmountTotal()) }</c:if></span> <i class="fa fa-shopping-cart"></i>
                                        <span class="product-count"> <c:if test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getQuantityTotal() }</span>
                                   
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>