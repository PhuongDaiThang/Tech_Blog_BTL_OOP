<%-- 
    Document   : report
    Created on : 22 thg 10, 2024, 07:12:34
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phản ánh</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
                background-color: #007bff;
                color: white;
                padding: 20px;
                text-align: center;
                font-size: 24px;
                font-weight: bold;
            }
        </style>
    </head>
    <%
        User user = (User) session.getAttribute("cur_user");
        if (user == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    %>
    <jsp:include page="usernav.jsp" />
    <body>
        <div class="container mt-5">
            <div class="banner-background">
                Phản ánh vấn đề
            </div>
            <form action="addreport" method="post" class="border p-4 rounded shadow">
                <%
                    String addReportMessage = (String) request.getAttribute("addreportmessage");
                    if (addReportMessage != null) {
                %>
                <div style="text-align: center; background-color: rgb(99, 181, 103); color: rgb(49, 129, 0); padding: 10px; margin: 10px 0; border-radius: 5px;">
                    <%= addReportMessage%>
                </div>
                <%
                        request.removeAttribute("addreportmessage");
                    }
                %>
                <div class="form-group">
                    <label for="issue">Vấn đề phản ánh:</label>
                    <textarea required class="form-control" id="issue" name="rtype" rows="2" placeholder="Vấn đề bạn muốn phản ánh"></textarea>
                </div>
                <div class="form-group">
                    <label for="content">Nội dung phản ánh:</label>
                    <textarea required class="form-control" id="content" name="rcontent" rows="2" placeholder="Nội dung phản ánh"></textarea>
                </div>
                <button type="submit" class="btn btn-primary w-100">Gửi</button>
            </form>
        </div>
    </body>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js
