<%-- 
    Document   : seereport
    Created on : 20 thg 11, 2024, 23:21:50
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="model.Report"%>
<%@page import="dal.ReportDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem báo cáo</title>
        <script type="text/javascript">
            function changeStatus(id){
                if(confirm("Bạn có chắc chắn đánh dấu là đã xử lý?")){
                    window.location="changestt?rid="+id;
                }
            }
        </script>
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
        <%
            ReportDAO rDAO = new ReportDAO();
            List<Report> rList = rDAO.getAllReport();
        %>
        <br/>
        <table class="table table-bordered">
    <thead class="primary-background text-light">
        <tr>
            <th>ID</th>
            <th>Loại báo cáo</th>
            <th>Nội dung báo cáo</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <% 
            for (Report report : rList) {
        %>
            <tr>
                <td><%= report.getRID() %></td>
                <td><%= report.getrType() %></td>
                <td><%= report.getrContent() %></td>
                <td><%= report.getrStatus() %></td>
                <td>
                    <button class="btn btn-success" onclick="changeStatus(<%= report.getRID() %>)">
                        <span class="fa fa-check"></span>
                    </button>
                </td>
            </tr>
        <% 
            }
        %>
    </tbody>
</table>

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
