<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    footer {
        background-color: black;
        color: white;
        padding: 55px 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .footer-column {
        flex: 1;
        margin: 20px;
        min-width: 200px;
    }

    .footer-column h3 {
        font-size: 18px;
        margin-bottom: 20px;
        color: #f4d03f;
        position: relative;
    }

    .footer-column h3::after {
        content: '';
        display: block;
        width: 50px;
        height: 3px;
        background-color: #f4d03f;
        margin-top: 5px;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-column ul li {
        margin-bottom: 10px;
    }

    .footer-column ul li a {
        color: white;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-column ul li a:hover {
        color: #f4d03f;
    }

    .footer-column p {
        font-size: 14px;
        line-height: 1.8;
    }

    .newsletter input[type="email"] {
        padding: 12px;
        border: none;
        border-radius: 4px;
        width: 75%;
        margin-right: 10px;
        font-size: 14px;
    }

    .newsletter button {
        padding: 12px 15px;
        background-color: #f4d03f;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .newsletter button:hover {
        background-color: #e2b20e;
    }

    .newsletter {
        margin-top: 30px;
    }

    .footer-bottom {
        background-color: #141414;
        padding: 20px;
        text-align: center;
        color: #aaa;
        font-size: 14px;
        border-top: 1px solid #444;
    }

    .footer-bottom a {
        color: #f4d03f;
        text-decoration: none;
    }

    .footer-bottom a:hover {
        text-decoration: underline;
    }

    .footer-column img {
        width: 150px;
        margin-top: 20px;
    }
    i{
        font-size: 20px;
        color: white;
    }
    .popular-searches a,a {
        color: #fff;
        text-decoration: none;
        font-size: 14px;
        /* padding: 1px; */
        transition: color 0.2s ease;
    }

    .popular-searches a:hover {
        color: #f1cb33;
        text-decoration: underline;
    }

    img:hover,i:hover{
        scale: 1.3;
        color: #f4d03f;
    }

    .popular-searches{
        margin-left: 60px;
        margin-right: 60px;
        font-size: 18px;
        font-weight: 500;
    }
    
</style>

<body>

    <footer>
        <div class="footer-column">
            <img src="./Images/Logo1.png" alt="Hub4Pets Logo">
            <p>Your one-stop destination for all pet supplies and care, because pets deserve the best!</p>
        </div>

        <div class="footer-column">
            <h3>Shop by Category</h3>
            <ul>
                <li><a href="dog.jsp?animal=dogfood">Dog Food</a></li>
                <li><a href="Cat.jsp?animal=catfood">Cat Food</a></li>
                <li><a href="Bird.jsp?animal=Birds">Birds & Fish Supplies</a></li>
                <li><a href="dog.jsp?animal=dogaccessories">Pet Toys</a></li>
                <li><a href="dog.jsp?animal=doggrooming">Pet Grooming</a></li>
                <li><a href="dog.jsp?animal=dogtreats">Pet Treats</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Customer Service</h3>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Shipping & Delivery</a></li>
                <li><a href="#">Returns</a></li>
                <li><a href="#">Track Your Order</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Get in Touch</h3>
            <p><i class="fa-solid fa-phone"></i> 080-45678765</p>
            <p><i class="fa-solid fa-envelope"></i> <a href="mailto:support@hub4pets.com">support@hub4pets.com</a></p>
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
            </div>
        </div>

        <div class="footer-column">
            <h3>Newsletter</h3>
            <p>Subscribe for pet care tips, special deals, and the latest news.</p>
            <div class="newsletter">
                <a href="Registration.jsp"><button type="submit">Signup</button></a>
            </div>
        </div>

        <section class="popular-searches">
            <h3>POPULAR SEARCHES</h3>
            <div>
                <p>Dog Food</a>
                <a href="#"> | Dog Collars Leashes Harnesses</a>
                <a href="#"> | Me-O</a>
                <a href="#"> | Cat Clothes</a>
                <a href="#"> | Cat Litter</a>
                <a href="#"> | Dog Raincoat</a>
                <a href="#"> | Dog Toys</a>
                <a href="#"> | Dog Beds</a>
                <a href="#"> | Veg Dog Food</a>
                <a href="#"> | Dog Biscuits Cookies</a>
                <a href="#"> | Cat Dry Food</a>
                <a href="#"> | Cat Food</a>
                <a href="#"> | Pet Pharmacy</a>
                <a href="#"> | Pedigree</a>
                <a href="#"> | Cat Toys</a>
                <a href="#"> | Drools</a>
                <a href="#"> | Dog Grooming</a>
                <a href="#"> | Dog Carrier</a>
                <a href="#"> | Dogs Bones Chews</a>
                <a href="#"> | Pedigree Pro</a>
                <a href="#"> | Whiskas</a>
                <a href="#"> | Cat Collars Leashes Harnesses</a>
                <a href="#"> | Cat Wet Food</a>
                <a href="#"> | Dog Shampoos & Conditioners</a>
                <a href="#"> | Cat Carriers Travel Supplies</a>
                <a href="#"> | Dog Accessories</a>
                <a href="#"> | Dog Bowls Feeders</a>
                <a href="#"> | Dog Clothes</a>
                <a href="#"> | Dog Treats</a>
                <a href="#"> | Cat Accessories</a>
                <a href="#"> | Cat Litter Boxes</a>
                <a href="#"> | Cat Treats</a>
                <a href="#"> | Farmina</a>
                <a href="#"> | Dog Leashes</a>
                <a href="#"> | Cat Kitten Food</a>
                <a href="#"> | Cat Beds Mats Tents</a>
                <a href="#"> | Deworming Tablets</a>
                <a href="#"> | Cat Shampoo & Conditioners</a>
                <a href="#"> | Dog Fleas & Ticks</a>
                <a href="#"> | Dog Boots</a>
                <a href="#"> | Orijen Dog Food</a>
                <a href="#"> | Acana Dog Food</a>
                <a href="#"> | Dog Training & Behaviour</a>
                <a href="#"> | Dog Food Supplements & Vitamins</a></div>
        </section>
    </footer>

    <section class="footer-bottom">
        <p>&copy; 2024 Hub4Pets Pvt Ltd. All rights reserved. | <a href="">Privacy Policy</a> | <a href="#">Terms &
            Conditions</a></p>
    </section>


</body>
</html>