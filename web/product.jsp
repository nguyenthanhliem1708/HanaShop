<%-- 
    Document   : product
    Created on : Jan 18, 2021, 10:25:06 PM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
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

        

        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <c:set var="prodImgLink" value="${param.PRODUCT_IMAGE_LINK}"/>
                                <div class="tab-pane active" id="pic-1"><img src="${prodImgLink}" /></div>
                            </div>

                        </div>
                        <div class="details col-md-6">
                            <c:set var="prodName" value="${param.PRODUCT_NAME}"/>
                            <h3 class="product-title">${prodName}</h3>
                            
                            <c:set var="prodDesription" value="${param.PRODUCT_DESCRIPTION}"/>
                            <p class="product-description">${prodDescription}</p>
                            
                            <c:set var="prodPrice" value="${param.PRODUCT_PRICE}"/>
                            <h4 class="price">current price: <span>$${prodPrice}</span></h4>

                            <c:set var="prodQuantity" value="${param.PRODUCT_QUANTITY}"/>
                            <h4 class="quantity">AVAILABLE QUANTITY : <span>${prodQuantity}</span></h4>
                            
                            <c:set var="prodCreateDate" value="${param.PRODUCT_CREATE_DATE}"/>
                            <h4 class="quantity">CREATE DATE : <span>${prodCreateDate}</span></h4>
                            
                            <c:if test="${sessionScope.LOGIN_USER.roleID ne'AD'}">
                            <div class="action">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="PRODUCT_ID" value="${param.PRODUCT_ID}">
                                    <input type="hidden" name="PRODUCT_NAME" value="${prodName}">
                                    <input type="hidden" name="PRODUCT_CATEGORY" value="${prodCategory}">
                                    <input type="hidden" name="PRODUCT_CREATE_DATE" value="${prodCreateDate}">
                                    <input type="hidden" name="PRODUCT_IMAGE_LINK" value="${prodImgLink}">
                                    <input type="hidden" name="PRODUCT_PRICE" value="${prodPrice}">
                                    <input type="hidden" name="PRODUCT_DESCRIPTION" value="${prodDescription}">
                                    <button class="add-to-cart btn btn-default" type="submit" name="btnAction" value="Add to Cart" >add to cart</button>
                                </form>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


<style>

    /*****************globals*************/
    body {
        font-family: 'open sans';
        overflow-x: hidden; }

    img {
        max-width: 100%; }

    .preview {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column; }
    @media screen and (max-width: 996px) {
        .preview {
            margin-bottom: 20px; } }

    .preview-pic {
        -webkit-box-flex: 1;
        -webkit-flex-grow: 1;
        -ms-flex-positive: 1;
        flex-grow: 1; }

    .preview-thumbnail.nav-tabs {
        border: none;
        margin-top: 15px; }
    .preview-thumbnail.nav-tabs li {
        width: 18%;
        margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
        max-width: 100%;
        display: block; }
    .preview-thumbnail.nav-tabs li a {
        padding: 0;
        margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
        margin-right: 0; }

    .tab-content {
        overflow: hidden; }
    .tab-content img {
        width: 100%;
        -webkit-animation-name: opacity;
        animation-name: opacity;
        -webkit-animation-duration: .3s;
        animation-duration: .3s; }

    .card {
        margin-top: 50px;
        background: #eee;
        padding: 3em;
        line-height: 1.5em; }

    @media screen and (min-width: 997px) {
        .wrapper {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex; } }

    .details {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column; }

    .colors {
        -webkit-box-flex: 1;
        -webkit-flex-grow: 1;
        -ms-flex-positive: 1;
        flex-grow: 1; }

    .product-title, .price, .sizes, .colors {
        text-transform: UPPERCASE;
        font-weight: bold; }

    .checked, .price span {
        color: #ff9f1a; }

    .product-title, .rating, .product-description, .price, .vote, .sizes {
        margin-bottom: 15px; }

    .product-title {
        margin-top: 0; }

    .size {
        margin-right: 10px; }
    .size:first-of-type {
        margin-left: 40px; }

    .color {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
        height: 2em;
        width: 2em;
        border-radius: 2px; }
    .color:first-of-type {
        margin-left: 20px; }

    .add-to-cart, .like {
        background: #ff9f1a;
        padding: 1.2em 1.5em;
        border: none;
        text-transform: UPPERCASE;
        font-weight: bold;
        color: #fff;
        -webkit-transition: background .3s ease;
        transition: background .3s ease; }
    .add-to-cart:hover, .like:hover {
        background: #b36800;
        color: #fff; }

    .not-available {
        text-align: center;
        line-height: 2em; }
    .not-available:before {
        font-family: fontawesome;
        content: "\f00d";
        color: #fff; }

    .orange {
        background: #ff9f1a; }

    .green {
        background: #85ad00; }

    .blue {
        background: #0076ad; }

    .tooltip-inner {
        padding: 1.3em; }

    @-webkit-keyframes opacity {
        0% {
            opacity: 0;
            -webkit-transform: scale(3);
            transform: scale(3); }
        100% {
            opacity: 1;
            -webkit-transform: scale(1);
            transform: scale(1); } }

    @keyframes opacity {
        0% {
            opacity: 0;
            -webkit-transform: scale(3);
            transform: scale(3); }
        100% {
            opacity: 1;
            -webkit-transform: scale(1);
            transform: scale(1); } }

    /*# sourceMappingURL=style.css.map */
</style>
