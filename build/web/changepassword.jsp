<%-- 
    Document   : changepassword
    Created on : 21 thg 11, 2024, 22:11:26
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <main class="d-flex align-items-center" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center text-white bg-primary">
                                <h4>Đổi mật khẩu</h4>
                            </div>
                            <%
                                String msg = (String) request.getAttribute("msg");
                                request.removeAttribute("msg");
                                if(msg != null){ 
                                    if(msg.equals("Cập nhật mật khẩu thành công!")){
                            %>
                            <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                <%= msg%>
                            </div>
                            <%
                                    }
                                    else{
                            %>
                            <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                <%= msg%>
                            </div>
                            <%
                                    }
                                }
                            %>
                            <div class="card-body">
                                <form action="changepassword" method="post">
                                    <div class="form-group">
                                        <label for="newPassword">Mật khẩu mới</label>
                                        <input type="password" class="form-control" id="newPassword" name="newpassword" placeholder="Nhập mật khẩu mới" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" placeholder="Xác nhận mật khẩu mới" required>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary" id="submitBtn">Cập nhật mật khẩu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
