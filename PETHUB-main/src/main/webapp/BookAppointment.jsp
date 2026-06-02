<%@page import="com.MVC.Model.Doctor"%>
<%@page import="com.MVC.Model.DoctorService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Vet Appointment</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
body {
    margin: 0;
    background: #f7fbff;
    color: #152238;
    font-family: Arial, sans-serif;
}
.appointment-hero {
    background: linear-gradient(90deg, rgba(21,34,56,.92), rgba(19,122,111,.72)), url('Health/dogvet.jpg');
    background-size: cover;
    background-position: center;
    color: #fff;
    padding: 56px 7vw;
}
.appointment-hero h1 {
    max-width: 760px;
    margin: 0 0 12px;
    font-size: clamp(32px, 5vw, 58px);
}
.appointment-hero p {
    max-width: 650px;
    line-height: 1.7;
    margin: 0;
    color: rgba(255,255,255,.88);
}
.appointment-shell {
    width: min(1180px, calc(100% - 32px));
    margin: 28px auto 50px;
    display: grid;
    grid-template-columns: 1.1fr .9fr;
    gap: 22px;
}
.panel {
    background: #fff;
    border: 1px solid #e3edf7;
    border-radius: 8px;
    box-shadow: 0 14px 36px rgba(15,23,42,.09);
    padding: 24px;
}
.panel h2 {
    margin: 0 0 18px;
    color: #152238;
}
.form-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 16px;
}
.field.full {
    grid-column: 1 / -1;
}
label {
    display: block;
    margin-bottom: 7px;
    color: #435064;
    font-weight: 700;
    font-size: 14px;
}
input, select, textarea {
    width: 100%;
    padding: 12px 13px;
    border: 1px solid #cfdcec;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
}
textarea {
    min-height: 92px;
    resize: vertical;
}
input:focus, select:focus, textarea:focus {
    border-color: #137a6f;
    box-shadow: 0 0 0 3px rgba(19,122,111,.12);
}
.submit-btn {
    width: 100%;
    margin-top: 18px;
    border: 0;
    border-radius: 8px;
    padding: 14px 18px;
    background: #137a6f;
    color: #fff;
    font-weight: 800;
    cursor: pointer;
    font-size: 16px;
}
.status {
    margin-bottom: 18px;
    padding: 13px 15px;
    border-radius: 8px;
    background: #ecfdf5;
    border: 1px solid #a7f3d0;
    color: #065f46;
}
.doctor-card {
    border: 1px solid #e3edf7;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 12px;
    background: #fbfdff;
}
.doctor-card strong {
    display: block;
    color: #152238;
    font-size: 17px;
}
.doctor-card span {
    display: block;
    color: #667085;
    margin-top: 4px;
    line-height: 1.5;
}
.helper-list {
    margin: 18px 0 0;
    padding-left: 18px;
    color: #526071;
    line-height: 1.7;
}
@media (max-width: 850px) {
    .appointment-shell {
        grid-template-columns: 1fr;
    }
    .form-grid {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<%
DoctorService doctorService = new DoctorService();
ArrayList<Doctor> doctors = doctorService.getDoctors(true);
String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<section class="appointment-hero">
    <h1>Book a trusted vet appointment</h1>
    <p>Choose a doctor, appointment time, pet type, and symptom notes. Admin can manage doctors and view every booking from the dashboard.</p>
</section>

<main class="appointment-shell">
    <section class="panel">
        <h2>Appointment Booking</h2>
        <% if (request.getAttribute("status") != null) { %>
            <div class="status"><%= request.getAttribute("status") %></div>
        <% } %>
        <form action="Schedule" method="post">
            <div class="form-grid">
                <div class="field">
                    <label for="name">Owner Name</label>
                    <input type="text" id="name" name="p_name" required>
                </div>
                <div class="field">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" pattern="[0-9]{10}" placeholder="10 digit number" required>
                </div>
                <div class="field">
                    <label for="petType">Pet Type</label>
                    <select id="petType" name="petType" required>
                        <option value="">Select pet</option>
                        <option>Dog</option>
                        <option>Cat</option>
                        <option>Bird</option>
                        <option>Fish</option>
                        <option>Small Pet</option>
                    </select>
                </div>
                <div class="field">
                    <label for="doctorId">Doctor</label>
                    <select id="doctorId" name="doctorId" required>
                        <option value="">Choose doctor</option>
                        <% for (Doctor doctor : doctors) { %>
                            <option value="<%= doctor.getId() %>"><%= doctor.getName() %> - <%= doctor.getSpecialization() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="field">
                    <label for="appointmentDate">Date</label>
                    <input type="date" id="appointmentDate" name="appointmentDate" min="<%= today %>" required>
                </div>
                <div class="field">
                    <label for="appointmentTime">Time Slot</label>
                    <select id="appointmentTime" name="appointmentTime" required>
                        <option value="">Select time</option>
                        <option>10:00 AM</option>
                        <option>11:30 AM</option>
                        <option>01:00 PM</option>
                        <option>03:00 PM</option>
                        <option>05:00 PM</option>
                    </select>
                </div>
                <div class="field full">
                    <label for="disease">Symptoms / Reason</label>
                    <textarea id="disease" name="disease" placeholder="Example: fever, skin itching, vaccination, dental checkup" required></textarea>
                </div>
            </div>
            <button type="submit" class="submit-btn">Book Appointment</button>
        </form>
    </section>

    <aside class="panel">
        <h2>Available Doctors</h2>
        <% if (doctors.isEmpty()) { %>
            <p>No active doctors yet. Admin can add doctors from Doctor Management.</p>
        <% } %>
        <% for (Doctor doctor : doctors) { %>
            <div class="doctor-card">
                <strong><%= doctor.getName() %></strong>
                <span><%= doctor.getSpecialization() %></span>
                <span><%= doctor.getExperience() %> experience</span>
                <span><%= doctor.getAvailability() %></span>
            </div>
        <% } %>
        <ul class="helper-list">
            <li>Urgent bleeding, repeated vomiting, or breathing trouble needs immediate vet attention.</li>
            <li>Bring vaccination records and current medicines if available.</li>
            <li>Doctors who self-register appear as Pending until admin approves them.</li>
        </ul>
    </aside>
</main>
<%@include file="Footer.jsp" %>
</body>
</html>
