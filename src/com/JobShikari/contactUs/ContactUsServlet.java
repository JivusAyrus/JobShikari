package com.JobShikari.contactUs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JobShikari.mailer.Mailer;

/**
 * Servlet implementation class ContactUsServlet
 */
@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("fname");
		String email = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String message = request.getParameter("msg");
		
		Mailer.sendMail("vkalghat@gmail.com", "User Message", name+"\n"+message+"\n"+"Phone :"+phone+"\n"+"Email : "+email);
		response.sendRedirect("contactus.html");
		
	}

}
