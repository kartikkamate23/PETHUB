<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare Videos for Dogs and Cats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #ffcc00;
            font-size: 36px;
            padding: 20px;
            
            margin: 0;
            
        }

        .container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
        }

        .video-card {
            
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: 25%;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .video-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .video-card iframe {
            width: 100%;
            height: 200px;
            border-radius: 8px;
        }

        .video-card h2 {
            font-size: 24px;
            color: #ffcc00;
            margin-top: 15px;
        }

        .video-card p {
            color: #555;
            font-size: 16px;
            margin: 10px 0;
        }

        .video-card .details {
            text-align: left;
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }

        .video-card .details strong {
            color: #ffcc00;
        }

        @media (max-width: 768px) {
            .video-card {
                width: 45%;
            }
        }

        @media (max-width: 480px) {
            .video-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <h1>Healthcare Videos for Dogs and Cats</h1>
    <div class="container">
        <div class="video-card">
            <iframe  src="https://www.youtube.com/embed/HqqU25hDqis?si=XmQIrFavAaUjydt9"  allowfullscreen></iframe>
            <h2>Dog Healthcare Basics</h2>
            <p>Learn essential healthcare practices for keeping your dog healthy and happy.</p>
            <div class="details">
                <strong>Duration:</strong> 8 minutes<br>
                <strong>Skill Level:</strong> All levels<br>
                This video covers common health tips, including grooming and diet essentials.
            </div>
        </div>

        <div class="video-card">
            <iframe  src="https://www.youtube.com/embed/aDHh1meTv6M?si=FVLf2RUIyoD2xn4O"  allowfullscreen></iframe>
            <h2>Cat Healthcare Basics</h2>
            <p>Get essential healthcare tips for your cat, including grooming and diet management.</p>
            <div class="details">
                <strong>Duration:</strong> 10 minutes<br>
                <strong>Skill Level:</strong> All levels<br>
                This video provides a basic guide to caring for your cat’s health and well-being.
            </div>
        </div>

        <div class="video-card">
            <iframe  src="https://www.youtube.com/embed/w9OsRynxajY?si=03EBOXNg32fPPb8-"  allowfullscreen></iframe>
            <h2>Recognizing Pet Illness Symptoms</h2>
            <p>Identify early signs of illness in dogs and cats to keep them safe and healthy.</p>
            <div class="details">
                <strong>Duration:</strong> 6 minutes<br>
                <strong>Skill Level:</strong> Beginner<br>
                This video helps you recognize common symptoms that may require a vet’s attention.
            </div>
        </div>
    </div>
    <%@include file="Footer.jsp" %>
</body>
</html>
