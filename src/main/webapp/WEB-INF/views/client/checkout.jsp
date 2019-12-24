<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <!DOCTYPE html>
        <html>

        <body>
            <div class="body-wrapper">
                <jsp:include page="/WEB-INF/views/client/header.jsp" />
                <jsp:include page="/WEB-INF/views/client/menu.jsp" />
                <jsp:include page="/WEB-INF/views/client/slide.jsp" />
                <div class="breadcrumb-area">
                    <div class="container">
                        <div class="breadcrumb-content">
                            <ul>
                                <li><a href="index">Trang chủ</a></li>
                                <li class="active">Thanh toán</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="container" style="padding-top:100px;padding-bottom:100px">
                    <c:if test="${sessionScope.Cart == null}">
                        <h3>Giỏ hàng trống!</h3>
                    </c:if>
                    <c:if test="${sessionScope.Cart != null}">
                        <form action="order" method="post">
                            <div class="row">

                                <div class="col-lg-6 col-12">
                                    <div class="checkbox-form">
                                        <h3>Chi tiết đơn hàng</h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Họ tên <span class="required">*</span></label> <input name="name" placeholder="" type="text" required="required">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Số điện thoại<span class="required">*</span></label> <input name="phone" placeholder="" type="text" required="required">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Email <span class="required">*</span></label> <input name="email" placeholder="" type="text" required="required">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout-form-list">
                                                    <label>Địa chỉ nhận hàng <span class="required">*</span></label> <input name="address" placeholder="" type="text" required="required">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-notes">
                                            <div class="checkout-form-list">
                                                <label>Ghi chú</label>
                                                <textarea id="checkout-mess" cols="30" rows="10" name="note" placeholder="Ghi chú" style="width:-webkit-fill-available;"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="your-order">
                                        <h3>Đơn hàng của bạn:</h3>
                                        <div class="your-order-table table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th class="cart-product-name">Vật nuôi</th>
                                                        <th class="cart-product-total">Thành tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.Cart.getCartLines()}" var="it">
                                                        <tr class="cart_item">
                                                            <td class="cart-product-name">${it.getVatNuoiInfo().getTenvatnuoi()}<strong class="product-quantity"> × ${it.getQuantity()}</strong></td>
                                                            <td class="cart-product-total"><span class="amount">${it.getVatNuoiInfo().getGiatien()
															* it.getQuantity()}</span></td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                                <tfoot>
                                                    <tr class="cart-subtotal">
                                                        <th>Tổng tiền</th>
                                                        <td><span class="amount">${String.format("%,.0f", sessionScope.Cart.getAmountTotal())}</span></td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="payment-method">
                                <div class="payment-accordion">
                                    <div class="order-button-payment">
                                        <input value="Place order" type="submit">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>
                </div>

                <jsp:include page="/WEB-INF/views/client/footer.jsp" />
            </div>
        </body>

        </html>