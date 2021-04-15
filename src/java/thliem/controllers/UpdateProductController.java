/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thliem.daos.ProductDAO;
import thliem.dtos.ProductDTO;
import thliem.dtos.UserDTO;

/**
 *
 * @author LiemNguyen
 */
public class UpdateProductController extends HttpServlet {

    final String HOME_PAGE = "home.jsp";
    final String MANAGE_PAGE = "ManageController";

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

        final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(UpdateProductController.class);

        String url = HOME_PAGE;
        try {
            HttpSession ss = request.getSession();
            if (((UserDTO) ss.getAttribute("LOGIN_USER")).getRoleID().equals("AD")) {

                int productID = Integer.parseInt(request.getParameter("prodID"));
                String name = request.getParameter("prodName");
                String category = request.getParameter("prodCategory");
                String imageLink = request.getParameter("prodImgLink");
                String description = request.getParameter("prodDescription");

                int quantity = Integer.parseInt(request.getParameter("prodQuantity"));
                float price = Float.parseFloat(request.getParameter("prodPrice"));
                Date createDate = Date.valueOf(request.getParameter("prodCreateDate"));

                String prodStatus = request.getParameter("prodStatus");

                boolean status = true;
                if (prodStatus == null) {
                    status = false;
                }

                ProductDAO dao = new ProductDAO();
                if (dao.updateProductInfo(new ProductDTO(productID, name, category, quantity, imageLink, createDate, price, status, description))) {
                    request.setAttribute("UPDATE_MESSAGE", "Update Status : Successfully update product : " + name);
                }
                else {
                    request.setAttribute("UPDATE_MESSAGE", "Update Status : Failed to update product : " + name);
                }
                url = MANAGE_PAGE;
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
