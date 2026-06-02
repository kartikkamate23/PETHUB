package com.MVC.Model;

public class Dproduct {
	String p_id;
	String p_name;
	String p_image;
	double p_cost;
	String p_details;
	String p_category;

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getp_id() {
		return p_id;
	}

	public String getp_image() {
		return p_image;
	}
	public String getp_name() {
		return p_name;
	}


	public String getp_details() {
		return p_details;
	}

	public void setp_id(String p_id) {
		this.p_id = p_id;
	}

	public void setp_image(String p_image) {
		this.p_image = p_image;
	}
	public void setp_name(String p_name) {
		this.p_name = p_name;
	}


	public double getP_cost() {
		return p_cost;
	}

	public void setP_cost(double p_cost) {
		this.p_cost = p_cost;
	}

	public void setp_details(String p_details) {
		this.p_details= p_details;
	}
}
