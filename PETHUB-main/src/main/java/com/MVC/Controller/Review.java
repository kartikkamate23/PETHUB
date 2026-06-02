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

@WebServlet(name = "submitreview", urlPatterns = {"/submitreview"})
public class Review extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Registration reg = new Registration(session);
        
        if (req.getParameter("submit") != null) {
            String pid = req.getParameter("p_id");
            String uname = req.getParameter("username");
            String review = req.getParameter("review");
            String ratingStr = req.getParameter("rating");

            // Validate parameters
            if (pid == null || uname == null || review == null || ratingStr == null) {
                req.setAttribute("status", "Invalid input. Please fill in all fields.");
                RequestDispatcher rd1 = req.getRequestDispatcher("productDetails.jsp");
                rd1.forward(req, resp);
                return;
            }

            // Parse rating to integer
            int rating = 0;
            try {
                rating = Integer.parseInt(ratingStr);
            } catch (NumberFormatException e) {
                req.setAttribute("status", "Invalid rating. Please select a valid star rating.");
                RequestDispatcher rd1 = req.getRequestDispatcher("productDetails.jsp");
                rd1.forward(req, resp);
                return;
            }

            // Process review submission
            String status = reg.getReview(pid, uname, review, rating);
            if ("success".equals(status)) {
                req.setAttribute("status", "Thank you for your review!");
            } else {
                req.setAttribute("status", "Failed to submit your review. Please try again.");
            }

            // Forward the request back to the product details page
            RequestDispatcher rd1 = req.getRequestDispatcher("productDetails.jsp");
            rd1.forward(req, resp);
        }
    }
}
