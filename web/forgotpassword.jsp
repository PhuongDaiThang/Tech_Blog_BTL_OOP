<%-- 
    Document   : forgotpassword
    Created on : 21 thg 11, 2024, 14:17:49
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quên mật khẩu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <%
            String message = (String) request.getAttribute("msg");
            String email = request.getParameter("email");  // Giữ giá trị email đã nhập
            request.removeAttribute("msg");
            boolean readonly = (message != null && !message.equals("Email chưa sử dụng!"));  // Kiểm tra nếu có thông báo OTP
%>
        <main class="d-flex align-items-center" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center text-white bg-primary">
                                <h4>Quên mật khẩu</h4>
                            </div>
                            <div class="card-body">
                                <form action="sendmail" method="post">
                                    <div class="form-group">
                                        <label for="email">Nhập email của bạn</label>
                                        <input name="email" type="email" value="<%= email != null ? email : ""%>" required class="form-control" id="email" placeholder="Email" <%= readonly ? "readonly" : ""%>>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                                    </div>
                                </form>
                                <%
                                    if (message != null) {
                                        if (message.equals("Email chưa sử dụng!")) {
                                %>
                                <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                    <%= message%>
                                </div>
                                <%
                                } else {
                                %>
                                <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                    <%= message%>
                                </div>
                                <%
                                    String fmsg = (String) request.getAttribute("falsemsg");
                                %>
                                <form action="verifyotp" method="post" id="otp-form">
                                    <div class="form-group">
                                        <%
                                            if(fmsg != null){
                                        %>
                                        <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                                            <%= fmsg%>
                                        </div>
                                        <% } %>
                                        <label for="otp">Nhập mã OTP</label>
                                        <input name="inpotp" type="text" required class="form-control" id="otp" placeholder="Nhập mã OTP">
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    </div>
                                </form>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</html>
