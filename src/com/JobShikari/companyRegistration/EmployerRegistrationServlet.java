package com.JobShikari.companyRegistration;

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

@WebServlet("/EmployerRegistrationServlet")
public class EmployerRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String company_name = request.getParameter("company_name");
		String username = request.getParameter("username");
		String email = request.getParameter("mail");
		String office_no = request.getParameter("offno");
		String password = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		String industry_type = request.getParameter("itype");
		String office_address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String gst = request.getParameter("gst");

		boolean isEqual = false;
		if (password.equals(cpass)) {
			isEqual = true;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Passwords did not match !')");
			out.println("</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("employee.jsp");
			dispatcher.forward(request, response);

		}
		if (isEqual) {

			HttpSession session = request.getSession();
			session.setAttribute("company_name", company_name);

			EmployerModel emod = new EmployerModel();
			emod.setCompany_name(company_name);
			emod.setUsername(username);
			emod.setEmail(email);
			emod.setOffice_no(office_no);
			emod.setPassword(password);
			emod.setIndustry_type(industry_type);
			emod.setOffice_address(office_address);
			emod.setCity(city);
			emod.setState(state);
			emod.setCountry(country);
			emod.setGst(gst);
			
			

			int result = EmployerDAO.addEmployerRegister(emod);
			if (result > 0) {
				Mailer.sendMail(email, "Job Shikari Registration",
						"Successfully registered as Employer\nRegards,\nTeam Job Shikari");
				response.sendRedirect("loginemployer.jsp");
			}

			/* SQL Query has sent back unique constraint exception */
			else if (result == -1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("employer.jsp");
				request.setAttribute("status", "An account with this email Id already exists !");
				dispatcher.forward(request, response);
			}
		}
	}

}
