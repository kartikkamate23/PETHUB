<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bird and Fish Care Tips</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
            font-size: 2.5em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .tip-card {
            background: white;
            border-radius: 12px;
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
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
        }

        .tip-card-img {
            position: relative;
            overflow: hidden;
        }

        .tip-card-img img {
            max-width: 300px;
            height: 280px;
            border-radius: 12px 0 0 12px;
            transition: transform 0.3s ease, filter 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
            font-size: 1.6em;
            transition: color 0.3s ease;
        }

        h5:hover {
            color: #0056b3;
        }

        p {
            color: #555;
            line-height: 1.6;
            font-size: 1.1em;
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
                border-radius: 12px;
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
<div class="container">
    <h1>Bird and Fish Care Tips</h1>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://i.cdn.newsbytesapp.com/images/l30920230726011659.jpeg" alt="Bird care">
        </div>
        <div class="tip-card-info">
            <h5>How to Take Care of Your Pet Bird</h5>
            <p>Researching the bird's needs is crucial. Provide a good space, ensure a healthy diet, maintain cleanliness, keep harmful products away, and stay in touch with a veterinarian.
            For those who choose to adopt a bird, a cage is likely to be on the top of your list. Your birdcage carries much importance in terms of humane and proper pet care, as it should be big enough for them to exercise, climb and play with their toys. Depending on the bird and how many you have, your cage may need to be bigger to be comfortable, 
            as your bird(s) will likely spend a significant amount of time in their cage throughout their lives.
            </p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://www.bigblogofgardening.com/wp-content/uploads/2022/05/fish-tank-1800x1200-1.jpg" alt="Fish care">
        </div>
        <div class="tip-card-info">
            <h5>Take Care of Fish</h5>
            <p>Fish need food, clean water, filtration, and heat. Choose an aquarium that's large enough for their growth and use a submersible heater for tropical fish. Consider commercial fish foods, preferably freeze-dried over live options.</p>
            <p>Fish have the same basic needs as other animals, including food, water and a proper habitat, but because fish live in completely different environments than humans and other mammals, they are dependent on us to provide everything they need to live happily.</p>
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
