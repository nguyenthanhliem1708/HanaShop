/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thliem.daos.OrderDAO;
import thliem.daos.ProductDAO;
import thliem.dtos.CartDTO;
import thliem.dtos.ProductDTO;
import thliem.dtos.UserDTO;

/**
 *
 * @author LiemNguyen
 */
public class CheckoutController extends HttpServlet {

    final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CheckoutController.class);
    final String CHECKOUT_PAGE = "checkout.jsp";

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
        String url = CHECKOUT_PAGE;
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

            if (cart != null) {
                OrderDAO ordDAO = new OrderDAO();
                ProductDAO dao = new ProductDAO();

                if (checkQuantity(request, response)) {
                    if (ordDAO.createNewOrder(cart)) {
                        for (ProductDTO product : cart.getCart().values()) {
                            int orgQuantity = dao.getProductQuantity(product.getProductID());
                            dao.updateQuantityOnCheckout(product.getQuantity(), orgQuantity, product.getProductID());
                            List<Integer> list = dao.getProductIDList();
                            for (int i = 0; i < list.size(); i++) {
                                cart.delete(list.get(i));
                            }
                            request.setAttribute("CHECKOUT_CONFIRM", "Successfully placed your order ");
                        }
                    }
                    else {
                        request.setAttribute("CHECKOUT_CONFIRM", "Sorry, failed to check out this order");
                    }
                }
                else {
                    request.setAttribute("CHECKOUT_CONFIRM", "Sorry, product out of stock");
                }
            }
        }
        catch (Exception e) {
            log.error(e);

        }
        finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static boolean checkQuantity(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        CartDTO cart = (CartDTO) session.getAttribute("CART");

        ProductDAO dao = new ProductDAO();

        for (ProductDTO dto : cart.getCart().values()) {
            if (dto.getQuantity() > dao.getProductQuantity(dto.getProductID())) {
                
                return false;
            }
        }

        return true;
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
