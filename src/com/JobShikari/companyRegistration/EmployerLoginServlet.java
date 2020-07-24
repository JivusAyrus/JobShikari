package com.JobShikari.companyRegistration;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.create_job.CreateJobDAO;
import com.JobShikari.create_job.JobModel;
import com.JobShikari.employeeRegistration.EmployeeDAO;


@WebServlet("/EmployerLoginServlet")
public class EmployerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String company_name = EmployerDAO.isValidate(email, password);
		System.out.println(company_name);
		if(company_name!= null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("company_name", company_name);
			session.setAttribute("email", email);
			EmployerModel emod = EmployerDAO.getEmployerByEmail(email);
			
			
			//Getting all jobs based on current company name
			List<JobModel> jobs = CreateJobDAO.getJobsBasedOnCompanyName(company_name);
			
			
			
			System.out.println("NUMBER OF JOBS POSTED BY "+company_name+": "+jobs.size());
			
			session.setAttribute("jobs_posted", jobs);
			session.setAttribute("current_employer", emod);
			response.sendRedirect("employerHomepage.jsp");
		}
		else
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginemployer.jsp");
			request.setAttribute("status","Invalid email or password");
			dispatcher.forward(request, response);
		}
	}

}
