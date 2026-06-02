<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

   
    body {
         height: 100vh;
    }

  
    form {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(255, 204, 51, 0.3);
        width: 100%;
        max-width: 400px;
        margin-left:500px;
        margin-bottom:20px;
        text-align: center;
        border: 2px solid #ffcc33;
    }

  
    h1 {
        font-size: 24px;
        color: #333333;
        margin-bottom: 20px;
    }

   
    label {
        display: block;
        font-size: 14px;
        color: #333333;
        margin-bottom: 5px;
        text-align: left;
    }

   
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ffd966;
        border-radius: 5px;
        font-size: 14px;
        background-color: #fffde7;
    }

    input[type="text"]:focus {
        border-color: #ffcc33;
        outline: none;
        box-shadow: 0px 0px 8px rgba(255, 204, 51, 0.3);
    }

    
    button[type="submit"] {
        background-color: #ffcc33;
        color: #333333;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    button[type="submit"]:hover {
        background-color: #ffb700;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<form action="addProduct" method="post">
    <h1>Add Product</h1>
    <label>Product Name:</label>
    <input type="text" name="name" placeholder="Enter Product name"><br><br>
    
    <label>Product Image:</label>
    <input type="text" name="image" placeholder="Enter Product image"><br><br>
    
    <label>Product Cost:</label>
    <input type="text" name="cost" placeholder="Enter Product cost"><br><br>
    
    <label>Product Details:</label>
    <input type="text" name="description" placeholder="Enter Product details"><br><br>
    
    <label>Product Category:</label>
    <input type="text" name="category" placeholder="Enter Product category"><br><br>
    
    <button type="submit" name="addProduct">Add Product</button>
</form>
<%@include file="Footer.jsp" %>
</body>
</html>
