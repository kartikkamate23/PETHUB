<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="index.css">
    <style>
    * {
    margin: 0;
    padding: 0;
}
.custom-navbar {
    background-color: #fff;
    padding: 0px;

}
.nav-item .nav-link {
    position: relative;
    padding-bottom: 2px;
    display: inline-block;
    text-transform: capitalize;
}
.nav-item .nav-link:hover {
    text-decoration: none;
}
.nav-item .nav-link:hover:after {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 2px;
    background-color: red;
    transform: translateY(4px);
}
.hover-content {
    position: absolute;
    left: 0;
    top: 100%;
    width: 100%;
    display: none;
    z-index: 1000;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
}
.nav-item:hover .hover-content {
    display: flex;
    justify-content: space-between;
    flex-wrap: nowrap;
    gap: 20px;
}
.product-section {
    display: flex;
    background-color:#fff;
    justify-content: space-between;
    width: 100%;
    gap: 30px;
    align-items: flex-start; 
}
.text-section {
    display: flex;
    justify-content: space-between;
    width: 80%;
 
    flex-wrap: nowrap;
}
.grooming-section {
    padding-top: 20px; 
    width: 100%; 
    display: flex;
    justify-content: flex-start;
}
.textalign {
    width: 22%; 
    margin-right: 20px;
}
.image-section {
    width: 20%;
    display: flex;
    justify-content: flex-end;
    margin-left: 20px;
}
.image-section img {
    height: 300px;
    width: 350px;
    object-fit: cover; 
}
.textalign a {
    text-decoration: none;
    font-size: 18px;
    color: black;
    
}
.textalign {
    text-align: center;
}
.textalign h3 {
    font-size: 24px; 
    font-weight: 600; 
    color: black; 
}
.nav-item p {
    text-transform: capitalize;
    margin: 5px 0;
    
}
.bird-section {
    display: flex;
    justify-content: center;
    width: 100%;
    gap: 60px;
    padding: 20px 0;
}
.image-container img {
    width: 300px;
    height: 250px;
    gap: 30px;
    object-fit: cover; 
    border-radius: 20px; 
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
}
.brand{
    margin-left: 250px;
}
.brand-section{
    display: flex;
    justify-content: center;
    width: 60%;
    gap: 60px;
    margin-left: 60px;
    padding: 20px 0;
}
.image1-container img {
    width: 180px;
    height: 120px;
    gap: 30px;
    object-fit: fill;
    border-radius: 10px; 
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
    padding: 20px;
}
.image-container p{
    font-size: 22px;
    font-weight: bold;
    padding-left: 10px;
}

.image1-container img:hover{
    scale: 1.1;
    box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.1);
}
.brand1-section{
    display: flex;
    justify-content: center;
    width: 45%;
    gap: 60px;
}
.image2-container img {
    width: 300px;
    height: 250px;
    gap: 30px;
    object-fit: fill;
    border-radius: 10px; 
    padding: 20px;
    border-radius:10%;
}
.image2-container p{
    font-size: 22px;
    padding-left: 20px;
    font-weight: bold;
}

.hover-content iframe {
    max-width: 100%;
}

@media (max-width: 991px) {
    .custom-navbar .container {
        width: 100%;
        max-width: 100%;
    }

    .navbar-nav {
        gap: 6px !important;
        font-size: 16px !important;
    }

    .hover-content {
        position: static;
        display: none;
        width: 100%;
        box-shadow: none;
        padding: 10px;
    }

    .nav-item:hover .hover-content {
        display: block;
    }

    .product-section,
    .text-section,
    .bird-section {
        display: grid;
        grid-template-columns: 1fr;
        width: 100%;
        gap: 12px;
    }

    .textalign,
    .image-section {
        width: 100%;
        margin: 0;
    }

    .image-section img,
    .image-container img {
        width: 100%;
        max-width: 320px;
        height: auto;
    }
}
    </style>
</head>
<body>
 <nav class="navbar navbar-expand-lg py-1 text-uppercase border-bottom border-light-subtle sticky-top custom-navbar">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav justify-content-start mb-1 mb-lg-0 gap-4 fs-5">
                   <!-- Dog Products -->
                   <li class="nav-item">
                    <a class="nav-link" id="dogsProduct" href="#">Dogs</a>
                    <div class="hover-content">
                        <section class="product-section">
                            <div class="text-section">
                                <div class="textalign">
                                    <h3><a href="dog.jsp?animal=dogfood">Dog Food</a></h3>
                                    <p>Wet Food</p>
                                    <p>Dry Food</p>
                                    <p>Puppy Food</p>
                                    <p>Weaning Food</p>
                                </div>
                                <div class="textalign">
                                    <h3><a href="dog.jsp?animal=dogtreats">Treats & Chews</a></h3>
                                    <p>Biscuits</p>
                                    <p>Bone & Chews</p>
                                    <p>Dental Treats</p>
                                    <p>Jerky & Training</p>
                                </div>
                                <div class="textalign">
                                    <h3><a href="dog.jsp?animal=dogaccessories">Toys & Accessories</a></h3>
                                    <p>Toys & Cage</p>
                                    <p>Travel Supplies</p>
                                    <p>Bowls & Comforts</p>
                                    <p>Beds & Comforts</p>
                                </div>
                                
                                <div class="textalign">
                                    <h3><a href="dog.jsp?animal=doggrooming">Grooming</a></h3>
                                    <p>Shampoo & Conditioners</p>
                                    <p>Brushes & Combs</p>
                                    <p>Towels & Wipes</p>
                                    <p>Deodorants & Perfumes</p>
                                    <p>Oral, Paw & Nail Care</p>
                                </div>
                            </div>

                            <div class="image-section">
                                <img src="assests/Dogs.avif" alt="Dog Products" height="300px" width="350px">
                            </div>
                        </section>
                    </div>
                </li>

                <!-- Cats Products -->
                <li class="nav-item">
                    <a class="nav-link" id="catProduct" href="#">Cats</a>
                    <div class="hover-content">
                        <section class="product-section">
                            <div class="text-section">
                                <div class="textalign">
                                    <h3><a href="Cat.jsp?animal=catfood">Cat Food</a></h3>
                                    <p>Dry Food</p>
                                    <p>Wet Food</p>
                                    <p>Kitten Food</p>
                                </div>

                                <div class="textalign">
                                    <h3><a href="Cat.jsp?animal=cattreats">Treats & Biscuits</a></h3>
                                    <p>Biscuits</p>      
                                    <p>Treats</p>
                                </div>

                                <div class="textalign">
                                    <h3><a href="Cat.jsp?animal=cataccessories">Litter & Litter Essential</a></h3>
                                    <p>Cat Litter</p>
                                    <p>Litter Boxes & Scoopers</p>
                                    <p>Wipes & Deodorizers</p>        
                                </div>

                                

                                <div class="textalign">
                                    <h3><a href="Cat.jsp?animal=catgrooming">Grooming</a></h3>
                                    <p>Shampoo & Conditioners</p>
                                    <p>Brushes & Combs</p>
                                    <p>Towels & Wipes</p>
                                    <p>Deodrants & Perfumes</p>
                                    <p>Oral, Paw & Nail Care</p>
                                </div>
                            </div>
                    
                            <div class="image-section">
                                <img src="assests/cat.avif" alt="Cats Products" height="300px" width="350px">
                            </div>
                        </section>
                    </div>
                </li>
                
                <!-- Small Pets -->
                <li class="nav-item">
                    <a class="nav-link" id="catProduct" href="#">Small Pets</a>
                    <div class="hover-content">
                        <section class="product-section">
                            <div class="text-section">
                                <div class="bird-section">
                                    <div class="image-container">
                                        <a href="Bird.jsp?animal=Birds"><img src="./assests/BirdsNav.jpg" alt="Bird Image 1" height="300px" width="350px"></a>
                                        <p>Birds</p>
                                    </div>
                                    <div class="image-container">
                                        <a href="Fish.jsp?animal=fish"><img src="./assests/FishNav.jpg" alt="Bird Image 1" height="300px" width="350px"></a>
                                        <p>Fish</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>                    
                </li>

                <!-- Shop by brands -->
             <!--     <li class="nav-item">
                    <a class="nav-link" href="#">Shop by Brands</a>
                    <div class="hover-content">
                        <section class="product-section">
                            <div class="text-section">
                                <div class="textalign">
                                    <h3><a href="dog.jsp?animal=dogfood">Dog Food</a></h3>
                                    <p>Acana</p>
                                    <p>Chappi</p>
                                    <p>Drools</p>
                                    <p>Farmina</p>
                                    <p>IAMS</p>
                                    <p>Pedigree</p>
                                    <p>Purepet</p>
                                    <p>Royal Canin</p>
                                    <p>SmartHeart</p>
                                </div>
                                
                                <div class="textalign" style="padding-left: 100px; width: 100%;">
                                    <h3><a href="Cat.jsp?animal=catfood">Cat Food </a></h3>
                                    <p>Applaws</p>
                                    <p>Arden  Grange</p>
                                    <p>Drools</p>
                                    <p>Bellotta</p>
                                    <p>IAMS</p>
                                    <p>Farmina</p>
                                    <p>Me-O</p>
                                    <p>Sheba</p>
                                </div>
                                
                        <div class="brand">
                                <h2 style="text-transform: capitalize;">Most Popular Brands</h2>
                            <div class="brand-section"> 
                                <div class="image1-container">
                                    <img src="assests/petproduct1.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct2.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct3.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct7.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                            </div>    

                            <div class="brand-section">     
                                <div class="image1-container">
                                    <img src="assests/petproduct4.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct5.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct6.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                                <div class="image1-container">
                                    <img src="assests/petproduct8.avif" alt="Bird Image 1" height="100px" width="100px">
                                </div>
                            </div>    
                        </div>    
                </li>-->

                <!-- Shop by Breeds -->
               <!--   <li class="nav-item">
                    <a class="nav-link" href="#">Shop by Animals</a>
                    <div class="hover-content">
                        <section class="product-section">
                            <div class="brand">
                            <div class="brand-section"> 
                                <div class="image2-container">
                                   <a href="BuyDogs.jsp"> <img src="assests/Dognav.jpeg" alt="Bird Image 1" height="100px" width="100px"></a>
                                    <p>Dogs</p>
                                </div>
                                <div class="image2-container">
                                   <a href="Buycats.jsp"> <img src="assests/Catnav.jpeg" alt="Bird Image 1" height="100px" width="100px"></a>
                                    <p>Cats</p>
                                </div>
                                <div class="image2-container">
                                   <a href="BuyBirds.jsp"> <img src="assests/BirdsNav.jpg" alt="Bird Image 1" height="100px" width="100px"></a>
                                    <p>Birds</p>
                                </div>
                                <div class="image2-container">
                                   <a href="BuyFishes.jsp"> <img src="assests/FishNav.jpg" alt="Bird Image 1" height="100px" width="100px"></a>
                                    <p>Fishes</p>
                                </div>
                              
                        </div>   
                        </section>
                    </div>          
                </li>-->

                <!-- Store Location -->
                <li class="nav-item">
                    <a class="nav-link" href="">Store Location</a>
                    <div class="hover-content">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31104.155133226614!2d77.51214284615104!3d12.970610890038193!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae3dd95efc3ae7%3A0xc90db791aedd9aad!2sVijayanagar%2C%20Bengaluru%2C%20Karnataka!5e0!3m2!1sen!2sin!4v1729096038706!5m2!1sen!2sin" width="2000" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                    
                </li>
                </ul>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
