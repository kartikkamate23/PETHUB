<%@page import="com.MVC.Model.Doctor"%>
<%@page import="com.MVC.Model.DoctorService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Management</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
body {
    margin: 0;
    background: #f5f8fc;
    color: #17202a;
    font-family: Arial, sans-serif;
}
.admin-hero {
    padding: 34px 7vw;
    background: #17202a;
    color: #fff;
}
.admin-hero h1 {
    margin: 0 0 8px;
    font-size: clamp(30px, 4vw, 48px);
}
.admin-hero p {
    margin: 0;
    color: rgba(255,255,255,.78);
}
.doctor-admin {
    width: min(1200px, calc(100% - 32px));
    margin: 26px auto 54px;
    display: grid;
    grid-template-columns: 360px 1fr;
    gap: 22px;
}
.panel, .doctor-card {
    background: #fff;
    border: 1px solid #e3edf7;
    border-radius: 8px;
    box-shadow: 0 14px 34px rgba(15,23,42,.08);
}
.panel {
    padding: 22px;
}
.panel h2 {
    margin: 0 0 18px;
}
label {
    display: block;
    margin: 12px 0 6px;
    color: #526071;
    font-weight: 700;
}
input, select {
    width: 100%;
    padding: 11px 12px;
    border: 1px solid #cfdcec;
    border-radius: 8px;
}
button {
    border: 0;
    border-radius: 8px;
    padding: 11px 14px;
    font-weight: 800;
    cursor: pointer;
}
.primary {
    width: 100%;
    margin-top: 16px;
    background: #137a6f;
    color: #fff;
}
.doctor-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 16px;
}
.section-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin: 0 0 14px;
}
.section-title h2 {
    margin: 0;
}
.counter {
    background: #fff7ed;
    color: #c2410c;
    border: 1px solid #fed7aa;
    border-radius: 999px;
    padding: 6px 12px;
    font-weight: 800;
    font-size: 13px;
}
.pending-zone {
    margin-bottom: 24px;
    padding: 16px;
    border: 1px dashed #f59e0b;
    border-radius: 8px;
    background: #fffbeb;
}
.empty-state {
    padding: 18px;
    border-radius: 8px;
    background: #f8fafc;
    color: #64748b;
    border: 1px solid #e2e8f0;
}
.doctor-card {
    padding: 18px;
}
.doctor-card h3 {
    margin: 0 0 8px;
}
.meta {
    color: #5f6b7a;
    line-height: 1.6;
    margin: 0 0 12px;
}
.badge {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 999px;
    background: #e0f2fe;
    color: #075985;
    font-weight: 800;
    font-size: 12px;
}
.actions {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 8px;
    margin-top: 14px;
}
.actions form {
    margin: 0;
}
.actions button {
    width: 100%;
    background: #f1f5f9;
    color: #17202a;
}
.actions .danger {
    background: #fee2e2;
    color: #991b1b;
}
.status {
    margin-bottom: 14px;
    padding: 12px;
    border-radius: 8px;
    background: #ecfdf5;
    color: #065f46;
    border: 1px solid #a7f3d0;
}
@media (max-width: 950px) {
    .doctor-admin, .doctor-grid {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<% if (!"admin".equals(session.getAttribute("role"))) { %>
    <section class="admin-hero">
        <h1>Owner Access Only</h1>
        <p>Doctor approval, pause, and delete actions can be handled only by the PetHub owner/admin.</p>
    </section>
    <main class="doctor-admin" style="display:block;">
        <section class="panel">
            <h2>Doctor Application Status</h2>
            <p>Please use Doctor Signup to register or check your application status.</p>
            <a href="DoctorRegistration.jsp" style="display:inline-block;margin-top:12px;padding:11px 15px;background:#137a6f;color:#fff;border-radius:8px;text-decoration:none;font-weight:800;">Open Doctor Signup</a>
        </section>
    </main>
</body>
</html>
<% return; } %>
<%
DoctorService service = new DoctorService();
ArrayList<Doctor> doctors = service.getDoctors(false);
int pendingCount = 0;
for (Doctor doctor : doctors) {
    if ("Pending".equalsIgnoreCase(doctor.getStatus())) {
        pendingCount++;
    }
}
%>
<section class="admin-hero">
    <h1>Doctor Management</h1>
    <p>Add doctors, approve self-registrations, pause unavailable doctors, and keep appointment booking accurate.</p>
</section>
<main class="doctor-admin">
    <section class="panel">
        <h2>Add Doctor</h2>
        <% if (request.getParameter("status") != null) { %>
            <div class="status">Action completed: <%= request.getParameter("status") %></div>
        <% } %>
        <form action="Doctor" method="post">
            <input type="hidden" name="action" value="add">
            <label>Name</label>
            <input name="doctor_name" required>
            <label>Email</label>
            <input type="email" name="email" required>
            <label>Phone</label>
            <input name="phone" pattern="[0-9]{10}" required>
            <label>Specialization</label>
            <input name="specialization" required>
            <label>Experience</label>
            <input name="experience" placeholder="8 years" required>
            <label>Availability</label>
            <input name="availability" placeholder="Mon-Sat, 10 AM - 5 PM" required>
            <label>Status</label>
            <select name="status">
                <option>Active</option>
                <option>Pending</option>
                <option>Inactive</option>
            </select>
            <button class="primary" type="submit">Save Doctor</button>
        </form>
    </section>

    <section>
        <div class="pending-zone">
            <div class="section-title">
                <h2>Pending Doctor Approvals</h2>
                <span class="counter"><%= pendingCount %> waiting</span>
            </div>
            <% if (pendingCount == 0) { %>
                <div class="empty-state">No pending doctor profiles right now. New Doctor Signup submissions will appear here.</div>
            <% } %>
            <div class="doctor-grid">
                <% for (Doctor doctor : doctors) { if ("Pending".equalsIgnoreCase(doctor.getStatus())) { %>
                    <article class="doctor-card">
                        <span class="badge"><%= doctor.getStatus() %></span>
                        <h3><%= doctor.getName() %></h3>
                        <p class="meta">
                            <strong><%= doctor.getSpecialization() %></strong><br>
                            <%= doctor.getExperience() %> experience<br>
                            <%= doctor.getAvailability() %><br>
                            <%= doctor.getEmail() %> | <%= doctor.getPhone() %>
                        </p>
                        <div class="actions">
                            <form action="Doctor" method="post">
                                <input type="hidden" name="action" value="status">
                                <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                                <input type="hidden" name="status" value="Active">
                                <button type="submit">Approve</button>
                            </form>
                            <form action="Doctor" method="post">
                                <input type="hidden" name="action" value="status">
                                <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                                <input type="hidden" name="status" value="Inactive">
                                <button type="submit">Reject/Pause</button>
                            </form>
                        </div>
                    </article>
                <% }} %>
            </div>
        </div>
        <div class="section-title">
            <h2>All Doctors</h2>
            <span class="counter"><%= doctors.size() %> total</span>
        </div>
        <div class="doctor-grid">
            <% for (Doctor doctor : doctors) { %>
                <article class="doctor-card">
                    <span class="badge"><%= doctor.getStatus() %></span>
                    <h3><%= doctor.getName() %></h3>
                    <p class="meta">
                        <strong><%= doctor.getSpecialization() %></strong><br>
                        <%= doctor.getExperience() %> experience<br>
                        <%= doctor.getAvailability() %><br>
                        <%= doctor.getEmail() %> | <%= doctor.getPhone() %>
                    </p>
                    <div class="actions">
                        <form action="Doctor" method="post">
                            <input type="hidden" name="action" value="status">
                            <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                            <input type="hidden" name="status" value="Active">
                            <button type="submit">Approve</button>
                        </form>
                        <form action="Doctor" method="post">
                            <input type="hidden" name="action" value="status">
                            <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                            <input type="hidden" name="status" value="Inactive">
                            <button type="submit">Pause</button>
                        </form>
                        <form action="Doctor" method="post">
                            <input type="hidden" name="action" value="status">
                            <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                            <input type="hidden" name="status" value="Pending">
                            <button type="submit">Pending</button>
                        </form>
                        <form action="Doctor" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="doctor_id" value="<%= doctor.getId() %>">
                            <button class="danger" type="submit">Delete</button>
                        </form>
                    </div>
                </article>
            <% } %>
        </div>
    </section>
</main>
</body>
</html>
