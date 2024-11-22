<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>

    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Chào mừng đến với TechBlog </h3>
                    <p>Chào mừng đến với blog của chúng tôi, cùng tham gia để biết mọi người đang quan tâm tới vấn đề gì nhé!
                       Những chia sẻ từ người dùng khác có thể đem lại thông tin hữu ích cho bạn!
                    </p>
                    <p>
                        Ngoài ra bạn có cơ hội mở rộng các mối quan hệ hoặc tìm việc làm với mức lương mong muốn.
                    </p>
                    <a href="signup"><button class="btn btn-outline-light btn-lg"> <span class="fa 	fa fa-user-plus"></span>  Bắt đầu!</button></a>
                    <a href="login" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Đăng nhập</a>
                </div>
            </div>
        </div>
<div class="container">
    <div class="row mb-2">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Lập trình Java</h5>
                    <p class="card-text">Một ví dụ ngắn để xây dựng trên tiêu đề của thẻ Lập trình Java và tạo thành phần lớn nội dung của thẻ.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Phát triển Web</h5>
                    <p class="card-text">Tìm hiểu cơ bản về HTML, CSS và JavaScript để tạo ra các trang web và ứng dụng web hiện đại.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Khoa học Dữ liệu</h5>
                    <p class="card-text">Hiểu rõ các nguyên tắc cơ bản về phân tích dữ liệu, học máy và các kỹ thuật trực quan hóa dữ liệu.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Phát triển Ứng dụng Di động</h5>
                    <p class="card-text">Khám phá quá trình xây dựng ứng dụng cho thiết bị di động sử dụng các framework như React Native.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Điện toán Đám mây</h5>
                    <p class="card-text">Tìm hiểu về các công nghệ đám mây và cách triển khai, quản lý, và mở rộng các ứng dụng trên đám mây.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">An ninh Mạng</h5>
                    <p class="card-text">Hiểu rõ các khái niệm chính trong việc bảo vệ hệ thống, mạng và dữ liệu khỏi các mối đe dọa số.</p>
                    <a href="#" class="btn primary-background text-white">Đọc thêm</a>
                </div>
            </div>
        </div>
    </div>
 </div>
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>