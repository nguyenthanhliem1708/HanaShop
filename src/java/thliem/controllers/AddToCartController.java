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
import thliem.daos.UserDAO;
import thliem.dtos.CartDTO;
import thliem.dtos.ProductDTO;
import thliem.dtos.UserDTO;

/**
 *
 * @author LiemNguyen
 */
public class AddToCartController extends HttpServlet {
    final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(AddToCartController.class);
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
        final String CART_PAGE = "cart.jsp";
        final String LOGIN_PAGE = "login.jsp";

        String url = CART_PAGE;

        try {
            HttpSession ss = request.getSession();
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            if (user != null && !user.getRoleID().equals("AD")) {
                UserDAO dao = new UserDAO();
                String username = user.getUsername();
                int userID = dao.getUserIDFromUsername(username);
                CartDTO cart = (CartDTO) ss.getAttribute("CART");
                if (cart == null) {
                    cart = new CartDTO(userID, null);
                }

                int productID = Integer.parseInt(request.getParameter("PRODUCT_ID"));
                String productName = request.getParameter("PRODUCT_NAME");
                String productCategory = request.getParameter("PRODUCT_CATEGORY");
                float productPrice = Float.parseFloat(request.getParameter("PRODUCT_PRICE"));
                String productDescription = request.getParameter("PRODUCT_DESCRIPTION");
                String productImgLink = request.getParameter("PRODUCT_IMAGE_LINK");
                String date = request.getParameter("PRODUCT_CREATE_DATE");
                Date createDate = java.sql.Date.valueOf(date);
                
                cart.add(new ProductDTO(productID, productName,productCategory,1,productImgLink, createDate, productPrice, true, productDescription));
                ss.setAttribute("CART", cart);
            }
            else{
                url=LOGIN_PAGE;
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
