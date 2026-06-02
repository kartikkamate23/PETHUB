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

@WebServlet("/register")
public class Register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");

        HttpSession session = req.getSession();

        Registration reg = new Registration(session);

        try {

            // REGISTER
            if (req.getParameter("register") != null) {

                String name = req.getParameter("name");
                String phone = req.getParameter("phone");
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                String confirm = req.getParameter("confirm");

                if (password != null && password.equals(confirm)) {

                    String status = reg.registration(name, phone, email, password);

                    if (status.equals("existed")) {

                        req.setAttribute("status", "Existed Record");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("Registration.jsp");

                        rd.forward(req, resp);

                    } else if (status.equals("success")) {

                        req.setAttribute("status", "Successfully Registered");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("Login.jsp");

                        rd.forward(req, resp);

                    } else {

                        req.setAttribute("status", "Registration Failed");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("Registration.jsp");

                        rd.forward(req, resp);
                    }

                } else {

                    req.setAttribute("status", "Password Mismatch");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("Registration.jsp");

                    rd.forward(req, resp);
                }
            }

            // LOGIN
            else if (req.getParameter("login") != null) {

                String email = req.getParameter("email");
                String password = req.getParameter("password");

                String status = reg.login(email, password);

                if (status.equals("success")) {

                    req.setAttribute("status", "Login Successful");
                    session.setAttribute("role", "user");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("Home1.jsp");

                    rd.forward(req, resp);

                } else {

                    req.setAttribute("status", "Login Failed");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("Login.jsp");

                    rd.forward(req, resp);
                }
            }

            // LOGOUT
            else if (req.getParameter("logout") != null) {

                session.invalidate();

                resp.sendRedirect("Home1.jsp");
            }

            // PROFILE UPDATE
            else if (session.getAttribute("uname") != null
                    && req.getParameter("submit") != null) {

                String name = req.getParameter("name");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");

                String status = reg.update(name, email, phone);

                if (status.equals("success")) {

                    session.setAttribute("uname", name);
                    session.setAttribute("phone", phone);
                    session.setAttribute("email", email);

                    req.setAttribute("status",
                            "Profile Updated Successfully");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("index.jsp");

                    rd.forward(req, resp);

                } else {

                    req.setAttribute("status",
                            "Failed to Update Profile");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("index.jsp");

                    rd.forward(req, resp);
                }
            }

            // FORGOT PASSWORD
            else if (req.getParameter("forgotPass") != null) {

                String mail = req.getParameter("email");
                String pw = req.getParameter("pw");
                String cp = req.getParameter("cpw");

                if (pw.equals(cp)) {

                    String status = reg.forgot(mail, pw);

                    if (status.equals("success")) {

                        req.setAttribute("status",
                                "Password Reset Successfully");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("ForgotReset.jsp");

                        rd.forward(req, resp);

                    } else {

                        req.setAttribute("status",
                                "Password Reset Failed");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("ForgotReset.jsp");

                        rd.forward(req, resp);
                    }

                } else {

                    req.setAttribute("status", "Password Mismatch");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("ForgotReset.jsp");

                    rd.forward(req, resp);
                }
            }

            // RESET PASSWORD
            else if (req.getParameter("reset") != null) {

                String email = req.getParameter("email");
                String opw = req.getParameter("opw");
                String npw = req.getParameter("npw");

                if (opw.equals(npw)) {

                    req.setAttribute("status",
                            "New Password same as Old Password");

                    RequestDispatcher rd =
                            req.getRequestDispatcher("ForgotReset.jsp");

                    rd.forward(req, resp);

                } else {

                    String status = reg.resetPassword(email, npw);

                    if (status.equals("success")) {

                        req.setAttribute("status",
                                "Password Changed Successfully");

                        RequestDispatcher rd =
                                req.getRequestDispatcher("Login.jsp");

                        rd.forward(req, resp);
                    }
                }
            }

            // DOG PAGE
            else if (req.getParameter("submit1") != null) {

                resp.sendRedirect(
                        "dog.jsp?animal="
                                + req.getParameter("animalname"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        processRequest(req, resp);
    }
}
