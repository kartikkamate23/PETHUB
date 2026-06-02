<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Pet's Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff4500;
            font-weight: bold;
        }

        .total-cost {
            font-size: 26px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
            border-top: 2px solid #ff4500;
            padding-top: 10px;
        }

        .checkout-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <div class="container">
        <% if (session.getAttribute("uname") != null) { %>
            <h2>Your Pet's Shopping Cart</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Cost (&#8377;)</th>
                        <th>Quantity</th>
                        <th>Total (&#8377;)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        int tcost = 0;
                        Registration s1 = new Registration(session);
                        ArrayList<Cart> ar = s1.getcartinfo();
                        Iterator<Cart> itr = ar.iterator();
                        while (itr.hasNext()) {
                            Cart s = itr.next();
                            int itemTotalCost = (int)Math.round(Double.parseDouble(s.getc_cost()) * Integer.parseInt(s.getQuantity()));
                            tcost += itemTotalCost;  
                    %>
                    <tr>
                        <td><img src="Images/<%=s.getc_image()%>" alt="<%=s.getc_name()%>" style="height: 80px; width: auto; border-radius: 10px;"></td>
                        <td><%=s.getc_name()%></td>
                        <td>&#8377;<%=s.getc_cost()%></td>
                        <td><%=s.getQuantity() %></td>
                        <td>&#8377;<%=itemTotalCost%></td>
                        <td>
                            <form action="addtocart" method="post" style="display:inline;">
                                <input type="hidden" name="cid" value="<%=s.getc_id()%>"/>
                                <button type="submit" name="delete" class="btn btn-danger"><i class="fas fa-trash"></i> Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="total-cost">Total: &#8377;<%=tcost%></div>
            <div class="checkout-button">
                <a href="booking.jsp" class="btn btn-primary">Proceed to Checkout</a>
                <a href="dog.jsp?animal=dogfood" class="btn btn-primary">Back</a>
            </div>
        <% } else { %>
            <h2>Please log in to view your cart.</h2>
        <% } %>
    </div>
</body>
</html>
