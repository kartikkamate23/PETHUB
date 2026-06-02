package com.MVC.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.MVC.Config.Db;

import jakarta.servlet.http.HttpSession;

public class Appointment {
	private Connection con;
	HttpSession se;
	public Appointment(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = Db.getConnection();
			se=session;
			new DoctorService();
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
	public String addPatient(String name,String phone,String date,String disease) {
		return addPatient(name, phone, date, disease, 0, "", "");
	}
	public String addPatient(String name,String phone,String date,String disease,int doctorId,String petType,String appointmentTime) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM patient WHERE phone=? and appointment_date=? and doctor_id=? and appointment_time=?";
		try {
			ResultSet rs = null;
			ps=con.prepareStatement(query);
			ps.setString(1, phone);
			ps.setString(2, date);
			ps.setInt(3, doctorId);
			ps.setString(4, appointmentTime);
			rs=ps.executeQuery();
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into patient (p_name, phone, appointment_date, disease, doctor_id, pet_type, appointment_time, status) values(?,?,?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, date);
				ps.setString(4, disease);
				ps.setInt(5, doctorId);
				ps.setString(6, petType);
				ps.setString(7, appointmentTime);
				ps.setString(8, "Booked");
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	public ArrayList<AppointmentPojo> getAppinfo(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<AppointmentPojo> al = new ArrayList<>();
		try {
		    String query = "select p.*, d.doctor_name from patient p left join pethub_doctors d on p.doctor_id = d.doctor_id order by p.appointment_date desc";
		    ps = con.prepareStatement(query);
		   
		    rs = ps.executeQuery();
		    while (rs.next()) {
		        AppointmentPojo a = new AppointmentPojo();
		        a.setP_name(rs.getString("p_name"));
		        a.setPhone(rs.getString("phone"));
		        a.setDate(rs.getDate("appointment_date"));
		        a.setDisease(rs.getString("disease"));
		        a.setDoctorId(rs.getInt("doctor_id"));
		        a.setDoctorName(rs.getString("doctor_name"));
		        a.setPetType(rs.getString("pet_type"));
		        a.setAppointmentTime(rs.getString("appointment_time"));
		        a.setStatus(rs.getString("status"));
		        al.add(a);
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    if (ps != null) {
		        try {
		            ps.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		}
		return al;
	}
	

}
