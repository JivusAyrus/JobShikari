package com.JobShikari.create_job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CreateJobDAO {
	
	

	public static int addJobApplication(JobModel jmod) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			String[] fieldArray = { jmod.getCompany_name(),jmod.getJob_title(), jmod.getLocation(), jmod.getGender(), jmod.getQualification(),
					jmod.getSalary(), jmod.getExperience(), jmod.getJob_type(), jmod.getIndustry(), jmod.getJob_resp(),
					jmod.getSkills(), jmod.getBenefits(), jmod.getJob_desc(), jmod.getLang_req(),jmod.getDate() };
			PreparedStatement pst = con.prepareStatement(
					"insert into js_schema.job_app(company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			for (int i = 0; i < 15; i++) {
				pst.setString(i + 1, fieldArray[i]);
			}

			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static List<JobModel> getAllJobs() {
		List<JobModel> jobs = new ArrayList<JobModel>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			Statement smt = con.createStatement();

			ResultSet rs = smt.executeQuery(
					"select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app");
			JobModel job;
			while (rs.next()) {
				job = new JobModel();
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
				job.setDate(rs.getDate("date_posted").toString());

				jobs.add(job);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobs;
	}

	public static List<JobModel> getJobsBasedOnSkills(String interests[]) {
		List<JobModel> jobs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			String initialQuery = "select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where skills_req like ? ";
			String finalQuery = generateEmployeeInterestQuery(initialQuery,interests);
			PreparedStatement pst = con.prepareStatement(finalQuery);
			for(int i=0;i<interests.length;i++)
			{
				pst.setString(i+1, "%"+interests[i]+"%");
			}
			
			ResultSet rs = pst.executeQuery();
			JobModel job;
			jobs = new ArrayList<JobModel>();
			while (rs.next()) {
				job = new JobModel();
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
				job.setDate(rs.getDate("date_posted").toString());

				jobs.add(job);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobs;
	}

	private static String generateEmployeeInterestQuery(String initialQuery,String[] interestArray) {
		StringBuilder sb = new StringBuilder(initialQuery);
		for(int i=1;i<interestArray.length;i++)
		{
		    
		    sb.append("OR skills_req like ? ");
		}
		return new String(sb);
	}
	
	public static List<JobModel> getJobsBasedOnLocation(String location){
		List<JobModel> jobs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement("select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where location like ?");
			pst.setString(1, "%"+location+"%");
			ResultSet rs = pst.executeQuery();
			JobModel job;
			jobs = new ArrayList<JobModel>();
			while (rs.next()) {
				job = new JobModel();
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
				job.setDate(rs.getDate("date_posted").toString());

				jobs.add(job);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jobs;
	}

	public static JobModel getJobById(String id) {
		
		JobModel job = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement("select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted from js_schema.job_app where id = ?");
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				job = new JobModel();
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
				job.setDate(rs.getDate("date_posted").toString());


			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return job;
	}

	public static int addApplicant(int employeeId, int jobId) {
		int result = 0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement(
					"UPDATE js_schema.job_app SET applicant = concat(applicant,?) WHERE id = ?");
			pst.setString(1, employeeId+",");
			pst.setInt(2, jobId);
			System.out.println(pst.toString());
			result = pst.executeUpdate();
			System.out.println("APPLICANT UPDATED!");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static List<JobModel> getJobsBasedOnCompanyName(String company_name)
	{
		List<JobModel> jobs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/js_schema", "root", "root");
			PreparedStatement pst = con.prepareStatement("select id,company_name,job_title,location,gender,qualification,salary,experience,job_type,industry,job_resp,skills_req,benefits,job_desc,lang_req,date_posted,applicant from js_schema.job_app where company_name = ?");
			pst.setString(1, company_name);
			ResultSet rs = pst.executeQuery();
			JobModel job;
			jobs = new ArrayList<JobModel>();
			while (rs.next()) {
				job = new JobModel();
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
				job.setDate(rs.getDate("date_posted").toString());
				job.setApplicant(rs.getString("applicant"));

				jobs.add(job);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobs;
	}
}
