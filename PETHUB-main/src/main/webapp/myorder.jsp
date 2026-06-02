<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #eef2f3; 
            font-family: 'Roboto', sans-serif;
            color: #333;
        }
        .container-xl {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .table-title {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #007bff;
            font-weight: bold;
        }
        .table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        tr {
            transition: background-color 0.3s;
        }
        tr:hover {
            background-color: #e0f7fa; 
        }
        .product-image {
            width: 80px; 
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s;
        }
        .product-image:hover {
            transform: scale(1.1);
        }
        .btn-warning {
            background-color: #ff9800;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-warning:hover {
            background-color: #fb8c00;
            transform: scale(1.05);
        }
        @media (max-width: 768px) {
            .table-title {
                font-size: 1.5rem;
            }
            .product-image {
                width: 60px; 
            }
        }
    </style>
</head>
<body>
    <%@include file="Header1.jsp" %>
    <% if (session.getAttribute("uname") != null) {%>
    <div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <h2><b>My Orders</b></h2>
                </div>    
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Product Cost</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Registration s1 = new Registration(session);
                            ArrayList<Order> ar = s1.getorderinfo();
                            Iterator<Order> itr = ar.iterator();
                            while (itr.hasNext()) {
                                Order s = itr.next();%> 
                        <%
                                Registration s2 = new Registration(session);
                                ArrayList<Order> ar1 = s2.getorderinfocart(s.getoid());
                                Iterator<Order> itr1 = ar1.iterator();
                                while (itr1.hasNext()) {
                                    Order s3 = itr1.next();
                                    int tcost=(int)Math.round(Double.parseDouble(s3.getc_cost())*Integer.parseInt(s3.getQuantity()));
                        %> 
                        <tr> 
                            <td><img src="Images/<%=s3.getp_image()%>" class="product-image" alt="<%=s3.getc_name()%>"></td>
                            <td><%=s3.getc_name()%></td>
                            <td>&#8377 <%=tcost%></td>
                            <td><%=s.getstatus()%></td>
                            <td>
                                <%if (s.getstatus().equals("ordered")) {%>
                                <form action="order" method="post">
                                    <input type="hidden" name="orderid" value="<%=s.getoid()%>"/>
                                    <input type="submit" class="btn btn-warning" name="deleteorder" value="Cancel Order">
                                </form>
                                <%}%>
                            </td>
                        </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>        
    </div>
    <br><br><br>
    <%}%>
</body>
</html>
