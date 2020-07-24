package com.JobShikari.viewEmployees;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JobShikari.employeeRegistration.EmployeeModel;


@WebServlet("/ViewEmployeesServlet")
public class ViewEmployeesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EmployeeModel> users = new ArrayList<>();
		users = ViewEmployeeDAO.getAllEmployees();
		request.setAttribute("data", users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewEmployee.jsp");
		dispatcher.forward(request, response);
	}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("sname");
		List<EmployeeModel> users = new ArrayList<>();
		users = ViewEmployeeDAO.getEmployeesBySearch(search);
		request.setAttribute("data", users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewEmployee.jsp");
		dispatcher.forward(request, response);
		
	}

	

}
