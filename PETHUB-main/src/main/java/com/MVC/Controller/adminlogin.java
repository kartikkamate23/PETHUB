package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Admin admin = new Admin(session);
		
		 if(req.getParameter("login")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status =admin.login(email, password);
				if(status.equals("success")) {
					session.setAttribute("uname", "Admin");
					session.setAttribute("role", "admin");
					req.setAttribute("status", "Login Successfull");
					RequestDispatcher rd =req.getRequestDispatcher("Admin.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
					rd.forward(req, resp);
				}
				
		
			}
		 else if (req.getParameter("acceptevent") != null) {
			    int order_id = Integer.parseInt(req.getParameter("order_id"));
			    int status = admin.acceptorder(order_id);  
			    if (status > 0) {
			        RequestDispatcher rd = req.getRequestDispatcher("BookedProducts.jsp");
			        rd.forward(req, resp);
			    }
			}
		 else if ( req.getParameter("cancel") != null) {
			    int order_id = Integer.parseInt(req.getParameter("order_id"));
			    int status = admin.cancelOrder(order_id);
			    if (status > 0) {
			        RequestDispatcher rd = req.getRequestDispatcher("BookedProducts.jsp");
			        rd.forward(req, resp);
			    }
			}
		 

	}

}
