<%-- 
    Document   : login
    Created on : Jan 9, 2021, 12:02:41 AM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-touch"><head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" type="image/png" href="images/icons/favicon.ico">

        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">

        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">

        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <style type="text/css">/*
         * contextMenu.js v 1.4.0
         * Author: Sudhanshu Yadav
         * s-yadav.github.com
         * Copyright (c) 2013 Sudhanshu Yadav.
         * Dual licensed under the MIT and GPL licenses
        **/

            .iw-contextMenu {
                box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.10) !important;
                border: 1px solid #c8c7cc !important;
                border-radius: 11px !important;
                display: none;
                z-index: 1000000132;
                max-width: 300px !important;
                width: auto !important;
            }

            .dark-mode .iw-contextMenu,
            .TnITTtw-dark-mode.iw-contextMenu,
            .TnITTtw-dark-mode .iw-contextMenu {
                border-color: #747473 !important;
            }

            .iw-cm-menu {
                background: #fff !important;
                color: #000 !important;
                margin: 0px !important;
                padding: 0px !important;
                overflow: visible !important;
            }

            .dark-mode .iw-cm-menu,
            .TnITTtw-dark-mode.iw-cm-menu,
            .TnITTtw-dark-mode .iw-cm-menu {
                background: #525251 !important;
                color: #FFF !important;
            }

            .iw-curMenu {
            }

            .iw-cm-menu li {
                font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Helvetica, Arial, Ubuntu, sans-serif !important;
                list-style: none !important;
                padding: 10px !important;
                padding-right: 20px !important;
                border-bottom: 1px solid #c8c7cc !important;
                font-weight: 400 !important;
                cursor: pointer !important;
                position: relative !important;
                font-size: 14px !important;
                margin: 0 !important;
                line-height: inherit !important;
                border-radius: 0 !important;
                display: block !important;
            }

            .dark-mode .iw-cm-menu li, .TnITTtw-dark-mode .iw-cm-menu li {
                border-bottom-color: #747473 !important;
            }

            .iw-cm-menu li:first-child {
                border-top-left-radius: 11px !important;
                border-top-right-radius: 11px !important;
            }

            .iw-cm-menu li:last-child {
                border-bottom-left-radius: 11px !important;
                border-bottom-right-radius: 11px !important;
                border-bottom: none !important;
            }

            .iw-mOverlay {
                position: absolute !important;
                width: 100% !important;
                height: 100% !important;
                top: 0px !important;
                left: 0px !important;
                background: #FFF !important;
                opacity: .5 !important;
            }

            .iw-contextMenu li.iw-mDisable {
                opacity: 0.3 !important;
                cursor: default !important;
            }

            .iw-mSelected {
                background-color: #F6F6F6 !important;
            }

            .dark-mode .iw-mSelected, .TnITTtw-dark-mode .iw-mSelected {
                background-color: #676766 !important;
            }

            .iw-cm-arrow-right {
                width: 0 !important;
                height: 0 !important;
                border-top: 5px solid transparent !important;
                border-bottom: 5px solid transparent !important;
                border-left: 5px solid #000 !important;
                position: absolute !important;
                right: 5px !important;
                top: 50% !important;
                margin-top: -5px !important;
            }

            .dark-mode .iw-cm-arrow-right, .TnITTtw-dark-mode .iw-cm-arrow-right {
                border-left-color: #FFF !important;
            }

            .iw-mSelected > .iw-cm-arrow-right {
            }

            /*context menu css end */</style><style type="text/css">@-webkit-keyframes load4 {
                0%,
                100% {
                    box-shadow: 0 -3em 0 0.2em, 2em -2em 0 0em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 0;
                }
                12.5% {
                    box-shadow: 0 -3em 0 0, 2em -2em 0 0.2em, 3em 0 0 0, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 -1em;
                }
                25% {
                    box-shadow: 0 -3em 0 -0.5em, 2em -2em 0 0, 3em 0 0 0.2em, 2em 2em 0 0, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 -1em;
                }
                37.5% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0em 0 0, 2em 2em 0 0.2em, 0 3em 0 0em, -2em 2em 0 -1em, -3em 0em 0 -1em, -2em -2em 0 -1em;
                }
                50% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 0em, 0 3em 0 0.2em, -2em 2em 0 0, -3em 0em 0 -1em, -2em -2em 0 -1em;
                }
                62.5% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 0, -2em 2em 0 0.2em, -3em 0 0 0, -2em -2em 0 -1em;
                }
                75% {
                    box-shadow: 0em -3em 0 -1em, 2em -2em 0 -1em, 3em 0em 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 0, -3em 0em 0 0.2em, -2em -2em 0 0;
                }
                87.5% {
                    box-shadow: 0em -3em 0 0, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 0, -3em 0em 0 0, -2em -2em 0 0.2em;
                }
            }

            @keyframes load4 {
                0%,
                100% {
                    box-shadow: 0 -3em 0 0.2em, 2em -2em 0 0em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 0;
                }
                12.5% {
                    box-shadow: 0 -3em 0 0, 2em -2em 0 0.2em, 3em 0 0 0, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 -1em;
                }
                25% {
                    box-shadow: 0 -3em 0 -0.5em, 2em -2em 0 0, 3em 0 0 0.2em, 2em 2em 0 0, 0 3em 0 -1em, -2em 2em 0 -1em, -3em 0 0 -1em, -2em -2em 0 -1em;
                }
                37.5% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0em 0 0, 2em 2em 0 0.2em, 0 3em 0 0em, -2em 2em 0 -1em, -3em 0em 0 -1em, -2em -2em 0 -1em;
                }
                50% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 0em, 0 3em 0 0.2em, -2em 2em 0 0, -3em 0em 0 -1em, -2em -2em 0 -1em;
                }
                62.5% {
                    box-shadow: 0 -3em 0 -1em, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 0, -2em 2em 0 0.2em, -3em 0 0 0, -2em -2em 0 -1em;
                }
                75% {
                    box-shadow: 0em -3em 0 -1em, 2em -2em 0 -1em, 3em 0em 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 0, -3em 0em 0 0.2em, -2em -2em 0 0;
                }
                87.5% {
                    box-shadow: 0em -3em 0 0, 2em -2em 0 -1em, 3em 0 0 -1em, 2em 2em 0 -1em, 0 3em 0 -1em, -2em 2em 0 0, -3em 0em 0 0, -2em -2em 0 0.2em;
                }
                }</style><style type="text/css">/* This is not a zero-length file! */</style></head>
    <body>
        <c:set var="errorMessage" value="${sessionScope.LOGIN_ERROR}"/>
        <c:if test="${errorMessage != null}">
            <c:if test="${not empty errorMessage}">
                <script>alert("${errorMessage}");</script>
            </c:if>
        </c:if>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt="">
                        <!--<img src="images/img-01.png" alt="IMG">-->
                        <img src="images/img-02.jpg" alt="IMG">
                    </div>
                    <form class="login100-form validate-form" action="MainController" method = "POST">
                        <span class="login100-form-title">
                            Login
                        </span>
                        
                        <div class="text-center p-t-20" style="margin-bottom: 4%"> 
                            <span class="alert-success">${requestScope.REGISTER_MESSAGE}</span>
                        </div>
                        
                        <div class="wrap-input100 validate-input alert-validate" data-validate="Valid username is required">
                            <input class="input100" type="text" name="username" placeholder="Username" required minlength="4" maxlength="15" pattern="[A-Za-z0-9]{4,15}" title="4-15 characters symbols not allowed">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input alert-validate" data-validate="Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password" required minlength="4" maxlength="15" pattern="[A-Za-z0-9!@#$%^&*?|\/~]{4,15}" title="4-15 characters& symbols">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit" name="btnAction" value="Login">
                                Login
                            </button>
                        </div>
                        <div class="text-center p-t-136">
                            <a class="txt2" href="register.jsp">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script src="vendor/jquery/jquery-3.2.1.min.js"></script>

        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <script src="vendor/select2/select2.min.js"></script>

        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script>
                    $('.js-tilt').tilt({
                        scale: 1.1
                    })
        </script>

        <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag() {
                        dataLayer.push(arguments);
                    }
                    gtag('js', new Date());

                    gtag('config', 'UA-23581568-13');
        </script>

        <script src="js/main.js"></script>


    </body></html>

