<%@page import="java.util.Iterator"%>
<%@page import="com.MVC.Model.AppointmentPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.MVC.Model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment List</title>
<link rel="stylesheet" href="pethub-responsive.css">
<style>
body {
    font-family: Arial, sans-serif;
    background: #f5f8fc;
    margin: 0;
    color: #17202a;
}
.page-head {
    padding: 34px 7vw;
    background: #137a6f;
    color: #fff;
}
.page-head h1 {
    margin: 0 0 8px;
    font-size: clamp(30px, 4vw, 48px);
}
.page-head p {
    margin: 0;
    color: rgba(255,255,255,.85);
}
.table-wrap {
    width: min(1180px, calc(100% - 32px));
    margin: 28px auto;
    overflow-x: auto;
    background: #fff;
    border: 1px solid #e3edf7;
    border-radius: 8px;
    box-shadow: 0 14px 34px rgba(15,23,42,.08);
}
table {
    width: 100%;
    min-width: 860px;
    border-collapse: collapse;
}
th, td {
    padding: 14px;
    text-align: left;
    border-bottom: 1px solid #e7eef7;
}
th {
    background: #17202a;
    color: #fff;
}
.badge {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 999px;
    background: #dcfce7;
    color: #166534;
    font-weight: 800;
    font-size: 12px;
}
.actions {
    width: min(1180px, calc(100% - 32px));
    margin: 0 auto 40px;
}
.actions a {
    display: inline-block;
    margin-right: 8px;
    padding: 11px 15px;
    background: #137a6f;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 800;
}
</style>
</head>
<body>
<%@include file="Header1.jsp" %>
<section class="page-head">
    <h1>Appointment List</h1>
    <p>Track booked appointments with doctor, pet, time slot, symptoms, and contact details.</p>
</section>
<div class="table-wrap">
    <table>
        <tr>
            <th>Owner</th>
            <th>Phone</th>
            <th>Pet</th>
            <th>Doctor</th>
            <th>Date</th>
            <th>Time</th>
            <th>Symptoms</th>
            <th>Status</th>
        </tr>
        <%
        Appointment app1 = new Appointment(session);
        ArrayList<AppointmentPojo> al1 = app1.getAppinfo();
        Iterator<AppointmentPojo> itr2 = al1.iterator();
        while (itr2.hasNext()) {
            AppointmentPojo app = itr2.next();
        %>
        <tr>
            <td><%= app.getP_name() %></td>
            <td><%= app.getPhone() %></td>
            <td><%= app.getPetType() == null ? "-" : app.getPetType() %></td>
            <td><%= app.getDoctorName() == null ? "Not assigned" : app.getDoctorName() %></td>
            <td><%= app.getDate() %></td>
            <td><%= app.getAppointmentTime() == null ? "-" : app.getAppointmentTime() %></td>
            <td><%= app.getDisease() %></td>
            <td><span class="badge"><%= app.getStatus() == null ? "Booked" : app.getStatus() %></span></td>
        </tr>
        <% } %>
    </table>
</div>
<div class="actions">
    <a href="Admin.jsp">Back to Dashboard</a>
    <a href="DoctorManagement.jsp">Doctor Management</a>
</div>
</body>
</html>
