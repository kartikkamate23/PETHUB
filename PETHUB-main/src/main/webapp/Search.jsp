<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Animal Search</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-image: url('https://png.pngtree.com/background/20210710/original/pngtree-pet-food-big-promotion-cartoon-yellow-background-picture-image_1045595.jpg'); /* Background image */
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh; /* Full viewport height */
        }

        .container {
            border-radius: 15px; /* Rounded corners */
            padding: 30px; /* Padding inside the container */
            width: 100%; /* Full width */
            max-width: 500px; /* Max width for larger screens */
            margin-left: 350px; /* Center the container */
            margin-right: auto; /* Center the container */
            
            text-align: center; /* Center text */
           
        }

        .form-group {
            margin-bottom: 20px; /* Space below form group */
        }

        .form-control {
            width: 100%; /* Full width */
            padding: 15px; /* Increased padding inside input */
            border-radius: 8px; /* Rounded corners */
            border: 2px solid #ddd; /* Light border */
            font-size: 16px; /* Increased font size */
            transition: border-color 0.3s; /* Smooth transition for border color */
        }

        .form-control:focus {
            border-color: #007BFF; /* Change border color on focus */
            outline: none; /* Remove outline */
        }

        .btn {
            background-color: black; /* Primary button color */
            color: white; /* Button text color */
            border: none; /* Remove border */
            padding: 15px 30px; /* Increased padding inside button */
            border-radius: 8px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor */
            font-size: 18px; /* Increased font size */
            transition: background-color 0.3s, transform 0.2s; /* Smooth transition */
        }

        

        label {
            font-weight: bold; /* Bold label text */
            margin-bottom: 10px; /* Space below label */
            font-size: 18px; /* Increased font size */
            display: block; /* Block display for labels */
        }
    </style>
</head>
<body>
    <%@include file="Header1.jsp"%>
    
   <div class="container">
    <form action="register" method="POST">
        <div class="form-group">
            <label>Search for animal:</label>
            <input type="text" name="animalname" class="form-control" required>
        </div>
        <button type="submit" class="btn" name="submit1">Search</button>
    </form>
</div>

</body>
</html>
