<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ page import="java.util.Random,java.text.*"%>
            <!DOCTYPE html>
            <html lang="en">
            <jsp:include page="/WEB-INF/views/client/header.jsp" />
            <div>
                <jsp:include page="/WEB-INF/views/client/menu.jsp" />
                <jsp:include page="/WEB-INF/views/client/slide.jsp" />
                <!-- filter-->
                <div class="container" style="background-color: #d9d9d9; padding:20px">

                    <div class="col-lg-2" style="margin-left: 25px;"></div>
                    <div class="col-lg-3">
                        <label class="lb">Loại vật nuôi</label></br>
                        <select name="" id="loai" class="dropdown">
                        <% String type= request.getParameter("loai"); %>
                        <option value="v.idloai">Tất cả</option>
                        <c:forEach var="loai" items="${loai}" varStatus="status">
                            <option value="${loai.id}">${loai.tenloai}</option>
                        </c:forEach>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label class="lb">Giá vật nuôi</label></br>
                        <select name="" id="gia" class="dropdown">
                        <option value="-1" >Tất cả</option>
                        <option value="0">Dưới 1 triệu</option>
                        <option value="1">1tr->2tr</option>
                        <option value="2">2tr->3tr</option>
                        <option value="3">Trên 3 triệu</option>
                    </select>
                    </div>
                    <div class="col-lg-3" style="margin-top:10px">
                        <button id="btnsearch" name="Tìm"><i class="fa fa-search"></i> Tìm kiếm</button>
                    </div>

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
                                            <a href="${pageContext.request.contextPath}/detail/?code=${pet.id}"><img src="${pageContext.request.contextPath}/template/client/img/${pet.hinhanh}" alt="" class="product-thumb"></a>
                                            <h2><a href="${pageContext.request.contextPath}/detail/?code=${pet.id}">${pet.tenvatnuoi}</a></h2>
                                            <div class="product-wid-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-wid-price">
                                                <ins>Giá tiền: ${pet.giatien}</ins>
                                            </div>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/add-to-cart?code=${pet.id}"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <ul id="pagination" style="margin-left:255px;"></ul>
                        </div>
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
                    $('#btnsearchtext').on('click', function(e) {
                        e.preventDefault();
                        sendquery();
                    });
                });

                function sendData() {
                    let loai = $('#loai').val();
                    let gia = $('#gia').val();
                    window.location.href = "${pageContext.request.contextPath}/getdata?loai=" + loai + "&gia=" + gia;
                }
                function sendquery(){
                    let key = $('#nhap').val();
                    window.location.href = "${pageContext.request.contextPath}/search?key=" + key;
                }
            </script>