package com.MVC.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import com.MVC.Config.Db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ai-features")
public class AIFeaturesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String feature = request.getParameter("feature");
        String result;

        if ("vaccine".equals(feature)) {
            result = vaccinationReminder(request);
        } else if ("food".equals(feature)) {
            result = foodRecommendation(request);
        } else if ("appointment".equals(feature)) {
            result = appointmentPrep(request);
        } else {
            result = "Choose one AI feature and try again.";
        }

        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.write("{\"result\":\"" + escapeJson(result) + "\"}");
        }
    }

    private String vaccinationReminder(HttpServletRequest request) {
        String petName = fallback(value(request, "petName"), "Your pet");
        String petType = value(request, "petType").toLowerCase();
        String lastDate = value(request, "lastDate");

        LocalDate date;
        try {
            date = LocalDate.parse(lastDate);
        } catch (Exception e) {
            return "Please enter the last vaccination date. I will calculate the next reminder from that.";
        }

        int intervalMonths = petType.contains("puppy") || petType.contains("kitten") ? 1 : 12;
        LocalDate next = date.plusMonths(intervalMonths);
        long days = ChronoUnit.DAYS.between(LocalDate.now(), next);

        String urgency;
        if (days < 0) {
            urgency = "Overdue by " + Math.abs(days) + " days. Please book a vet appointment soon.";
        } else if (days <= 14) {
            urgency = "Due soon in " + days + " days. Good time to schedule the appointment.";
        } else {
            urgency = "Next reminder is in " + days + " days.";
        }

        return "Smart Vaccination Reminder: " + petName + "'s next suggested vaccination date is " + next
                + ". " + urgency + " Keep rabies, DHPP/7-in-1 for dogs, and FVRCP/rabies for cats in your vet card.";
    }

    private String foodRecommendation(HttpServletRequest request) {
        String petType = value(request, "petType").toLowerCase();
        String age = value(request, "age").toLowerCase();
        String need = value(request, "need").toLowerCase();

        String category;
        if (petType.contains("cat")) {
            category = "catfood";
        } else if (petType.contains("fish")) {
            category = "fish";
        } else if (petType.contains("bird")) {
            category = "Birds";
        } else {
            category = "dogfood";
        }

        List<String> products = catalog(category, need, 5);
        String guidance = "Choose age-appropriate portions and introduce new food gradually over 5-7 days.";
        if (age.contains("puppy") || age.contains("kitten") || age.contains("young")) {
            guidance = "Pick starter or growth food with higher protein and smaller kibble.";
        } else if (age.contains("senior") || need.contains("senior")) {
            guidance = "Pick senior-friendly food with digestive and joint support.";
        } else if (need.contains("grain") || need.contains("allergy")) {
            guidance = "Try grain-free or limited-ingredient food and watch for itching, loose stool, or vomiting.";
        }

        return "AI Food Recommendation: " + guidance + " Best catalog matches: " + String.join("; ", products) + ".";
    }

    private String appointmentPrep(HttpServletRequest request) {
        String petType = fallback(value(request, "petType"), "pet");
        String urgency = value(request, "urgency").toLowerCase();
        String symptoms = fallback(value(request, "symptoms"), "the symptoms you noticed");

        ArrayList<String> steps = new ArrayList<>();
        steps.add("AI Appointment Prep: Book a vet visit for your " + petType + " and mention: " + symptoms + ".");
        steps.add("Carry vaccination records, current medicines, food details, and clear photos/videos of the symptom.");
        steps.add("Before the visit, note appetite, water intake, stool/urine changes, temperature if available, and when symptoms started.");

        if (urgency.contains("emergency")) {
            steps.add("Emergency warning: breathing trouble, bleeding, seizures, repeated vomiting, collapse, or poisoning signs need immediate veterinary care.");
        } else if (urgency.contains("today")) {
            steps.add("Try to book a same-day slot and avoid giving human medicines unless a vet tells you.");
        } else {
            steps.add("For a normal appointment, monitor the symptom and keep the pet comfortable until the scheduled slot.");
        }

        return String.join(" ", steps);
    }

    private List<String> catalog(String category, String need, int limit) {
        ArrayList<String> products = new ArrayList<>();
        String sql = "SELECT p_name, p_cost FROM products WHERE p_category = ? "
                + "AND (LOWER(p_name) LIKE ? OR ? = '') "
                + "ORDER BY p_cost LIMIT ?";
        String term = need == null ? "" : need.trim().toLowerCase();
        String like = "%" + term + "%";

        try (Connection con = Db.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, category);
            ps.setString(2, like);
            ps.setString(3, term);
            ps.setInt(4, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(rs.getString("p_name") + " (Rs. " + rs.getInt("p_cost") + ")");
                }
            }
        } catch (Exception e) {
            products.addAll(defaultCatalog(category, limit));
        }

        if (products.isEmpty()) {
            products.addAll(defaultCatalog(category, limit));
        }
        return products;
    }

    private List<String> defaultCatalog(String category, int limit) {
        String[] items;
        if ("catfood".equals(category)) {
            items = new String[] {
                    "Whiskas Cat Food (Rs. 699)",
                    "Royal Canin Kitten Food (Rs. 1299)",
                    "Me-O Tuna Cat Food (Rs. 499)",
                    "Sheba Wet Cat Food (Rs. 349)",
                    "Senior Cat Digestive Food (Rs. 899)" };
        } else if ("fish".equals(category)) {
            items = new String[] {
                    "Betta Fish Pellets (Rs. 199)",
                    "Goldfish Flakes (Rs. 249)",
                    "Tropical Fish Food (Rs. 299)",
                    "Weekend Feeder Block (Rs. 149)",
                    "Aquarium Mineral Food (Rs. 349)" };
        } else if ("Birds".equals(category)) {
            items = new String[] {
                    "Parrot Seed Mix (Rs. 299)",
                    "Budgie Millet Spray (Rs. 199)",
                    "Cockatiel Nutrition Mix (Rs. 349)",
                    "Calcium Cuttle Bone (Rs. 149)",
                    "Fruit Bird Treats (Rs. 249)" };
        } else {
            items = new String[] {
                    "Pedigree Adult Dog Food (Rs. 799)",
                    "Grain Zero Dog Food (Rs. 999)",
                    "Active Dog Protein Meal (Rs. 1199)",
                    "Senior Dog Care Food (Rs. 1099)",
                    "Chicken Puppy Kibble (Rs. 649)" };
        }

        ArrayList<String> products = new ArrayList<>();
        for (int i = 0; i < items.length && i < limit; i++) {
            products.add(items[i]);
        }
        return products;
    }

    private static String value(HttpServletRequest request, String key) {
        String value = request.getParameter(key);
        return value == null ? "" : value.trim();
    }

    private static String fallback(String value, String fallback) {
        return value == null || value.isBlank() ? fallback : value;
    }

    private static String escapeJson(String value) {
        return value.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n")
                .replace("\t", "\\t");
    }
}
