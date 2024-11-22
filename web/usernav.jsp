<%-- 
    Document   : usernav
    Created on : 24 thg 10, 2024, 16:12:18
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User user = (User) session.getAttribute("cur_user");
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="user.jsp"> <span class="fa fa-asterisk"></span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="user.jsp"> <span class="fa fa-bell-o"></span> Blog Team 3 <span class="sr-only">(hiện tại)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o"></span> Khóa học Drive miễn phí
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="https://drive.google.com/drive/folders/1942QubGOMMayUP5yUjN-VdVOzx0Agq5W?usp=sharing">C++</a>
                    <a class="dropdown-item" href="https://drive.google.com/drive/folders/1jqo0-VeL9Q8ODHOfDkEfhfn7XQcKXUVm?usp=sharing">Cấu trúc DL & GT</a>
                    <a class="dropdown-item" href="https://docs.google.com/document/d/1b70GaQl496I-Vv9L-m-kzfZMoIJo8NztRVrJgl36Rf4/edit?tab=t.0#heading=h.ma0geq5ucrkd">Java & SQL</a>
                    <a class="dropdown-item" href="https://drive.google.com/drive/folders/1Dta-YB9N87nb4QJ9lsHhlRAl-hpmw1xi?usp=drive_link">FrontEnd JavaScript</a>
                    <a class="dropdown-item" href="https://docs.google.com/spreadsheets/d/11tfxLdD42b1Sp-0R45LkDvJ4LF2qNkF6jCJuZkHVLiU/edit?usp=drive_link">BackEnd NodeJS</a>
                    <a class="dropdown-item" href="https://docs.google.com/spreadsheets/d/1D5xMYw74lbMjeUrd0c7KCkuEklbOrl8a/edit?usp=drive_link&ouid=110223729463163718951&rtpof=true&sd=true">BackEnd Java</a>
                    <a class="dropdown-item" href="https://www.youtube.com/playlist?list=PLD8zSU7U1L2HJR6ti3WflVvEqBHRAro2h">Lập trình Web JSP & Servlet</a>
                    <!--                    <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="news.jsp">Tin tức</a>-->
                </div>
            </li>
            <%
                if (user.getRole() == 2) {
            %>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-address-card-o"></span> Liên hệ
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="contact.jsp">Thông tin liên hệ</a>
                    <a class="dropdown-item" href="report.jsp">Gửi phản ánh</a>
                </div>
            </li>
            <%
            } else if (user.getRole() == 1) {
            %>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-cogs"></span> Tùy chọn
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="seereport.jsp">Xem phản ánh</a>
                    <a class="dropdown-item" href="addcategory.jsp">Thêm chủ đề</a>
                    <a class="dropdown-item" href="addadmin.jsp">Thêm quản trị viên</a>
                </div>
            </li>
            <% }%>
            <li class="nav-item">
                <a class="nav-link" href="addpost.jsp">
                    <span class="fa fa-pencil-square-o"></span> Đăng bài
                </a>
            </li>
        </ul>
        <!--        <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>-->
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="info.jsp"> <span class="fa fa-user-circle "></span> <%= user.getUsername()%> </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="logout"> <span class="fa fa-sign-out"></span> Đăng xuất</a>
            </li>
        </ul>
    </div>
</nav>

