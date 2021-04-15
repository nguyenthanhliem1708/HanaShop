/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thliem.daos.UserDAO;
import thliem.dtos.UserDTO;

/**
 *
 * @author LiemNguyen
 */
public class RegisterController extends HttpServlet {

    final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(RegisterController.class);
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    final String LOGIN_PAGE = "login.jsp";
    final String HOME_PAGE = "home.jsp";
    final String REGISTER_PAGE = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REGISTER_PAGE;
        try {
            HttpSession ss = request.getSession();
            if (((UserDTO) ss.getAttribute("LOGIN_USER")) == null) {
                String username = request.getParameter("username");
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String password = request.getParameter("password");

                UserDAO dao = new UserDAO();
                //check username duplicate ? 
                boolean add = false;
                if (dao.checkUsernameExist(username)) {
                    if (dao.addNewUser(new UserDTO("MB", username, password, fullname, address, phone, true))) {
                        url = LOGIN_PAGE;
                        add = true;
                        request.setAttribute("REGISTER_MESSAGE", "Successfully created, please log in as " + username + " to continue");
                    }
                }
                else {
                    request.setAttribute("USERNAME_ERROR", "Duplicated username");
                }
                if (!add) {
                    request.setAttribute("USERNAME", username);
                    request.setAttribute("FULLNAME", fullname);
                    request.setAttribute("PHONE", phone);
                    request.setAttribute("ADDRESS", address);
                }
            }
            else {
                url = HOME_PAGE;
            }
        }
        catch (Exception e) {
            log.error(e);
        }
        finally {
            request.getRequestDispatcher(url).forward(request, response);
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

}
