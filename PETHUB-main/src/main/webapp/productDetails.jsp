<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="com.MVC.Model.Reviews"%>
<%@page import="com.MVC.Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Product"%>
<%@page import="com.MVC.Model.Registration"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	color: #856404;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.product-card {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	transition: transform 0.3s;
}

.product-card:hover {
	transform: scale(1.03);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.product-image {
	max-width: 100%;
	border-radius: 10px;
}

.thumbnail {
	cursor: pointer;
	border-radius: 5px;
	transition: transform 0.3s;
}

.thumbnail:hover {
	transform: scale(1.1);
	border: 2px solid #ffc107;
}

.price {
	font-size: 1.6rem;
	color: #ffc107;
	font-weight: bold;
}

.add-to-cart, .wishlist {
	background-color: #ffc107;
	color: #212529;
	border: none;
	border-radius: 8px;
	padding: 15px 25px;
	font-size: 1.2rem;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 15px;
}

.add-to-cart:hover, .wishlist:hover {
	background-color: #e0a800;
}

.user-review {
	border-bottom: 1px solid #dee2e6;
	padding: 12px 0;
}

.rating {
	color: #ffc107;
}

@media ( max-width : 768px) {
	.product-card {
		flex-direction: column;
	}
}

h6 {
	color: #856404;
	margin-top: 20px;
	font-weight: bold;
}

.pet-care-tips, .breed-information, .nutrition-guidelines,
	.training-resources, .pet-health, .adoption-resources {
	background-color: #ffeeba;
	border-radius: 8px;
	padding: 20px;
	margin-top: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.pet-care-tips ul, .training-resources ul {
	list-style-type: none;
	padding: 0;
}

.pet-care-tips a, .training-resources a {
	color: #856404;
	text-decoration: underline;
}

.pet-care-tips a:hover, .training-resources a:hover {
	text-decoration: none;
}

.user-reviews-section {
	border-radius: 10px;
	padding: 20px;
	margin-top: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
}

.user-reviews-section h6 {
	color: #5d4b28;
	margin-bottom: 15px;
	font-weight: bold;
}

.review-form {
	display: flex;
	flex-direction: column;
}

.review-form textarea {
	height: 120px;
	border-radius: 8px;
	border: 1px solid #ccc;
	padding: 12px;
	font-size: 1rem;
	resize: none;
	margin-bottom: 12px;
	transition: border-color 0.3s;
}

.review-form textarea:focus {
	border-color: #ffca28;
	outline: none;
}

.btn-submit {
	background-color: #ffca28;
	color: #fff;
	border: none;
	border-radius: 8px;
	padding: 12px 20px;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-submit:hover {
	background-color: #fbc02d;
}

.emoji-rating {
	display: flex;
	cursor: pointer;
}

.emoji-rating input[type="radio"] {
	display: none; /* Hide the radio buttons */
}

.emoji-rating .emoji {
	font-size: 30px; /* Increase the size of the stars */
	transition: transform 0.2s; /* Add a hover effect */
}

.emoji-rating .emoji:hover {
	transform: scale(1.2); /* Slightly enlarge on hover */
}

.emoji-rating input[type="radio"]:checked+label {
	color: gold; /* Change color for the selected star */
}

.quantity-select {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 2px solid #f9d04e;
	border-radius: 5px;
	background-color: #fff;
	font-size: 1em;
	transition: border-color 0.3s;
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
}

.quantity-select:focus {
	border-color: #f9e55e;
	outline: none;
}

.quantity-select::after {
	content: '▼';
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none;
}

@media ( max-width : 768px) {
	.quantity-select {
		font-size: 0.9em;
	}
}

label {
	font-size: 1.2em;
	color: #333;
	margin-bottom: 5px;
	display: block;
}
</style>
</head>
<body>
	<%@ include file="Header1.jsp"%>
	<div class="container">
		<%
        String pid = request.getParameter("p_id");
        int productId = Integer.parseInt(pid);
        Registration r = new Registration(session);
        ArrayList<Product> al = r.getproductdetails(productId);
        Iterator<Product> it = al.iterator();
        while (it.hasNext()) {
            Product s = it.next();
    %>
		<div class="product-card p-4">
			<div class="row">
				<div class="col-md-6">
					<img id="mainProductImage" src="Images/<%= s.getP_image() %>"
						alt="<%= s.getP_name() %>" class="product-image">
					<div class="d-flex mt-2">
						<img class="thumbnail" src="Images/<%= s.getP_image1() %>"
							alt="Thumbnail 1"
							onclick="changeImage('Images/<%= s.getP_image1() %>')"
							style="width: 80px; margin-right: 5px;"> <img
							class="thumbnail" src="Images/<%= s.getP_image2() %>"
							alt="Thumbnail 2"
							onclick="changeImage('Images/<%= s.getP_image2() %>')"
							style="width: 80px; margin-right: 5px;"> <img
							class="thumbnail" src="Images/<%= s.getP_image() %>"
							alt="Thumbnail 3"
							onclick="changeImage('Images/<%= s.getP_image() %>')"
							style="width: 80px;">
					</div>
				</div>
				<div class="col-md-6 description">
					<h5><%= s.getP_name() %></h5>
					<p class="price">
						Rs.
						<%= s.getP_cost() %></p>


					<ul class="product-info-list mt-2">
						<li><strong>Details:</strong> <%= s.getP_details() %></li>
						<li><strong>Availability:</strong> In Stock</li>
						<li><strong>Estimated Delivery:</strong> 3-5 business days</li>
						<li><strong>Shipping:</strong> Free on orders over Rs. 1000</li>
					</ul>
					<form action="addtocart" method="post">
						<input type="hidden" name="p_id" value="<%= s.getP_id() %>" /> <label
							for="quantity-<%= s.getP_id() %>">Quantity:</label> <select
							name="quantity" id="quantity-<%= s.getP_id() %>"
							class="quantity-select">
							<% for (int i = 1; i <= 7; i++) { %>
							<option value="<%=i%>"><%=i%></option>
							<% } %>
						</select>

						<% if (session.getAttribute("uname") != null) { %>
						<button name="addtocart" class="add-to-cart">Add to Cart</button>
						<button type="button" class="wishlist" data-toggle="modal"
							data-target="#wishlistModal">Add to Wishlist</button>
						<% } else { %>
						<p>Please log in to add items to your cart.</p>
						<% } %>
					</form>
				</div>
			</div>
		</div>
		<div class="reviews mt-4">
			<h6>About this product:</h6>
			<p><%=s.getP_info() %></p>
		</div>
		<div class="pet-care-tips">
			<h6>Pet Care Tips:</h6>
			<ul>
				<li><a href="dog-care-tips.jsp">Top 10 Dog Care Tips</a></li>
				<li><a href="cat-care-tips.jsp">Essential Cat Care
						Guidelines</a></li>
				<li><a href="SmallPetCare.jsp">Care Tips for Small Pets</a></li>
			</ul>
		</div>



		<div class="nutrition-guidelines">
			<h6>Nutrition Guidelines:</h6>
			<p>
				Learn about proper nutrition for your pets. <a
					href="NutritionGuide.jsp">Read More</a>
			</p>
		</div>

		<div class="training-resources">
			<h6>Training Resources:</h6>
			<p>Check out our training guides and videos:</p>
			<ul>
				<li><a href="Training.jsp">Dog Training Basics</a></li>
				<li><a href="CatTraining.jsp">How to Train Your Cat</a></li>
			</ul>
		</div>

		<div class="pet-health">
			<h6>Health & Wellness:</h6>
			<p>Find information on common health issues and preventive care
				for pets.</p>
			<a href="HealthWellness.jsp">Learn More</a>
		</div>

		<div class="adoption-resources">
			<h6>Pet Adoption:</h6>
			<p>
				Looking to adopt a pet? <a
					href="https://amtmindia.org/?gad_source=1&gclid=Cj0KCQjwvpy5BhDTARIsAHSilyleQhxwGcfe_feiCX0g6WmCQLLvJG01k7AdfY8cDpeN31JxbRUpRwcaAnalEALw_wcB">Find
					local shelters and adoption events</a>.
			</p>
		</div>


		<div class="user-reviews-section">
			<h6>User Reviews:</h6>
			<div class="review-form mb-3">
				<form action="submitreview" method="post">
					<input type="hidden" name="p_id" value="<%= s.getP_id() %>" /> <input
						type="hidden" name="username"
						value="<%= session.getAttribute("uname") %>" />
					<div class="emoji-rating">
						<input type="radio" id="emoji5" name="rating" value="1" /> <label
							for="emoji5" class="emoji" onclick="setRating(1)">&#11088;</label>

						<input type="radio" id="emoji4" name="rating" value="2" /> <label
							for="emoji4" class="emoji" onclick="setRating(2)">&#11088;</label>

						<input type="radio" id="emoji3" name="rating" value="3" /> <label
							for="emoji3" class="emoji" onclick="setRating(3)">&#11088;</label>

						<input type="radio" id="emoji2" name="rating" value="4" /> <label
							for="emoji2" class="emoji" onclick="setRating(4)">&#11088;</label>

						<input type="radio" id="emoji1" name="rating" value="5" /> <label
							for="emoji1" class="emoji" onclick="setRating(5)">&#11088;</label>
					</div>

					<textarea name="review" placeholder="Write your review here..."
						required></textarea>
					<button type="submit" class="btn btn-submit" name="submit">Submit
						Review</button>
				</form>
			</div>
		</div>

		<% 
    Registration reg = new Registration(session);
    ArrayList<Reviews> al1 = reg.getreviewinfo();
    Iterator<Reviews> itr2 = al1.iterator();
    while(itr2.hasNext()) {
        Reviews rev = itr2.next();
%>
		<div class="user-review">
			<strong><%= rev.getUname() %></strong>

			<p class="rating">
				<% 
                int rating =(Integer.parseInt(rev.getRating()));
                for (int i = 1; i <= 5; i++) {
                    if (i <= rating) { %>
				<i class="fas fa-star"></i>
				<% } else { %>
				<i class="far fa-star"></i>
				<% }
                }
            %>
			</p>

			<p><%= rev.getReview() %></p>
		</div>
		<% 
    } 
%>


		<!-- Wishlist Modal -->
		<div class="modal fade" id="wishlistModal" tabindex="-1" role="dialog"
			aria-labelledby="wishlistModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="wishlistModalLabel">Add to
							Wishlist</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to add this product to your wishlist?</p>
						<form action="addtocart" method="post">
							<input type="hidden" name="p_id" value="<%= s.getP_id() %>" />
							<button type="submit" class="btn btn-success"
								name="addtowishlist">Yes, Add to Wishlist</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<% } %>
	</div>

	<script>
    function changeImage(imageSrc) {
        document.getElementById('mainProductImage').src = imageSrc;
    }
</script>
	<script>function setRating(rating) {
    const stars = document.querySelectorAll('.rating input');
    stars.forEach(star => {
        if (star.value <= rating) {
            star.checked = true;
        } else {
            star.checked = false;
        }
    });
}
</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
