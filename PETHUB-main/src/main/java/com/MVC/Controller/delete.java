package com.MVC.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.MVC.Model.Registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name = "delete", urlPatterns = {"/delete"})
public class delete extends HttpServlet{
	   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	           throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       HttpSession session = request.getSession();
	       try {
	           int id = Integer.parseInt(request.getParameter("userid"));
	           Registration reg = new Registration(session);
	           String status = reg.delete(id);
	           if (status.equals("success")) {
	               request.setAttribute("status","Successfully Deleted");
	               request.getRequestDispatcher("DeleteUser.jsp")
	                       .forward(request, response);
	           }
	           if (status.equals("failure")) {
	                request.setAttribute("status","Deletion failure");
	               //request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
	               response.sendRedirect("DeleteUser.jsp");
	           }
	       } catch (Exception e) {
	           e.printStackTrace();
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

	   public String getServletInfo() {
	       return "Short description";
	   }// </editor-fold>


}
