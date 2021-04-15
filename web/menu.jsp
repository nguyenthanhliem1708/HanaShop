<%-- 
    Document   : product
    Created on : Jan 12, 2021, 8:24:50 AM
    Author     : LiemNguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
    </head>

    <body>
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

        <c:set var="list" value="${requestScope.PRODUCT_LIST}"/>


        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading" style="font-family: cursive">Menu</h1>
                <p class="lead text-muted mb-0">Welcome to our luxurious menu</div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <section class="search-sec">
                        <div class="container">
                            <form action="MainController" method="post">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                <input type="text" class="form-control search-slt" name="productName" placeholder="Product Name" value="${requestScope.SEARCH_NAME}">
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                <select class="form-control search-slt" name="searchProductCategory" id="category_cmb">
                                                    <option value="none">Select Category</option>
                                                    <c:forEach var="entry" items="${requestScope.CATEGORY_MAP}">
                                                        <option value="${entry.key}"<c:if test="${requestScope.SEARCH_CATEGORY eq entry.key}">selected</c:if> >${entry.value}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                <select class="form-control search-slt" id="price_range_cmb" name="searchProductPriceRange">
                                                    <option value="none">Select Price Range</option>
                                                    <option value="0-50">Under 50</option>
                                                    <option value="50-100">50 - 100</option>
                                                    <option value="100-300">100 - 300</option>
                                                    <option value="300-500">300 - 500</option>
                                                    <option value="500">Over 500</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0">

                                                <button type="submit" class="btn btn-danger wrn-btn" name="btnAction" value="Search">Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <br>
        <div class="container">

            <!-- Product Showing section -->

            <div class="col">
                <div class="row">
                    <c:set var="list" value="${requestScope.PRODUCT_LIST}"/>
                    <c:if test="${list != null}">
                        <c:forEach items="${list}" var="dto" varStatus="counter">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <form action="MainController" method="POST">
                                        <img class="card-img-top" src="${dto.imageLink}" alt="Card image cap">
                                        <div class="card-body">

                                            <c:url var="prod" value="product.jsp">
                                                <c:param name="PRODUCT_ID" value="${dto.productID}"/>
                                                <c:param name="PRODUCT_NAME" value="${dto.name}"/>
                                                <c:param name="PRODUCT_PRICE" value="${dto.price}"/>
                                                <c:param name="PRODUCT_CREATE_DATE" value="${dto.createDate}"/>
                                                <c:param name="PRODUCT_QUANTITY" value="${dto.quantity}"/>
                                                <c:param name="PRODUCT_DESCRIPTION" value="${dto.description}"/>
                                                <c:param name="PRODUCT_IMAGE_LINK" value="${dto.imageLink}"/>
                                            </c:url>

                                            <h4 class="card-title"><a href="${prod}" title="View Product">${dto.name}</a></h4>
                                            <p class="card-text">${dto.description}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${dto.price} $</p>
                                                </div>

                                                <div class="col">
                                                    <input type="hidden" name="PRODUCT_ID" value="${dto.productID}"/>
                                                    <input type="hidden" name="PRODUCT_NAME" value="${dto.name}"/>
                                                    <input type="hidden" name="PRODUCT_PRICE" value="${dto.price}"/>
                                                    <input type="hidden" name="PRODUCT_QUANTITY" value="${dto.quantity}"/>
                                                    <input type="hidden" name="PRODUCT_CREATE_DATE" value="${dto.createDate}"/>
                                                    <input type="hidden" name="PRODUCT_CATEGORY" value="${dto.category}"/>
                                                    <input type="hidden" name="PRODUCT_DESCRIPTION" value="${dto.description}"/>
                                                    <input type="hidden" name="PRODUCT_IMAGE_LINK" value="${dto.imageLink}"/>
                                                    <c:if test="${sessionScope.LOGIN_USER.roleID ne 'AD'}">
                                                        <button type="submit" name="btnAction" value="Add to Cart" class="btn btn-success btn-block">Add to cart</button>
                                                    </c:if>
                                                </div>

                                            </div>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                </div>
                <div class="col-5">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <jsp:useBean id="a" class="thliem.daos.ProductDAO" scope="request"></jsp:useBean>

                            <c:forEach begin="1" end="${a.numberPage}" var="i">
                                <li class="page-item" ${indexPage==i?"active":""}><a class="page-link" href="MenuController?index=${i}">${i}</a></li>
                                </c:forEach>

                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-light">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-lg-4 col-xl-3">
                <h5>About</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <p class="mb-0">
                    Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                </p>
            </div>
            <div class="col-md-4 col-lg-3 col-xl-3">
                <h5>Contact</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><i class="fa fa-home mr-2"></i> My company</li>
                    <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                    <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                    <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                </ul>
            </div>
            <div class="col-12 copyright mt-3">
                <p class="float-left">
                    <a href="#">Back to top</a>
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>

<style>
    .bloc_left_price {
        color: #c01508;
        text-align: center;
        font-weight: bold;
        font-size: 150%;
    }
    .category_block li:hover {
        background-color: #037bff;
    }
    .category_block li:hover a {
        color: #ffffff;
    }
    .category_block li a {
        color: #343a40;
    }
    .add_to_cart_block .price {
        color: #c01508;
        text-align: center;
        font-weight: bold;
        font-size: 200%;
        margin-bottom: 0;
    }
    .add_to_cart_block .price_discounted {
        color: #343a40;
        text-align: center;
        text-decoration: line-through;
        font-size: 140%;
    }
    .product_rassurance {
        padding: 10px;
        margin-top: 15px;
        background: #ffffff;
        border: 1px solid #6c757d;
        color: #6c757d;
    }
    .product_rassurance .list-inline {
        margin-bottom: 0;
        text-transform: uppercase;
        text-align: center;
    }
    .product_rassurance .list-inline li:hover {
        color: #343a40;
    }
    .reviews_product .fa-star {
        color: gold;
    }
    .pagination {
        margin-top: 20px;
    }
    footer {
        background: #343a40;
        padding: 40px;
    }
    footer a {
        color: #f8f9fa!important
    }

</style>