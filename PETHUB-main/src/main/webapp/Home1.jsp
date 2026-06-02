<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Dproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Hub Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="pethub-responsive.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap');

       
        .banner {
            width: 100%;
            height: 75vh;
            background-image: url('Images1/banner.webp');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }
        .banner .banner_text {
            width: 33%;
            height: 30%;
            position: absolute;
            top: 0;
            left: 3%;
            bottom: -15px;
            margin: auto;
        }
        .banner .banner_text p {
            font-size: 15px;
            font-weight: 600;
            padding-bottom: 25px;
            letter-spacing: 2px;
            color: #272727;
        }
        .banner .banner_text h1 {
            font-size: 58px;
            line-height: 1.1;
            color: #272727;
        }

        .productchild img {
            border: 1px solid white;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 50%;
            margin-top: 60px;
        }
        .productchild h1 {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-top: 100px;
            margin-left: 0;
        }
        .productchild h2 {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-left: 0;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 18px;
            padding: 24px 18px;
            overflow: hidden;
        }

        .productchild {
            flex: 0 1 220px;
            text-align: center;
        }

        .productchild:first-child {
            flex-basis: 260px;
        }

        .slick-list,
        .testimonial-section {
            overflow: hidden;
        }
        nav {
            margin-top: -30px;
        }
        .product-content {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .productchild h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .parent1 {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .child {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 15px;
            text-align: center;
            width: calc(25% - 20px); /* Adjust width for responsive design */
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .child img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }

        h4 {
            margin: 10px 0;
            color: #555;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .featured-products {
            padding: 40px 20px;
            background-color: #fff; /* White background for contrast */
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .product-list .child {
            width: calc(24% - 20px); /* Adjust to fit 4 products in a row */
            margin-bottom: 20px;
            text-align: center;
        }

        .blog-section {
            padding: 30px;
            background-color: #fff8e1; /* Light yellow background */
            border-radius: 12px;
            margin: 20px auto;
            max-width: 800px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .about {
            background-color: #fff9c4;
            padding: 60px 20px;
            text-align: center;
        }

        .heading {
            font-size: 2.8em;
            color: #ffb300;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .heading span {
            color: #ffca28;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin-top: 40px;
        }

        .image {
            flex: 1;
            max-width: 400px;
            margin: 0 20px;
        }

        .image img {
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .content {
            flex: 2;
            max-width: 600px;
            margin: 0 20px;
            text-align: left;
        }

        .content h3 {
            font-size: 2em;
            color: #f57f17;
            margin-bottom: 15px;
        }

        .content p {
            line-height: 1.8;
            color: #333;
            margin-bottom: 15px;
        }

        .content p:last-child {
            margin-bottom: 0;
        }

        @media (max-width: 768px) {
            nav {
                margin-top: 0;
            }

            .banner {
                height: 58vh;
                background-position: center;
            }

            .banner .banner_text {
                width: 88%;
                height: auto;
                top: auto;
                bottom: 34px;
                left: 6%;
            }

            .banner .banner_text h1 {
                font-size: clamp(34px, 11vw, 48px);
            }

            .products {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 18px;
                padding: 24px 16px;
                align-items: start;
            }

            .productchild:first-child {
                grid-column: 1 / -1;
                text-align: center;
            }

            .productchild h1,
            .productchild h2 {
                margin: 8px 0;
                text-align: center;
            }

            .productchild img {
                display: block;
                width: min(150px, 80%);
                height: auto;
                margin: 0 auto;
            }

            .row {
                flex-direction: column;
                align-items: center;
            }

            .image, .content {
                max-width: 100%;
                margin: 10px 0;
            }
        }

        @media (max-width: 480px) {
            .products {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
<nav>    <%@include file="NavBar.jsp"%></nav>
<div class="banner">
    <div class="banner_text">
        <p>Bio-organic 30% OFF</p>
        <h1>We care About Your Pet!</h1>
    </div>
</div>

<div class="products" id="products">
    <div class="productchild">
        <h1>Lets Shop<br>by pet</h1>
    </div>
    <div class="productchild">
        <a class="dogmain" href="dog.jsp?animal=dogfood">
            <img src="Images/Dogmain.avif" height="200px" width="200px">
            <h2>Dogs</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Cat.jsp?animal=catfood">
            <img src="Images/cat2.webp" height="200px" width="200px">
            <h2>Cats</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Bird.jsp?animal=Birds">
            <img src="Images/Bird.webp" height="200px" width="200px">
            <h2>Birds</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Fish.jsp?animal=fish">
            <img src="Images/Fish.webp" height="200px" width="200px">
            <h2>Fish</h2>
        </a>
    </div>
</div>



<%@include file="testimonial.html" %>
<%@include file="catvideo.html" %>


<section class="about" id="about">
    <h1 class="heading">about <span>us</span></h1>
    <div class="row">
        <div class="image">
            <img src="img/Aboutus.jpeg" alt="About Us">
        </div>
        <div class="content">
            <h3>Welcome To Hub4Pets: A Pet grooming and supplies</h3>
            <p>Our extensive range of products includes everything from high-quality pet food and delicious treats to interactive toys and stylish accessories. Whether you have a loyal canine companion or a playful feline friend, we have you covered.</p>
            <p>When you shop with us, you can expect unparalleled convenience as you order from your home or office, saving valuable time and avoiding trips to physical stores. Our online pet shop boasts a wide array of pet products, including specialized options like online dog food and cat food, all tailored to your pet's dietary needs. We take pride in being one of India's most affordable pet shops, ensuring you get exceptional value without compromising quality. Our user-friendly website streamlines your shopping experience, making it effortless to find the perfect products.</p>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/5hb8ay9h1F71z5YsHDa9yQch/a6K/2GgL5Spt5" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@include file="Footer.jsp" %>

</body>
</html>
