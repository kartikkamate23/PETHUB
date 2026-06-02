<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nutrition Guidelines for Pets</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            margin: 0;
            padding: 20px;
            color: #333;
           
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .guideline {
            display: flex;
            align-items: center;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            line-height: 1.7;
        }
        .guideline img {
            max-width: 400px;
            height: auto;
            border-radius: 10px;
            margin-right: 20px; /* Space between image and text */
        }
        .content {
            flex: 1; /* Takes up remaining space */
        }
        h2 {
            color: #2980b9;
            font-size: 1.8em;
            border-bottom: 2px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        p {
            margin: 15px 0;
        }
       .btn {
    background-color: #2980b9;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    text-align: center;
    text-decoration: none;
}

.btn:hover {
    background-color: #3498db;
    transform: translateY(-2px);
}

.btn:active {
    transform: translateY(1px);
}
       
    </style>
</head>
<body>
 <%@include file="Header1.jsp" %>
    <h1>Nutrition Guidelines for Pets</h1>

    <div class="guideline">
        <img src="https://www.barclondon.com/cdn/shop/articles/dog-nutrition-chart.png?v=1656392758&width=2000" alt="Balanced Dog Food">
        <div class="content">
            <h2>1. Balanced Diet</h2>
            <p>A balanced diet is crucial for pets' overall health and wellbeing. Dogs require a mix of protein, carbohydrates, fats, vitamins, and minerals to support their energy needs and bodily functions. Cats, as obligate carnivores, need a diet rich in animal protein and specific nutrients, like taurine, to maintain optimal health. Choosing high-quality pet food that meets these nutritional requirements is essential for a long, healthy life.</p>
        </div>
    </div>

    <div class="guideline">
        <img src="https://storage.googleapis.com/petbacker/images/cms/articles/2020/food%20that%20puppies%20can%20eat.JPG" alt="Puppy Food">
        <div class="content">
            <h2>2. Age-Appropriate Food</h2>
            <p>Nutritional needs change as pets age. Puppies and kittens need food that supports their rapid growth, which is typically higher in calories and protein. Adult pets require a balanced diet for maintenance, while senior pets often need specialized diets that cater to health issues like arthritis or kidney disease. Consulting with a veterinarian can help you select the right food for your pet’s life stage.</p>
        </div>
    </div>

    <div class="guideline">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoNbldGiDJvcS_pZA-n5K1qM6X6Ek_oWNljw&s" alt="Fresh Water">
        <div class="content">
            <h2>3. Hydration</h2>
            <p>Hydration is vital for pets, as water plays a critical role in digestion, nutrient absorption, and temperature regulation. Always provide access to fresh, clean water, especially after exercise or during warm weather. Dehydration can lead to serious health problems, so encouraging your pet to drink regularly is important.</p>
        </div>
    </div>

    <div class="guideline">
        <img src="https://q9c5t3u9.rocketcdn.me/wp-content/uploads/2023/07/Food-toxic-for-dogs-cats-770x515-1.jpeg" alt="Toxic Foods">
        <div class="content">
            <h2>4. Avoid Toxic Foods</h2>
            <p>Many common foods can be harmful or even fatal to pets. Chocolate, grapes, raisins, onions, and garlic are among the most toxic foods for dogs and cats. Always be aware of what foods are safe and keep toxic items out of reach. If you suspect your pet has ingested something harmful, contact your veterinarian immediately.</p>
        </div>
    </div>

    <div class="guideline">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyIpmdX-VrrRv4x820F6rpF6IgyKQc5VbieQ&s" alt="Vet Check-up">
        <div class="content">
            <h2>5. Regular Vet Check-ups</h2>
            <p>Regular veterinary visits are crucial for monitoring your pet’s health and nutritional needs. Veterinarians can provide personalized dietary recommendations based on your pet's age, weight, and health status. These check-ups help catch potential health issues early and ensure your pet is getting the right nutrition to thrive.</p>
        </div>
    </div>
    <a href="dog.jsp?animal=dogfood"><button class="btn">Back</button></a>

    <%@include file="Footer.jsp" %>
</body>
</html>
