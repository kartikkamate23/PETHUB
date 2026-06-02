<%@page import="com.MVC.Model.Product"%>
<%@page import="com.MVC.Model.Cart"%>
<%@page import="com.MVC.Model.Wishlist"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Wishlist</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #eef2f3; /* Light background for contrast */
            color: #333;
        }

        .container {
            width: 90%; /* Slightly wider for smaller screens */
            max-width: 1200px; /* Limit max width */
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px; /* Slightly rounded corners */
            border: 1px solid #ddd; /* Add border for definition */
        }

        h2 {
            text-align: center;
            color: #d9534f; /* Softer red for headers */
            margin-bottom: 20px;
            font-size: 2.5em; /* Larger heading */
            text-transform: uppercase; /* Uppercase for emphasis */
        }

        .wishlist-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px; /* Rounded corners for table */
            overflow: hidden; /* To apply border-radius */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Shadow for depth */
        }

        .wishlist-table th, .wishlist-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            vertical-align: middle; /* Center-align content vertically */
        }

        .wishlist-table th {
            background-color: #d9534f; /* Primary color for headers */
            color: #fff; /* White text for contrast */
            font-weight: bold;
        }

        .wishlist-table tr:nth-child(even) {
            background-color: #f9f9f9; /* Light grey for striped effect */
        }

        .wishlist-image {
            max-width: 100px; /* Limit the image width */
            height: auto;
            border-radius: 8px; /* More rounded corners for images */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for images */
        }

        .checkout-button {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            color: #fff;
            background-color: #5bc0de; /* Blue for action buttons */
            text-decoration: none;
            font-weight: bold; /* Bold text for buttons */
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s;
        }

        .btn-danger {
            background-color: #d9534f; /* Red for danger actions */
        }

        .btn:hover {
            background-color: #218838; /* Darker green on hover */
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
        }

        @media (max-width: 768px) {
            .wishlist-image {
                max-width: 80px; /* Smaller images on mobile */
            }

            .wishlist-table th, .wishlist-table td {
                padding: 10px; /* Less padding on smaller screens */
                font-size: 0.9em; /* Slightly smaller text */
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
<div class="container">
    <% if (session.getAttribute("uname") != null) { %>
        <h2>Wishlist</h2>
        <table class="wishlist-table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Item Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Registration s1 = new Registration(session);
                    ArrayList<Wishlist> ar = s1.getwishlistinfo();
                    Iterator<Wishlist> itr = ar.iterator();
                    while (itr.hasNext()) {
                        Wishlist s = itr.next();
                %>
                <tr>
                    <td><img src="Images/<%= s.getW_image() %>" alt="<%= s.getW_name() %>" class="wishlist-image"></td>
                    <td><%= s.getW_name() %></td>
                    <td>
                        <form action="addtocart" method="post" style="display:inline;">
                            <input type="hidden" name="w_id" value="<%= s.getW_id() %>"/>
                            <button type="submit" name="deletewishlist" class="btn btn-danger">Remove</button>
                        </form>
                       
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <h2>Please log in to view your wishlist.</h2>
    <% } %>
     
</div>
</body>
</html>
