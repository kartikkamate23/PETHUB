package com.MVC.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.MVC.Model.Registration;
import com.MVC.Model.Wishlist;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AnimalServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try {
            if (request.getParameter("") != null) {
                String p_id = request.getParameter("p_id");
               
                ArrayList<Wishlist> status = reg.getwishlistinfo();
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("wishlist.jsp");
                    rd1.forward(request, response);
                }
            }
}catch (Exception e) {
    e.printStackTrace();
}
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
processRequest(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
processRequest(request, response);
}

}
