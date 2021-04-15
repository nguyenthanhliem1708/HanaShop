/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LiemNguyen
 */
public class CartDTO {

    private int userID;
    private Map<Integer, ProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(int userID, Map<Integer, ProductDTO> cart) {
        this.userID = userID;
        this.cart = cart;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Map<Integer, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, ProductDTO> cart) {
        this.cart = cart;
    }

    public void setMap(Map<Integer, ProductDTO> cartMap) {
        this.cart = cartMap;
    }

    public void add(ProductDTO prod) {
        if (cart == null) {
            cart = new HashMap<>();
        }
        if (cart.containsKey(prod.getProductID())) {
            int quantity = this.cart.get(prod.getProductID()).getQuantity();

            prod.setQuantity(quantity + prod.getQuantity());
        }
        cart.put(prod.getProductID(), prod);
    }

    public void delete(int id) {
        if (cart == null) {
            return;
        }
        if (cart.containsKey(id)) {
            cart.remove(id);
        }
    }

    public void update(ProductDTO dto) {
        if (this.cart != null) {
            if (this.cart.containsKey(dto.getProductID())) {
                this.cart.replace(dto.getProductID(), dto);
            }
        }
    }
}
