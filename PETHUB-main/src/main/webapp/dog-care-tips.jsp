<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Dog Care Tips</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
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
            max-width: 200px;
            height: 150px;
            border-radius: 12px 0 0 12px;
            transition: transform 0.3s ease, filter 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .tip-card-img img:hover {
            transform: scale(1.1);
            filter: brightness(1.1);
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
    <h1>Dog Care Tips</h1>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://www.wagglespetresort.com/wp-content/uploads/2022/04/iStock-1252455620-Medium-1080x675.jpg" alt="Dog exercising">
        </div>
        <div class="tip-card-info">
            <h5>1. Regular Exercise</h5>
            <p>Ensure your dog gets daily exercise to keep them healthy and happy. Aim for at least 30 minutes of walking or playtime each day.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsKejI677t0rNqQPpzSE09wVLrls3Eo0Peng&s" alt="Dog food">
        </div>
        <div class="tip-card-info">
            <h5>2. Balanced Diet</h5>
            <p>Feed your dog a balanced diet with high-quality dog food. Consult your vet for specific dietary recommendations based on your dog's breed and age.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7klqF-oeD6FFkaov4lj0_n73BIFEs6yvlhQ&s" alt="Dog at the vet">
        </div>
        <div class="tip-card-info">
            <h5>3. Regular Vet Checkups</h5>
            <p>Take your dog for regular veterinary checkups to catch any health issues early. Vaccinations and parasite prevention are also crucial.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9q6ZoDkqg6qCMd0dJ8TFwCMbxW1ZCoHNqzg&s" alt="Dog grooming">
        </div>
        <div class="tip-card-info">
            <h5>4. Grooming</h5>
            <p>Regular grooming helps maintain your dog’s coat and skin health. Brush your dog regularly and schedule baths as needed.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_iaqIFePhGTfLbTDkyhCPfzRt6Bxlm67hQ&s" alt="Dog training">
        </div>
        <div class="tip-card-info">
            <h5>5. Training and Socialization</h5>
            <p>Train your dog to follow basic commands and socialize them with other dogs and people to develop good behavior and confidence.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_U0bPqOeBsnOWUDb-KdckuT0sikFV6KPprg&s" alt="Dog drinking water">
        </div>
        <div class="tip-card-info">
            <h5>6. Provide Fresh Water</h5>
            <p>Always provide your dog with fresh water. Keep their water bowl filled and change the water daily to keep them hydrated.</p>
        </div>
    </div>

    <div class="tip-card">
        <div class="tip-card-img">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0tc3fyyO1MdseQlE4NbfOF-UNoHn4Ve6DsqRvP7tW4mC4vmOApnSYMVa6_ZDFVp2XNkA&usqp=CAU" alt="Owner with dog">
        </div>
        <div class="tip-card-info">
            <h5>7. Love and Attention</h5>
            <p>Give your dog plenty of love and attention. Spend quality time together to strengthen your bond and make them feel secure.</p>
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
