package com.MVC.Model;

public class adminOrder {
	String c_id;
	String c_cost;
	String usname;
	String order_address;
	String order_city;
	String order_state;
	String status;
	String order_id;

	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getstatus() {
		return status;
	}
	public String getc_id() {
		return c_id;
	}


	public String getc_cost() {
		return c_cost;
	}
	public String getusname() {
		return usname;
	}
	public String getorder_address() {
		return order_address;
	}
	public String getorder_city() {
		return order_city;
	}
	public String getorder_state() {
		return order_state;
	}



	public void setstatus(String status) {
		this.status = status;
	}

	public void setc_cost(String c_cost) {
		this.c_cost= c_cost;
	} 
	public void setusname(String usname) {
		this.usname= usname;
	} 
	public void setorder_address(String order_address) {
		this.order_address= order_address;
	} 
	public void setorder_city(String order_city) {
		this.order_city=order_city;
	} 
	public void setorder_state(String order_state) {
		this.order_state= order_state;
	} 
	public void setc_id(String c_id) {
		this.c_id= c_id;
	} 

}
