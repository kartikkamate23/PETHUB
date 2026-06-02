package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Appointment;
import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Schedule", urlPatterns = {"/Schedule"})

public class Schedule extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String pname=req.getParameter("p_name");
     String phone = req.getParameter("phone");
     String date = req.getParameter("appointmentDate");
     String disease = req.getParameter("disease");
     String petType = req.getParameter("petType");
     String appointmentTime = req.getParameter("appointmentTime");
     int doctorId = 0;
     try {
    	 doctorId = Integer.parseInt(req.getParameter("doctorId"));
     } catch (Exception e) {
    	 doctorId = 0;
     }
     
     HttpSession session = req.getSession();
     Appointment appointment = new Appointment(session);
     String status = appointment.addPatient(pname, phone, date, disease, doctorId, petType, appointmentTime);
		if(status.equals("existed")) {
			req.setAttribute("status", "Existed Record");
			RequestDispatcher rd1=req.getRequestDispatcher("BookAppointment.jsp");
			rd1.forward(req, resp);
		}
		else if(status.equals("success")) {
			req.setAttribute("status", "Successfully Registered");
			RequestDispatcher rd=req.getRequestDispatcher("BookAppointment.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("status", "Appointment Failed");
			RequestDispatcher rd=req.getRequestDispatcher("BookAppointment.jsp");
			rd.forward(req, resp);
		}
	}
}
