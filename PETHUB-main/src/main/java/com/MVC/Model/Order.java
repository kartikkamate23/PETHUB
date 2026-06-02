package com.MVC.Model;

public class Order {
	 int oid;
	    String c_id;
	    String status;
	    String p_image;
	    String c_name;
	    String c_cost;
	    String quantity;


		public String getp_image() {
	        return p_image;
	    }

	    public String getQuantity() {
			return quantity;
		}

		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}

		public String getstatus() {
	        return status;
	    }

	    public String getc_cost() {
	        return c_cost;
	    }

	    public int getoid() {
	        return oid;
	    }
	        public String getc_id() {
	        return c_id;
	    }
	         public String getc_name() {
	        return c_name;
	    }

	    public void setoid(int oid) {
	        this.oid = oid;
	    }
	        public void setc_id(String c_id) {
	        this.c_id = c_id;
	    }
	         public void setstatus(String status) {
	        this.status = status;
	    }

	    public void setp_image(String p_image) {
	        this.p_image = p_image;
	    }

	    public void setc_name(String c_name) {
	        this.c_name = c_name;
	    }

	    public void setc_cost(String c_cost) {
	        this.c_cost = c_cost;
	    }
}
