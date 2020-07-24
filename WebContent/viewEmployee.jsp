<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.JobShikari.employeeRegistration.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee List</title>
<link rel="shortcut icon"
	href="images/Hd_logo_Job_siccary-removebg-preview.png">
</head>
<body>


	<%
		List<EmployeeModel> l = (List<EmployeeModel>) request.getAttribute("data");
	%>

	<center>List of users</center>
	<div class="UserListing">

		<center>
			<div class="searchbar">
				<form action="" method="POST">
					<input type="text" name="sname" placeholder="Enter the name">
					<input type="submit" value="search">
				</form>
			</div>
			<table>
				<tr>
					<th>Name</th>
					<br>
					<th>email</th>
					<th>Phone</th>
					<th>Date Of Birth</th>
					<th>Interests</th>
					<th>Experience</th>
					<th>Gender</th>
					<th>Previous Company</th>
					<th>Qualification</th>
				</tr>
				<%
					for (EmployeeModel u : l) {
				%>

				<tr>
					<td><%=u.getFname() + " " + u.getLname()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getPhone()%></td>
					<td><%=u.getDob()%></td>
					<td><%=u.getInterests()%></td>
					<td><%=u.getExperience()%></td>
					<td><%=u.getGender()%></td>
					<td><%=u.getPrev_comp()%></td>
					<td><%=u.getQualification()%></td>

				</tr>

				<%
					}
				%>
			</table>
		</center>
	</div>
</body>
</html>