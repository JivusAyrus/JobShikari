package com.JobShikari.employeeRegistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.JobShikari.create_job.CreateJobDAO;
import com.JobShikari.create_job.JobModel;

public class EmployeeDAO {

	public static int addEmployeeRegister(EmployeeModel emod) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"insert into js_schema.employee_reg(fname,lname,email,phone,password,dob,interests,experience,gender,prev_comp,qualification) values(?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, emod.getFname());
			pst.setString(2, emod.getLname());
			pst.setString(3, emod.getEmail());
			pst.setString(4, emod.getPhone());
			pst.setString(5, emod.getPassword());
			pst.setString(6, emod.getDob());
			pst.setString(7, emod.getInterests());
			pst.setString(8, emod.getExperience());
			pst.setString(9, emod.getGender());
			pst.setString(10, emod.getPrev_comp());
			pst.setString(11, emod.getQualification());
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
					.prepareStatement("UPDATE js_schema.employee_reg SET password = ? WHERE email = ?");
			pst.setString(1, newPass);
			pst.setString(2, email_to_be_updated);
			result = pst.executeUpdate();
			System.out.println("PASSWORD UPDATED");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static String isValidate(String email, String password) {
		String name = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con
					.prepareStatement("select fname from js_schema.employee_reg where email=? AND password=?");
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				name = rs.getString("fname");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	public static EmployeeModel getEmployeeDetails(String email) {
		EmployeeModel u = new EmployeeModel();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			Statement smt = con.createStatement();
			PreparedStatement pst = con.prepareStatement(
					"select id,fname,lname,email,phone,dob,interests,experience,gender,prev_comp,qualification from js_schema.employee_reg where email = ?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

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
				u.setId(rs.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	public static List<JobModel> getJobsBasedOnInterest(String interests) {
		List<JobModel> resultJobList = null;

		String[] interestsArray = interests.split(",");
		resultJobList = new ArrayList<JobModel>();
		resultJobList.addAll(CreateJobDAO.getJobsBasedOnSkills(interestsArray));

		return resultJobList;

	}

	public static List<JobModel> getJobsBasedOnLoc(String loc) {
		List<JobModel> resultJobList = null;
		resultJobList = new ArrayList<JobModel>();
		resultJobList.addAll(CreateJobDAO.getJobsBasedOnLocation(loc));
		return resultJobList;
	}

	public static int addJobApp(int jobId, int employeeId) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"UPDATE js_schema.employee_reg SET job_app_id = concat(job_app_id,?) WHERE id = ?");
			pst.setString(1, jobId + ",");
			pst.setInt(2, employeeId);
			result = pst.executeUpdate();
			System.out.println("JOB APPLICATION UPDATED");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static String getJobCSV(int id) {
		String csv = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			Statement smt = con.createStatement();
			PreparedStatement pst = con.prepareStatement("select id,fname,lname,email,phone,dob,interests,experience,gender,prev_comp,qualification from js_schema.employee_reg where id = ?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

				csv = rs.getString("job_app_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return csv;
	}

	public static List<EmployeeModel> getEmployeesBasedOnIdArray(String[] ids) {
		List<EmployeeModel> employees = null;
		employees = new ArrayList<EmployeeModel>();
		for (String id : ids) {
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
				Statement smt = con.createStatement();
				PreparedStatement pst = con
						.prepareStatement("select * from js_schema.employee_reg where id = ?");
				pst.setInt(1, Integer.parseInt(id));
				ResultSet rs = pst.executeQuery();
				EmployeeModel u = new EmployeeModel();
				while (rs.next()) {

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
					u.setId(rs.getInt("id"));
					employees.add(u);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return employees;
	}

}
