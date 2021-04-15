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

/**
 *
 * @author LiemNguyen
 */
public class MainController extends HttpServlet {

     final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(MainController.class);

    final String ERROR_PAGE = "invalid.html";
    final String HOME_PAGE = "home.jsp";
    final String MANAGE = "ManageController";

    final String LOGIN = "LoginController";
    final String REGISTER = "RegisterController";
    final String LOGOUT = "LogoutController";
    final String MENU = "MenuController";
    
    final String CREATE_PRODUCT = "CreateProductPageController";
    final String UPDATE_PRODUCT = "UpdateProductController";
    final String DELETE_PRODUCT = "DeleteProductController";
    final String SEARCH_MANAGE_PRODUCT = "SearchManageProductController";
    
    final String SEARCH_PRODUCT = "SearchProductController";
    final String SHOW_PRODUCT = "ShowProductController";
    final String CART = "ShowCartController";
    
    final String ADD_CART = "AddToCartController";
    final String UPDATE_CART = "UpdateCartController";
    final String DELETE_CART = "DeleteCartController";
    
    final String CHECKOUT = "CheckoutController";
    
    

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
        String url = ERROR_PAGE;
        try {
            String action = request.getParameter("btnAction");

            if (action.equals("Login")) {
                url = LOGIN;
            }
            else if (action.equals("Logout")) {
                url = LOGOUT;
            }
            else if (action.equals("Menu")) {
                url = MENU;
            }
            else if (action.equals("Register")) {
                url = REGISTER;
            }
            else if (action.equals("Manage")) {
                url = MANAGE;
            }
            else if(action.equals("Create Product")){
                url = CREATE_PRODUCT;
            }
            else if(action.equals("Update")){
                url = UPDATE_PRODUCT;
            }
            else if(action.equals("Delete")){
                url = DELETE_PRODUCT;
            }
            else if(action.equals("Search Product")){
            url = SEARCH_MANAGE_PRODUCT;
            }
            else if(action.equals("Search")){
            url = SEARCH_PRODUCT;
            }
            else if(action.equals("Cart")){
            url = CART;
            }
            else if(action.equals("Add to Cart")){
            url = ADD_CART;
            }
            else if(action.equals("Update Cart")){
            url = UPDATE_CART;
            }
            else if(action.equals("Delete Cart")){
            url = DELETE_CART;
            }
            else if(action.equals("Checkout")){
            url = CHECKOUT;
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

