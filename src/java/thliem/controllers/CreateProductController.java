/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.controllers;

import java.io.IOException;
import java.time.LocalDate;
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
public class CreateProductController extends HttpServlet {

    final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CreateProductController.class);
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    final String HOME_PAGE = "home.jsp";
    final String CREATE_PAGE = "CreateProductPageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CREATE_PAGE;
        String error = null;
        try {
            String imageLink = request.getParameter("IMAGE_LINK");
            String category = request.getParameter("CATEGORY");
            
            String description = request.getParameter("DESCRIPTION");
            String name = request.getParameter("NAME");
            String quantity = request.getParameter("QUANTITY");
            String price = request.getParameter("PRICE");

            if (!imageLink.trim().isEmpty()) {
                if (imageLink.length() <= 300) {
                    if (name.length() <= 50 || !name.trim().isEmpty()) {
                        if (description.length() <= 100) {
                            if (Integer.parseInt(quantity) > 0) {
                                if (Float.parseFloat(price) > 0.0) {
                                    ProductDAO dao = new ProductDAO();
                                    if (dao.checkDupProduct(name)) {
                                        if (dao.addNewProduct(new ProductDTO(0, name, category, Integer.parseInt(quantity), imageLink, java.sql.Date.valueOf(LocalDate.now()), Float.parseFloat(price), true, description))) {
                                            error = "Added successfully";
                                        }
                                    }
                                    else {
                                        error += "Duplicate product";
                                    }
                                }
                            }
                            else {
                                error += "\nName invalid";
                            }
                        }
                        else {
                            error += "\nDescription URL is too long";
                        }
                    }
                    else {
                        error += "\nName URL is too long";
                    }
                }
                else {
                    error += "\nImage URL is too long";
                }
            }
            else {
                error += "Image Link is required ";
            }
            request.setAttribute("IMAGE_LINK", imageLink);
            request.setAttribute("CATEGORY", category);
            request.setAttribute("DESCRIPTION", description);
            request.setAttribute("NAME", name);
            request.setAttribute("QUANTITY", quantity);
            request.setAttribute("PRICE", price);
        }
        catch (NumberFormatException num) {
            error += "\nInvalid number format";
        }
        catch (Exception e) {
            log.error(e);
        }

        finally {
            if (error != null) {
                request.setAttribute("ERROR", error);
            }
            
            
            
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
