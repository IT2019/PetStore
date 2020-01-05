<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.util.Random,java.text.*"%>
        <!DOCTYPE html>
        <html lang="en">
        <jsp:include page="/WEB-INF/views/client/header.jsp" />
    


        <div>

            <!-- End header area -->
            <div class="site-branding-area">
                <div class="container"></div>
                <div class="row">
                    <div class="col-sm-10">
                        <div class="logo">
                            <h1>
                                <a href="./"><img src="${pageContext.request.contextPath}/template/client/img/logo.png"></a>
                            </h1>
                        </div>
                    </div>

                    <div class="col-sm-2">
                        <a href="view-cart">
                            <div class="shopping-item">
                                Giỏ hàng<span class="cart-amunt"> $<c:if test="${sessionScope.Cart == null}">0</c:if>
                                        <c:if test="${sessionScope.Cart != null}">${String.format("%,.0f", sessionScope.Cart.getAmountTotal()) }</c:if></span> <i class="fa fa-shopping-cart"></i>
                                <span class="product-count"> <c:if test="${sessionScope.Cart == null}">0</c:if>${sessionScope.Cart.getQuantityTotal() }</span>
                            </div>
                        </a>
                        <span>
                                <a href="checkout" class="li-button li-button-fullwidth li-button-sm"> <span>Thanh toán</span> </a>
                        </span>
                    </div>
                </div>
            </div>
            </div>
            <jsp:include page="/WEB-INF/views/client/menu.jsp" />
            <jsp:include page="/WEB-INF/views/client/slide.jsp" />
            
            
            <!-- filter-->
            <div id="searchform">
                <div id="group1">
                    <label class="lb">Loại vật nuôi</label></br>
                    <select name="" id="loai" class="dropdown">
                        <% String type= request.getParameter("loai"); %>
                        <option value="v.idloai">Tất cả</option>
                        <c:forEach var="loai" items="${loai}" varStatus="status">
                            <option value="${loai.id}">${loai.tenloai}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="group2">
                    <label class="lb">Giá vật nuôi</label></br>
                    <select name="" id="gia" class="dropdown">
                        <option value="-1" >Tất cả</option>
                        <option value="0">Dưới 1 triệu</option>
                        <option value="1">1tr->2tr</option>
                        <option value="2">2tr->3tr</option>
                        <option value="3">Trên 3 triệu</option>
                    </select>
                </div>
                <button id="btnsearch" name="Tìm"><i class="fa fa-search"></i> Tìm kiếm</button>
            </div>


            <div class="product-widget-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <h1 id="soluong" style="display: none;">${pets.size()}</h1>
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
            <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
            <script
                src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
                integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
                crossorigin="anonymous"></script>-->
            <script>
                $(document).ready(function($) {
                    $('#btnsearch').on('click', function(e) {
                        e.preventDefault();
                        sendData();

                    });
                });

                function sendData() {
                    let loai = $('#loai').val();
                    let gia = $('#gia').val();
                    window.location.href = "${pageContext.request.contextPath}/getdata/?loai=" + loai +"&gia=" + gia;
                }
            </script>