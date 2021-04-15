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
 * @author LiemNguyen
 */
public class LoginController extends HttpServlet {
     final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(LoginController.class);
    String HOME_PAGE = "home.jsp";
    String LOGIN_PAGE = "login.jsp";

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

        String url = LOGIN_PAGE;
        
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("LOGIN_USER") != null) {
                url = HOME_PAGE;
            }
            else {
                String loginError = "";
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                UserDAO dao = new UserDAO();
                UserDTO dto = dao.checkLogin(username, password);

                //if this account existed
                if (dto != null) {
                    //inactive account
                    if (!dto.isStatus()) {
                        loginError = "This account is deactivated,Please contact administrator";
                    }
                    //active account
                    else {
                        session.setAttribute("LOGIN_USER", dto);
                        session.removeAttribute("LOGIN_ERROR");
                        url = HOME_PAGE;
                    }
                }
                //this account doesn't exist
                else {
                     loginError = "Invalid username or password";
                }
                if(loginError!=null && !loginError.isEmpty()){
                     session.setAttribute("LOGIN_ERROR", loginError);
                }
            }
            
        }
        catch (Exception e) {
                       log.error(e);

        }
        finally {
            response.sendRedirect(url);
//            request.getRequestDispatcher(url).forward(request, response);
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
