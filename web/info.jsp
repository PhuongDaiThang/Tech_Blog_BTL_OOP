<%-- 
    Document   : info
    Created on : 20 thg 11, 2024, 21:40:23
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page import="dal.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hồ sơ</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <%
            User user = (User) session.getAttribute("cur_user");
        %>
        <jsp:include page="usernav.jsp" />
        <div class="container text-center">
            <img src="pics/default.png" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
            <br>
            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getUsername()%> </h5>
            </div>
            <div id="profile-details">
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="row"> ID :</th>
                            <td> <%= user.getuID()%></td>

                        </tr>
                        <tr>
                            <th scope="row"> Email : </th>
                            <td><%= user.getEmail()%></td>

                        </tr>
                        <tr>
                            <th scope="row">Giới tính :</th>
                            <td><%= user.getGender()%></td>

                        </tr>
                        <tr>
                            <th scope="row">Chi tiết :</th>
                            <td><%= user.getAbout()%></td>

                        </tr>
                        <tr>
                            <th scope="row">Đăng ký vào :</th>
                            <td><%= user.getRegDate().toString()%></td>

                        </tr>
                    </tbody>
                </table>
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
