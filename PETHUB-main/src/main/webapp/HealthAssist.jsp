<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Assistance</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f9fc;
    color: #152238;
}
.health-hero {
    min-height: 320px;
    padding: 48px 7vw;
    background: linear-gradient(90deg, rgba(21,34,56,.94), rgba(19,122,111,.66)), url('Health/dogvet.jpg');
    background-size: cover;
    background-position: center;
    color: #fff;
    display: flex;
    align-items: end;
}
.health-hero h1 {
    margin: 0 0 12px;
    font-size: clamp(34px, 5vw, 58px);
}
.health-hero p {
    max-width: 680px;
    margin: 0;
    line-height: 1.7;
    color: rgba(255,255,255,.88);
}
.health-wrap {
    width: min(1180px, calc(100% - 32px));
    margin: 28px auto 54px;
}
.primary-action {
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 18px;
    align-items: center;
    background: #fff;
    border: 1px solid #dce7f1;
    border-radius: 8px;
    padding: 24px;
    box-shadow: 0 16px 38px rgba(15,23,42,.1);
    margin-bottom: 18px;
}
.primary-action h2 {
    margin: 0 0 8px;
}
.primary-action p {
    margin: 0;
    color: #607086;
    line-height: 1.6;
}
.primary-action a, .doctor-signup {
    display: inline-block;
    padding: 13px 18px;
    background: #137a6f;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 900;
    text-align: center;
}
.health-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
}
.health-card {
    background: #fff;
    border: 1px solid #dce7f1;
    border-radius: 8px;
    box-shadow: 0 14px 32px rgba(15,23,42,.08);
    overflow: hidden;
}
.health-card img {
    width: 100%;
    height: 190px;
    object-fit: cover;
}
.health-card div {
    padding: 18px;
}
.health-card h3 {
    margin: 0 0 8px;
}
.health-card p {
    margin: 0;
    color: #607086;
    line-height: 1.6;
}
.doctor-bar {
    margin-top: 18px;
    padding: 20px;
    border-radius: 8px;
    background: #17202a;
    color: #fff;
    display: flex;
    justify-content: space-between;
    gap: 16px;
    align-items: center;
}
.doctor-bar p {
    margin: 4px 0 0;
    color: rgba(255,255,255,.78);
}
.doctor-signup {
    background: #f59e0b;
    color: #17202a;
    flex-shrink: 0;
}
@media(max-width: 850px) {
    .primary-action, .health-grid, .doctor-bar {
        grid-template-columns: 1fr;
        display: grid;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<section class="health-hero">
    <div>
        <h1>Health Assistance</h1>
        <p>One clear appointment path, helpful care resources, and doctor registration without repeating the same booking button three times.</p>
    </div>
</section>

<main class="health-wrap">
    <section class="primary-action">
        <div>
            <h2>Vet Visit Booking</h2>
            <p>Select doctor, pet type, date, time slot, and symptoms in one complete booking flow.</p>
        </div>
        <a href="BookAppointment.jsp">Book Appointment</a>
    </section>

    <section class="health-grid">
        <article class="health-card">
            <img src="Health/videoconsultancy.jpg" alt="Video Consultation">
            <div>
                <h3>Video Care Library</h3>
                <p>Watch pet-care videos for common symptoms, hygiene, and routine wellness.</p>
            </div>
        </article>
        <article class="health-card">
            <img src="Health/catvet.avif" alt="General Checkup">
            <div>
                <h3>General Checkup</h3>
                <p>Understand when to schedule routine exams, dental checks, and vaccination visits.</p>
            </div>
        </article>
        <article class="health-card">
            <img src="Health/birdvet.jpg" alt="Pet Wellness">
            <div>
                <h3>Pet Wellness</h3>
                <p>Prepare food notes, symptoms, vaccination cards, and behavior observations before visiting.</p>
            </div>
        </article>
    </section>

    <section class="doctor-bar">
        <div>
            <h2>Are you a doctor?</h2>
            <p>Submit your profile and check whether your application is Pending, Active, or Inactive.</p>
        </div>
        <a class="doctor-signup" href="DoctorRegistration.jsp">Doctor Self Registration</a>
    </section>
</main>
<%@include file="Footer.jsp" %>
</body>
</html>
