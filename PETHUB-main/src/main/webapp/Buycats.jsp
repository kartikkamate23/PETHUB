<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
 .headerSpace{
    margin-top: 10px;
}
.heading{
    text-align: center;
}
.heading>div{
        font-size: 55px;
        position: relative;
        left: 0%;
        top:-70px;
        color: rgb(11, 134, 26);
    }
.main {
    margin-left: -200px;
    padding: 0;
    font-family: Arial, sans-serif;
    display:flex;
    justify-content: center;
    align-items: center;
}
.main2{
    margin-left: 600px;
    padding: 0;
    font-family: Arial, sans-serif;
    display:flex;
    justify-content: center;
    align-items: center;
}
.container {
    display:flex;
    justify-content: center;
    align-items: center;
    position: relative;
    text-align: center;
    width: 500px;
    height: 500px;
}

.main-image img{
    width: 300px;
    height: 400px;
    border-radius: 10px;
}
.main-image2 img {
    width: 300px;
    height: 300px;
    border-radius: 10px;
    position: relative;
    left: -180px;
}

.cloud {
    position: absolute;
    width: 200px;
    height: 70px;
    background-image: url('./Assets/thought-bubble-black-business-icon-clipart.png');
    background-size: cover;
    background-position: center;
    color: rgb(225, 105, 7);
}

.cloud1 {
    top: -40px;
    left: -110px;
    padding: 70px;
    transform: scaleX(-1)
}
.cloud1>h6{
    transform: scaleX(-1);
    font-size: large;
}
.cloud2 {
    top: -40px;
    right: -40px;
    padding: 70px;
}
h6{
    font-size: 20px;
    text-align: center;
    position: relative;
    top:-40px;

}
.cloud3 {
    bottom: -40px;
    left: -70px;
    padding: 70px;
    transform: scaleX(-1) scaleY(-1);
}
.cloud3>h6{
    transform: scaleX(-1) scaleY(-1);
}
.cloud4 {
    bottom: -40px;
    right: -90px;
    padding: 70px;
    transform: scaleY(-1);
    display: flex;
    justify-content: center;
    align-items: center;
}
.cloud4>h6{
    transform: scaleY(-1);
    position: relative;
    top:-12px;
}
.cloud5 {
    top: 140px;
    left: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 70px;
}

.cloud5 h6 {
    top:-10px;
    text-align: center;
}
.section1{
    position: relative;
    left: 300px; 
    width: 450px;
}
.section2{
    position: relative;
    right: 500px;
    text-align: start;
}
.space{
    margin-top: 200px;
}
button{
    height: 80px;
    width: 160px;
    border-radius: 50%;
    border: 2px solid rgb(232, 128, 42);
    background-image: url(./Assets/paws.jpg);
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    font-size:x-large;
    color:black;
    font-weight: 700;
    cursor: pointer;
}
.header {
            text-align: center;
            padding: 40px 0;
            background: linear-gradient(90deg, #f9e55e, #f9d04e);
            border-bottom: 2px solid #f9d04e;
        }

        .header h1 {
            margin-bottom: 20px;
            font-weight: 500;
            color: #333;
        }
 .logos {
    position: absolute;
    top: 180px; /* Adjust as needed for spacing */
    right: 20px; 
}

.logos img {
    width: 80px; 
    height: 90px;
    border-radius:50%;
    margin-left: 10px; 
}
</style>
<body>
<%@include file="Header1.jsp"%>
<div class="header">
    <h1>Welcome to Our Pet Shop!</h1>
    <div class="logos">
        <a href="BuyDogs.jsp"><img src="Images1/doglogo.avif" alt="Dog Logo"></a>
        <a href="BuyBirds.jsp"><img src="Images1/birdlogo.jpeg" alt="Bird Logo"></a>
        <a href="BuyFishes.jsp"><img src="Images1/fishlogo.jpeg" alt="Fish Logo"></a>
    </div>
</div>

    <div class="headerSpace"></div>
    
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/adorable-black-white-kitty-with-monochrome-wall-her.png" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Tuxedo</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>17-20yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;20,000</h6></div>
        </div>
        <section class="section1">
            <h3>Weight: Up to 18 pounds, depending on breed</h3>
            <h3>Length: Up to 36 inches, nose to tail, depending on breed</h3>
            <h3>Coat Length: Short hair, long hair, or curly</h3>
            <h3>Origin: Ancient Egypt</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
        <section class="section2">
            <h3>PERSONALITY: Affectionate, easy-going, and calm.</h3>
            <h3>WEIGHT: About 7 to 17 pounds, with males slightly larger.</h3>
            <h3>LENGTH: About 22 to 25 inches. </h3>
            <h3>COAT LENGTH: Short and very dense. Not double coated or woolly.</h3>
            <h3>Nature:Cheerful,Intelligent,Playfull,Energetic Loyal,Sociable,Active</h3>
            <h3>ORIGIN: United Kingdom.</h3>
            <button>Buy Me</button>
            </section>
            <div class="main-image2">
                <img src="./Assets/British.png" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>British Shorthair</h6></div>
            <div class="cloud cloud2"><h6>Female</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>12-20yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;20,000</h6></div>
        </div>
    </section>


    <div class="space"></div>
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/mainecoon.png" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Maine Coon</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:1yr</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>12-15yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;8000</h6></div>
        </div>
        <section class="section1">
            <h3>PERSONALITY: Amiable, gentle and dog-like</h3>
            <h3>WEIGHT: Average of 9 to 18 pounds; males can weigh 20 pounds or more</h3>
            <h3>LENGTH: About 19 to 30 inches</h3>
            <h3>COAT LENGTH: Heavy and shaggy; silky with coat falling smoothly</h3>
            <h3>ORIGIN: United States</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
        <section class="section2">
            <h3>PERSONALITY: Amiable, gentle and dog-like</h3>
            <h3>WEIGHT: About 6 to 14 pounds</h3>
            <h3>LENGTH: Up to 14 inches</h3>
            <h3>COAT LENGTH: Short, glossy, fine-textured and close-lying</h3>
            <h3>Nature:Cheerful,Intelligent,Playfull,Energetic Loyal,Sociable,Active</h3>
            <h3>ORIGIN: United States</h3>
            <button>Buy Me</button>
        </section>
            <div class="main-image2">
                <img src="./Assets/siamese.png" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Siamese</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>6 months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>8-12yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;28,000</h6></div>
        </div>
    </section>

    <br><br><br>
</body>
</html>