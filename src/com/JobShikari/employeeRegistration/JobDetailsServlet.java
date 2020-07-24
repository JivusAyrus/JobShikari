package com.JobShikari.employeeRegistration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.create_job.CreateJobDAO;
import com.JobShikari.create_job.JobModel;

/**
 * Servlet implementation class JobDetailsServlet
 */
@WebServlet("/JobDetailsServlet")
public class JobDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("jobid");
		System.out.println(id);
		JobModel job_to_be_displayed = CreateJobDAO.getJobById(id);
		System.out.println(job_to_be_displayed.getJob_title());
		HttpSession session = request.getSession();
		session.setAttribute("job_details", job_to_be_displayed);
		response.sendRedirect("jobApply.jsp");
	}

}
