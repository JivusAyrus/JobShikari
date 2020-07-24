package com.JobShikari.employeeRegistration;

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

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		/* Setting city of user via their public ip address in a session */

		HttpSession session = request.getSession();
		

		String name = EmployeeDAO.isValidate(email, password);
		if (name != null) {
			session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("employee_city", request.getParameter("employee_city"));

			/*Storing the current employee details in a session to be used for displaying on the homepage*/
			
			EmployeeModel emod = EmployeeDAO.getEmployeeDetails(email);
			session.setAttribute("employee_details", emod);
			
			/*
			 * Adding jobs list to dynamically display jobs posted for
			 * candidates (One based on interests and other based on location)
			 */

			List<JobModel> jobsBasedOnInterest = EmployeeDAO.getJobsBasedOnInterest(emod.getInterests());
			List<JobModel> jobsBasedOnLocation = EmployeeDAO.getJobsBasedOnLoc(request.getParameter("employee_city"));

			session.setAttribute("jobsBasedOnInterest", jobsBasedOnInterest);
			session.setAttribute("jobsBasedOnLocation", jobsBasedOnLocation);
			response.sendRedirect("employeeHomepage.jsp");
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginemployee.jsp");
			request.setAttribute("status", "Invalid email or password");
			dispatcher.forward(request, response);
		}

	}

}
