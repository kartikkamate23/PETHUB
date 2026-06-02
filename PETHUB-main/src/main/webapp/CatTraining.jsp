<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cat Training Videos</title>
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
    <h1>Cat Training Videos</h1>
    <div class="container">

        <div class="video-card">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/1TW8xYY7hT0?si=BfuNzzA0gIyYAvWu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            <h2>Basic Commands for Cats</h2>
            <p>Teach your cat essential commands like sit and high five.</p>
            <div class="details">
                <strong>Duration:</strong> 9 minutes<br>
                <strong>Skill Level:</strong> Beginner<br>
                This video introduces basic commands and reinforces positive reinforcement techniques.
            </div>
        </div>

        <div class="video-card">
           <iframe width="560" height="315" src="https://www.youtube.com/embed/EKe0otXH3Ck?si=Mugb_GHKh-yekFIN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            <h2>Litter Box Training</h2>
            <p>Learn how to effectively train your cat to use the litter box.</p>
            <div class="details">
                <strong>Duration:</strong> 7 minutes<br>
                <strong>Skill Level:</strong> All levels<br>
                This video covers tips and tricks to ensure your cat uses the litter box consistently.
            </div>
        </div>

        <div class="video-card">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/kZ2wyYjsw5w?si=CfS3tkuC9gyjFl4b" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            <h2>Socializing Your Cat</h2>
            <p>Tips for socializing your cat with other pets and people.</p>
            <div class="details">
                <strong>Duration:</strong> 11 minutes<br>
                <strong>Skill Level:</strong> Intermediate<br>
                This video helps you understand your cat's social behavior and how to improve interactions.
            </div>
        </div>

    </div>
<br><br><br>
    <%@include file="Footer.jsp" %>
</body>
</html>
