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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import thliem.dtos.ProductDTO;
import thliem.utils.DBUtil;

/**
 *
 * @author LiemNguyen
 */
public class ProductDAO {

    final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(ProductDAO.class);
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

    public List<ProductDTO> loadProductList(int index) {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT productID,name,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description "
                    + "FROM tblProducts p JOIN tblCategories c on p.categoryID = c.categoryID WHERE p.status = 1 AND p.quantity > 0 ORDER BY p.createDate "
                    + "offset ? rows fetch first 20 rows only";
            stm = con.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 20);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("productID");
                String name = rs.getString("name");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = true;

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);

        }
        finally {
            closeConnection();
        }
        return list;
    }

    public List<ProductDTO> loadAllProductList() {
        List<ProductDTO> list = null;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT productID,name,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description,status "
                    + "FROM tblProducts p JOIN tblCategories c on p.categoryID = c.categoryID ORDER BY p.status DESC";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("productID");
                String name = rs.getString("name");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public Map<String, String> loadCategoriesMap() {
        Map<String, String> categoryMap = new HashMap<>();
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT categoryID,categoryName FROM tblCategories ORDER BY categoryName";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                categoryMap.put(rs.getString("categoryID"), rs.getString("categoryName"));
            }
        }
        catch (Exception ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return categoryMap;
    }

    public List<ProductDTO> searchProductList(String search) {
        List<ProductDTO> list = null;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT productID,name,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description,status "
                    + "FROM tblProducts p JOIN tblCategories c on p.categoryID = c.categoryID "
                    + "WHERE p.name LIKE ? ORDER BY p.status DESC";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("productID");
                String name = rs.getString("name");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public List<ProductDTO> searchProductOnCategory_PriceRange(String productName, String categoryID, float min, float max) {
        List<ProductDTO> list = null;
        try {

            con = DBUtil.getConnection();
            String sql = "SELECT productID,name,c.categoryName AS 'Category',quantity,imageLink,createDate,price,description "
                    + "FROM tblProducts p JOIN tblCategories c on p.categoryID = c.categoryID "
                    + "WHERE (p.status = 1 AND p.quantity > 0) AND ((p.name LIKE ?) OR (p.categoryID LIKE ?) OR (p.price BETWEEN ? AND ?)) "
                    + "ORDER BY p.createDate";
            stm = con.prepareStatement(sql);

            if (productName.trim().isEmpty()) {
                stm.setNull(1, java.sql.Types.VARCHAR);
            }
            else {
                stm.setString(1, "%" + productName + "%");
            }
            if (categoryID.equals("none")) {
                stm.setNull(2, java.sql.Types.VARCHAR);
            }
            else {
                stm.setString(2, "%" + categoryID + "%");
            }
            if (min == 0.0 && max == 0.0) {
                stm.setNull(3, java.sql.Types.FLOAT);
                stm.setNull(4, java.sql.Types.FLOAT);
            }
            else {
                stm.setFloat(3, min);
                stm.setFloat(4, max);
            }
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("productID");
                String name = rs.getString("name");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String imageLink = rs.getString("imageLink");
                Date createDate = rs.getDate("createDate");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                boolean status = true;

                list.add(new ProductDTO(id, name, category, quantity, imageLink, createDate, price, status, description));
            }

        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public boolean updateProductInfo(ProductDTO dto) {
        boolean success = true;

        try {

            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts SET name=?,categoryID=?,createDate=?"
                    + ",imageLink=?,quantity=?,price=?,description=? WHERE productID = ?";
            stm = con.prepareStatement(sql);

            stm.setString(1, dto.getName());
            stm.setString(2, dto.getCategory());
            stm.setDate(3, dto.getCreateDate());
            stm.setString(4, dto.getImageLink());
            stm.setInt(5, dto.getQuantity());
            stm.setFloat(6, dto.getPrice());
            stm.setString(7, dto.getDescription());
            stm.setInt(8, dto.getProductID());

            int affectedRow = stm.executeUpdate();
            if (affectedRow > 0) {
                success = true;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return success;
    }

    public boolean deleteProduct(int productID) {
        boolean success = true;

        try {

            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts SET status = 0 WHERE productID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, productID);

            int affectedRow = stm.executeUpdate();
            if (affectedRow > 0) {
                success = true;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return success;
    }

    public boolean addNewProduct(ProductDTO dto) {
        boolean success = true;

        try {

            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblProducts VALUES(?,?,?,?,?,?,?,?)";
            stm = con.prepareStatement(sql);

            stm.setString(1, dto.getName());
            stm.setString(2, dto.getCategory());
            stm.setInt(3, dto.getQuantity());
            stm.setString(4, dto.getImageLink());
            stm.setDate(5, dto.getCreateDate());
            stm.setFloat(6, dto.getPrice());
            stm.setBoolean(7, dto.isStatus());
            stm.setString(8, dto.getDescription());
            

            int affectedRow = stm.executeUpdate();
            if (affectedRow > 0) {
                success = true;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return success;
    }

    public boolean checkQuantity(int id, int quantity) {
        boolean valid = true;

        try {

            con = DBUtil.getConnection();
            String sql = "SELECT quantity FROM tblProducts WHERE productID = ?";
            stm = con.prepareStatement(sql);

            stm.setInt(1, id);

            rs = stm.executeQuery();
            if (rs.next()) {
                int orgQuantity = rs.getInt(1);
                if (quantity <= orgQuantity) {
                    valid = false;
                }
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return valid;
    }

    public void updateQuantityOnCheckout(int ordQuantity, int availQuantity, int productID) {

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts SET quantity = ? WHERE productID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, availQuantity - ordQuantity);
            stm.setInt(2, productID);
            stm.executeUpdate();
        }
        catch (Exception e) {
            log.error(e);

        }
        finally {
            closeConnection();
        }
    }

    public int getProductQuantity(int productID) {
        int res = -1;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT quantity FROM tblProducts WHERE productID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, productID);
            rs = stm.executeQuery();
            if (rs.next()) {
                res = rs.getInt(1);
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

    public List<Integer> getProductIDList() {
        List<Integer> list = null;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT productID FROM tblProducts";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt(1);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(productID);
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException e) {
            log.error(e);
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public int getNumberPage() throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "select COUNT(productID) from tblProducts";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 20;
                    if (total % 20 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }

        }
        catch (Exception e) {

        }
        finally {
            closeConnection();
        }
        return 0;
    }

    public boolean checkDupProduct(String name) {
        boolean valid = true;

        try {

            con = DBUtil.getConnection();
            String sql = "SELECT id FROM tblProducts WHERE name = ?";
            stm = con.prepareStatement(sql);

            stm.setString(1, name);

            rs = stm.executeQuery();
            if (rs.next()) {
                valid = false;
            }
        }
        catch (ClassNotFoundException | SQLException | NamingException ex) {
            log.error(ex);
        }
        finally {
            closeConnection();
        }
        return valid;
    }
}
