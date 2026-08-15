package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Admin;
import util.DBConnection;

public class AdminDAO {
	public boolean validate(Admin admin) {
	    try {
	        Connection con = DBConnection.getConnection();

	        System.out.println("Connection = " + con);

	        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, admin.getUsername().trim());
	        ps.setString(2, admin.getPassword().trim());

	        System.out.println("Username = " + admin.getUsername());
	        System.out.println("Password = " + admin.getPassword());

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            System.out.println("Login Successful");
	            return true;
	        } else {
	            System.out.println("No Record Found");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}}



