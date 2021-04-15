<%-- 
    Document   : create-product
    Created on : Mar 16, 2021, 8:23:04 AM
    Author     : LiemNguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <a href="MainController?btnAction=Manage">Back to Manage Page</a>
    <body>
        <c:set  var="categoryMap" value="${requestScope.CATEGORY_MAP}"/>
        <h1>Enter your new product info</h1>
        <form action="CreateProductController" method="POST">
            
            <label>Product's Image Link : </label>
            <input type="url" name="IMAGE_LINK" value="${requestScope.IMAGE_LINK}">
            <br><br>
            <label>Product's Name: </label>
            <input type="text" name="NAME" value="${requestScope.NAME}"><br><br>
            <label>Product's Category: </label>
            <select name="CATEGORY">
                <c:forEach var="entry" items="${categoryMap}">
                    <option value="${entry.key}" <c:if test="${requestScope.CATEGORY eq entry.key}">selected</c:if>>${entry.value}</option>
                </c:forEach>
            </select><br><br>
            <label>Product's Description :  </label>
            <textarea name="DESCRIPTION" cols="20" >${requestScope.DESCRIPTION}</textarea>
           <br><br><label>Product's Quantity </label>
            <input type="number" name="QUANTITY" value="${requestScope.QUANTITY}" min="1" required><br><br>
            <label>Product's Price :  </label>
            <input type="number" name="PRICE" value="${requestScope.PRICE}" min="1" required step="0.01"><br><br>
            <button  type="sumbit" > Create Product</button>
        </form>
            <div style="color: red;">
                <p>${requestScope.ERROR}</p>
            </div>
    </body>
    
    
</html>
