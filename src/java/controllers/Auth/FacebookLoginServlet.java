/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Auth;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Objects;
import models.FacebookUser;
import models.User;

/**
 *
 * @author AD
 */
@WebServlet(name="FacebookLogin", urlPatterns={"/loginFB"})
public class FacebookLoginServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        String code = request.getParameter("code");
//        System.out.println(code);
//        getFacebook FB = new getFacebook();
//        String accessToken = FB.getToken(code);
//        System.out.println(accessToken);
//        FacebookUser accFb = FB.getUserInfo(accessToken);
//         User userExist = UserDAO.INSTANCE.getUserByEmail(accFb.getEmail());
//        if (Objects.isNull(userExist)) {
//            //if not exist => redirect to register page
//            returnValueBefore(request, response,
//                    accFb.getName(),
//                    accFb.getName(),
//                    accFb.getEmail(),
//                    null
//            );
//            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
//            return;
//        } else {
//            //else save user in session => may be save email, password, or all userExist
//            System.out.println(userExist);
//            session.setAttribute("currentUser", userExist);
//        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
