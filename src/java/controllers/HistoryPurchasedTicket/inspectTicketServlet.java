/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.HistoryPurchasedTicket;

import dal.HistoryPurchasedTicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import models.HistoryPurchasedTicketMatchSeat;

/**
 *
 * @author nguye
 */
@WebServlet(name = "inspectTicketServlet", urlPatterns = {"/inspectTicket"})
@MultipartConfig
public class inspectTicketServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inspectTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet inspectTicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public boolean isNullOrBlank(String str) {
        return str == null || str.trim().isEmpty();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String qrcode = request.getParameter("qrcode");
        String checkQRCode = ""; 
        ArrayList<HistoryPurchasedTicketMatchSeat> listHistoryPurchasedTicketMatchSeat = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
        for (HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat : listHistoryPurchasedTicketMatchSeat) {
            if (LocalDateTime.now().isAfter(historyPurchasedTicketMatchSeat.getStartTime())) {
                HistoryPurchasedTicketDAO.getInstance().updateListHistoryPurchasedTicketMatchSeat(historyPurchasedTicketMatchSeat.getQrCode(), 3);
            }
        }
        if (!isNullOrBlank(qrcode)) {
            ArrayList<HistoryPurchasedTicketMatchSeat> listHistoryPurchasedTicket = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
            for (HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat : listHistoryPurchasedTicket) {
                if (qrcode.equals(historyPurchasedTicketMatchSeat.getQrCode())) {
                    switch (historyPurchasedTicketMatchSeat.getStatusId().getStatusId()) {
                        case 1:
                            checkQRCode = "unchecked";
                            HistoryPurchasedTicketDAO.getInstance().updateListHistoryPurchasedTicketMatchSeat(qrcode, 2);
                            break;
                        case 2:
                            checkQRCode = "checked";
                            break;
                        case 3:
                            checkQRCode = "timeOut";
                            break;
                    }
                    break;
                }
            }
        }

        request.setAttribute("checkQRCode", checkQRCode);
        request.setAttribute("getListHistoryPurchasedTicketMatchSeat", HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat());
        request.getRequestDispatcher("views/inspectTicket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}