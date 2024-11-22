/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PostDAO;
import file.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDateTime;
import model.Post;
import model.User;

/**
 *
 * @author ASUS
 */
public class editpostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editpostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editpostServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("cur_user");

        if (user == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String rawID = request.getParameter("postid");
        PostDAO pDAO = new PostDAO();
        try{
            int id = Integer.parseInt(rawID);
            Post p = pDAO.getPostByID(id);
            request.setAttribute("post", p);
            request.getRequestDispatcher("editpost.jsp").forward(request, response);
        }
        catch(NumberFormatException e){
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("cur_user");

        if (user == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        PostDAO pDAO = new PostDAO();
        String rawID = request.getParameter("editpostid");
        String postCatIDRaw = request.getParameter("editpostcid");
        String postTitle = request.getParameter("editpostptitle");
        String postContent = request.getParameter("editpostpcontent");
        try{
            int id = Integer.parseInt(rawID);
            int cid = Integer.parseInt(postCatIDRaw);
            Post p = pDAO.getPostByID(id);
            if(p != null){
                p.setCatID(cid);
                p.setpTitle(postTitle);
                p.setpContent(postContent);
                pDAO.updatePost(p);
            }
        }
        catch(NumberFormatException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
