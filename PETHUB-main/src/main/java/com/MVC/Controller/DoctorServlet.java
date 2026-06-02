package com.MVC.Controller;

import java.io.IOException;

import com.MVC.Model.Doctor;
import com.MVC.Model.DoctorService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Doctor")
public class DoctorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = value(request, "action");
        DoctorService service = new DoctorService();
        String status = "failure";
        String target = "DoctorManagement.jsp";
        boolean owner = isOwner(request);

        if ("selfRegister".equals(action) || "add".equals(action)) {
            if ("add".equals(action) && !owner) {
                response.sendRedirect("DoctorRegistration.jsp?status=ownerOnly");
                return;
            }
            Doctor doctor = new Doctor();
            doctor.setName(value(request, "doctor_name"));
            doctor.setEmail(value(request, "email"));
            doctor.setPhone(value(request, "phone"));
            doctor.setSpecialization(value(request, "specialization"));
            doctor.setExperience(value(request, "experience"));
            doctor.setAvailability(value(request, "availability"));
            doctor.setStatus(value(request, "status").isBlank() ? "Active" : value(request, "status"));
            boolean selfRegistration = "selfRegister".equals(action);
            status = service.saveDoctor(doctor, selfRegistration);
            if (selfRegistration) {
                target = "DoctorRegistration.jsp?status=" + status + "&email=" + encode(doctor.getEmail());
                response.sendRedirect(target);
                return;
            }
            target = "DoctorManagement.jsp";
        } else if ("status".equals(action)) {
            if (!owner) {
                response.sendRedirect("DoctorRegistration.jsp?status=ownerOnly");
                return;
            }
            status = service.updateStatus(parseId(request), value(request, "status"));
        } else if ("delete".equals(action)) {
            if (!owner) {
                response.sendRedirect("DoctorRegistration.jsp?status=ownerOnly");
                return;
            }
            status = service.deleteDoctor(parseId(request));
        }

        response.sendRedirect(target + "?status=" + status);
    }

    private String encode(String value) {
        return value.replace("@", "%40").replace(" ", "%20");
    }

    private int parseId(HttpServletRequest request) {
        try {
            return Integer.parseInt(value(request, "doctor_id"));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private String value(HttpServletRequest request, String key) {
        String value = request.getParameter(key);
        return value == null ? "" : value.trim();
    }

    private boolean isOwner(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && "admin".equals(session.getAttribute("role"));
    }
}
