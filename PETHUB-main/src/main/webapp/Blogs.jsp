<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Blogs - Pet Hub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="style.css"> <!-- Link to your main CSS file -->
    <style>
        /* Add any additional styles specific to the blog page here */
        .blog-section {
            padding: 40px 20px;
            background-color: #fff; /* White background for contrast */
            text-align: center;
        }

        .blog-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .blog-post {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin: 10px;
            padding: 15px;
            width: calc(24% - 20px); /* Adjust to fit 4 posts in a row */
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .blog-post img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }

        .blog-post h4 {
            margin: 10px 0;
            color: #333;
        }

        .blog-post p {
            color: #555;
        }

        .blog-post:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 768px) {
            .blog-post {
                width: calc(48% - 20px); /* Two posts per row on small screens */
            }
        }

        @media (max-width: 480px) {
            .blog-post {
                width: 100%; /* One post per row on extra small screens */
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
<nav><%@include file="NavBar.jsp"%></nav>

<section class="blog-section">
    <h2 class="heading">Latest <span>Articles</span></h2>
    <div class="blog-list">
        <div class="blog-post">
            <img src="Images/blog1.jpg" alt="Article Title 1">
            <h4><a href="blog1.html">5 Essential Tips for First-Time Dog Owners</a></h4>
            <p>Discover what you need to know before bringing home your new furry friend.</p>
        </div>
        <div class="blog-post">
            <img src="Images/blog2.jpg" alt="Article Title 2">
            <h4><a href="blog2.html">The Best Foods for Your Cat: A Comprehensive Guide</a></h4>
            <p>Learn about the top cat foods recommended by veterinarians.</p>
        </div>
        <div class="blog-post">
            <img src="Images/blog3.jpg" alt="Article Title 3">
            <h4><a href="blog3.html">How to Keep Your Pet Healthy and Happy</a></h4>
            <p>Simple tips to ensure your pet lives a long, happy life.</p>
        </div>
        <div class="blog-post">
            <img src="Images/blog4.jpg" alt="Article Title 4">
            <h4><a href="blog4.html">Understanding Your Bird's Behavior</a></h4>
            <p>Get to know your feathered friend better with these insights.</p>
        </div>
    </div>
</section>

<%@include file="Footer.jsp" %>

</body>
</html>
