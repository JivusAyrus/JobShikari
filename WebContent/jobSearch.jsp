<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.JobShikari.create_job.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Jobs</title>
<link rel="shortcut icon"
	href="images/Hd_logo_Job_siccary-removebg-preview (1).png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous">
	
</script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link rel="stylesheet" href="css/Jobsearch.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>

<body ng-app="">
	<nav class="navbar navbar-light bg-light fixed-top"
		style="border: black 2px solid; padding-left: 80px; padding-right: 20px; margin-left: 10px; margin-right: 10px; margin-top: 5px;">
		<!-- Navbar content -->

		<!-- <button type="button" class="btn btn-light" onclick="openNav();" > &#9776;</button> -->
		<a
			style="font-size: 25px; color: black; font-family: 'Times New Roman', Times, serif"><strong>JOB
				SHIKARI - The best job portal of humanity</strong></a> <a href="employeeHomepage.jsp"><button
				type="button" class="btn btn-outline-dark">Home</button></a> <a href="#"><button
				type="button" class="btn btn-secondary" onclick="">Jobs</button></a> <a
			href="Tutoreals.html"><button type="button" class="btn btn-outline-dark"
				onclick="">Tutorials</button></a> 
				<a href="resume.html"><button
				type="button" class="btn btn-outline-dark" onclick="">Resume
				</button> </a>
				<a href="employeecontactus.html"><button
				type="button" class="btn btn-outline-dark" onclick="">Contact
				Us</button> </a>

	</nav>

	<div class="image">

		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<form class="card cards" method="POST" action="JobListServlet">
					<div class="card-body row no-gutters align-items-center">
						<div class="col-auto">
							<i class="fas fa-search h4 text-body"></i>
						</div>

						<div class="col">
							<input
								class="form-control form-control-lg form-control-borderless"
								type="search" name="search_query" placeholder="Search"
								style="font-style: italic;">
						</div>
						<div class="col-auto">
							<button class="btn btn-lg btn-outline-primary" type="submit">Search</button>
						</div>
					</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-2">
				<label for="location">Location:</label> <select name="location"
					ng-model="location">
					
					<option value="beng">Bangalore/Bengaluru</option>
					<option value="chen">Chennai</option>
					<option value="mum">Mumbai</option>
					<option value="del">New Delhi</option>
					<option value="hyder">Hyderabad</option>
					<option value="bhop">Bhopal</option>
					<option value="bhub">Bhubaneswar</option>
					<option value="cochi">Cochin</option>
					<option value="kolk">Kolkata</option>
					<option value="ahme">Ahmedabad</option>
					<option value="pune">Pune</option>
				</select>
			</div>
			<div class="col-lg-2">
				<label for="comp_name">Company:</label> <select name="comp_name"
					ng-model="comp_name">
					
					<option value="goog">Google</option>
					<option value="micro">Microsoft</option>
					<option value="amaz">Amazon</option>
					<option value="face">Facebook</option>
					<option value="flip">Flipkart</option>
					<option value="intel">Intel</option>
					<option value="cisco">Cisco</option>
					<option value="tcs">TCS</option>
					<option value="infosys">Infosys</option>
					<option value="ibm">IBM</option>
					<option value="oracle">Oracle</option>
				</select>
			</div>
			<div class="col-lg-2">
				<label for="datepost">Date Posted:</label> <select name="date_post"
					ng-model="date_post">
					
					<option value="past3">Past 3 Days</option>
					<option value="pastweek">Past Week</option>
					<option value="pastmonth">Past Month</option>
				</select>
			</div>
			
			
		</div>
		

		</form>
		
			
		<div class="row">
			<%
				List<JobModel> jobs = (List<JobModel>) request.getAttribute("data");

				if (!jobs.isEmpty()) {

					for (JobModel job : jobs) {
			%>
			<div class="col-lg-4">
				<center>
					<div class="card"
						style="width: 22rem; text-align: center; margin: 40px;">
						<img src="images/JobShikariTransparentLogo.png"
							class="card-img-top" alt="..." style="border: 2px solid black;">
						<div class="card-body">

							<h5 class="card-title">
								<strong><%=job.getCompany_name()%></strong>
							</h5>
							<p class="card-text">
								<strong>Hiring:</strong> Bachelors and Masters
							</p>
							<p class="card-text">
								<strong>Salary: </strong><%=job.getSalary()%>
							</p>
							<p class="card-text">
								<strong>Role: </strong><%=job.getJob_title()%>
							</p>
							<p class="card-text">
								<strong>Skills Required: </strong>
								<%=job.getSkills()%>
							</p>

						</div>


						<form action="JobDetailsServlet" method="get">
					<input type="hidden" name = "jobid" value=<%=job.getId() %>></input> 
					<div class="card-footer">
						<button type="submit" class="btn btn-success">View Job</button>
					</div>
					</form>
					</div>
			</div>
			</center>

			<%
				}
				} else {
			%>
			<div class="error">
				<h2>OOPS! Your search term returned 0 results</h2>
			</div>
			<%
				}
			%>
		</div>
	</div>
	</div>
	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="..."><i
								class='fab fa-facebook-square' style='font-size: 24px'></i></a></li>
						<li class="list-inline-item"><a href="..."><i
								class='fab fa-twitter' style='font-size: 24px'></i></a></li>
						<li class="list-inline-item"><a href="..."><i
								class='fab fa-github' style='font-size: 24px'></i></a></li>
						<li class="list-inline-item"><a href="..."><i
								class='fab fa-instagram' style='font-size: 24px'></i></a></li>
						<li class="list-inline-item"><a href="about_us.html"><i
								class="fa fa-info-circle" style="font-size: 24px"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="about">
				<center>© 2019 Job Shikari - All Rights Reserved</center>
				<br>
			</div>

		</div>
	</section>

</body>


</html>