<%-- 
    Document   : addadmin
    Created on : 20 thg 11, 2024, 23:22:07
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm QTV</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("cur_user");
            if (user == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>
        <jsp:include page="usernav.jsp" />
        <main class="primary-background  banner-background"  style="padding-bottom: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Thêm quản trị viên
                        </div>
                        <%
                            String signupMessage = (String) request.getAttribute("signupMessage");
                            if (signupMessage != null) {
                                if (signupMessage != "Thêm thành công") {
                        %>
                        <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                            <%= signupMessage%>
                        </div>
                        <%
                        } else {
                        %>       
                        <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                            <%= signupMessage%>
                        </div>
                        <%
                                }
                                request.removeAttribute("signupMessage");

                            }
                        %>
                        <div class="card-body">
                            <%
                                String username = request.getAttribute("username") == null ? "" : (String) request.getAttribute("username");
                                String email = request.getAttribute("email") == null ? "" : (String) request.getAttribute("email");
                                String gender = request.getAttribute("gender") == null ? "" : (String) request.getAttribute("gender");
                                String about = request.getAttribute("about") == null ? "" : (String) request.getAttribute("about");
                                String check = request.getAttribute("check") == null ? "" : (String) request.getAttribute("check");
                            %>

                            <form id="reg-form" action="addadmin" method="POST">
                                <div class="form-group">
                                    <label for="user_name">Tên đăng nhập</label>
                                    <input required name="username" type="text" class="form-control" id="username" 
                                           aria-describedby="emailHelp" placeholder="Tên đăng nhập" value="<%= username%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Địa chỉ email</label>
                                    <input required name="email" type="email" class="form-control" id="exampleInputEmail1" 
                                           aria-describedby="emailHelp" placeholder="Nhập email" value="<%= email%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mật khẩu</label>
                                    <input required name="password" type="password" class="form-control" id="exampleInputPassword1" 
                                           placeholder="Nhập mật khẩu">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Giới tính</label>
                                    <br>
                                    <input required type="radio" id="gender" name="gender" value="Nam" 
                                           <%= "Nam".equals(gender) ? "checked" : ""%>> Nam
                                    &nbsp;&nbsp;&nbsp;
                                    <input required type="radio" id="gender" name="gender" value="Nữ" 
                                           <%= "Nữ".equals(gender) ? "checked" : ""%>> Nữ
                                    &nbsp;&nbsp;&nbsp;
                                    <input required type="radio" id="gender" name="gender" value="Khác" 
                                           <%= "Khác".equals(gender) ? "checked" : ""%>> Khác
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="about" rows="5" 
                                              placeholder="Nhập mô tả"><%= about%></textarea>
                                </div>
                                <br>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Thêm</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
