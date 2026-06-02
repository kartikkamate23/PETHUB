<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dog Training Videos</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;

        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-transform: uppercase;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .video-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            padding: 15px;
            transition: transform 0.2s, box-shadow 0.2s;
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        iframe {
            width: 100%;
            height: 200px;
            border-radius: 10px;
        }
        h2 {
            color: #2980b9;
            font-size: 1.6em;
            margin: 10px 0;
            font-weight: bold;
        }
        p {
            line-height: 1.6;
            color: #555;
            flex-grow: 1;
        }
        .details {
            margin-top: 10px;
            font-size: 0.9em;
            color: #777;
        }
       
    </style>
</head>
<body>
<%@include file="Header1.jsp" %>
    <h1>Dog Training Videos</h1>
    <div class="container">

        <div class="video-card">
            <iframe src="https://www.youtube.com/embed/eHbcb2EQC88?si=kQpOvXpUe4hjUn2B" allowfullscreen></iframe>
            <h2>Basic Commands Training</h2>
            <p>Teach your dog essential commands like sit, stay, and come for better obedience.</p>
            <div class="details">
                <strong>Duration:</strong> 6 minutes<br>
                <strong>Skill Level:</strong> Beginner<br>
                This video covers the foundation of dog training, essential for any new pet owner.
            </div>
        </div>

        <div class="video-card">
            <iframe src="https://www.youtube.com/embed/OwN0Ub3TWsk?si=zUOJkcIxJA6-do5M" allowfullscreen></iframe>
            <h2>Leash Training</h2>
            <p>Learn how to train your dog to walk politely on a leash without pulling.</p>
            <div class="details">
                <strong>Duration:</strong> 7 minutes<br>
                <strong>Skill Level:</strong> Intermediate<br>
                This video will guide you through techniques to ensure enjoyable walks with your dog.
            </div>
        </div>

        <div class="video-card">
            <iframe src="https://www.youtube.com/embed/1gyrHtiQoHg?si=Luc179ZotElOCfNh" allowfullscreen></iframe>
            <h2>Socialization Tips</h2>
            <p>Tips for socializing your dog with other animals and people to reduce anxiety.</p>
            <div class="details">
                <strong>Duration:</strong> 4 minutes<br>
                <strong>Skill Level:</strong> All levels<br>
                This video emphasizes the importance of socialization in a dog's development and offers practical advice.
            </div>
        </div>

    </div>
<br><br><br>
 <%@include file="Footer.jsp" %>
</body>
</html>
