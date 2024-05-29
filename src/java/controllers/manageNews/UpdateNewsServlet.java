/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageNews;

import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import models.News;
import models.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UpdateNewsServlet", urlPatterns = {"/updateNews"})
public class UpdateNewsServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateNewsServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
//         PrintWriter out = response.getWriter();
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        HttpSession session = request.getSession();
        try {
            int newsId = Integer.parseInt(request.getParameter("newsId"));
            String mainTitle = request.getParameter("mainTitle");
            String title = request.getParameter("title");
            String mainContent = request.getParameter("mainContent");
            String content = request.getParameter("content");
            String location = request.getParameter("location");
            String kickOff_raw = request.getParameter("kickOff");
            LocalDateTime kickOff;
            try {
                kickOff = LocalDateTime.parse(kickOff_raw, formatter);
            } catch (DateTimeParseException e) {
                throw new IllegalArgumentException("Invalid date time format", e);
            }
            boolean status = false;
            int status_raw = Integer.parseInt(request.getParameter("status"));
            if (status_raw == 1) {
                status = true;
            }
            News n = NewsDAO.INSTANCE.getNews(newsId);
            n.setMainTitle(mainTitle);
            n.setTitle(title);
            n.setMainContent(mainContent);
            n.setContent(content);
            n.setLocation(location);
            n.setKickOff(kickOff);
            n.setStatus(status);
            String userName = (String) session.getAttribute("userName");
            session.setAttribute("updated", NewsDAO.INSTANCE.updateNews(n, userName));
        } catch (IllegalArgumentException e) {
        }

        response.sendRedirect("manageNews");
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
