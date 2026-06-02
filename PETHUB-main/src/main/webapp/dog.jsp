<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Registration"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #fdf6e3;
	color: #333;
	margin: 0;
	padding: 0;
}

.header {
	text-align: center;
	padding: 40px 0;
	background: linear-gradient(90deg, #f9e55e, #f9d04e);
	border-bottom: 2px solid #f9d04e;
}

.header h1 {
	margin-bottom: 20px;
	font-weight: 500;
	color: #333;
}

.container {
	padding: 20px;
	text-align: center;
}

.product-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.product-card {
	background-color: #ffffff;
	border: 2px solid #f9d04e;
	border-radius: 20px;
	margin: 20px;
	padding: 25px;
	width: 350px;
	transition: transform 0.3s, box-shadow 0.3s;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

.product-image img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 15px;
}

.product-title {
	text-align: center;
	margin: 15px 0;
	font-weight: 600;
	color: #444;
	font-size: 1.5em;
}

.price {
	color: #f9d04e;
	text-align: center;
	font-size: 1.5em;
	font-weight: 700;
	margin: 10px 0;
}

.product-description {
	font-size: 0.9em;
	color: #666;
	text-align: center;
	margin: 5px 0;
}

.rating {
	display: flex;
	align-items: center;
}

.average-rating {
	margin-right: 5px;
	font-weight: bold;
}

.star {
	color: #f9d04e;
	font-size: 1em;
}

.availability, .delivery-info, .return-policy {
	font-size: 0.9em;
	color: #666;
	margin: 5px 0;
}

.button-container {
	display: flex;
	justify-content: space-between;
	margin: 15px 0;
	width: 100%;
}

.add-to-cart {
	flex: 1;
	margin-right: 5px;
	background-color: #f9e55e;
	color: #333;
	border: none;
	border-radius: 25px;
	padding: 10px 15px;
	font-size: 1.2em;
	transition: background-color 0.3s, transform 0.3s;
}

.add-to-cart:hover {
	background-color: #f9d04e;
	transform: scale(1.05);
}

.quantity-select {
	margin-left: 5px;
	padding: 8px;
	border: 2px solid #f9d04e;
	border-radius: 5px;
	font-size: 1em;
	background-color: #fff;
}

.logos {
	position: absolute;
	top: 180px; /* Adjust as needed for spacing */
	right: 20px;
}

.logos img {
	width: 80px;
	height: 90px;
	border-radius: 50%;
	margin-left: 10px;
}

.nav-buttons .btn {
	margin: 0 10px;
	background-color: #f9e55e;
	color: #333;
	border-radius: 25px;
	padding: 10px 20px;
	text-decoration: none;
	transition: transform 0.3s, background-color 0.3s;
}

.nav-buttons .btn:hover {
	transform: scale(1.05);
	background-color: #f9d04e;
}
</style>
</head>
<body>
	<%@include file="Header1.jsp"%>
	<div class="header">
		<h1>Welcome to Our Pet Shop!</h1>
		<div class="nav-buttons">
			<a href="dog.jsp?animal=dogfood" class="btn">Food</a> <a
				href="dog.jsp?animal=dogaccessories" class="btn">Accessories</a> <a
				href="dog.jsp?animal=doggrooming" class="btn">Grooming</a> <a
				href="dog.jsp?animal=dogtreats" class="btn">Treats</a>
		</div>
		<div class="logos">
			<a href="Cat.jsp?animal=catfood"><img src="Images1/catlogo.png"
				alt="Dog Logo"></a> <a href="Bird.jsp?animal=Birds"><img
				src="Images1/birdlogo.jpeg" alt="Bird Logo"></a> <a
				href="Fish.jsp?animal=fish"><img src="Images1/fishlogo.jpeg"
				alt="Fish Logo"></a>
		</div>
	</div>

	<div class="container">

		<div class="product-container">

			<%
            Registration r = new Registration(session);
            ArrayList<Dproduct> al = r.get_productinfo(request.getParameter("animal"));
            if (al != null && !al.isEmpty()) {
                for (Dproduct s : al) {
        	%>
			<div class="product-card">
				<div class="product-image">
					<a href="productDetails.jsp?p_id=<%= s.getp_id() %>"> <img
						src="Images/<%= s.getp_image() %>" alt="<%= s.getp_name() %>">
					</a>
				</div>
				<h2 class="product-title"><%= s.getp_name() %></h2>
				<p class="price">
					&#8377;
					<%= s.getP_cost() %></p>

				<p class="availability">In Stock</p>
				<p class="delivery-info">Free shipping on orders over &#8377;
					1000!</p>
				<form action="addtocart" method="post" style="width: 100%;">
					<input type="hidden" name="p_id" value="<%= s.getp_id() %>" />

					<% if(session.getAttribute("uname") != null) { %>
					<div class="button-container">
						<button name="addtocart" class="add-to-cart">Add to Cart</button>
						<select name="quantity" id="quantity-<%= s.getp_id() %>"
							class="quantity-select">
							<% for (int i = 1; i <= 7; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<% } %>
						</select>
					</div>
					<% } else { %>
					<p style="text-align: center;">Please log in to add items to
						your cart.</p>
					<% } %>
				</form>

			</div>
			<%
                }
            } else {
        %>
			<p>Shop By categories</p>
			<%
            }
        %>
		</div>
	</div>
</body>
</html>
