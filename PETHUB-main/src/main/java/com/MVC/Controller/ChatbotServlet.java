package com.MVC.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.MVC.Config.AppConfig;
import com.MVC.Config.Db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    private static final String OPENAI_MODEL = "gpt-5.4-mini";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userMessage = request.getParameter("message");
        String botResponse = getAssistantResponse(userMessage);

        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.write("{\"response\":\"" + escapeJson(botResponse) + "\"}");
        }
    }

    private String getAssistantResponse(String message) {
        if (message == null || message.isBlank()) {
            return "Ask me about dog food, cat accessories, grooming, treats, fish food, bird supplies, appointments, orders, or pet-care tips.";
        }

        String apiKey = AppConfig.openAiApiKey();
        if (!apiKey.isBlank()) {
            try {
                return callOpenAi(message, apiKey);
            } catch (Exception e) {
                return localAssistant(message) + " I could not reach the online AI service right now, so I answered from the local PetHub catalog.";
            }
        }

        return localAssistant(message);
    }

    private String callOpenAi(String message, String apiKey) throws IOException {
        String catalog = String.join("; ", topCatalogItems(message, 8));
        String instructions = "You are PetHub's friendly shopping and pet-care assistant. "
                + "Answer briefly. Recommend relevant catalog items when useful. "
                + "For medical symptoms, suggest booking a vet appointment instead of diagnosing.";

        String input = instructions + "\nCatalog context: " + catalog + "\nUser: " + message;
        String payload = "{\"model\":\"" + OPENAI_MODEL + "\",\"input\":\"" + escapeJson(input) + "\"}";

        HttpURLConnection conn = (HttpURLConnection) new URL("https://api.openai.com/v1/responses").openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + apiKey);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(payload.getBytes(StandardCharsets.UTF_8));
        }

        int status = conn.getResponseCode();
        if (status < 200 || status >= 300) {
            throw new IOException("OpenAI API returned status " + status);
        }

        String body = new String(conn.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        String output = extractJsonString(body, "output_text");
        if (output.isBlank()) {
            output = extractJsonString(body, "text");
        }
        return output.isBlank() ? localAssistant(message) : output;
    }

    private String localAssistant(String message) {
        String normalized = message.toLowerCase();

        if (normalized.contains("appointment") || normalized.contains("vet")
                || normalized.contains("doctor") || normalized.contains("sick")) {
            return "You can book a vet appointment from Health Assistance > Book Appointment. If your pet is very weak, vomiting repeatedly, bleeding, or breathing heavily, contact a vet urgently.";
        }

        if (normalized.contains("cart") || normalized.contains("order") || normalized.contains("checkout")) {
            return "To order: open a product category, add items to cart, go to the cart icon, then proceed to checkout. You can track or cancel active orders from My Orders.";
        }

        List<String> products = topCatalogItems(message, 5);
        if (!products.isEmpty()) {
            return "Here are good matches from the PetHub catalog: " + String.join("; ", products)
                    + ". Open the matching category page, choose quantity, and add it to cart.";
        }

        if (normalized.contains("dog")) {
            return "For dogs, try Dog Food for daily meals, Accessories for toys/collars, Grooming for coat care, and Treats for rewards.";
        }
        if (normalized.contains("cat")) {
            return "For cats, try Cat Food, Litter and Accessories, Grooming tools, and Cat Treats. Keep fresh water available with dry food.";
        }
        if (normalized.contains("fish")) {
            return "For fish, use small portions of flakes or species-specific feed and avoid overfeeding. Check the Fish category for available food.";
        }
        if (normalized.contains("bird")) {
            return "For birds, seed mixes are useful, but add variety with safe fruits or greens. Check the Birds category for food options.";
        }

        return "I can help with product recommendations, cart and order steps, appointment booking, and basic pet-care guidance. Try asking: 'best dog food', 'cat grooming', or 'how do I book a vet appointment?'.";
    }

    private List<String> topCatalogItems(String message, int limit) {
        ArrayList<String> items = new ArrayList<>();
        String like = "%" + message.toLowerCase().replaceAll("[^a-z0-9 ]", " ").trim().replace(" ", "%") + "%";
        if (like.equals("%%")) {
            return items;
        }

        String sql = "SELECT p_name, p_cost, p_category FROM products "
                + "WHERE LOWER(p_name) LIKE ? OR LOWER(p_details) LIKE ? OR LOWER(p_category) LIKE ? "
                + "ORDER BY p_category, p_cost LIMIT ?";

        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, like);
            ps.setString(2, like);
            ps.setString(3, like);
            ps.setInt(4, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    items.add(rs.getString("p_name") + " (Rs. " + rs.getInt("p_cost")
                            + ", " + rs.getString("p_category") + ")");
                }
            }
        } catch (Exception e) {
            return items;
        }

        return items;
    }

    private static String extractJsonString(String body, String key) {
        String marker = "\"" + key + "\":\"";
        int start = body.indexOf(marker);
        if (start < 0) {
            return "";
        }
        start += marker.length();
        StringBuilder value = new StringBuilder();
        boolean escaping = false;
        for (int i = start; i < body.length(); i++) {
            char c = body.charAt(i);
            if (escaping) {
                if (c == 'n') {
                    value.append('\n');
                } else if (c == 't') {
                    value.append('\t');
                } else {
                    value.append(c);
                }
                escaping = false;
            } else if (c == '\\') {
                escaping = true;
            } else if (c == '"') {
                break;
            } else {
                value.append(c);
            }
        }
        return value.toString();
    }

    private static String escapeJson(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n")
                .replace("\t", "\\t");
    }
}
