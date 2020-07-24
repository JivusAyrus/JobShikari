package com.JobShikari.companyRegistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

public class EmployerDAO {

	public static int addEmployerRegister(EmployerModel emod) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			String[] fieldArray = { emod.getCompany_name(), emod.getUsername(), emod.getEmail(), emod.getOffice_no(),
					emod.getPassword(), emod.getIndustry_type(), emod.getOffice_address(), emod.getCity(),
					emod.getState(), emod.getCountry(), emod.getGst() };
			PreparedStatement pst = con.prepareStatement(
					"insert into js_schema.employer_reg(company_name,username,email,office_no,password,industry_type,office_address,city,state,country,gst) values(?,?,?,?,?,?,?,?,?,?,?)");
			for (int i = 0; i < 11; i++) {
				pst.setString(i + 1, fieldArray[i]);
			}
			result = pst.executeUpdate();
		}

		/* Catches unique email exception first and then a general exception */
		catch (SQLIntegrityConstraintViolationException e) {
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static int updatePassword(String newPass, String email_to_be_updated) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con
					.prepareStatement("UPDATE js_schema.employer_reg SET password = ? WHERE email = ?");
			pst.setString(1, newPass);
			pst.setString(2, email_to_be_updated);
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static String isValidate(String email, String password) {
		String company_name = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con
					.prepareStatement("select company_name from js_schema.employer_reg where email=? AND password=?");
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				company_name = rs.getString("company_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return company_name;
	}
	
	public static EmployerModel getEmployerByEmail(String email)
	{
		EmployerModel emod = null;
		try {
			emod = new EmployerModel();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement("select company_name,username,email,office_no,password,industry_type,office_address,city,state,country,gst from js_schema.employer_reg where email=?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				emod.setCompany_name(rs.getString("company_name"));
				emod.setUsername(rs.getString("username"));
				emod.setEmail(rs.getString("email"));
				emod.setOffice_no(rs.getString("office_no"));
				emod.setPassword(rs.getString("password"));
				emod.setIndustry_type(rs.getString("industry_type"));
				emod.setOffice_address(rs.getString("office_address"));
				emod.setCity(rs.getString("city"));
				emod.setState(rs.getString("state"));
				emod.setCountry(rs.getString("country"));
				emod.setGst(rs.getString("gst"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emod;
	}
}
