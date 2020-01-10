<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <jsp:include page="/WEB-INF/views/client/header.jsp" />
        <jsp:include page="/WEB-INF/views/client/menu.jsp" />
        <jsp:include page="/WEB-INF/views/client/slide.jsp" />

        <body>
            <div class="single-product-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="product-content-right">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="product-images">
                                            <div class="product-main-img">
                                                <img src="${pageContext.request.contextPath}/template/client/img/${pet.hinhanh}" alt="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="product-inner">
                                            <h2 class="product-name">${pet.tenvatnuoi}</h2>
                                            <div class="product-inner-price">
                                                Giá tiền:
                                                <ins>$${pet.giatien}</ins>
                                            </div>


                                            <div class="quantity">
                                                <input id="quantity" type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
                                            </div>
                                            <a href="${pageContext.request.contextPath}/add-to-cart?code=${pet.id}">
                                                <button class="add_to_cart_button" value="${pet.id}">Thêm vào giỏ hàng</button>
                                            </a>


                                            <div class="product-inner-category">
                                                <p>Thông tin thú cưng:</p><span><p>${pet.mota}</p></span>

                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">

                </div>
            </div>
            </div>
            </div>
            <jsp:include page="/WEB-INF/views/client/footer.jsp" />