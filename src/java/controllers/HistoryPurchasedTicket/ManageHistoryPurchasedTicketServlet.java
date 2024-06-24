/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.HistoryPurchasedTicket;

import dal.HistoryPurchasedTicketDAO;
import dal.MatchDAO;
import dal.SeasonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.HistoryPurchasedTicketMatchSeat;

/**
 *
 * @author nguye
 */
@WebServlet(name = "ManageHistoryPuchasedTicketServlet", urlPatterns = {"/manageHistoryPurchasedTicket"})
public class ManageHistoryPurchasedTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageHistoryPuchasedTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageHistoryPuchasedTicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public boolean isNullOrBlank(String str) {
        return str == null || str.trim().isEmpty();
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
        ArrayList<HistoryPurchasedTicketMatchSeat> getListHistoryPurchasedTicketMatchSeat;
        String go = request.getParameter("go");
        if (!isNullOrBlank(go)) {
            if (go.equals("search")) {
                String valueSearch = request.getParameter("valueSearch").trim();
                getListHistoryPurchasedTicketMatchSeat = HistoryPurchasedTicketDAO.getInstance().Search(valueSearch);
                if (!getListHistoryPurchasedTicketMatchSeat.isEmpty()) {
                    request.setAttribute("getListHistoryPurchasedTicketMatchSeat", getListHistoryPurchasedTicketMatchSeat);
                }
            }
        } else {
            getListHistoryPurchasedTicketMatchSeat = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
            request.setAttribute("getListHistoryPurchasedTicketMatchSeat", getListHistoryPurchasedTicketMatchSeat);
            request.setAttribute("getListSeason", SeasonDAO.getINSTANCE().getAllseason());
            request.setAttribute("getListSeatClass", SeatClassDAO);
            
        }

        request.getRequestDispatcher("views/manageHistoryPurchasedTicket.jsp").forward(request, response);
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
        processRequest(request, response);
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
        System.out.println(HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat());
    }
}
