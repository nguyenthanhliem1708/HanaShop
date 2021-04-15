<%-- 
    Document   : manage
    Created on : Jan 13, 2021, 4:09:50 PM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
        <script src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    </head>
    
    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
        <c:set var="errorMessage" value="${requestScope.SEARCH_ERROR}"/>
        <c:if test="${errorMessage != null}">
            <c:if test="${not empty errorMessage}">
                <script>alert("${errorMessage}");</script>
            </c:if>
        </c:if>

        <c:set var="updateMessage" value="${requestScope.UPDATE_MESSAGE}"/>
        <c:if test="${updateMessage != null}">
            <c:if test="${not empty updateMessage}">
                <script>alert("${updateMessage}");</script>
            </c:if>
        </c:if>


        <body>
            
            <a href="MainController?btnAction=Create Product">CREATE PRODUCT</a><br>
            <form action="MainController" method="POST">
                <input type="text" name="SEARCH_VALUE" value="${param.SEARCH_VALUE}" maxlength="50" placeholder="Product name">
                <input type="submit" name="btnAction" value="Search Product">
            </form>
            <div>

                <div class="row">
                    <div class="col-md-12">
                        <legend>Product Listings</legend>
                    </div>
                </div>

                <c:set var="productList" value="${requestScope.PRODUCT_LIST}"/>

                <c:choose>
                    <c:when test="${not empty productList}">
                        <c:set var="categoryMap" value="${requestScope.CATEGORY_MAP}"/>

                        <form action="MainController" method="POST">

                            <table class="table table-responsive table-hover table-bordered ">
                                <thead>
                                    <tr class="info">
                                        <th>No.</th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Quantity</th>
                                        <th>Image Link </th>
                                        <th>Price</th>
                                        <th>Create Date</th>
                                        <th>Available</th>
                                        <th>Description</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="product" items="${productList}" varStatus="counter">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td> <input type="text" name="prodName" value="${product.name}" maxlength="50"> </td>
                                            <td>
                                                <select id="categoryCmb" name="prodCategory">
                                                    <c:forEach var="entry" items="${categoryMap}">
                                                        <option value="${entry.key}"<c:if test="${product.category eq entry.value}"> selected</c:if>>${entry.value}</option>
                                                    </c:forEach>
                                                </select> 
                                            </td>
                                            <td> <input type="number"  name="prodQuantity" value="${product.quantity}" required min="0"/> </td>
                                            <td> <input type="text"  name="prodImgLink" value="${product.imageLink}"  maxlength="200"/> </td>

                                            <td> <input type="number" name="prodPrice"  value="${product.price}" step="any" min="0" required /> </td>
                                            <td> <input type="date" name="prodCreateDate"  value="${product.createDate}"/> </td>
                                            <td><input type="checkbox" name="prodStatus" <c:if test="${product.status == true}">checked</c:if> onclick="return false;"/></td>
                                            <td><input type="text" name="prodDescription" value="${product.description}" maxlength="100"/></td>
                                        <input type="hidden" name="prodID" value="${product.productID}"/>

                                        <td><input type="submit" name="btnAction" value="Update" onclick="return confirm('Do you wish to continue update this product ?');"/></td>
                                        <td><input type="submit" name="btnAction" value="Delete" onclick="return confirm('Do you wish to continue delete this product ?');"/></td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>
                </c:when>
                <c:otherwise>
                    <h2>The product list is empty</h2><br>
                </c:otherwise>
            </c:choose>
        </body>
    </c:if>
    <c:if test="${sessionScope.LOGIN_USER.roleID != 'AD'}">
        <nav>
            <!--Navigation bar-->
            <div id="nav-placeholder">
            </div>

            <script src="//code.jquery.com/jquery.min.js"></script>
            <script>
                $.get("nav-bar.jsp", function (data) {
                    $("#nav-placeholder").replaceWith(data);
                });
            </script>
            <!--end of nav-bar-->
        </nav>
        <h2>Sorry , you can't access this page</h2>
    </c:if>

        

</html>
