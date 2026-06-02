<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="products" id="products">
    <div class="productchild">
        <h1>Lets Shop<br>by pet</h1>
    </div>
    <div class="productchild">
        <a class="dogmain" href="BuyDogs.jsp?a_id=1">
            <img src="Images/Dogmain.avif" height="200px" width="200px">
            <h2>Dogs</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Cat.jsp?animal=catfood">
            <img src="Images/cat2.webp" height="200px" width="200px">
            <h2>Cats</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Bird.jsp?animal=Birds">
            <img src="Images/Bird.webp" height="200px" width="200px">
            <h2>Birds</h2>
        </a>
    </div>
    <div class="productchild">
        <a href="Fish.jsp?animal=fish">
            <img src="Images/Fish.webp" height="200px" width="200px">
            <h2>Fish</h2>
        </a>
    </div>
</div>
</body>
</html>