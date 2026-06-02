package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Registration reg = new Registration(session);
        String cid = req.getParameter("cid");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Assuming you have a method to get user ID from session
        String userId = (String) session.getAttribute("id");

        try {
            boolean isUpdated = reg.updateCartQuantity(cid, userId, quantity);
            if (isUpdated) {
                resp.sendRedirect("cart.jsp"); 
            } else {
                req.setAttribute("error", "Failed to update quantity.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid quantity format.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An unexpected error occurred.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
