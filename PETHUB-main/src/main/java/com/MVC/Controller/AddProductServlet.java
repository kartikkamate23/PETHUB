package com.MVC.Controller;



import java.io.IOException;

import com.MVC.Model.Dproduct;
import com.MVC.Model.Registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        double cost = Double.parseDouble(request.getParameter("cost"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        
        Dproduct product = new Dproduct();
        product.setp_name(name);
        product.setp_image(image);
        product.setP_cost(cost);
        product.setp_details(description);
        product.setP_category(category);

        
        HttpSession session = request.getSession();
        Registration registration = new Registration(session);
        
        
        boolean success = registration.addProduct(product);

        
        if (success) {
            response.sendRedirect("Admin.jsp?message=Product added successfully!");
        } else {
            response.sendRedirect("Admin.jsp?error=Failed to add product.");
        }
    }
}

