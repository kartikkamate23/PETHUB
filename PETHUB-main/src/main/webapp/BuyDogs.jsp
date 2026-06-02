<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.Animal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    left: -130px;
}

.cloud {
    position: absolute;
    width: 200px;
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
    top:-5px;
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
    background-image: url(./Assets/dog-chew-bones.png);
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    font-size: large;
    cursor: pointer;
}
</style>
<body>
<%@include file="Header1.jsp"%>
    <div class="headerSpace"></div>
        <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="https://t3.ftcdn.net/jpg/08/09/54/34/240_F_809543455_WSu2BDH7P678rNnGQYkIOzvBVq1k45yJ.jpg" alt="Main Image">
            </div>
            <%String animalname=request.getParameter("a_name");
            
            %>
         <div class="cloud cloud1"><h6>Golden Retriever</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>10-12yrs</h6></div>
            <div class="cloud cloud5">
                <h6>&#x20B9;20,000</h6>
            </div>
    
       
        <section class="section1">
            <h3>Height:58-61 cm (23-24 inches) tall at the shoulder.</h3>
            <h3>Wieght:29-34 kg</h3>
            <h3>Available:7dogs</h3>
            <h3>Nature:Intelligent,Kind,Friendly,Reliable,<br>TrustWorthy,Confident</h3>
            <h3>Habitat:Golden Retrievers adapt well to various living environments, from apartments to homes with large yards.</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
            <section class="section2">
                <h3>Height:46-53 cm (18-21 inches) tall.</h3>
                <h3>Weight:12-19 kg</h3>
                <h3>Available:7dogs</h3>
                <h3>Nature:Energetic,Loyal,Intelligent,Hard working,Resposive</h3>
                <h3>Habitat: Border Collies can adapt to living indoors, they are best suited to homes with large yards where they have space to run and explore.</h3>
                <button>Buy Me</button>
            </section>
            <div class="main-image2">
                <img src="https://t4.ftcdn.net/jpg/08/14/04/67/240_F_814046747_jsTsajGuY1a1yvM5nvbo2aKN7ShfFgfg.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Border Collie</h6></div>
            <div class="cloud cloud2"><h6>Female</h6></div>
            <div class="cloud cloud3"><h6>Age:2yrs</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan<br>12-15yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;2,20,000</h6></div>
        </div>
    </section>


    <div class="space"></div>
    <section class="main">
        <div class="container">
            <div class="main-image">
                <img src="https://t3.ftcdn.net/jpg/06/21/58/26/240_F_621582639_puymmSrQfwC6BbO7W5tXnPV0166IA8ZB.jpg" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Dachshund</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>Age:1yr</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>12-16yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;8000</h6></div>
        </div>
        <section class="section1">
            <h3>Height:20-23 cm (8-9 inches) tall at the shoulder</h3>
            <h3>Weight:7-15 kg</h3>
            <h3>Available:12dogs</h3>
            <h3>Nature:Clever,Playfull,Stubborn,Active<br>Independent,Courageous</h3>
            <h3>Habitat:Dachshunds adapt well to both apartment living and larger homes</h3>
            <button>Buy Me</button>
        </section>
    </section>

    <div class="space"></div>
    <section class="main2">
        <div class="container">
            <section class="section2">
                <h3>Height:18-30 cm (7-12 inches) tall at the shoulder</h3>
                <h3>Weight:1.9-3.5 kg </h3>
                <h3>Available: 11 dogs</h3>
                <h3>Nature:Cheerful,Intelligent,Playfull,Energetic Loyal,Sociable,Active</h3>
                <h3>Habitat:Pomeranians adapt well to apartment living, as they are small and don’t require a large space to be happy.</h3>
                <button>Buy Me</button>
            </section>
            <div class="main-image2">
                <img src="https://img.freepik.com/free-photo/cute-spitz-dog_144627-12267.jpg?uid=R160840186&ga=GA1.1.261853089.1725718949&semt=ais_hybrid" alt="Main Image">
            </div>
            <div class="cloud cloud1"><h6>Pomeranian</h6></div>
            <div class="cloud cloud2"><h6>male</h6></div>
            <div class="cloud cloud3"><h6>6 months</h6></div>
            <div class="cloud cloud4"><h6>LifeSpan:<br>12-16yrs</h6></div>
            <div class="cloud cloud5"><h6>&#x20B9;28,000</h6></div>
        </div>
    </section>
  

    <br><br><br>
</body>
</html>