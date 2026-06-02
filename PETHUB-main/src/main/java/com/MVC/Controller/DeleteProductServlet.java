package com.MVC.Controller;

import java.io.IOException;
import com.MVC.Model.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String productIdStr = request.getParameter("p_id");

        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdStr);
                Registration registration = new Registration(session);
                boolean isDeleted = registration.deleteProduct(productId);

                if (isDeleted) {
                    response.sendRedirect("Admin.jsp?message=Product deleted successfully");
                } else {
                    response.sendRedirect("Admin.jsp?message=Error deleting product");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("Admin.jsp?message=Invalid product ID");
            }
        } else {
            response.sendRedirect("Admin.jsp?message=Product ID is missing");
        }
    }
}
