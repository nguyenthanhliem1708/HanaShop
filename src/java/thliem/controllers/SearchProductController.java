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
import thliem.daos.ProductDAO;
import thliem.dtos.ProductDTO;

/**
 *
 * @author LiemNguyen
 */
public class SearchProductController extends HttpServlet {

    final String MENU_CONTROLLER = "MenuController";
    final String MENU_PAGE = "menu.jsp";

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
        String url = MENU_PAGE;
        try {

            String productName = request.getParameter("productName");
            String categoryID = request.getParameter("searchProductCategory");
            String priceRange = request.getParameter("searchProductPriceRange");

            if (productName.trim().isEmpty() && categoryID.equals("none") && priceRange.equals("none")) {
                url = MENU_CONTROLLER;
            }
            else {
                float min = 0, max = 0;
                if (priceRange.contains("-")) {
                    min = Float.parseFloat(priceRange.split("-")[0]);
                    max = Float.parseFloat(priceRange.split("-")[1]);
                }
                else {
                    if (!priceRange.equals("none")) {
                        min = Float.parseFloat(priceRange);
                        max = Float.MAX_VALUE;
                    }
                }

                ProductDAO dao = new ProductDAO();
                List<ProductDTO> list = dao.searchProductOnCategory_PriceRange(productName, categoryID, min, max);
                if (list != null) {
                    request.setAttribute("PRODUCT_LIST", list);
                }

                request.setAttribute("SEARCH_NAME", productName);
                request.setAttribute("SEARCH_CATEGORY", categoryID);
                request.setAttribute("CATEGORY_MAP", dao.loadCategoriesMap());

            }
        }

        catch (Exception e) {
            //log       
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
