///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controllers.manageNews;
//
//import dal.NewsDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import models.Match;
//import models.News;
//import models.User;
//
///**
// *
// * @author nguye
// */
//@WebServlet(name = "CreateNewNewsServlet", urlPatterns = {"/createNewNews"})
//public class CreateNewNewsServlet extends HttpServlet {
//
//    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CreateNewNewsServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CreateNewNewsServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//
//        HttpSession session = request.getSession();
//        String userName = (String)session.getAttribute("userName");
//        int matchId = Integer.parseInt(request.getParameter("matchId") != null ? request.getParameter("matchId") : "");
////        out.println(matchId);
//        String title = request.getParameter("title");
//        String content = request.getParameter("content");
//        int status_raw = Integer.parseInt(request.getParameter("status"));
//        boolean status = false;
//        if (status_raw == 2) {
//            status = true;
//        }
//        Match m = new Match();
//        m.setMatchId(matchId);
////        out.print(m.toString());
//
//        News n = new News(m, u, title, content, u.getUserName(), status);
//        int created = NewsDAO.INSTANCE.createNews(n, u, m);
//        if (created != 0) {
//            session.setAttribute("created", created);
//        }
////        out.print(created);
//        response.sendRedirect("manageNews");
//
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
