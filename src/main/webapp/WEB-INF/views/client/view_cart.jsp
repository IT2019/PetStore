<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <!DOCTYPE html>
        <html>

        <body>
            <!-- Begin Body Wrapper -->
            <div class="body-wrapper">
                <jsp:include page="/WEB-INF/views/client/header.jsp" />
                <jsp:include page="/WEB-INF/views/client/menu.jsp" />
                <jsp:include page="/WEB-INF/views/client/slide.jsp" />
                <div class="breadcrumb-area">
                    <div class="container">
                        <div class="breadcrumb-content">
                            <ul>
                                <li><a href="index">Trang chủ</a></li>
                                <li class="active">Giỏ hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row" style="padding-top:100px;padding-bottom:100px">
                        <div class="col-12">
                            <c:if test="${sessionScope.Cart == null}">
                                <h3>Giỏ hàng trống!</h3>
                            </c:if>
                            <c:if test="${sessionScope.Cart != null}">
                                <form action="update-cart" method="post">
                                    <div class="table-content table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="li-product-thumbnail">Hình ảnh</th>
                                                    <th class="cart-product-name">Tên vật nuôi</th>
                                                    <th class="li-product-price">Đơn giá</th>
                                                    <th class="li-product-quantity">Số lượng</th>
                                                    <th class="li-product-subtotal">Thành tiền</th>
                                                    <th class="li-product-remove">Xóa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.Cart.getCartLines()}" var="it" varStatus="i">
                                                    <tr>

                                                        <td class="li-product-thumbnail"><a href="view-product?vatNuoiid=${it.getVatNuoiInfo().getId()}"><img
														width="150px" height="150px"
														src="<c:url value='/template/client/img/${it.getVatNuoiInfo().getHinhanh()}' />"
														alt="Li's Product Image"></a></td>
                                                        <td class="li-product-name"><a href="view-product?vatNuoiId=${it.getVatNuoiInfo().getId()}">${it.getVatNuoiInfo().getTenvatnuoi()}</a></td>
                                                        <td class="li-product-price"><span class="amount">$${it.getVatNuoiInfo().getGiatien()}</span></td>
                                                        <td class="quantity"><label>Quantity</label>
                                                            <div class="cart-plus-minus">
                                                                <input class="cart-plus-minus-box" style="width: auto;" value="${it.getQuantity()}" type="number" name="quantity" required="required">
                                                            </div>
                                                        </td>
                                                        <td class="product-subtotal"><span class="amount">$${it.getVatNuoiInfo().getGiatien()
                                                        * it.getQuantity()}</span></td>
                                                        <td class="li-product-remove"><input type="text" name="code" value="${it.getVatNuoiInfo().getId()}" hidden=""> <a href="delete-item-cart?code=${it.getVatNuoiInfo().getId()}"><i class="fa fa-times"></i></a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="coupon-all">
                                                <div class="coupon">
                                                    <a href="index" class="btn btn-success">Tiếp tục mua</a>
                                                </div>
                                                <div class="coupon2">
                                                    <input class="button" name="update_cart" value="Cập nhật giỏ hàng" type="submit">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5 ml-auto">
                                            <div class="cart-page-total">
                                                <h2>Tổng tiền:<span>${String.format("%,.0f", sessionScope.Cart.getAmountTotal())}</span></h2>
                                                <a href="checkout">Tới trang thanh toán</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
                <jsp:include page="/WEB-INF/views/client/footer.jsp" />
            </div>
        </body>

        </html>