/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.manageNews;

import dal.FootballClubDAO;
import dal.MatchDAO;
import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import models.FootballClub;
import models.Match;
import models.News;

/**
 *
 * @author nguye
 */
@WebServlet(name = "ManageNewsServlet", urlPatterns = {"/manageNews"})
public class ManageNewsServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageNewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageNewsServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<News> listNews = NewsDAO.INSTANCE.getlistNews();
        ArrayList<Match> listMatch = MatchDAO.INSTANCE.getMatches();
        HashSet<Integer> MatchIdInNews = new HashSet<>();
        for (News listNew : listNews) {
            MatchIdInNews.add(listNew.getMatchId().getMatchId());
        }
//        out.println(MatchIdInNews.toString());
        ArrayList<Match> MatchIdNotInNews = new ArrayList<>();
        for (Match match : listMatch) {
            if (!MatchIdInNews.contains(match.getMatchId())) {
                MatchIdNotInNews.add(match);
            }
        }
//        out.println(MatchIdNotInNews.toString());
        session.setAttribute("MatchIdNotInNews", MatchIdNotInNews);
        if (!listNews.isEmpty()) {
            session.setAttribute("getListNews", listNews);
        } else {
            request.setAttribute("err", "listNews Empty!!!");
        }
        if (!listMatch.isEmpty()) {
            session.setAttribute("getListMatch", listMatch);
        } else {
            request.setAttribute("err", "listMatch Empty!!!");
        }

        request.getRequestDispatcher("views/manageNews.jsp").forward(request, response);
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
        doGet(request, response);
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

    public static void main(String[] args) {
        ArrayList<News> listNews = NewsDAO.INSTANCE.getlistNews();
        System.out.println(listNews.toString());
//        ArrayList<Match> listMatch = MatchDAO.INSTANCE.getMatches();
//        System.out.println(listMatch.toString());
//        ArrayList<FootballClub> listFootballClub = FootballClubDAO.INSTANCE.getFootballClubs();
//        System.out.println(listFootballClub.toString());
    }
}