package com.MVC.Model;

import java.sql.Date;

public class AppointmentPojo {
private String p_name;
private String phone;
private Date date;
private String disease;
private int doctorId;
private String doctorName;
private String petType;
private String appointmentTime;
private String status;
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getDisease() {
	return disease;
}
public void setDisease(String disease) {
	this.disease = disease;
}
public int getDoctorId() {
	return doctorId;
}
public void setDoctorId(int doctorId) {
	this.doctorId = doctorId;
}
public String getDoctorName() {
	return doctorName;
}
public void setDoctorName(String doctorName) {
	this.doctorName = doctorName;
}
public String getPetType() {
	return petType;
}
public void setPetType(String petType) {
	this.petType = petType;
}
public String getAppointmentTime() {
	return appointmentTime;
}
public void setAppointmentTime(String appointmentTime) {
	this.appointmentTime = appointmentTime;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
}
