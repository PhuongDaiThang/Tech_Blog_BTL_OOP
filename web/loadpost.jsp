<%-- 
    Document   : loadpost
    Created on : 19 thg 11, 2024, 12:53:48
    Author     : ASUS
--%>

<%@page import="model.User"%>
<%@page import="dal.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Post"%>
<%@page import="dal.LikeDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .card {
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: scale(1.03);
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
    }

    .card-img-top {
        height: 200px;
        object-fit: cover;
    }

    .card-body {
        max-height: 150px;
        overflow: hidden;
    }

    .card-footer {
        background-color: #007bff;
    }

    .card-footer a {
        color: white;
        text-decoration: none;
        margin: 0 5px;
    }

    .btn-outline-light:hover {
        background-color: white;
        color: #007bff;
    }

    .like-counter {
        margin-left: 5px;
        font-weight: bold;
    }
</style>
<%
    Integer cid = (Integer) session.getAttribute("cid");
    if (cid == null) {
            cid = 0; 
        }
%>
<form action="loadpost" method="post" class="d-flex align-items-center">
    <select style="width:300px" required class="form-control" name="selectedcat" id="category">
        <option value="0" <%= (cid == 0) ? "selected" : ""%>>---Tất cả chủ đề---</option>
        <%
            CategoryDAO cDao = new CategoryDAO();
            ArrayList<Category> list = cDao.getAllCategory();
            for (Category c : list) {
        %>
        <option value="<%= c.getcID()%>" <%= (cid == c.getcID()) ? "selected" : ""%>>
            <%= c.getcName()%>
        </option>
        <% }%>
    </select>

    <button type="submit" class="btn btn-primary ml-2">
        <i class="fa fa-filter"></i> Lọc
    </button>
</form>

<div class="row">

    <%

        User user = (User) session.getAttribute("cur_user");

        Thread.sleep(1000);
        PostDAO pDAO = new PostDAO();

//        Integer cid = (Integer) session.getAttribute("cid");
        List<Post> posts = null;
        if (cid == 0) {
            posts = pDAO.getAllPost();
        } else {
            posts = pDAO.getPostByCatID(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>Chưa có bài viết</h3>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <%
                if (p.getpImg() != null || p.getpImg().isEmpty()) {
            %>
            <img class="card-img-top" src="pics/<%= p.getpImg()%>" alt="Không có ảnh">
            <% }%>
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer primary-background text-center">
                <%
                    LikeDAO lDAO = new LikeDAO();
                %>
                <a href="like?postid=<%= p.getpID()%>&userid=<%= user.getuID()%>" class="btn btn-outline-light btn-sm">
                    <i class="fa fa-thumbs-o-up"></i> 
                    <span id="like-counter-<%= p.getpID()%>"><%= lDAO.countLike(p.getpID())%></span>
                </a>              
                <a href="detail?postid=<%= p.getpID()%>" class="btn btn-outline-light btn-sm">Chi tiết</a>
                <!--<a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>-->
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>