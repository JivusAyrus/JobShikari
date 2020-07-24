package com.JobShikari.employeeRegistration;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.mailer.Mailer;

/**
 * Servlet implementation class EmployeeRegistrationServlet
 */
@WebServlet("/EmployeeRegistrationServlet")
public class EmployeeRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Code to add register to EmployeeRegisterDAO
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String password = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		String dob = request.getParameter("date");
		String qualification = request.getParameter("qualify");
		String experience = request.getParameter("experience");
		String prev_comp = request.getParameter("pcomp");
		String interest = request.getParameter("interest");
		
		boolean isEqual = false;
		if(password.equals(cpass))
		{
			isEqual = true;
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Passwords did not match !')");
			out.println("</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("employee.jsp");
			dispatcher.forward(request, response);
			
		}
		
		if(isEqual)
		{
		
		EmployeeModel emod = new EmployeeModel();
		
		
		
		emod.setFname(fname);
		emod.setLname(lname);
		emod.setEmail(email);
		emod.setPhone(phone);
		emod.setGender(gender);
		emod.setPassword(password);
		emod.setDob(dob);
		emod.setQualification(qualification);
		emod.setExperience(experience);
		emod.setPrev_comp(prev_comp);
		emod.setInterests(interest);
		
		
		
			int result = EmployeeDAO.addEmployeeRegister(emod);
			if(result>0)
			{
				Mailer.sendMail(email, "Job Shikari Registration", "Successfully registered as employee\nRegards,\nTeam Job Shikari");
				response.sendRedirect("loginemployee.jsp");
			}
			
			/*SQL Query has sent back unique constraint exception*/
			else if(result == -1)
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("employee.jsp");
				request.setAttribute("status","An account with this email Id already exists !");
				dispatcher.forward(request, response);
			}
		}
	}
		
			
			
		
	

}
