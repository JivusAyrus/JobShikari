package com.JobShikari.companyRegistration;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JobShikari.employeeRegistration.EmployeeDAO;

@WebServlet("/EmployerUpdatePasswordServlet")
public class EmployerUpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("pass");
		String cpass = request.getParameter("cpass");
		boolean isEqual = false;
		if(pass.equals(cpass))
		{
			isEqual = true;
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Passwords did not match !')");
			out.println("location = 'employerUpdatePassword.html'");
			out.println("</script>");
			
			
		}
		HttpSession session = request.getSession();
		String email_to_be_updated = (String)session.getAttribute("email_to_be_updated");
		int result = EmployerDAO.updatePassword(pass, email_to_be_updated);
		
		if(result>0 && isEqual)
		{
			response.sendRedirect("loginemployer.jsp");
		}
	}

}
