<%-- 
    Document   : home1
    Created on : Jan 17, 2021, 11:52:49 PM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hana Shop Home Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <nav>

            <div id="nav-placeholder">
            </div>

            <script src="//code.jquery.com/jquery.min.js"></script>
            <script>
                $.get("nav-bar.jsp", function (data) {
                    $("#nav-placeholder").replaceWith(data);
                });
            </script>
        </nav>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="">HΛNΛ</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?btnAction=Menu">Menu</a>
                        </li>
                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?btnAction=Cart">Cart</a>
                        </li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?btnAction=Manage">Manage</a>
                        </li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <header>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" style="background-image: url('https://blog.tubikstudio.com/wp-content/uploads/2019/12/Italian-food-illustration-tubikarts-2.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-4">Professional</h2>
                            <p class="lead">Enjoy the professional style of HΛNΛ.</p>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('https://blog.tubikstudio.com/wp-content/uploads/2019/12/asian-food-illustration-2.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-4">Premium</h2>
                            <p class="lead">Premium from ingredients to you .</p>
                        </div>
                    </div>
                    <!-- Slide Three - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('https://i.pinimg.com/originals/ab/8a/fc/ab8afc7ef92d0bcdcafaac220c62c194.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-4">Experience</h2>
                            <p class="lead">The one of the kind experience only at HΛNΛ.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>
    </body>
</html>

<style>
    .carousel-item {
        height: 100vh;
        min-height: 350px;
        background: no-repeat center center scroll;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        
    }
    .carousel-caption{
        color: black;
    }
    .carousel-indicators{
        color: black;
    }
</style>

