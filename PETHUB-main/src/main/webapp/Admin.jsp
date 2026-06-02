<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Registration"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="pethub-responsive.css">

<style>

body{
    font-family: Arial, sans-serif;
    margin:0;
    padding:0;
    background:#fff8e1;
}

.header{
    background:#ffc107;
    color:white;
    text-align:center;
    padding:25px;
}

.container{
    width:90%;
    margin:auto;
    margin-top:30px;
}

.admin-actions {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 14px;
    margin: 22px 0;
}

.admin-action {
    display: block;
    background: #fff;
    border: 1px solid #ffe08a;
    border-radius: 8px;
    padding: 18px;
    color: #333;
    box-shadow: 0 8px 22px rgba(0,0,0,.08);
}

.admin-action strong {
    display: block;
    color: #f57c00;
    margin-bottom: 6px;
}

.add-products-button{
    background:#ff9800;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:5px;
    cursor:pointer;
    font-size:16px;
}

.add-products-button:hover{
    background:#f57c00;
}

.product-container{
    display:flex;
    flex-wrap:wrap;
    gap:20px;
    margin-top:30px;
}

.product-card{
    width:300px;
    background:white;
    border-radius:10px;
    padding:20px;
    box-shadow:0px 4px 10px rgba(0,0,0,0.1);
}

.product-card img{
    width:100%;
    height:250px;
    object-fit:cover;
    border-radius:10px;
}

.product-card h3{
    margin-top:10px;
    color:#333;
}

.product-card p{
    font-size:18px;
    font-weight:bold;
    color:#ff9800;
}

.button-container{
    margin-top:15px;
}

.button-container form{
    margin-top:10px;
}

.button-container input{
    width:90%;
    padding:10px;
}

.btn{
    width:100%;
    padding:10px;
    border:none;
    background:#ffc107;
    color:white;
    cursor:pointer;
    border-radius:5px;
    font-size:15px;
}

.btn:hover{
    background:#ff9800;
}

.no-products{
    font-size:20px;
    color:red;
}

a{
    text-decoration:none;
}

@media(max-width: 900px) {
    .admin-actions {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media(max-width: 620px) {
    .admin-actions {
        grid-template-columns: 1fr;
    }
}

</style>

</head>

<body>

<%@include file="Header1.jsp"%>

<div class="header">
    <h1>Admin Dashboard</h1>
</div>

<div class="container">

    <h2>Current Products</h2>

    <div class="admin-actions">
        <a class="admin-action" href="DoctorManagement.jsp">
            <strong>Doctor Management</strong>
            Add, approve, pause, and delete doctors.
        </a>
        <a class="admin-action" href="AppList.jsp">
            <strong>Appointments</strong>
            View bookings with doctor and time slots.
        </a>
        <a class="admin-action" href="BookedProducts.jsp">
            <strong>Orders</strong>
            Manage booked products.
        </a>
        <a class="admin-action" href="UserReviews.jsp">
            <strong>Reviews</strong>
            Monitor customer feedback.
        </a>
    </div>

    <a href="Addproducts.jsp">
        <button class="add-products-button">
            Add Products
        </button>
    </a>

    <div class="product-container">

<%

Registration r = new Registration(session);

ArrayList<Dproduct> al = r.get_all_productinfo();

if(al != null && !al.isEmpty()){

for(Dproduct s : al){

%>

        <div class="product-card">

            <h3><%= s.getp_name() %></h3>

            <img src="Images/<%= s.getp_image() %>">

            <p>₹ <%= s.getP_cost() %></p>

            <div class="button-container">

                <!-- UPDATE PRODUCT -->

                <form action="updateProduct" method="post">

                    <input type="hidden"
                    name="p_id"
                    value="<%= s.getp_id() %>">

                    <input type="number"
                    name="p_cost"
                    value="<%= s.getP_cost() %>"
                    required>

                    <button type="submit" class="btn">
                        Update Product
                    </button>

                </form>

                <!-- DELETE PRODUCT -->

                <form action="deleteProduct" method="post">

                    <input type="hidden"
                    name="p_id"
                    value="<%= s.getp_id() %>">

                    <button type="submit" class="btn">
                        Delete Product
                    </button>

                </form>

                <!-- ADD DETAILS -->

                <form action="SaveProductDetails" method="post">

                    <input type="hidden"
                    name="p_id"
                    value="<%= s.getp_id() %>">

                    <button type="submit" class="btn">
                        Add Details
                    </button>

                </form>

            </div>

        </div>

<%

}

}else{

%>

<p class="no-products">
No Products Found
</p>

<%

}

%>

    </div>

</div>

</body>
</html>
