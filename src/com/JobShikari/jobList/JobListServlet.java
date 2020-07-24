package com.JobShikari.jobList;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JobShikari.create_job.JobModel;

@WebServlet("/JobListServlet")
public class JobListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<JobModel> jobs = new ArrayList<JobModel>();
		jobs = JobListDAO.getAllJobs();
		request.setAttribute("data", jobs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jobSearch.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchQuery = request.getParameter("search_query");
		String location = request.getParameter("location");
		String company_name = request.getParameter("comp_name");
		String date_posted = request.getParameter("date_post");

		/* Initialising the dropdown menu values */

		if (location.equals("? undefined:undefined ?")) {
			location = "";
		}
		if (company_name.equals("? undefined:undefined ?")) {
			company_name = "";
		}
		if (date_posted.equals("? undefined:undefined ?")) {
			date_posted = "";
		}

		/* Initialising date value */
		
		String strDate = "0000-00-00";

		if (!date_posted.isEmpty()) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			System.out.println(date_posted);
			cal.setTime(date);
			if (date_posted.equals("past3")) {
				cal.add(cal.DATE, -3);
			}
			else if(date_posted.equals("pastweek"))
			{
				cal.add(cal.DATE, -7);
			}
			else if(date_posted.equals("pastmonth"))
			{
				cal.add(cal.DATE, -31);
			}
			
			strDate = dateFormat.format(cal.getTime());
			System.out.println(strDate);

		}
		List<JobModel> jobs = new ArrayList<JobModel>();
		if ((location.isEmpty() && company_name.isEmpty() && date_posted.isEmpty()) && !searchQuery.isEmpty()) {
			jobs = JobListDAO.getAllJobsBySearch(searchQuery);
		} else if (searchQuery.isEmpty()
				&& (!location.isEmpty() || !company_name.isEmpty() || !date_posted.isEmpty())) {
			jobs = JobListDAO.getJobsByFilters(location, company_name, strDate);
		} else {
			jobs = JobListDAO.getJobsByEverything(searchQuery, location, company_name, date_posted);
		}

		request.setAttribute("data", jobs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jobSearch.jsp");
		dispatcher.forward(request, response);
	}

}
