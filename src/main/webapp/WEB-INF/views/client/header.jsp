<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Shop thú cưng</title>

            <!-- Google Fonts -->
            <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

            <!-- Bootstrap -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" />
            <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
            <!-- JS tạo nút bấm di chuyển trang start -->
            <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
            <!-- JS tạo nút bấm di chuyển trang end -->
            <!-- Font Awesome -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/css/font-awesome.min.css">

            <!-- Custom CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/css/owl.carousel.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/css/style.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/css/responsive.css">

            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" />
            <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
            <!-- JS tạo nút bấm di chuyển trang start -->
            <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
            <!-- JS tạo nút bấm di chuyển trang end -->
            <script type="text/javascript">
                $(function() {
                    var pageSize = 2; // Hiển thị 6 sản phẩm trên 1 trang
                    showPage = function(page) {
                        $(".contentPage").hide();
                        $(".contentPage").each(function(n) {
                            if (n >= pageSize * (page - 1) && n < pageSize * page)
                                $(this).show();
                        });
                    }
                    showPage(1);
                    ///** Cần truyền giá trị vào đây **///
                    var totalRows = 111; // Tổng số sản phẩm hiển thị
                    var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                    var iTotalPages = Math.ceil(totalRows / pageSize);

                    var obj = $('#pagination').twbsPagination({
                        totalPages: iTotalPages,
                        visiblePages: btnPage,
                        onPageClick: function(event, page) {
                            console.info(page);
                            showPage(page);
                        }
                    });
                    console.info(obj.data());
                });
            </script>
            <style>
                ///** CSS căn id pagination ra giữa màn hình **///
                #pagination {
                    display: flex;
                    display: -webkit-flex;
                    /* Safari 8 */
                    flex-wrap: wrap;
                    -webkit-flex-wrap: wrap;
                    /* Safari 8 */
                    justify-content: center;
                    -webkit-justify-content: center;
                }
            </style>
        </head>