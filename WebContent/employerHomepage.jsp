<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,com.JobShikari.create_job.*,com.JobShikari.companyRegistration.*,com.JobShikari.employeeRegistration.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Job Shikari</title>
<link rel="stylesheet" href="css/play.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
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
<link rel="stylesheet" href="css/ihover.min.css";>
<link rel="stylesheet" href="css/animate.css">

<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>

<%
	EmployerModel emod = (EmployerModel) request.getSession().getAttribute("current_employer");
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

		</a> <a href="#hire" id="hireId">Recent Applicants
			<p style="display: inline; color: red;" id="toparrow"><-</p>
		</a> <a href="#hired" id="tag">Hired Applicants
			<p style="display: inline; color: red;" id="tagsarrow"><-</p>
		</a>
		<form action="EmployerLogoutServlet" method="GET" style="margin: 10px">
			<button type="submit" class="btn btn-light" style="margin: 20px">Logout</button>
		</form>
		<!-- <a href="#footer" id="foot">Contact
              <p style="display: inline;color:red;" id="contactarrow"><-</p>
          </a> -->
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
	<!-- Use any element to open the sidenav -->



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
					type="button" class="btn btn-dark">Home</button></a> <a
				href="create_job.html"><button type="button"
					class="btn btn-outline-secondary" onclick="">Post Job</button></a> </a> <a
				href="employerTutorial.html"><button type="button"
					class="btn btn-outline-secondary" onclick="">Tutorials</button></a> <a
				href="contactus.html"><button type="button"
					class="btn btn-outline-secondary" onclick="">Contact Us</button></a>


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
											<img src="img/bitmoji.png" alt="Ramesh">
										</div>
										<div class="info">
											<h3 style="font-family: 'Times New Roman', Times, serif;">Edit
												Profile-pic</h3>
											<p>Upload the awesome face!</p>
										</div>
									</a>
								</div>
								<!-- end normal -->
								<h1 style="font-family: cursive; color: aliceblue;"><%=emod.getCompany_name()%></h1>
								<h5 style="font-family: cursive; color: aliceblue;"><%=emod.getIndustry_type()%></h5>
								<hr color="white">

								<h4 style="font-family: cursive; color: aliceblue;">
									Email:
									<%=emod.getEmail()%></h4>
								<h4 style="font-family: cursive; color: aliceblue;">
									Phone number:
									<%=emod.getOffice_no()%></h4>

								<!-- <hr color="white"> -->

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



		<!--Lets go yolo-->

		<br> <br> <br>
		
		
		<%
			List<JobModel> jobs = (List<JobModel>)request.getSession().getAttribute("jobs_posted");
	
		
			for(JobModel job:jobs)
			{
				List<EmployeeModel> candidates = EmployeeDAO.getEmployeesBasedOnIdArray(job.getApplicant().split(","));
				System.out.println(job.getApplicant().split(",").length);
		%>
		<hr width="100%" size="400px" color="black" id="hire">
		<br>
		<center>
			<h1 style="color: black;"><%=job.getJob_title() %> Applicants</h1>
		</center>
		<br>

		<hr width="100%" size="400px" color="black">
		<br> <br> <br>
		<div class="row">
		<%
			for(EmployeeModel candidate:candidates)
			{
		%>

		
		<div class=col-lg-4>
			<div class="card">
				<img style="padding-bottom: 18px; border: black solid 5px;"
					class="card-img-top" src="img/faces/1.png" alt="Card image cap">
				<div class="card-body">

					<h5 class="card-title">
						<strong><%=candidate.getFname()+" "+candidate.getLname() %></strong>
					</h5>
					<p class="card-text">
						<strong>Qualification:</strong> <%=candidate.getQualification() %>
					</p>
					<p class="card-text">
						<strong>Date Of Birth :</strong> <%= candidate.getDob() %>
					</p>
					<p class="card-text">
						<strong>Experience:</strong> <%=candidate.getExperience() %>
					</p>
					
					<p class="card-text">
						<strong>Email :</strong> <%=candidate.getEmail() %>
					</p>
				</div>


				<div class="card-footer">
					<button type="button" class="btn btn-success">View Resume</button>
				</div>
			</div>
			</div>
			<br><br>
			
		
		<%
			}
			
		
		%>
		</div>
		<br><br>
		<%
			}
		%>
		
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
			<center>� 2019 Job Shikari - All Rights Reserved</center>
			<br>
		</div>

	</div>
</section>
</body>


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