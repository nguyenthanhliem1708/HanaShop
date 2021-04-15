/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import thliem.dtos.UserDTO;
import thliem.utils.DBUtil;

/**
 *
 * @author LiemNguyen
 */
public class UserDAO {

    Connection con;
    PreparedStatement stm;
    ResultSet rs;

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
    * This method take the 
    * @param #usr and #pwd to check if there's any user from DB match that info 
    * @return a DTO of that user if exist or null if not
     */
    public UserDTO checkLogin(String usr, String pwd) {

        UserDTO dto = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT roleID,fullname,phone,address,status FROM tblUsers WHERE username = ? AND password = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, usr);
            stm.setString(2, pwd);
            rs = stm.executeQuery();

            if (rs.next()) {
                String roleID = rs.getString("roleID");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");

                dto = new UserDTO(roleID, usr, "***", fullname, address, phone, status);
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        finally {
            closeConnection();
        }
        return dto;
    }

    public boolean addNewUser(UserDTO dto) {
        boolean success = false;

        try {
            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblUsers VALUES(?,?,?,?,?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1,dto.getRoleID());
            stm.setString(2, dto.getUsername());
            stm.setString(3, dto.getPassword());
            stm.setString(4, dto.getFullname());
            stm.setString(5, dto.getPhone());
            stm.setString(6, dto.getAddress());
            stm.setBoolean(7, dto.isStatus());
            
            int row = stm.executeUpdate();

            if (row > 0) {
                success = true;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            closeConnection();
        }
        return success;
    }
    
    public int getUserIDFromUsername(String username){
        int userID = 0;
         try {
            con = DBUtil.getConnection();
            String sql = "SELECT userID FROM tblUsers WHERE username = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            
            rs = stm.executeQuery();

            if (rs.next()) {
                userID= rs.getInt("userID");
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            closeConnection();
        }
        return userID;
    }

    /**
     *
     * @param String username
     * @return isValid : boolean value about username existence
     */
    public boolean checkUsernameExist(String username) {
        boolean isValid = true;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT userID FROM tblUsers WHERE username = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();

            if (rs.next()) {
                isValid = false;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        finally {
            closeConnection();
        }
        return isValid;

    }

}
