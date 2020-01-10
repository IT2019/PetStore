<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <section>
            <div style="background-color: #d9d9d9;">
                <div class="col-lg-3">
                    <img style="width:100px;margin-left:120px;" src="${pageContext.request.contextPath}/template/client/img/logo.png">
                </div>
                <div class="col-lg-7">
                    <div id="searchtext">
                        <input type="text" id="nhap" placeholder="Nhập thông tin cần tìm" />
                        <button id="btnsearchtext"><i class="fa fa-search"></i></button>
                    </div>
                </div>
                <div class="col-lg-2">
                    <a href="${pageContext.request.contextPath}/view-cart">
                        <div style="    margin-top: 15px;background-color: #015196;border-radius:15px;height:50px;margin-left:50px;padding-top:10px">
                            <i class="fa fa-shopping-cart" style="font-size:25px;color: beige;margin-left:15px"></i>
                            <span class="cart-amunt"> $<c:if test="${sessionScope.Cart == null}">0</c:if>
                                <c:if test="${sessionScope.Cart != null}">${String.format("%,.0f", sessionScope.Cart.getAmountTotal()) }</c:if></span>
                            <span class="product-count"> <c:if test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getQuantityTotal() }</span>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <div class="clearfix" style="margin-bottom: 10px;"></div>
        <div class="mainmenu-area">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                </div>
                <div class="navbar-collapse collapse" style="float: right;padding-right: 80px;">

                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">tin tức</a></li>

                    </ul>
                </div>
            </div>
        </div>