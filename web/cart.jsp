<%-- 
    Document   : cart
    Created on : Jan 18, 2021, 9:51:57 AM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <!------ Include the above in your HEAD tag ---------->

    </head>
    <body>
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

        <c:if test="${sessionScope.LOGIN_USER != null}">
            <c:set var="totalPrice"/>
            <c:set var="Cart_Message" value="${requestScope.CART_EMPTY_MESSAGE}"/>

            <c:set var="cart" value="${sessionScope.CART}"/>




            <c:if test="${cart != null}">               
                <c:if test="${not empty cart.getCart()}">
                    <main class="page">
                        <section class="shopping-cart dark">
                            <div class="container">
                                <div class="block-heading">
                                    <h2>Shopping Cart</h2>
                                    <p>${Cart_Message}</p>
                                </div>
                                <div class="content">
                                    <form action="MainController" method="POST">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-8">

                                                <c:forEach var="entry" items="${cart.getCart()}">
                                                    <form action="MainController" method="POST">
                                                        <div class="items">
                                                            <div class="product">  
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <img class="img-fluid mx-auto d-block image" src="${entry.value.imageLink}">
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                        <div class="info">
                                                                            <div class="row">
                                                                                <div class="col-md-5 product-name">
                                                                                    <div class="product-name">
                                                                                        <a href="#">${entry.value.name}</a>
                                                                                        <div class="product-info">
                                                                                            <div>Product ID : <span class="value">${entry.value.productID}</span></div>
                                                                                        </div>
                                                                                        <div class="product-info">
                                                                                            <div>Category : <span class="value">${entry.value.category}</span></div>
                                                                                        </div>
                                                                                        <c:if test="${requestScope.ERROR_CART != null}">
                                                                                            <c:if test="${requestScope.ERROR_PRODUCT_ID eq entry.value.productID}">
                                                                                                <div class="product-error">
                                                                                                    <div>ERROR : <span class="value">${requestScope.ERROR_UPDATE_CART}</span></div>
                                                                                                </div>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-4 quantity">
                                                                                    <label for="quantity">Quantity:</label>
                                                                                    <input id="quantity" type="number" name="PRODUCT_QUANTITY" value ="${entry.value.quantity}" min="1" class="form-control quantity-input">
                                                                                </div>
                                                                                <div class="col-md-3 price">
                                                                                    <span>${entry.value.price}</span>
                                                                                    <c:set var="totalPrice" value="${totalPrice +(entry.value.price*entry.value.quantity)}"/>
                                                                                </div>
                                                                                <input  type="hidden" name="PRODUCT_ID" value="${entry.value.productID}"/>
                                                                                <div class="col-md-3 price">
                                                                                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnAction" value="Update Cart"><i class="fa fa-refresh" aria-hidden="true"></i></button>
                                                                                </div>
                                                                                <div class="col-md-3 price">
                                                                                    <button  class="btn btn-danger btn-lg btn-block" type="submit" name="btnAction" value="Delete Cart"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </c:forEach>
                                            </div>
                                            <div class="col-md-12 col-lg-4">
                                                <div class="summary">
                                                    <h3>Summary</h3>

                                                    <div class="summary-item"><span class="text">Total</span><span class="price">$${totalPrice}</span></div>
                                                    <button type="submit" name="btnAction" value="Checkout"class="btn btn-primary btn-lg btn-block"><i class="fa fa-shopping-cart"></i></button>
                                                </div>

                                            </div>  
                                        </div> 
                                    </form>
                                </div>
                            </div>
                        </section>
                    </main>


                    <c:if test="${sessionScope.LOGIN_USER == null}">
                        <main class="page">
                            <section class="shopping-cart dark">
                                <div class="container">
                                    <div class="block-heading">
                                        <h2>Shopping Cart</h2>
                                        <p>Please login to continue...</p>
                                    </div>
                                </div>
                            </section>
                        </main>
                    </c:if>
                </c:if>
            </c:if>
        </c:if>

        <c:if test="${empty cart.getCart()}">
            <main class="page">
                <section class="shopping-cart dark">
                    <div class="container">
                        <div class="block-heading">
                            <h2>Shopping Cart</h2>
                            <p>Your cart is empty</p>
                        </div>
                    </div>
                </section>
            </main>
        </c:if>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>
<style>
    .shopping-cart{
        padding-bottom: 50px;
        font-family: 'Montserrat', sans-serif;
    }

    .shopping-cart.dark{
        background-color: #f6f6f6;
    }

    .shopping-cart .content{
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
        background-color: white;
    }

    .shopping-cart .block-heading{
        padding-top: 50px;
        margin-bottom: 40px;
        text-align: center;
    }

    .shopping-cart .block-heading p{
        text-align: center;
        max-width: 420px;
        margin: auto;
        opacity:0.7;
    }

    .shopping-cart .dark .block-heading p{
        opacity:0.8;
    }

    .shopping-cart .block-heading h1,
    .shopping-cart .block-heading h2,
    .shopping-cart .block-heading h3 {
        margin-bottom:1.2rem;
        color: #3b99e0;
    }

    .shopping-cart .items{
        margin: auto;
    }

    .shopping-cart .items .product{
        margin-bottom: 20px;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .shopping-cart .items .product .info{
        padding-top: 0px;
        text-align: center;
    }
    .shopping-cart .items .product .error{
        padding-top: 0px;
        text-align: center;
        color : red;
    }

    .shopping-cart .items .product .info .product-name{
        font-weight: 600;
    }

    .shopping-cart .items .product .info .product-name .product-info{
        font-size: 14px;
        margin-top: 15px;
    }

    .shopping-cart .items .product .info .product-name .product-info .value{
        font-weight: 400;
    }

    .shopping-cart .items .product .info .quantity .quantity-input{
        margin: auto;
        width: 80px;
    }

    .shopping-cart .items .product .info .price{
        margin-top: 15px;
        font-weight: bold;
        font-size: 22px;
    }

    .shopping-cart .summary{
        border-top: 2px solid #5ea4f3;
        background-color: #f7fbff;
        height: 100%;
        padding: 30px;
    }

    .shopping-cart .summary h3{
        text-align: center;
        font-size: 1.3em;
        font-weight: 600;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .shopping-cart .summary .summary-item:not(:last-of-type){
        padding-bottom: 10px;
        padding-top: 10px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .shopping-cart .summary .text{
        font-size: 1em;
        font-weight: 600;
    }

    .shopping-cart .summary .price{
        font-size: 1em;
        float: right;
    }

    .shopping-cart .summary button{
        margin-top: 20px;
    }

    @media (min-width: 768px) {
        .shopping-cart .items .product .info {
            padding-top: 25px;
            text-align: left; 
        }

        .shopping-cart .items .product .info .price {
            font-weight: bold;
            font-size: 22px;
            top: 17px; 
        }

        .shopping-cart .items .product .info .quantity {
            text-align: center; 
        }
        .shopping-cart .items .product .info .quantity .quantity-input {
            padding: 4px 10px;
            text-align: center; 
        }
    }

</style>




