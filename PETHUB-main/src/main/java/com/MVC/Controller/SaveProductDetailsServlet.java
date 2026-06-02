package com.MVC.Controller;


	import com.MVC.Model.Admin;
	import com.MVC.Model.Dproduct;
import com.MVC.Model.Product;
import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


	@WebServlet("/SaveProductDetails")
	public class SaveProductDetailsServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String p_id = request.getParameter("p_id");
	        String name = request.getParameter("p_name");
	        String image = request.getParameter("image");
	        String image1 = request.getParameter("image1");
	        String image2 = request.getParameter("image2");
	        String cost = request.getParameter("cost");
	        String category = request.getParameter("category");
	        String details = request.getParameter("details");
	        String info = request.getParameter("info");
	        
	      Product productdetails = new Product();
	      productdetails.setP_id(p_id);
	      productdetails.setP_name(name);
	      productdetails.setP_image(image);
	      productdetails.setP_image1(image1);
	      productdetails.setP_image2(image2);
	      productdetails.setP_cost(cost);
	      productdetails.setP_category(category);
	      productdetails.setP_details(details);
	      productdetails.setP_info(info);
	      
	      PrintWriter out=response.getWriter();
	      response.setContentType("text/html");
	        
	        HttpSession session = request.getSession();
	        Admin admin = new Admin(session);
	        
	        
	        String status = admin.addProductDetails(p_id, name, image, image1, image2, cost, category, details, info);
	        if(status.equals("success")) {
	        	request.setAttribute("status","Successfully Added" );
	        	out.print("<h3>Updated Successfully</h3>");
	        	RequestDispatcher rd = request.getRequestDispatcher("AddProductDetails.jsp");
	        	rd.include(request, response);
	        }
	        else {
	        	RequestDispatcher rd = request.getRequestDispatcher("AddProductDetails.jsp");
	        	rd.forward(request, response);
	        }

	    }
	}


