<%-- 
    Document   : detail
    Created on : 19 thg 11, 2024, 17:31:10
    Author     : ASUS
--%>

<%@page import="dal.LikeDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dal.UserDAO"%>
<%@page import="model.Post"%>
<%@page import="dal.PostDAO"%>
<%@page import="model.User"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript">
            function doDelete(id){
                if(confirm("Bạn có chắc chắn xóa?")){
                    window.location="delete?id="+id;
                }
            }
        </script>
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
            if (user == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>

        <%
            Post p = (Post) request.getAttribute("post");
            if (p != null) {
        %>
        <jsp:include page="usernav.jsp" />
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top my-2" src="pics/<%= p.getpImg()%>" alt="Không có ảnh">
                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDAO uDAO = new UserDAO();%>
                                    <p class="post-user-info"> <a href="#!"> <%= uDAO.findUserByID(p.getUserID()).getUsername()%></a> đã viết : </p>
                                </div>
                                <div class="col-md-4">
                                    <%
                                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                    %>
                                    <p class="post-date"> <%= p.getpDate().format(formatter)%> </p>
                                </div>
                            </div>
                            <p class="post-content"><%= p.getpContent()%></p> 
                            <br>
                            <br>
                        </div>
                        <div class="card-footer primary-background">
                            <%
                                LikeDAO lDAO = new LikeDAO();
                            %>
                            <a href="dlike?postid=<%= p.getpID()%>&userid=<%= user.getuID()%>"class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= lDAO.countLike(p.getpID())%></span>  </a>
<!--                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>-->
                            <% if (user.getuID() == p.getUserID()) {%>
                            <a href="editpost?postid=<%= p.getpID()%>" class="btn btn-outline-light btn-sm">
                                <i class="fa fa-edit"></i> Sửa bài viết
                            </a>
                            <% } %>
                            <% if (user.getuID() == p.getUserID() || user.getRole()==1) {%>
                            <a href="#" onclick="doDelete(<%= p.getpID() %>)" class="btn btn-outline-light btn-sm">
                                <i class="fa fa-trash"></i> Xóa bài viết
                            </a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </body>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</html>
