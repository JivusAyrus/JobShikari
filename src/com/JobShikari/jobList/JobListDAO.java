package com.JobShikari.jobList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.JobShikari.create_job.JobModel;

public class JobListDAO {
	public static List<JobModel> getAllJobs() {
		List<JobModel> jobList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req from js_schema.job_app");
			while (rs.next()) {
				JobModel job = new JobModel();
				job.setCompany_name(rs.getString("company_name"));
				job.setJob_title(rs.getString("job_title"));
				job.setLocation(rs.getString("location"));
				job.setGender(rs.getString("gender"));
				job.setQualification(rs.getString("qualification"));
				job.setSalary(rs.getString("salary"));
				job.setExperience(rs.getString("experience"));
				job.setJob_type(rs.getString("job_type"));
				job.setIndustry(rs.getString("industry"));
				job.setJob_resp(rs.getString("job_resp"));
				job.setSkills(rs.getString("skills_req"));
				job.setBenefits(rs.getString("benefits"));
				job.setJob_desc(rs.getString("job_desc"));
				job.setLang_req(rs.getString("lang_req"));
				job.setId(rs.getString("id"));
				jobList.add(job);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobList;
	}

	public static List<JobModel> getAllJobsBySearch(String searchQuery) {
		List<JobModel> jobList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where company_name like ? OR job_title like ?");
			pst.setString(1, "%" + searchQuery + "%");
			pst.setString(2, "%" + searchQuery + "%");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				JobModel job = new JobModel();
				job.setId(rs.getString("id"));
				job.setCompany_name(rs.getString("company_name"));
				job.setJob_title(rs.getString("job_title"));
				job.setLocation(rs.getString("location"));
				job.setGender(rs.getString("gender"));
				job.setQualification(rs.getString("qualification"));
				job.setSalary(rs.getString("salary"));
				job.setExperience(rs.getString("experience"));
				job.setJob_type(rs.getString("job_type"));
				job.setIndustry(rs.getString("industry"));
				job.setJob_resp(rs.getString("job_resp"));
				job.setSkills(rs.getString("skills_req"));
				job.setBenefits(rs.getString("benefits"));
				job.setJob_desc(rs.getString("job_desc"));
				job.setLang_req(rs.getString("lang_req"));
				job.setLang_req(rs.getString("date_posted"));
				jobList.add(job);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobList;
	}

	public static List<JobModel> getJobsByFilters(String location, String company_name, String date) {
		List<JobModel> jobList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where location like ? AND company_name like ? AND date_posted >= ?");
			if (!location.isEmpty()) {
				pst.setString(1, "%" + location + "%");
			} else {
				pst.setString(1, "%");
			}
			if (!company_name.isEmpty()) {
				pst.setString(2, "%" + company_name + "%");
			} else {
				pst.setString(2, "%");
			}
			if (!date.isEmpty()) {
				pst.setString(3, date);
			} else {
				pst.setString(3, "0000-00-00");
			}
			System.out.println(pst.toString());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				JobModel job = new JobModel();
				job.setId(rs.getString("id"));
				job.setCompany_name(rs.getString("company_name"));
				job.setJob_title(rs.getString("job_title"));
				job.setLocation(rs.getString("location"));
				job.setGender(rs.getString("gender"));
				job.setQualification(rs.getString("qualification"));
				job.setSalary(rs.getString("salary"));
				job.setExperience(rs.getString("experience"));
				job.setJob_type(rs.getString("job_type"));
				job.setIndustry(rs.getString("industry"));
				job.setJob_resp(rs.getString("job_resp"));
				job.setSkills(rs.getString("skills_req"));
				job.setBenefits(rs.getString("benefits"));
				job.setJob_desc(rs.getString("job_desc"));
				job.setLang_req(rs.getString("lang_req"));
				job.setLang_req(rs.getString("date_posted"));
				jobList.add(job);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobList;
	}

	public static List<JobModel> getJobsByEverything(String searchQuery, String location, String company_name,
			String date) {
		List<JobModel> jobList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where (company_name like ? OR job_title like ?) AND location like ? AND company_name like ? AND date_posted >= ?");
			pst.setString(1, "%" + searchQuery + "%");
			pst.setString(2, "%" + searchQuery + "%");
			if (!location.isEmpty()) {
				pst.setString(3, "%" + location + "%");
			} else {
				pst.setString(3, "%");
			}
			if (!company_name.isEmpty()) {
				pst.setString(4, "%" + company_name + "%");
			} else {
				pst.setString(4, "%");
			}
			if (!date.isEmpty()) {
				pst.setString(5, date);
			} else {
				pst.setString(5, "0000-00-00");
			}

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				JobModel job = new JobModel();
				job.setId(rs.getString("id"));
				job.setCompany_name(rs.getString("company_name"));
				job.setJob_title(rs.getString("job_title"));
				job.setLocation(rs.getString("location"));
				job.setGender(rs.getString("gender"));
				job.setQualification(rs.getString("qualification"));
				job.setSalary(rs.getString("salary"));
				job.setExperience(rs.getString("experience"));
				job.setJob_type(rs.getString("job_type"));
				job.setIndustry(rs.getString("industry"));
				job.setJob_resp(rs.getString("job_resp"));
				job.setSkills(rs.getString("skills_req"));
				job.setBenefits(rs.getString("benefits"));
				job.setJob_desc(rs.getString("job_desc"));
				job.setLang_req(rs.getString("lang_req"));
				job.setLang_req(rs.getString("date_posted"));
				jobList.add(job);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobList;
	}
}
