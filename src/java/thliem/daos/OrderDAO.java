/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import thliem.dtos.CartDTO;
import thliem.dtos.ProductDTO;
import thliem.utils.DBUtil;

/**
 *
 * @author LiemNguyen
 */
public class OrderDAO {
     final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(OrderDAO.class);
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
                      log.error(ex);

        }
    }

    public boolean createNewOrder(CartDTO cart) {
        boolean res = false;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String sql = "INSERT INTO tblOrders (userID,orderDate, status, totalPrice) VALUES (?,?,?,?)";
                String orderID[] = {"orderID"};
                Date orderDate = java.sql.Date.valueOf(LocalDate.now(ZoneId.systemDefault()));
                float totalPrice = 0;
                boolean status = true;
                for (ProductDTO dto : cart.getCart().values()) {
                    totalPrice += dto.getQuantity() * dto.getPrice();
                }
                stm = con.prepareStatement(sql, orderID);
                stm.setInt(1, cart.getUserID());
                stm.setDate(2, orderDate);
                stm.setBoolean(3, status);
                stm.setFloat(4, totalPrice);
                stm.executeUpdate();
                rs = stm.getGeneratedKeys();

                if (rs.next()) {
                    String ordDetailSQL = "INSERT INTO tblOrderDetails (orderID,productID,price,quantity) "
                            + " VALUES (?,?,?,?)";
                    stm = con.prepareStatement(ordDetailSQL);
                    for (ProductDTO product : cart.getCart().values()) {
                        //orderID of the above section result store @param orderID[]
                        stm.setInt(1, rs.getInt(1));
                        stm.setInt(2, product.getProductID());
                        stm.setFloat(3, product.getPrice());
                        stm.setInt(4, product.getQuantity());
                        stm.executeUpdate();
                    }
                }
                res = true;
            }
        }
        catch (Exception e) {
                       log.error(e);

        }
        finally {
            closeConnection();
        }
        return res;
    }

}
