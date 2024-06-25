/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.user_access;

import dal.FootballClubDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import models.FootballClub;
import models.User;

/**
 *
 * @author AD
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/userProfile"})
@MultipartConfig
public class ProfileServlet extends HttpServlet {

    private static final String IMAGE_FOLDER = "/images/avatars/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        request.setAttribute("user", UserDAO.getINSTANCE().getUserByEmail(currentUser.getEmail()));
        request.getRequestDispatcher("views/userProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //PrintWriter out = response.getWriter();
        //out.print("hehe");
        HttpSession session = request.getSession();
           //     out.print("hehe");

        boolean isUserChangeSuccess = false;

        try {
             //       out.print("hehe");

            Part part = request.getPart("avatar");
    //    out.print("hehe");

            String img = (part != null && part.getSize() > 0) ? handleFileUpload(part, request) : "";
            String name = request.getParameter("name").trim();
            String mobile = request.getParameter("mobile").trim();
            User currentUser = (User) session.getAttribute("currentUser");
            currentUser.setName(name);
            currentUser.setPhoneNumber(mobile);
            currentUser.setAvatar(img);
            isUserChangeSuccess = UserDAO.getINSTANCE().updateUser(currentUser);

        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
        
        doGet(request, response);
    }

    private String handleFileUpload(Part part, HttpServletRequest request) throws ServletException, IOException {
        String imagePath = null;
        if ((part != null) && (!part.getSubmittedFileName().trim().isEmpty()) && (part.getSubmittedFileName() != null)) {
            String path = request.getServletContext().getRealPath(IMAGE_FOLDER);
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File image = new File(dir, part.getSubmittedFileName());
            part.write(image.getAbsolutePath());
            imagePath = request.getContextPath() + IMAGE_FOLDER + image.getName();
        }
        return imagePath;
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
