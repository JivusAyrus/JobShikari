package com.JobShikari.employeeRegistration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmployeeOtpEnterServlet")
public class EmployeeOtpEnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEnteredOtp = request.getParameter("otp");
		HttpSession session = request.getSession();
		if(userEnteredOtp.equals(session.getAttribute("otp")))
		{
			response.sendRedirect("employeeUpdatePassword.html");
		}
		else
		{
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("employeeOtpEnter.jsp");
			request.setAttribute("status","Incorrect OTP");
			dispatcher.forward(request, response);
		}
	}

}
