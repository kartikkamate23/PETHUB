<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="stylesheet" href="pethub-responsive.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
   
}

a {
    text-decoration: none;
    color: inherit;
}

header {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 28px;
    gap: 18px;
    position: relative;
    z-index: 20;
}

header .logo img {
    height: 82px;
    width: auto;
}

header .menu {
    display: flex;
    align-items: center;
}

header .menu ul {
    display: flex;
    list-style-type: none;
    align-items: center;
    gap: 2px;
   
}

header .menu ul li a {
    display: block;
    padding: 10px 12px;
    font-size:15px;
    font-weight: 600;
    
    color: #333;
    border-bottom: 2px solid transparent;
    transition: color 0.3s, border-color 0.3s, transform 0.3s;
}

header .menu ul li a:hover {
    color: #007bff;
    border-color: #007bff;
    transform: translateY(-2px);
}

header .header_right {
    display: flex;
    align-items: center;
    gap: 14px;
    flex-shrink: 0;
}

header .header_right i {
    font-size: 26px;
    color: #333;
}

header .header_right .rel {
    position: relative;
}

header .header_right .rel .num {
    position: absolute;
    top: 0;
    right: -10px;
    background-color: red;
    color: white;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
}

.uname {
    display: flex;
    align-items: center;
    font-size: 16px;
    color: #333;
    padding: 10px;
   
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.nav-toggle {
    display: none;
    border: 0;
    background: #17202a;
    color: #fff;
    padding: 10px 12px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 700;
}



button.btn {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

button.btn:hover {
    background-color: #0056b3;
}

@media (max-width: 980px) {
    header {
        flex-wrap: wrap;
        padding: 12px 16px;
        background: rgba(255,255,255,.96);
        box-shadow: 0 6px 20px rgba(15,23,42,.08);
    }

    header .logo img {
        height: 64px;
    }

    .nav-toggle {
        display: inline-flex;
        margin-left: auto;
    }

    header .menu {
        order: 3;
        width: 100%;
        display: none;
    }

    header .menu.open {
        display: block;
    }

    header .menu ul {
        flex-direction: column;
        align-items: stretch;
        gap: 4px;
        padding: 10px 0;
    }

    header .menu ul li a {
        padding: 12px 10px;
        border-radius: 8px;
        background: #f8fafc;
    }

    header .header_right {
        order: 2;
        margin-left: auto;
        gap: 10px;
    }

    .uname {
        max-width: 110px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        padding: 6px;
    }
}

@media (max-width: 560px) {
    header .header_right {
        width: 100%;
        justify-content: space-between;
        order: 4;
    }

    .nav-toggle {
        font-size: 14px;
    }
}
</style>
</head>
<body>

<header>
    <div class="logo">
        <a href="Home1.jsp">
            <img src="Images/Logo.png" alt="Logo">
        </a>
    </div>
    <button class="nav-toggle" type="button" onclick="document.querySelector('header .menu').classList.toggle('open')">
        Menu
    </button>
    
    <div class="menu">
        <ul>
            <% if (session.getAttribute("uname") != null) { %>
                
                <li><a href="Home1.jsp">Home</a></li>
                
                <li><a href="Contact.jsp">Contact</a></li>

                <% if ("admin".equals(session.getAttribute("role"))) { %>
                    <li><a href="Admin.jsp">Dashboard</a></li>
                    <li><a href="BookedProducts.jsp">Booked Products</a></li>
                    <li><a href="UserReviews.jsp">User Reviews</a></li>
                    <li><a href="AppList.jsp">Appointment List</a></li>
                    <li><a href="DoctorManagement.jsp">Doctors</a></li>
                <% } else { %>
                    <li><a href="myorder.jsp">My Orders</a></li>
                    <li><a href="PetAssistant.jsp">AI Assistant</a></li>
                    <li><a href="AIFeatures.jsp">Smart AI Tools</a></li>
                    <li><a href="HealthAssist.jsp">Health Assistance</a></li>
                    <li><a href="DoctorRegistration.jsp">Doctor Signup</a></li>
                <% } %>

                <li><a href="register?logout=yes">Logout</a></li>
            <% } else { %>
                
                <li><a href="Home1.jsp">Home</a></li>
                
                <li><a href="Login.jsp">Login</a></li>
                <li><a href="Registration.jsp">Register</a></li>
                <li><a href="DoctorRegistration.jsp">Doctor Signup</a></li>
            <% } %>
        </ul>
    </div>
       <% if (session.getAttribute("uname") != null) { %>
    <div class="header_right">
        <a href="Wishlist.jsp"><i class="fa fa-heart"></i></a>
        <a href="Search.jsp"><i class="fa-solid fa-magnifying-glass"></i></a>
        <div class="rel">
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>

     
            <div class="uname">
                <i class="fa fa-user-circle" style="margin-right: 5px;"></i>
                <%= session.getAttribute("uname") %>
            </div>
        <% } %>
    </div>
</header>

<script>
document.addEventListener('DOMContentLoaded', function () {
    var targets = document.querySelectorAll('.child, .product-card, .doctor-card, .panel, .form-card, .admin-action, .tool, .tip, .rail-card, .blog-section, .image, .content, .card, .table-wrap');
    if (!('IntersectionObserver' in window)) {
        targets.forEach(function (item) { item.classList.add('is-visible'); });
        return;
    }
    var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.12 });
    targets.forEach(function (item) {
        item.classList.add('pethub-reveal');
        observer.observe(item);
    });
});
</script>

</body>
</html>
