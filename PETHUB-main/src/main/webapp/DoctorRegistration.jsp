<%@page import="com.MVC.Model.Doctor"%>
<%@page import="com.MVC.Model.DoctorService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Registration</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #f8fbff, #fff6d6);
    color: #17202a;
}
.doctor-register {
    width: min(1100px, calc(100% - 32px));
    margin: 34px auto 54px;
    display: grid;
    grid-template-columns: .9fr 1.1fr;
    gap: 24px;
    align-items: stretch;
}
.intro {
    background: linear-gradient(180deg, rgba(19,122,111,.93), rgba(15,23,42,.94)), url('Health/catvet.avif');
    background-size: cover;
    background-position: center;
    color: #fff;
    padding: 36px;
    border-radius: 8px;
    min-height: 420px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}
.intro h1 {
    font-size: clamp(32px, 5vw, 54px);
    margin: 0 0 12px;
}
.intro p {
    line-height: 1.7;
    color: rgba(255,255,255,.9);
}
.form-card {
    background: #fff;
    border: 1px solid #e4edf6;
    border-radius: 8px;
    box-shadow: 0 18px 44px rgba(15,23,42,.1);
    padding: 28px;
}
.form-card h2 {
    margin: 0 0 18px;
}
.status-card {
    margin-top: 18px;
    padding: 18px;
    border-radius: 8px;
    background: #f8fafc;
    border: 1px solid #dbe5f0;
}
.status-pill {
    display: inline-block;
    padding: 7px 12px;
    border-radius: 999px;
    background: #fff7ed;
    color: #c2410c;
    font-weight: 800;
}
.status-pill.Active {
    background: #dcfce7;
    color: #166534;
}
.status-pill.Inactive {
    background: #fee2e2;
    color: #991b1b;
}
.grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 15px;
}
.full {
    grid-column: 1 / -1;
}
label {
    display: block;
    margin-bottom: 7px;
    color: #526071;
    font-weight: 700;
}
input, select {
    width: 100%;
    padding: 12px 13px;
    border: 1px solid #cfdcec;
    border-radius: 8px;
    font-size: 15px;
}
button {
    width: 100%;
    margin-top: 18px;
    border: 0;
    border-radius: 8px;
    padding: 14px 18px;
    background: #137a6f;
    color: #fff;
    font-weight: 800;
    cursor: pointer;
}
.status {
    margin-bottom: 16px;
    padding: 16px;
    border-radius: 8px;
    background: #ecfdf5;
    color: #065f46;
    border: 1px solid #a7f3d0;
}
.status strong {
    display: block;
    font-size: 18px;
    margin-bottom: 6px;
}
.status a {
    display: inline-block;
    margin-top: 12px;
    padding: 10px 13px;
    border-radius: 8px;
    background: #137a6f;
    color: #fff;
    text-decoration: none;
    font-weight: 800;
}
@media (max-width: 850px) {
    .doctor-register, .grid {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<%
String lookupEmail = request.getParameter("statusEmail");
Doctor lookupDoctor = null;
if (lookupEmail != null && !lookupEmail.trim().isEmpty()) {
    lookupDoctor = new DoctorService().getDoctorByEmail(lookupEmail.trim());
}
%>
<main class="doctor-register">
    <section class="intro">
        <h1>Join PetHub as a doctor</h1>
        <p>Register your profile for admin approval. Once active, pet parents can book appointments with you from the health assistance flow.</p>
    </section>
    <section class="form-card">
        <h2>Doctor Self Registration</h2>
        <% if (request.getParameter("status") != null) { %>
            <div class="status">
                <% if ("success".equals(request.getParameter("status"))) { %>
                    <strong>Registration submitted successfully.</strong>
                    Your doctor profile<%= request.getParameter("email") == null ? "" : " (" + request.getParameter("email") + ")" %> is now waiting for owner approval.
                    You can check the status below using the same email.
                <% } else if ("ownerOnly".equals(request.getParameter("status"))) { %>
                    <strong>Owner access only.</strong>
                    Approval, pause, and delete actions are available only to the PetHub owner/admin.
                <% } else { %>
                    <strong>Submission failed.</strong>
                    Please check the form and try again.
                <% } %>
            </div>
        <% } %>
        <form action="Doctor" method="post">
            <input type="hidden" name="action" value="selfRegister">
            <div class="grid">
                <div>
                    <label>Name</label>
                    <input name="doctor_name" required>
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>
                <div>
                    <label>Phone</label>
                    <input name="phone" pattern="[0-9]{10}" required>
                </div>
                <div>
                    <label>Experience</label>
                    <input name="experience" placeholder="5 years" required>
                </div>
                <div class="full">
                    <label>Specialization</label>
                    <input name="specialization" placeholder="Dog and cat physician, birds, dermatology" required>
                </div>
                <div class="full">
                    <label>Availability</label>
                    <input name="availability" placeholder="Mon-Sat, 10 AM - 5 PM" required>
                </div>
            </div>
            <button type="submit">Submit for Approval</button>
        </form>

        <div class="status-card">
            <h2>Check Application Status</h2>
            <form action="DoctorRegistration.jsp" method="get">
                <label>Registered Email</label>
                <input type="email" name="statusEmail" value="<%= lookupEmail == null ? "" : lookupEmail %>" placeholder="doctor@email.com" required>
                <button type="submit">Check Status</button>
            </form>
            <% if (lookupEmail != null) { %>
                <% if (lookupDoctor != null) { %>
                    <p><strong><%= lookupDoctor.getName() %></strong></p>
                    <p>Specialization: <%= lookupDoctor.getSpecialization() %></p>
                    <p>Status: <span class="status-pill <%= lookupDoctor.getStatus() %>"><%= lookupDoctor.getStatus() %></span></p>
                    <% if ("Pending".equalsIgnoreCase(lookupDoctor.getStatus())) { %>
                        <p>Your application is waiting for owner approval.</p>
                    <% } else if ("Active".equalsIgnoreCase(lookupDoctor.getStatus())) { %>
                        <p>Your application is approved. Pet parents can book appointments with you.</p>
                    <% } else { %>
                        <p>Your profile is paused/inactive. Please contact the owner.</p>
                    <% } %>
                <% } else { %>
                    <p>No doctor application found for this email.</p>
                <% } %>
            <% } %>
        </div>
    </section>
</main>
<%@include file="Footer.jsp" %>
</body>
</html>
