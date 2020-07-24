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


@WebServlet("/EmployerOtpEnterServlet")
public class EmployerOtpEnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEnteredOtp = request.getParameter("otp");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if(userEnteredOtp.equals(session.getAttribute("otp")))
		{
			response.sendRedirect("employerUpdatePassword.html");
		}
		else
		{
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("employerOtpEnter.jsp");
			request.setAttribute("status","Incorrect OTP");
			dispatcher.forward(request, response);
		}
	}

	

}
