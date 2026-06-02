<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Birds</title>
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
    left: -230px;
}

.cloud {
    position: absolute;
    width: 250px;
    height: 80px;
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
    width: 100%;
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
    background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQlK1vaiKPc1LrMGo1UR8d7dtUigD3jNcm2wgFRPkYdqmVQB4Wfkj6iVHC3y8kKKex_jg&usqp=CAU);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    font-size:x-large;
    color:rgb(6, 6, 6);
    font-weight: 700;
    cursor: pointer;
}
.birds{
    position: relative;
    left: 200px;
    top:-260px;
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
        <a href="BuyFishes.jsp"><img src="Images1/fishlogo.jpeg" alt="Fish Logo"></a>
    </div>
</div>
<div class="headerSpace"></div>
    <!-- <div class="heading">
        <img src="./Assets/wooden-sign-hanging-from-rope.png" alt="" width="700px" height="200px">
        <div>Buy Here</div>
        <img class="birds" src="./Assets/baby-zitting-cisticola-bird-waiting-food-from-its-mother-zitting-cisticola-bird-branch.png" alt="" height="190px" width="190px">
    </div> -->
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/Macaw.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Macaw</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>40-55yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;1,20,000</h6></div>
        </div>
        <section class="section1">
            <h3>Adult Size: 35 inches</h3>
            <h3>Weight: ranges from 900 grams to 1.5 kg</h3>
            <h3>Vocalization: Macaws are loud and can produce harsh squawks and screams, often communicating with their flock or human companions.</h3>
            <h3>Highly intelligent, Catalina macaws respond well to training and can be taught to perform several tricks and to talk.</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>


    <section class="main2">
        <div class="container">
        <section class="section2">
            <h3>Length: 11 inches</h3>
            <h3>Adult Size: 12 inches from beak to tail</h3>
            <h3>Weight:  Around 90 to 150 grams</h3>
            <h3>Physical Characteristics: Breeding for pale green, white, or blue, and yellow; orange beaks</h3>
            <h3>Nature:Cheerful,Intelligent,Playfull,Energetic Loyal,Sociable,Active</h3>
            <h3>These birds are delightfully entertaining; they're like little clowns and enjoy being the center of attention.</h3>
            <button>Buy Me</button>
        </section>
            <div class="main-image2">
                <img src="./Assets/MonkParakeet.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Monk Parakeet</h6></div>
            <div class="cloud cloud2"><h6>Female</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>20-30yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;35,000</h6></div>
        </div>
    </section>


    <div class="space"></div>
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="./Assets/redFactorCanary.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>RedFactor Canary</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:1yr</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>10-12yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;8000</h6></div>
        </div>
        <section class="section1">
            <h3>Adult Size: 4 to 8 inches</h3>
            <h3>Weight: Typically weighs around 15-20 grams </h3>
            <h3> Canaries are intelligent birds. Many owners can train their canary to sit on their hand, move to a perch, or direct the bird to fly around the room</h3>
            <h3>Inexpensive, good beginner bird,Melodious songster</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
            <section class="section2">
                <h3>Adult Size: 12 or 13 inches</h3>
                <h3>Weight: 80 to 120 grams </h3>
                <h3>Vocalization: capable of whistling, chirping, and mimicking sounds</h3>
                <h3>These little birds are gentle, affectionate, and often like to be held and petted</h3>
                <h3>Nature:Cheerful,Intelligent,Playfull,Energetic Loyal,Sociable,Active</h3>
                <h3>Smaller-sized parrot Quieter bird who can learn to talk Does not require a lot of outside-cage time</h3>
            <button>Buy Me</button>
        </section>
            <div class="main-image2">
                <img src="./Assets/cockatiel.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Cockatiel</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>6 months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>15-20yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;28,000</h6></div>
        </div>
    </section>

    <br><br><br>

   
</body>
</html>