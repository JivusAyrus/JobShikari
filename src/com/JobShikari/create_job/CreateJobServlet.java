package com.JobShikari.create_job;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CreateJobServlet")
public class CreateJobServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job_title = request.getParameter("job");
		System.out.println("JOB TITLE: "+job_title);
		String location = request.getParameter("loc");
		String gender = request.getParameter("gender");
		String qualification = request.getParameter("qual");
		String salary = request.getParameter("sal");
		String experience = request.getParameter("exp");
		String job_type = request.getParameter("type");
		String industry = request.getParameter("ind");
		String job_resp = request.getParameter("resp");
		String skills_req = request.getParameter("skills");
		String benefits = request.getParameter("beni");
		String job_desc = request.getParameter("desc");
		String lang_req = request.getParameter("lang_req");
		
		HttpSession session = request.getSession();
		String company_name = (String)session.getAttribute("company_name");
		
		/*Retrieves the current date to be stored in the model*/
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();
		String date = dtf.format(now).toString();
		System.out.println(date);
		
		JobModel jmod = new JobModel();
		
		jmod.setJob_title(job_title);
		jmod.setLocation(location);
		jmod.setGender(gender);
		jmod.setQualification(qualification);
		jmod.setSalary(salary);
		jmod.setExperience(experience);
		jmod.setJob_type(job_type);
		jmod.setIndustry(industry);
		jmod.setJob_resp(job_resp);
		jmod.setSkills(skills_req);
		jmod.setBenefits(benefits);
		jmod.setJob_desc(job_desc);
		jmod.setLang_req(lang_req);
		jmod.setCompany_name(company_name);
		jmod.setDate(date);
		int result = CreateJobDAO.addJobApplication(jmod);
		if(result>0)
		{
			response.sendRedirect("create_job.html");
		}
	}

}
