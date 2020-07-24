package com.JobShikari.employeeRegistration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.mailer.Mailer;

@WebServlet("/EmployeeForgotPassServlet")
public class EmployeeForgotPassServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String otp = generateOtp();
		HttpSession session = request.getSession();
		session.setAttribute("otp", otp);
		session.setAttribute("email_to_be_updated", email);
		
		Mailer.sendMail(email, "Reset Password", "Your OTP is "+otp);
		response.sendRedirect("employeeOtpEnter.jsp");
	}
private static String generateOtp()
{
	String otp = null;
	int temp = 0;
	StringBuilder otpGen = new StringBuilder();
	for(int i=0;i<4;i++)
	{
		temp = (int)(Math.random()*10);
		otpGen.append(""+temp);
		
	}
	otp = new String(otpGen);
	System.out.println(otp);
	return otp;
}
}
