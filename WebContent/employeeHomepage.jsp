<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.JobShikari.create_job.*,com.JobShikari.employeeRegistration.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Job Shikari</title>
<link rel="shortcut icon"
	href="images/Hd_logo_Job_siccary-removebg-preview.png">
<link rel="stylesheet" href="css/play.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/ihover.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>

<!-- Initialising the current employee object -->

<%
	EmployeeModel emod = (EmployeeModel)request.getSession().getAttribute("employee_details");
	
%>
</head>
<body style="background-color: powderblue">
	<div id="mySidenav" class="sidenav">
		<br> <br> <br> <br> <a href="javascript:void(0)"
			class="closebtn" onclick="closeNav()">&times;</a> <a><button
				type="button" class="btn btn-light" data-toggle="modal"
				data-target="#exampleModalCenter">My Profile</button></a> <a
			href="#tops" id="top">Back to Top
			<p style="display: inline; color: red;" id="bttarrow"><-</p>

		</a> <a href="#jobs" id="job">Job ads
			<p style="display: inline; color: red;" id="jobarrow"><-</p>
		</a> <a href="#hire" id="hireId">Top Hiring
			<p style="display: inline; color: red;" id="toparrow"><-</p>
		</a> <a href="#tags" id="tag">Tags Search
			<p style="display: inline; color: red;" id="tagsarrow"><-</p>
		</a> <a href="#footer" id="foot">Contact
			<p style="display: inline; color: red;" id="contactarrow"><-</p>
		</a>
		<form action="EmployeeLogoutServlet" method="GET">
			<button
				type="submit" class="btn btn-light" style="margin:20px;" 
				>Logout</button>
		</form>
	</div>

	<!-- Use any element to open the sidenav -->
	<style>
</style>
	<script>
		$(document).ready(function() {
			$("#bttarrow").hide();
			$("#jobarrow").hide();
			$("#toparrow").hide();
			$("#tagsarrow").hide();
			$("#contactarrow").hide();

			$("#top").click(function() {
				$("#bttarrow").show();
				$("#jobarrow").hide();
				$("#toparrow").hide();
				$("#tagsarrow").hide();
				$("#contactarrow").hide();
			});
			$("#job").click(function() {
				$("#bttarrow").hide();
				$("#jobarrow").show();
				$("#toparrow").hide();
				$("#tagsarrow").hide();
				$("#contactarrow").hide();

			});
			$("#hireId").click(function() {
				$("#bttarrow").hide();
				$("#jobarrow").hide();
				$("#toparrow").show();
				$("#tagsarrow").hide();
				$("#contactarrow").hide();

			});
			$("#tag").click(function() {
				$("#bttarrow").hide();
				$("#jobarrow").hide();
				$("#toparrow").hide();
				$("#tagsarrow").show();
				$("#contactarrow").hide();

			});
			$("#foot").click(function() {
				$("#bttarrow").hide();
				$("#jobarrow").hide();
				$("#toparrow").hide();
				$("#tagsarrow").hide();
				$("#contactarrow").show();

			});
		});
	</script>

	<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
	<div id="main">
		<span id="tops" style="font-size: 1px;">TOP</span>
		<nav class="navbar navbar-light bg-light sticky-top"
			style="border: black 2px solid;">
			<!-- Navbar content -->

			<button type="button" class="btn btn-light" onclick="openNav();">
				&#9776;</button>
			<a
				style="font-size: 25px; color: black; font-family: 'Times New Roman', Times, serif"><strong>JOB
					SHIKARI - The best job portal of humanity</strong></a> <a href="#"><button
					type="button" class="btn btn-dark">Home</button></a><form action="JobListServlet" 
				><button 
					class="btn btn-secondary" onclick="">Jobs</button></form> <a
				href="Tutoreals.html"><button type="button"
					class="btn btn-secondary" onclick="">Tutorials</button></a> <a
				href="resume.html"><button type="button"
					class="btn btn-secondary" onclick="">Resume</button></a> <a
				href="employeecontactus.html"><button type="button"
					class="btn btn-secondary">Contact us</button></a>


		</nav>

		<center>
			<p
				style="font-size: 100px; font-family: 'Times New Roman', Times, serif"
				class="animated tada delay-0s">JOB SHIKARI</p>
			<h1 class="animated lightSpeedIn delay-1s">The best job
				searching and hosting website known to mankind</h1>


		</center>
		<center>
			<!-- The Modal -->
			<!-- Button trigger modal -->


			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">My
								Awesome Profile!</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<!-- Top to bottom-->
							<center>
								<!-- normal -->
								<div class="ih-item circle effect10 top_to_bottom">
									<a href="#">
										<div class="img">
											<img src="img/myAvatar.png" alt="Sambit Sanyal">
										</div>
										<div class="info">
											<h3 style="font-family: 'Times New Roman', Times, serif;">Edit
												Profile-pic</h3>
											<p>Upload the awesome face!</p>
										</div>
									</a>
								</div>
								<!-- end normal -->
								<h1 style="font-family: cursive; color: aliceblue;"><%=emod.getFname()+" "+emod.getLname() %></h1>
								<h5 style="font-family: cursive; color: aliceblue;"><%=emod.getQualification() %></h5>
								<hr color="white">

								<h4 style="font-family: cursive; color: aliceblue;">Tags</h4>
								<p style="font-family: cursive; color: aliceblue;"><%=emod.getInterests() %></p>
								<hr color="white">
								<%
									if(emod.getExperience().isEmpty())
									{
								%>
								<h5 style="font-family: cursive; color: aliceblue;">Experience: Nil</h5>
								<%
									}
									else{
								%>
								<h5 style="font-family: cursive; color: aliceblue;">Experience:<%=emod.getExperience() %></h5>
								<%
									}
								%>
								<br> <br>
							</center>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close my Awesomeness</button>
								<button type="button" class="btn btn-primary">Edit my
									Awesomeness</button>
							</div>
						</div>
					</div>
				</div>
		</center>
		<center>
			<br> <br> <br>
			<hr width="100%" size="400px" color="black" id="jobs">
			<br>
			<center>
				<h1 style="color: black;">JOB ADVERTISEMENTS</h1>
			</center>
			<br>

			<hr width="100%" size="400px" color="black">
			<br> <br> <br>


			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="img/bigad1.png" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/bigad2.jpg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/bigad3.png" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/bigad4.png" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="img/bigad5.png" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>


		</center>


		<!--Lets go yolo-->

		<br> <br> <br>
		<hr width="100%" size="400px" color="black" id="hire">
		<br>
		<center>
			<h1 style="color: black;">Jobs Based On Your Interests</h1>
		</center>
		<br>

		<hr width="100%" size="400px" color="black">
		<br> <br> <br>
		<div class="row">

			<%
				List<JobModel> jobsBasedOnInterest = (List<JobModel>) session.getAttribute("jobsBasedOnInterest");

				if (!jobsBasedOnInterest.isEmpty()) {

					for (JobModel job : jobsBasedOnInterest) {
			%>

			<div class="col-lg-4">

				<div class="card">
					<img style="border: black solid 5px;" class="card-img-top"
						src="images/JobShikariTransparentLogo.png" alt="Card image cap">
					<div class="card-body">

						<h5 class="card-title">
							<strong><%=job.getCompany_name()%></strong>
						</h5>
						<p class="card-text">
							<strong>Post:</strong> <%=job.getJob_title() %>
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




			<%
				}
				} else {
			%>
			<h3>OOPS! It looks like you haven't told us your interests :(</h3>
			<%
				}
			%>
		</div>


		<br> <br> <br>
		<hr width="100%" size="400px" color="black" id="tags">
		<br>
		<%
			String mesg = (String)request.getSession().getAttribute("employee_city");
			if(mesg == null || mesg=="")
			{
				mesg = "ALL JOBS";
			}
			else
			{
				mesg = "Jobs near "+(String)request.getSession().getAttribute("employee_city");;
			}
		%>
		<center>
			<h1 style="color: black;"><%=mesg %></h1>
		</center>
		<br>
		<hr width="100%" size="400px" color="black">
		<br> <br> <br>
		<div class="row">

			<%
				List<JobModel> jobsBasedOnLocation = (List<JobModel>) session.getAttribute("jobsBasedOnLocation");

				for (JobModel job : jobsBasedOnLocation) {
			%>

			<div class="col-lg-4">

				<div class="card">
					<img style="border: black solid 5px;" class="card-img-top"
						src="images/JobShikariTransparentLogo.png" alt="Card image cap">
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
			<%
				}
			%>
		</div>







		<hr width="100%" size="400px" color="black" id="tags">
		<br>
		<center>
			<h1 style="color: black;">Search based on Tags</h1>
		</center>
		<br>

		<hr width="100%" size="400px" color="black">
		<br> <br> <br>



		<center>
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-8">
						<div class="card text-center">
							<div class="card-header">Most Preferred Tag</div>
							<div class="card-body">
								<h5 class="card-title">Software Development</h5>
								<p class="card-text">Salary from 3.2 lakhs to 9 lakhs</p>
								<a href="#" class="btn btn-primary">Search with this tag</a>
							</div>
							<div class="card-footer text-muted">1,267 Jobs Available</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="col-lg-8">
						<div class="card text-center">
							<div class="card-header">Most Preferred Tag</div>
							<div class="card-body">
								<h5 class="card-title">Android Development</h5>
								<p class="card-text">Salary from 5 lakhs to 8 lakhs</p>
								<a href="#" class="btn btn-primary">Search with this tag</a>
							</div>
							<div class="card-footer text-muted">27 Jobs Available</div>
						</div>
					</div>
				</div>
			</div>



			<br> <br>
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-8">
						<div class="card text-center">
							<div class="card-header">Preferred Tag</div>
							<div class="card-body">
								<h5 class="card-title">Web Development</h5>
								<p class="card-text">Salary from 2.5 to 6 lakhs</p>
								<a href="#" class="btn btn-primary">Search with this tag</a>
							</div>
							<div class="card-footer text-muted">568 Jobs Available</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="col-lg-8">
						<div class="card text-center">
							<div class="card-header">Preferred Tag</div>
							<div class="card-body">
								<h5 class="card-title">Java Development</h5>
								<p class="card-text">Salary from 8 lakhs to 10 lakhs</p>
								<a href="#" class="btn btn-primary">Search with this tag</a>
							</div>
							<div class="card-footer text-muted">743 Jobs Available</div>
						</div>
					</div>
				</div>
			</div>

		</center>
		<!--MAIN DIV ENDS HERE!!-->
	</div>
	<br>
	<br>
</body>
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
		<div>
			<center>© 2019 Job Shikari - All Rights Reserved</center>
			<br>
		</div>

	</div>
</section>

<script>
	/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.body.style.backgroundColor = "powderblue";
	}

	/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft = "0";
		document.body.style.backgroundColor = "powderblue";
	}
</script>
</html>