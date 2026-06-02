package com.MVC.Controller;

	import java.io.IOException;
import java.io.PrintWriter;

import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
	@WebServlet(name="Contact",urlPatterns= {"/Contact"})

	public class Contact extends HttpServlet{
		protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			PrintWriter out = resp.getWriter();
			HttpSession session = req.getSession();
			Registration reg=new Registration(session);
			if(req.getParameter("Contact")!=null) {
				String name=req.getParameter("name");
				String email=req.getParameter("email");
				String subject=req.getParameter("subject");
				String message=req.getParameter("message");
				String phone=req.getParameter("phone");
				
					String status=reg.contactInfo(name, email, subject, message,phone);
					
					if(status.equals("success")) {
						req.setAttribute("status", "Thank You for Contacting");
						RequestDispatcher rd=req.getRequestDispatcher("Contact.jsp");
						rd.forward(req, resp);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Please Try Again Later");
						RequestDispatcher rd = req.getRequestDispatcher("Contact.jsp");
						rd.forward(req, resp);
					}
				}
				
		}
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        processRequest(req, resp);
	    }

	    
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        processRequest(req, resp);
	    }
	}
