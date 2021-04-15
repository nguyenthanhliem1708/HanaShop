/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thliem.dtos;

import java.sql.Date;

/**
 *
 * @author LiemNguyen
 */
public class ProductDTO {

    private int productID;
    private String name;
    private String category;
    private int quantity;
    private String imageLink;
    private Date createDate;
    private float price;

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    private boolean status;
    private String description;

    public ProductDTO() {
    }

    public ProductDTO(int productID, String name, String category, int quantity, String imageLink, Date createDate, float price, boolean status, String description) {
        this.productID = productID;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.imageLink = imageLink;
        this.createDate = createDate;
        this.price = price;
        this.status = status;
        this.description = description;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String categoryID) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
