package com.MVC.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.MVC.Config.Db;

import jakarta.servlet.http.HttpSession;


public class Admin {
	private Connection con;
	HttpSession se;
	public Admin(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = Db.getConnection();
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String login(String email,String pass) {
		String status1="" ,id="";
		String uname="" ,emails="";
		String query="SELECT * FROM ADMIN WHERE admin_email='"+email +"'and admin_pw='"+pass+"';";

		try {
		Statement st=null;
		ResultSet rs=null;
		st=con.createStatement();
		rs=st.executeQuery(query);
		boolean b=rs.next();
		if(b==true) {
			id=rs.getString("adminid");
			emails=rs.getString("admin_email");
			se.setAttribute("id", id);
			
			status1="success";
			
		}
		else {
			status1="failure";
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status1;
		
	}
	
	public int acceptorder(int order_id) {
	    int status = 0;
	    String query = "UPDATE orders SET status = 'Shipped' WHERE order_id = ?";
 try (PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, order_id);  // Setting the order_id to the query
	        status = pst.executeUpdate();  // Executing the update
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	public int cancelOrder(int order_id) {
	    int status = 0;
	    String query = "UPDATE orders SET status = 'Cancelled' WHERE order_id = ?";

	    try (PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, order_id);  // Set the order_id to the query parameter
	        status = pst.executeUpdate();  // Execute the update query
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}


    public ArrayList<adminOrder> getorderdata() {
    	Statement st = null;
    	ResultSet rs = null;
        ArrayList<adminOrder> al = new ArrayList<adminOrder>();
        try {
            st = con.createStatement();
            String qry = "select * from orders;";

            rs = st.executeQuery(qry);
            while (rs.next()) {
                adminOrder p = new adminOrder();
                p.setOrder_id(rs.getString("order_id"));
                p.setusname(rs.getString("usname"));
                p.setc_id(rs.getString("c_id"));
                p.setc_cost(rs.getString("c_cost"));
                p.setorder_address(rs.getString("order_address"));
                p.setorder_city(rs.getString("order_city"));
                p.setorder_state(rs.getString("order_state"));
                p.setstatus(rs.getString("status"));
                al.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    public Dproduct get_product_by_id(String p_id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Dproduct product = null;

        try {
            
            String sql = "SELECT p_id, p_name, p_image, p_cost,p_details,p_category FROM products WHERE p_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, p_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                product = new Dproduct();
                product.setp_id(rs.getString("p_id"));
                product.setp_name(rs.getString("p_name"));
                product.setp_image(rs.getString("p_image"));
                product.setP_cost(rs.getDouble("p_cost"));
                product.setP_category(rs.getString("p_category"));
                product.setp_details(rs.getString("p_details"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return product;
    }
    
   public void updateProductDetails(Product product) {
            try  {
                String sql = "UPDATE productdetails SET p_name = ?, p_image = ?, p_cost = ?, p_category = ?, p_details = ?, p_info = ?, p_image1 = ?, p_image2 = ? WHERE p_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, product.getP_name());
                ps.setString(2, product.getP_image());
                ps.setString(3, product.getP_cost());
                ps.setString(4, product.getP_category());
                ps.setString(5, product.getP_details());
                ps.setString(6, product.getP_info());
                ps.setString(7, product.getP_image1());
                ps.setString(8, product.getP_image2());
                ps.setString(9, product.getP_id());

                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
   public String addProductDetails(String pid,String p_name,String image,String image1,String image2,String cost,String category,String details,
		   String info){
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM productdetails WHERE p_id='"+pid+ "';";
		try {
			Statement st = null;
			ResultSet rs = null;
			st=con.createStatement();
			rs=st.executeQuery(query);
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into productdetails values(?,?,?,?,?,?,?,?,?)");
				ps.setString(1, pid);
				ps.setString(5, p_name);
				ps.setString(2, image);
				ps.setString(3, image1);
				ps.setString(4, image2);
				ps.setString(6, cost);
				
				ps.setString(7, details);
				ps.setString(8, category);
				ps.setString(9, info);
				
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
    }



