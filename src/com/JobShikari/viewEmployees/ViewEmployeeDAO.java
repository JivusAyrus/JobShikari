package com.JobShikari.viewEmployees;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.JobShikari.employeeRegistration.EmployeeModel;


public class ViewEmployeeDAO {
	
	public static List<EmployeeModel> getAllEmployees()
	{
		List<EmployeeModel> userList = new ArrayList<EmployeeModel>();		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema","root","root");
			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select fname,lname,email,phone,dob,interests,experience,gender,prev_comp,qualification from js_schema.employee_reg");
			while(rs.next())
			{
				EmployeeModel u = new EmployeeModel();
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setDob(rs.getString("dob"));
				u.setInterests(rs.getString("interests"));
				u.setExperience(rs.getString("experience"));
				u.setGender(rs.getString("gender"));
				u.setPrev_comp(rs.getString("prev_comp"));
				u.setQualification(rs.getString("qualification"));
				userList.add(u);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return userList;
	}
	
	public static List<EmployeeModel> getEmployeesBySearch(String name)
	{
		List<EmployeeModel> employeeList = new ArrayList<EmployeeModel>();		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema","root","root");
			Statement smt = con.createStatement();
			PreparedStatement pst = con.prepareStatement("select fname,lname,email,phone,dob,interests,experience,gender,prev_comp,qualification from js_schema.employee_reg where fname like ?");
			pst.setString(1,"%"+name+"%");
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				EmployeeModel u = new EmployeeModel();
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setDob(rs.getString("dob"));
				u.setInterests(rs.getString("interests"));
				u.setExperience(rs.getString("experience"));
				u.setGender(rs.getString("gender"));
				u.setPrev_comp(rs.getString("prev_comp"));
				u.setQualification(rs.getString("qualification"));
				employeeList.add(u);			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return employeeList;
		
	}
	
	

}
