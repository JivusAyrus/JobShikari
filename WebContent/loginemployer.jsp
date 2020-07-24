<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login as Company</title>
<link rel="shortcut icon"
	href="http://www.sclance.com/pngs/job-png/job_png_733952.png">
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/loginemployer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>

<body ng-app="">
	<nav class="navbar navbar-light bg-light">
		<div class="img">
			<a class="navbar-brand" href="#"> <img src="..." width="30"
				height="30" class="d-inline-block align-top" alt="">
				JobShikari
			</a>
		</div>

	</nav>
	<div class="image">
		<div class="card">
			<div class="card-body">
				<form action="EmployerLoginServlet" method="post">
					<center>
						<h5 class="card-title">JobShikari</h5>
						<h4>Login as Company</h4>
					</center>
					<input type="email" name="email" placeholder="  Email"
						ng-model="email" required><br> <input type="password"
						name="password" placeholder="  Password" ng-model="password"
						required><br>
					<%
						String status = (String) request.getAttribute("status");
						if (status != null) {
					%>
					<p style="color: red;"><%=status%></p>
					<%
						}
					%>
					<center>
						<button type="submit" class="btn btn-outline-primary">Log
							In</button>

					</center>
				</form>
				<a href="employerForgotPass.html">Forgot Password?</a>
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
			<div class=about>
				<center>© 2019 Job Shikari - All Rights Reserved</center>
				<br>
			</div>
		</div>
	</section>
</body>

</html>