package com.JobShikari.employeeRegistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.create_job.CreateJobDAO;
import com.JobShikari.create_job.JobModel;

/**
 * Servlet implementation class EmployeeJobAppServlet
 */
@WebServlet("/EmployeeJobAppServlet")
public class EmployeeJobAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		EmployeeModel emod = (EmployeeModel) session.getAttribute("employee_details");
		JobModel job = (JobModel) request.getSession().getAttribute("job_details");
		String csv = EmployeeDAO.getJobCSV(emod.getId());
		if(csv==null)
		{
			csv="";
		}
		String[] appliedIds;
		System.out.println("VALUE OF CSV = "+csv);
		appliedIds = csv.split(",");
		boolean isApplied = false;

		for (String id : appliedIds) {
			if (id.equals(job.getId())) {
				isApplied = true;
			}
		}

		if (!isApplied) {

			int employeeId = emod.getId();
			
			int jobId = Integer.parseInt(job.getId());
			
			//Adds the id of the job apllied for by the current candidate
			int result = EmployeeDAO.addJobApp(jobId, employeeId); 

			if (result > 0) {
				
				//Adds the id of the applicant to the job table
				int jobResult = CreateJobDAO.addApplicant(employeeId,jobId);
				System.out.println("Number of Applicants added : "+jobResult);
				response.sendRedirect("employeeHomepage.jsp");
			}
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('You have already applied !')");
			out.println("</script>");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeHomepage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
