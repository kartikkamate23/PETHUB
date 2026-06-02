<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pet Health & Wellness</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 40px;
            font-size: 2.5em;
            text-transform: uppercase;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
        }
        .article-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: calc(50% - 15px); /* Two cards in a row */
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        h2 {
            color: #2980b9;
            font-size: 1.6em;
            margin: 10px 0;
            text-align: center;
        }
        p {
            line-height: 1.5;
            color: #555;
            text-align: center;
            margin-bottom: 15px;
        }
        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <h1>Pet Health & Wellness</h1>
    <div class="container">

        <div class="article-card">
            <img src="https://www.cgshospital.com/images/blog/dog-and-cat-vaccinatinon.png" alt="Pet Vaccinations">
            <h2>The Importance of Vaccinations</h2>
            <p>Vaccinations protect your pets from serious diseases. Essential vaccines include rabies, distemper, and parvovirus for dogs, and feline leukemia and rabies for cats. A proper vaccination schedule is vital for maintaining health.</p>
        </div>

        <div class="article-card">
            <img src="https://i.ytimg.com/vi/-_n6icVZHLs/maxresdefault.jpg" alt="Pet Nutrition">
            <h2>Understanding Pet Nutrition</h2>
            <p>Proper nutrition is vital for your pet's overall health. Different pets require different diets. Dogs need a balance of proteins, carbs, and fats, while cats require high protein and specific nutrients. Always choose high-quality food that meets these needs.</p>
        </div>

        <div class="article-card">
            <img src="https://i.pinimg.com/originals/e9/bd/63/e9bd630077eddce12dd637cc2c51b52d.png" alt="Pet Exercise">
            <h2>Exercise: Keeping Your Pet Active</h2>
            <p>Regular exercise is essential for both physical and mental well-being. Dogs need daily walks, while indoor cats benefit from playtime with toys. Engaging activities like agility training can enhance fitness and strengthen your bond.</p>
        </div>

        <div class="article-card">
            <img src="https://i.pinimg.com/736x/b5/f5/12/b5f5129d385163010d16c79f75f565ca.jpg" alt="Pet Grooming">
            <h2>The Basics of Pet Grooming</h2>
            <p>Grooming is crucial for maintaining your pet's hygiene and comfort. Regular brushing helps prevent matting and reduces shedding. Different pets have varying grooming needs, from bathing to nail trimming, to keep them healthy and happy.</p>
        </div>

    </div>

    <%@include file="Footer.jsp" %>
</body>
</html>
