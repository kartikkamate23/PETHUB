<%@page import="com.MVC.Model.Product"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Product Details</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #ffeb3b;
            color: #333;
            padding: 20px;
            text-align: center;
            border-bottom: 4px solid #fbc02d; 
        }

        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            padding: 20px;
            background-color: #fff8e1;
            border-radius: 8px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            color: #fbc02d;
            font-size: 1.8rem;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 15px;
            font-size: 1rem;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #ffeb3b;
            outline: none;
        }

        .btn {
            background-color: #ffeb3b;
            color: #333;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: bold;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            text-align: center;
        }

        .btn:hover {
            background-color: #fbc02d;
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .header h1 {
                font-size: 2rem;
            }

            .btn {
                font-size: 1rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<%@include file="Header1.jsp"%>

<div class="header">
    <h1>Update Product Details</h1>
</div>

<div class="container">
    <%
        String p_id = request.getParameter("p_id");
        if (p_id != null && !p_id.isEmpty()) {
            Admin admin = new Admin(session);
            Dproduct product = admin.get_product_by_id(p_id); 
            

            if (product != null ) {
    %>
        <div class="form-container">
            <h2>Update Product Information</h2>
            <form action="SaveProductDetails" method="post">
            <label>Product Id</label>
                <input type="text" name="p_id" value="<%= product.getp_id() %>" />

                <label for="name">Product Name</label>
                <input type="text" name="p_name" id="name" value="<%= product.getp_name() %>" required>

                <label for="image">Main Image Filename</label>
                <input type="text" name="image" id="image" value="<%=product.getp_image() %>" required>

                 <label for="cost">Price</label>
                <input type="text" name="cost" id="cost" value="<%= product.getP_cost() %>" required>

                <label for="category">Category</label>
                <input type="text" name="category" id="category" value="<%= product.getP_category() %>" required>

                <label for="details">Product Details</label>
               <input type="text" name="details" value="<%=product.getp_details()%>">
               
               
               <label for="image1">Image 1 (URL or Filename)</label>
                <input type="text" name="image1" id="image1" required>

                <label for="image2">Image 2 (URL or Filename)</label>
                <input type="text" name="image2" id="image2"required>

                <label for="info">Product Information</label>
                <input type="text" name="info" id="info"> 

                <button type="submit" class="btn">Save Details</button>
            </form>
        </div>
    <%
            } else {
    %>
        <p>Product or Product Details not found.</p>
    <%
            }
        } else {
    %>
        <p>No Product ID provided.</p>
    <%
        }
    %>
</div>

</body>
</html>
