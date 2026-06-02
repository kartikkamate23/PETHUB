
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


@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession se1 = request.getSession();
        Registration reg = new Registration(se1);
        try {
            if (request.getParameter("submit") != null) {
                String order_address = request.getParameter("address");
                String order_city = request.getParameter("city");
                String order_state = request.getParameter("state");
                String tcost = request.getParameter("tcost");
            
                String status = reg.orderdetails(order_address, order_city, order_state,tcost);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("myorder.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("deleteorder") != null) {
                int oid = Integer.parseInt(request.getParameter("orderid"));
                int status = reg.deleteorder(oid);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("myorder.jsp");
                    rd1.forward(request, response);
                }
            }
        } catch (Exception e) {
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
