<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: Arial, sans-serif;
      
        height: 100vh;
    }

    .parentlogin {
        display: flex;
        width: 800px;
        height: 500px;
        background: #ffffff;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        border-radius: 12px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        margin-left:350px;
    }

    .parentlogin:hover {
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
    }

    .loginimg {
        flex: 1;
        background-color: #f1f4f8;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .loginimg img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

   .login {
    flex: 1;
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    background-color: #ffffff;
    color: #333;
    border-top-right-radius: 12px;
    border-bottom-right-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s;
}

.login:hover {
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
}
.login h1{
padding:10px 0;
}

    .login label {
        position: relative;
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .login label i {
        position: absolute;
        left: 12px;
        color: #666;
    }

    .login input[type="text"],
    .login input[type="password"] {
        width: 100%;
        padding: 12px 12px 12px 40px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        color: #333;
        transition: border-color 0.3s;
    }

    .login input:focus {
        border-color: #4a90e2;
        outline: none;
    }

    .login-button {
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 8px;
        background-color: #4a90e2;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .login-button:hover {
        background-color: #357abd;
    }

    .forgot {
        margin-top: 20px;
        text-align: center;
        font-size: 14px;
    }

    .forgot a {
        color: #4a90e2;
        text-decoration: none;
    }

    .forgot a:hover {
        text-decoration: underline;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script>
    jQuery.validator.addMethod("checkemail", function(value, element) { 
        return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value); 
    });

    $(document).ready(function () {
        $("#login").validate({
            rules: {
                email: {
                    required: true,
                    checkemail: true
                },
                password: {
                    required: true,
                    minlength: 4
                }
            },
            messages: {
                email: {
                    required: "Please enter your email"
                },
                password: {
                    required: "Please enter your password",
                    minlength: "Your password must be at least 4 characters long"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
</head>
<body>
<%@include file="Header1.jsp"%>

<form action="register" method="post" id="login">

    <div class="parentlogin">
        <div class="loginimg">
            <img src="Images1/loginimage.webp" alt="Login Image">
        </div>
        <div class="login">
        <h1>Login Page</h1>
            <label>
                <i class="fa fa-envelope"></i>
                <input type="text" class="username" autocomplete="on" placeholder="Email" name="email">
            </label>
            <label>
                <i class="fa fa-lock"></i>
                <input type="password" class="password" autocomplete="off" placeholder="Password" name="password">
            </label>
            <button class="login-button" type="submit" name="login">Login</button>
            <div class="forgot">
                <a href="ForgotReset.jsp">Forgot password? | Reset Password?</a>
            </div>
        </div>
    </div>
</form>

</body>
</html>
