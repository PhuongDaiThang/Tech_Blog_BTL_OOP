<%-- 
    Document   : addcategory
    Created on : 20 thg 11, 2024, 23:21:59
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm chủ đề</title>
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
        <div class="container mt-4">
            <h2>Thêm chủ đề mới</h2>
            <%
                String msg = (String) request.getAttribute("msg");
            %>
            <%
                if (msg != null && !msg.isEmpty()) {
                    if (msg == "Thêm chủ đề thành công!") {
            %>
            <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                <%= msg%>
            </div>
            <%
            } else {
            %>
            <div style="text-align: center; background-color: rgb(243, 216, 218); color: rgb(105, 35, 38); padding: 10px; margin: 10px 0; border-radius: 5px;">
                <%= msg%>
            </div> 
            <% } %>
            <%
                }
                request.removeAttribute("msg");
            %>
            <form action="addcategory" method="post">
                <div class="form-group">
                    <label for="categoryName">Tên chủ đề</label>
                    <input type="text" class="form-control" id="categoryName" name="catName" placeholder="Nhập tên chủ đề" required>
                </div>
                <div class="form-group">
                    <label for="categoryDescription">Mô tả</label>
                    <textarea class="form-control" id="categoryDescription" name="catDes" rows="4" placeholder="Nhập mô tả cho chủ đề" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Thêm chủ đề</button>
            </form>
        </div>
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
