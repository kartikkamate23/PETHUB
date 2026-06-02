package com.MVC.Model;

public class Cart {
    private String c_id;
    private String c_name;
    private String c_image;
    private String c_cost;
    private String quantity;

    public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	// Constructor
    public Cart(String c_id, String c_name, String c_image, String c_cost,String quantity) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.c_image = c_image;
        this.c_cost = c_cost;
        this.quantity = quantity; 
    }
    public Cart() {
    	
    }

    // Getters and Setters
    public String getc_id() {
        return c_id;
    }

    public void setc_id(String c_id) {
        this.c_id = c_id;
    }

    public String getc_name() {
        return c_name;
    }

    public void setc_name(String c_name) {
        this.c_name = c_name;
    }

    public String getc_image() {
        return c_image;
    }

    public void setc_image(String c_image) {
        this.c_image = c_image;
    }

    public String getc_cost() {
        return c_cost;
    }

    public void setc_cost(String c_cost) {
        this.c_cost = c_cost;
    }

    
    
    public int getTotalCost() {
        return (int) Math.round(Double.parseDouble(c_cost) * Integer.parseInt(quantity));
    }
}
