<%-- 
    Document   : checkout
    Created on : Jan 19, 2021, 7:23:12 PM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
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
        </nav>
        <!--end of nav-bar-->
        
        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Check Out</h2>
                        <p>${requestScope.CHECKOUT_CONFIRM}</p>
                    </div>
                </div>
            </section>
        </main>


    </body>
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
</style>