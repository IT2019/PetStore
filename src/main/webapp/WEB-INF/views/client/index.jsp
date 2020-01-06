<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">
        <jsp:include page="/WEB-INF/views/client/header.jsp" />



        <body>


            <jsp:include page="/WEB-INF/views/client/menu.jsp" />
            <jsp:include page="/WEB-INF/views/client/slide.jsp" />
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
                    <h1 id="soluong" style="display: none;">${pets.size()}</h1>
                    <div class="row">
                        <c:forEach var="pet" items="${pets}" varStatus="status">
                            <div class="col-md-4 contentPage">
                                <div class="single-product-widget">
                                    <div class="single-wid-product">
                                        <a href="single-product.html"><img src="${pageContext.request.contextPath}/template/client/img/${pet.hinhanh}" alt="" class="product-thumb"></a>
                                        <h2><a href="single-product.html">${pet.tenvatnuoi}</a></h2>
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
                                            <a href="add-to-cart?code=${pet.id}"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row">
                            <ul id="pagination"></ul>
                        </div>
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
                });

                function sendData() {
                    let loai = $('#loai').val();
                    let gia = $('#gia').val();
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "${pageContext.request.contextPath}/getdata",
                        data: {
                            loai: loai,
                            gia: gia
                        },
                        dataType: 'json',
                        timeout: 100000,
                        success: function(data) {
                            console.log("SUCCESS: ", data);
                            alert("thanh cong");
                        },
                        error: function(e) {
                            console.log("ERROR: ", e);
                        }
                    });
                }
            </script>