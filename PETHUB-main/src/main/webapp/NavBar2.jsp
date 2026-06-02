<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Pet Shop Navigation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
           
        }

        .sidenav {
            background: linear-gradient(135deg, #f7e441, #fcb045);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            height: 600px; /* Full height of the viewport */
            width: 200px; /* Fixed width for the sidebar */
            position: fixed; /* Fix to the left */
            margin-top:200px;
            left:0;
            overflow-y: auto; /* Scroll if content exceeds viewport height */
            padding: 20px; /* Add padding */
        }

        .head {
            font-size: x-large;
            font-weight: 600;
            margin-bottom: 10px; /* Space below the headings */
        }

        #sub {
            font-size: large;
            font-weight: 100;
            margin-top: 10px;
        }

        label {
            color: black;
            margin-left: 14px;
            font-size: 1.2rem;
            display: inline-block;
            cursor: pointer;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        label:hover {
            color: green;
            transform: scale(1.1);
        }

        ul {
            list-style-type: none;
        }

        nav ul li {
            margin-bottom: 1.5px;
        }
    </style>
</head>

<body>
    <header>
        <nav class="sidenav">
            <ul>
                <li class="head">DOGS
                    <ul id="sub">
                        <li><label for="dogfood">Dog Food</label></li>
                        <li><label for="treats">Treats & Chews</label></li>
                        <li><label for="toys">Toys & Accessories</label></li>
                        <li><label for="grooming">Grooming</label></li>
                    </ul>
                </li>
                <br>
                <li class="head">CATS
                    <ul id="sub">
                        <li><label for="catfood">Cat Food</label></li>
                        <li><label for="catbiscuits">Treats & Biscuits</label></li>
                        <li><label for="litter">Litter Essentials</label></li>
                        <li><label for="catgrooming">Grooming</label></li>
                    </ul>
                </li>
                <br>
                <li class="head">BIRDS
                    <ul id="sub">
                        <li><label for="birdfood">Bird Food</label></li>
                        <li><label for="birdtreats">Treats & Chews</label></li>
                        <li><label for="birdtoys">Toys & Accessories</label></li>
                        <li><label for="birdgrooming">Grooming</label></li>
                    </ul>
                </li>
                <br>
                <li class="head">FISHES
                    <ul id="sub">
                        <li><label for="fishfood">Fish Food</label></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
</body>
</html>
