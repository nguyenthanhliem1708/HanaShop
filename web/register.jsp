<%-- 
    Document   : register
    Created on : Jan 17, 2021, 1:48:36 AM
    Author     : LiemNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <body>
        <form action="MainController?btnAction=Register" method="POST">
            <label>
                <p class="label-txt">USERNAME</p>
                <input type="text" name="username" value="${requestScope.USERNAME}" class="input" required minlength="4" maxlength="15" >
                <div class="line-box">
                    <div class="line"></div>
                </div>
                <span id="username_message" style="color: red;font-family: sans-serif;">${requestScope.USERNAME_ERROR}</span>
            </label>
            <label>
                <p class="label-txt">FULL NAME</p>
                <input type="text" name="fullname" value="${requestScope.FULLNAME}" class="input" required maxlength="50">
                <div class="line-box">
                    <div class="line"></div>
                </div>
            </label>

            <label>
                <p class="label-txt">PASSWORD</p>
                <input type="password" name="password" class="input" id="orgPass" onkeyup ='checkPass();' required minlength="4" maxlength="15">
                <div class="line-box">
                    <div class="line"></div>
                </div>
            </label>

            <label>
                <p class="label-txt">CONFIRM PASSWORD</p>
                <input type="password" class="input"  id="confirmPass" onkeyup ='checkPass();' required minlength="4" maxlength="15">
                <div class="line-box">
                    <div class="line"></div>
                </div>
                <span id="message"></span>
            </label>

            <label>
                <p class="label-txt">PHONE</p>
                <input type="text" name="phone" value="${requestScope.PHONE}" class="input" pattern="(84|0[3|5|7|8|9])+([0-9]{9,10)\b" title="Enter valid phone number : starting with 0 and length : 10-11" placeholder="0xxx-xxx-xxx">
                <div class="line-box">
                    <div class="line"></div>
                </div>
            </label>

            <label>
                <p class="label-txt">ADDRESS</p>
                <input type="text" name="address" value="${requestScope.ADDRESS}" class="input" maxlength="50" required>
                <div class="line-box">
                    <div class="line"></div>
                </div>
            </label>

                <button type="submit" name="btnAction" value="Register" onclick="return confirm('Do you wish to continue register this account ?');">Register</button>
        </form>
    </body>
</html>

<style>
    body {
        background: #C5E1A5;
    }
    form {
        width: 60%;
        margin: 60px auto;
        background: #efefef;
        padding: 60px 120px 80px 120px;
        text-align: center;
        -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
        box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
    }
    label {
        display: block;
        position: relative;
        margin: 40px 0px;
    }
    .label-txt {
        position: absolute;
        top: -1.6em;
        padding: 10px;
        font-family: sans-serif;
        font-size: .8em;
        letter-spacing: 1px;
        color: rgb(120,120,120);
        transition: ease .3s;
    }
    .input {
        width: 100%;
        padding: 10px;
        background: transparent;
        border: none;
        outline: none;
    }

    .line-box {
        position: relative;
        width: 100%;
        height: 2px;
        background: #BCBCBC;
    }

    .line {
        position: absolute;
        width: 0%;
        height: 2px;
        top: 0px;
        left: 50%;
        transform: translateX(-50%);
        background: #8BC34A;
        transition: ease .6s;
    }

    .input:focus + .line-box .line {
        width: 100%;
    }

    .label-active {
        top: -3em;
    }

    button {
        display: inline-block;
        padding: 12px 24px;
        background: rgb(220,220,220);
        font-weight: bold;
        color: rgb(120,120,120);
        border: none;
        outline: none;
        border-radius: 3px;
        cursor: pointer;
        transition: ease .3s;
    }

    button:hover {
        background: #8BC34A;
        color: #ffffff;
    }

</style>

<script>
    $(document).ready(function () {

        $('.input').focus(function () {
            $(this).parent().find(".label-txt").addClass('label-active');
        });

        $(".input").focusout(function () {
            if ($(this).val() === '') {
                $(this).parent().find(".label-txt").removeClass('label-active');
            }
        });
    });

    function checkPass() {
        if (document.getElementById('orgPass').value ===
                document.getElementById('confirmPass').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').style.fontFamily = "sans-serif";
            document.getElementById("message").innerHTML = 'Match';
            document.getElementById('submit').disabled = false;
        } else {
            document.getElementById('message').style.fontFamily = "sans-serif";
            document.getElementById('message').style.color = 'red';
            document.getElementById("message").innerHTML = '*Not Match';
            document.getElementById('submit').disabled = true;
        }
    }
</script>