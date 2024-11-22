<%-- 
    Document   : addpost
    Created on : 24 thg 10, 2024, 19:12:23
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo bài viết</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("cur_user");
            if (user == null) { // Kiểm tra role
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        %>
        <jsp:include page="usernav.jsp" />
        <div class="container mt-5">
            <h2 class="text-center">Tạo bài viết</h2>
            <form id="add-post-form" action="addpost" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="category">Chọn chủ đề</label>
                    <select required class="form-control" name="addpostcid" id="category">
                        <option selected disabled>---Chọn chủ đề---</option>
                        <%
                            CategoryDAO cDAO = new CategoryDAO();
                            ArrayList<Category> list = cDAO.getAllCategory();
                            for (Category c : list) {
                        %>
                        <option value="<%= c.getcID()%>"><%= c.getcName()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">Tiêu đề</label>
                    <input required name="addpostptitle" type="text" id="title" class="form-control" placeholder="Điền tiêu đề bài viết">
                </div>
                <div class="form-group">
                    <label for="content">Nội dung</label>
                    <textarea name="addpostpcontent" class="form-control" id="content" rows="6" placeholder="Viết nội dung bạn muốn chia sẻ"></textarea>
                </div>
                <div class="form-group">
                    <label for="image">Tải ảnh lên</label>
                    <input type="file" name="addpostpimg" id="image" class="form-control-file" accept="image/*">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Đăng bài</button>
                </div>
            </form>
        </div>
    </body>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</html>
