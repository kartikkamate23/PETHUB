
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



@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try {
            if (request.getParameter("addtocart") != null) {
                String p_id = request.getParameter("p_id");
               String qty = request.getParameter("quantity");
                String status = reg.addtocart(p_id,qty);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("cart.jsp");
                    rd1.forward(request, response);
                }
            }
          
          
   else if (request.getParameter("delete") != null) {
                int c_id = Integer.parseInt(request.getParameter("cid"));
                int status = reg.deletecart(c_id);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("cart.jsp");
                    rd1.forward(request, response);
                }
            }
            else if (request.getParameter("deletewishlist") != null) {
                int w_id = Integer.parseInt(request.getParameter("w_id"));
                int status = reg.deletewishlist(w_id);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("Wishlist.jsp");
                    rd1.forward(request, response);
                }
            }
//            else if(request.getParameter("quantity")!=null) {
//            	int status = reg.getQty();
//            }
           
            
            else if (request.getParameter("cid") != null) {
                int c_id = Integer.parseInt(request.getParameter("cid"));
                int status = reg.deleteproduct(c_id);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("DeleteProduct.jsp");
                    rd1.forward(request, response);
                }
            }
            else  if (request.getParameter("addtowishlist") != null) {
                String p_id = request.getParameter("p_id");
               
                String status = reg.addwishlist(p_id);
                if (status.equals("success")) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("Wishlist.jsp");
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
