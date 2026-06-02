<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.headerSpace{
    margin-top: 20px;
}
.heading{
    text-align: center;
}
.heading>div{
        font-size: 55px;
        position: relative;
        left: 0%;
        top:-90px;
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
    width: 400px;
    height: 400px;
    border-radius: 10px;
}
.main-image2 img {
    width: 400px;
    height: 300px;
    border-radius: 10px;
    position: relative;
    left: -180px;
}

.cloud {
    position: absolute;
    width: 250px;
    height: 60px;
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
    background-image: url(https://img.freepik.com/free-photo/portrait-scuba-diver-sea-water-with-marine-life_23-2151456169.jpg?uid=R160840186&ga=GA1.1.261853089.1725718949&semt=ais_hybrid);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    font-size: large;
    color: white;
    font-size: 25px;
    font-weight: 900;
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
</head>
<body>
<%@include file="Header1.jsp"%>
<div class="header">
    <h1>Welcome to Our Pet Shop!</h1>
    <div class="logos">
        <a href="BuyDogs.jsp"><img src="Images1/doglogo.avif" alt="Dog Logo"></a>
        <a href="BuyCats.jsp"><img src="Images1/catlogo.png" alt="Bird Logo"></a>
        <a href="BuyBirds.jsp"><img src="Images1/birdlogo.jpeg" alt="Fish Logo"></a>
    </div>
</div>
    <div class="headerSpace"></div>
    <br><br><br>
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/halfmoon-betta-fish.png" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Betta</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:<br>2months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>3-5yrs</h6></div>
            <div class="cloud cloud5">
                <h6>&#x20B9;40</h6>
            </div>
        </div>
        <section class="section1">
            <h3>Adult Size: 3 inches (7 cm)</h3>
            <h3>Family:Belontiidae</h3>
            <h3>Minimum Tank Size:2 gallons</h3>
            <h3>Breeding:Egglayer</h3>
            <h3>With their jewel-toned coloring and flowing fins, betta fish are a great addition to any fish lover's home</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
            <section class="section2">
                <h3>Adult Size: 2 to 3 inches</h3>
                <h3>Family:Cichlidae</h3>
                <h3>Minimum Tank Size:20 gallons</h3>
                <h3>Breeding:Egg layer</h3>
                <h3>Nature:Energetic,Peaceful,Intelligent</h3>
                <button>Buy Me</button>
            </section>
            <div class="main-image2">
                <img src="./Assets/GermanBlueRam.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>German Blue Ram</h6></div>
            <div class="cloud cloud2"><h6>Female</h6></div>
            <div class="cloud cloud3"><h6>Age:<br>2months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>2-3yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;250</h6></div>
        </div>
    </section>


    <div class="space"></div>
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/GlowingLightTetra.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Glowinglight tetra</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:<br>2months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>3-5yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;120</h6></div>
        </div>
        <section class="section1">
            <h3>Adult Size: 1.5 inches (4 cm)</h3>
            <h3>Social:Peaceful, schooling</h3>
            <h3>Minimum Tank Size:10 gallons</h3>
            <h3>Nature: it is easygoing and peaceful and can survive in a fairly wide range of aquarium environments</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
            <section class="section2">
                <h3>Adult Size: 3 inches</h3>
                <h3>Social:Active schooling fish, nips fins </h3>
                <h3>Minimum Tank Size:20 gallon</h3>
                <h3>Breeding	Egglayer</h3>
                <h3>Nature:Cheerful,Intelligent,Playfull</h3>
                <button>Buy Me</button>
            </section>
            <div class="main-image2">
                <img src="./Assets/TigerBarb.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Tiger Barb</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>6 months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>5-6yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;70</h6></div>
        </div>
    </section>

    <br><br><br>
</body>
</html>