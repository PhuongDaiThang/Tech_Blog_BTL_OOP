<%-- 
    Document   : signup.
    Created on : 22 thg 10 2024, 21:57:57
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
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
        <jsp:include page="navbar.jsp"/>
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Đăng nhập</p>
                            </div>
                            <%
                                String loginMessage = (String) session.getAttribute("loginMessage");
                                if (loginMessage != null) {
                            %>
                            <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                <%= loginMessage%>
                            </div> 
                            <%
                                    session.removeAttribute("loginMessage");
                                }
                            %>

                            <%
                                String logoutMessage = (String) session.getAttribute("logoutMessage");
                                if (logoutMessage != null) {
                            %>
                            <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                <%= logoutMessage%>
                            </div>
                            <%
                                    session.removeAttribute("logoutMessage");
                                }
                            %>
                            <div class="card-body">
                                <form action="login" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Tên đăng nhập</label>
                                        <input name="username" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Tên đăng nhập">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Mật khẩu</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Mật khẩu">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                                    </div>
                                </form>
                            </div>
                            <div class="text-center mt-2">
                                <a href="forgotpassword.jsp" class="text-primary">Quên mật khẩu?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
