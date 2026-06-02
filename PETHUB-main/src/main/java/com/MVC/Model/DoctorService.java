package com.MVC.Model;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.MVC.Config.Db;

public class DoctorService {
    private static final String TABLE = "pethub_doctors";

    public DoctorService() {
        ensureSchema();
    }

    public String saveDoctor(Doctor doctor, boolean selfRegistration) {
        String sql = "INSERT INTO " + TABLE + " (doctor_name, email, phone, specialization, experience, availability, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE doctor_name = VALUES(doctor_name), phone = VALUES(phone), "
                + "specialization = VALUES(specialization), experience = VALUES(experience), "
                + "availability = VALUES(availability), status = VALUES(status)";
        try (Connection con = Db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, doctor.getName());
            ps.setString(2, doctor.getEmail());
            ps.setString(3, doctor.getPhone());
            ps.setString(4, doctor.getSpecialization());
            ps.setString(5, doctor.getExperience());
            ps.setString(6, doctor.getAvailability());
            ps.setString(7, selfRegistration ? "Pending" : doctor.getStatus());
            return ps.executeUpdate() > 0 ? "success" : "failure";
        } catch (SQLException e) {
            e.printStackTrace();
            return "failure";
        }
    }

    public String updateStatus(int doctorId, String status) {
        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE " + TABLE + " SET status = ? WHERE doctor_id = ?")) {
            ps.setString(1, status);
            ps.setInt(2, doctorId);
            return ps.executeUpdate() > 0 ? "success" : "failure";
        } catch (SQLException e) {
            e.printStackTrace();
            return "failure";
        }
    }

    public String deleteDoctor(int doctorId) {
        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM " + TABLE + " WHERE doctor_id = ?")) {
            ps.setInt(1, doctorId);
            return ps.executeUpdate() > 0 ? "success" : "failure";
        } catch (SQLException e) {
            e.printStackTrace();
            return "failure";
        }
    }

    public ArrayList<Doctor> getDoctors(boolean activeOnly) {
        ArrayList<Doctor> doctors = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE + (activeOnly ? " WHERE status = 'Active'" : "")
                + " ORDER BY FIELD(status, 'Active', 'Pending', 'Inactive'), doctor_name";
        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                doctors.add(mapDoctor(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }

    public Doctor getDoctor(int doctorId) {
        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM " + TABLE + " WHERE doctor_id = ?")) {
            ps.setInt(1, doctorId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapDoctor(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Doctor getDoctorByEmail(String email) {
        try (Connection con = Db.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM " + TABLE + " WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapDoctor(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Doctor mapDoctor(ResultSet rs) throws SQLException {
        Doctor doctor = new Doctor();
        doctor.setId(rs.getInt("doctor_id"));
        doctor.setName(rs.getString("doctor_name"));
        doctor.setEmail(rs.getString("email"));
        doctor.setPhone(rs.getString("phone"));
        doctor.setSpecialization(rs.getString("specialization"));
        doctor.setExperience(rs.getString("experience"));
        doctor.setAvailability(rs.getString("availability"));
        doctor.setStatus(rs.getString("status"));
        return doctor;
    }

    private void ensureSchema() {
        try (Connection con = Db.getConnection(); Statement st = con.createStatement()) {
            st.executeUpdate("CREATE TABLE IF NOT EXISTS " + TABLE + " ("
                    + "doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,"
                    + "doctor_name VARCHAR(120) NOT NULL,"
                    + "email VARCHAR(150) NOT NULL UNIQUE,"
                    + "phone VARCHAR(20) NOT NULL,"
                    + "specialization VARCHAR(120) NOT NULL,"
                    + "experience VARCHAR(80) NOT NULL,"
                    + "availability VARCHAR(150) NOT NULL,"
                    + "status VARCHAR(30) NOT NULL DEFAULT 'Active',"
                    + "created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP"
                    + ")");
            seedDoctors(con);
            addPatientColumn(con, "doctor_id", "INT NULL");
            addPatientColumn(con, "pet_type", "VARCHAR(60) NULL");
            addPatientColumn(con, "appointment_time", "VARCHAR(20) NULL");
            addPatientColumn(con, "status", "VARCHAR(30) NOT NULL DEFAULT 'Booked'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void seedDoctors(Connection con) throws SQLException {
        String sql = "INSERT INTO " + TABLE + " (doctor_name, email, phone, specialization, experience, availability, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'Active') ON DUPLICATE KEY UPDATE status = 'Active'";
        String[][] doctors = {
                {"Dr. Ananya Sharma", "ananya.vet@pethub.local", "9000011111", "Dog and Cat Physician", "8 years", "Mon-Sat, 10 AM - 5 PM"},
                {"Dr. Rohan Mehta", "rohan.exotics@pethub.local", "9000022222", "Birds and Small Pets", "6 years", "Tue-Sun, 11 AM - 4 PM"},
                {"Dr. Priya Nair", "priya.derma@pethub.local", "9000033333", "Skin, Dental and Grooming Care", "7 years", "Mon-Fri, 12 PM - 7 PM"}
        };
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            for (String[] row : doctors) {
                ps.setString(1, row[0]);
                ps.setString(2, row[1]);
                ps.setString(3, row[2]);
                ps.setString(4, row[3]);
                ps.setString(5, row[4]);
                ps.setString(6, row[5]);
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    private void addPatientColumn(Connection con, String column, String definition) throws SQLException {
        DatabaseMetaData meta = con.getMetaData();
        try (ResultSet rs = meta.getColumns(null, null, "patient", column)) {
            if (!rs.next()) {
                try (Statement st = con.createStatement()) {
                    st.executeUpdate("ALTER TABLE patient ADD COLUMN " + column + " " + definition);
                }
            }
        }
    }
}
