<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Reviews"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Reviews</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            padding: 30px;
            color: black;
            font-size: 36px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);
        }

        .reviews-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .review-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
          
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            cursor: pointer;
        }

        .review-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }

        .review-username {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .review-rating {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .review-rating i {
            color: #f39c12;
            font-size: 18px;
            transition: transform 0.2s ease;
        }

        .review-rating i:hover {
            transform: scale(1.2);
        }

        .review-text {
            color: #555;
            font-size: 14px;
            line-height: 1.5;
            text-align: center;
        }

        /* Hover Effect for the Rating Stars */
        .review-rating i.far {
            color: #e1e1e1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 28px;
            }

            .reviews-container {
                padding: 20px;
            }

            .review-card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>

    <h1>User Reviews</h1>

    <div class="reviews-container">
        <% 
            Registration reg = new Registration(session);
            ArrayList<Reviews> al1 = reg.getreviewinfo();
            Iterator<Reviews> itr2 = al1.iterator();
            while(itr2.hasNext()) {
                Reviews rev = itr2.next();
        %>
            <div class="review-card">
                <div class="review-username"><%= rev.getUname() %></div>
                
                
                <div class="review-rating">
                    <% 
                        int rating = Integer.parseInt(rev.getRating());
                        for (int i = 1; i <= 5; i++) {
                            if (i <= rating) { 
                    %>
                        <i class="fas fa-star"></i>
                    <% 
                            } else { 
                    %>
                        <i class="far fa-star"></i>
                    <% 
                            }
                        }
                    %>
                </div>

                
                <div class="review-text">
                    <%= rev.getReview() %>
                </div>
            </div>
        <% 
            } 
        %>
    </div>

</body>
</html>
