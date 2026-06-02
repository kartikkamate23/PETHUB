<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cat Care Tips</title>
    <style>
       body {
    font-family: 'Arial', sans-serif;
    
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 1000px;
    margin: auto;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 40px;
    font-size: 2.5em;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.tip-card {
    background: #ffffff;
    border-radius: 15px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
    margin-bottom: 30px;
    display: flex;
    overflow: hidden;
    transform: translateX(-100%);
    opacity: 0;
    transition: transform 0.6s ease-in-out, opacity 0.6s ease-in-out;
}

.tip-card.visible {
    transform: translateX(0);
    opacity: 1;
}

.tip-card:hover {
    transform: scale(1.03);
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.25);
}

.tip-card-img {
    position: relative;
    overflow: hidden;
}

.tip-card-img img {
    max-width: 250px;
    height: 200px;
    border-radius: 15px 0 0 15px;
    transition: transform 0.3s ease, filter 0.3s ease;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.tip-card-img img:hover {
    transform: scale(1.1);
    filter: brightness(1.1);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.tip-card-info {
    padding: 20px;
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

h5 {
    color: #007bff;
    font-weight: bold;
    margin: 0 0 10px;
    font-size: 1.7em;
    transition: color 0.3s ease;
}

h5:hover {
    color: #0056b3;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

p {
    color: #555;
    line-height: 1.6;
    font-size: 1.1em;
    transition: color 0.3s ease;
}

p:hover {
    color: #333;
}

@media (max-width: 600px) {
    .tip-card {
        flex-direction: column;
    }

    .tip-card-img {
        text-align: center;
    }

    .tip-card-img img {
        max-width: 100%;
        border-radius: 15px;
    }
}

    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
<div class="container">
    <h1>Cat Care Tips</h1>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://www.riverwoodpetfood.com/media/fpbb1xdu/shutterstock_1160020948.jpg?width=651&height=434&mode=max" alt="Cat playing">
        </div>
        <div class="tip-card-info">
            <h5>1. Regular Playtime</h5>
            <p>Engage your cat in play for at least 20 minutes a day using toys that mimic prey, like feathers or laser pointers, to keep them active and mentally stimulated.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZQ_ld4Ma75e6nfMrDc5WnGpWf9wc7MqLpJw&s" alt="Cat food">
        </div>
        <div class="tip-card-info">
            <h5>2. Proper Nutrition</h5>
            <p>Choose a high-quality cat food that is appropriate for your cat's age, health, and lifestyle. Consult your veterinarian for specific dietary needs, including whether to feed dry, wet, or a combination of both.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://d2zp5xs5cp8zlg.cloudfront.net/image-48672-800.jpg" alt="Cat at the vet">
        </div>
        <div class="tip-card-info">
            <h5>3. Regular Vet Checkups</h5>
            <p>Schedule annual veterinary visits for routine checkups and vaccinations. Regular health checks help catch any issues early, ensuring your cat remains healthy.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://hops.com.my/wp-content/uploads/2022/01/cat-grooming-1.png" alt="Cat grooming">
        </div>
        <div class="tip-card-info">
            <h5>4. Grooming</h5>
            <p>Brush your cat regularly to minimize shedding and prevent hairballs, especially for long-haired breeds. Bathe your cat occasionally if they get into something dirty, but cats generally groom themselves well.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://www.alleycat.org/wp-content/uploads/2020/07/touch-barrier_copyright-02.jpg" alt="Cat training">
        </div>
        <div class="tip-card-info">
            <h5>5. Socialization</h5>
            <p>Socialize your cat by introducing them to various people and environments from a young age. This helps them develop confidence and reduces stress in new situations.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYDM8_Bu1khBIN6kJ4-N3c3GO3rXZfWQQS1A&s" alt="Cat drinking water">
        </div>
        <div class="tip-card-info">
            <h5>6. Fresh Water</h5>
            <p>Ensure your cat always has access to fresh water. Consider a pet water fountain to encourage drinking, as many cats prefer flowing water.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBtJO24iWY_U0KFszj4QxmDoripC4LjYr-zHFWVpXCtA8vPvARnX8O7qzbD5ACj1PBszE&usqp=CAU" alt="Owner with cat">
        </div>
        <div class="tip-card-info">
            <h5>7. Love and Attention</h5>
            <p>Spend quality time with your cat through cuddling, petting, and talking. Cats thrive on affection and attention from their owners, which helps foster a strong bond.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://static.wixstatic.com/media/c7f8a9_35c10ec6154947cf8256c9efae6124e9~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/c7f8a9_35c10ec6154947cf8256c9efae6124e9~mv2.jpg" alt="Safe Environment">
        </div>
        <div class="tip-card-info">
            <h5>8. Safe Environment</h5>
            <p>Ensure your home is cat-proofed by removing hazards such as toxic plants, chemicals, and small objects that could be swallowed. Provide safe spaces for your cat to explore.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://supertails.com/cdn/shop/articles/img-1682681581195.jpg?v=1726151197" alt="Cat litter box">
        </div>
        <div class="tip-card-info">
            <h5>9. Litter Box Maintenance</h5>
            <p>Keep your cat's litter box clean and odor-free. Scoop daily and change the litter regularly to prevent aversion to using the box.</p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const cards = document.querySelectorAll('.tip-card');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        });

        cards.forEach(card => {
            observer.observe(card);
        });
    });
</script>
<%@include file="Footer.jsp" %>
</body>
</html>
