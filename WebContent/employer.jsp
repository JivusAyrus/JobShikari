<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register as Company</title>
<link rel="shortcut icon"
	href="images/Hd_logo_Job_siccary-removebg-preview.png">
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
<link rel="stylesheet" href="css/employer.css">
<script src="js/particles.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body ng-app="">
	<nav class="navbar navbar-light bg-light">
		<div class="img">
			<a class="navbar-brand" href="#"> <img src="..." width="30"
				height="30" class="d-inline-block align-top" alt="">
				JobShikari
			</a>
		</div>

		<%
			String status = (String) request.getAttribute("status");
			if (status != null) {
		%>
		<script>
	alert('<%=status%>');
		</script>
		<%
			}
		%>

	</nav>
	<div class="image">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-7">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">JobShikari</h5>
						<form name="frm" action="EmployerRegistrationServlet"
							method="POST">
							<h3>Register as Company</h3>
							<br>
							<div id="first">
								<div class="question">
									<label for="cname">Company Name:</label> <span
										style="color: red;" ng-show="frm.fname.$error.required">*</span>
									<input type="text" name="company_name" ng-model="fname"
										required>
								</div>
								<div class="question">
									<label for="uname">Username:</label> <span style="color: red;"
										ng-show="frm.lname.$error.required">*</span> <input
										type="text" name="username" ng-model="lname" required>
								</div>
								<div class="question">
									<label for="mail">Email:</label> <span style="color: red;"
										ng-show="frm.mail.$error.required">*</span> <input
										type="email" name="mail" ng-model="mail" required> <span
										style="color: red;" ng-show="frm.mail.$error.email">Invalid
										Email </span>
								</div>
								<div class="question">
									<label for="offno">Office MobileNo:</label> <span
										style="color: red;" ng-show="frm.offno.$error.required">*</span>
									<input type="text" name="offno" id="offno" ng-model="offno" minlength="10" maxlength="10" pattern="\d*"
										required>
								</div>

								<div class="question">
									<label for=" pass">Password:</label> <span style="color: red;"
										ng-show="frm.pass.$error.required">*</span> <input
										type="password" name="pass" id="pass" ng-model="pass"
										ng-minlength="6" ng-maxlength="10" required> <span
										style="color: red;" ng-show="frm.pass.$error.minlength">Weak</span>
									<span style="color: green;" ng-show="frm.pass.$error.maxlength">Strong</span>
								</div>
								<div class="question">
									<label for="cpass">Confirm Password:</label> <span
										style="color: red;" ng-show="frm.cpass.$error.required">*</span>
									<input type="password" name="cpass" id="cpass" ng-model="cpass"
										ng-minlength="6" ng-maxlength="10" required> <span
										style="color: red;" ng-show="frm.cpass.$error.minlength">Weak</span>
									<span style="color: green;"
										ng-show="frm.cpass.$error.maxlength">Strong</span>
								</div>
								<br> <a id="firstbtn"><button type="submit"
										class="btn btn-outline-primary">Next</button></a>
							</div>
							<div id="second">
								<div class="question">
									<label for="itype">Industry Type:</label> <span
										style="color: red;" ng-show="frm.itype.$error.required">*</span>
									<input type="text" name="itype" ng-model="itype" required>
								</div>
								<div class="question">
									<label for="address">Office Address:</label> <span
										style="color: red;" ng-show="frm.address.$error.required">*</span>
									<input type="text" name="address" ng-model="address" required>
								</div>
								<div class="question">
									<label for="city">City :</label> <span style="color: red;"
										ng-show="frm.city.$error.required">*</span> <input type="text"
										name="city" ng-model="city" required>
								</div>
								<div class="question">
									<label for="state">State:</label> <span style="color: red;"
										ng-show="frm.state.$error.required">*</span> <input
										type="text" name="state" ng-model="state" required>
								</div>
								<div class="question">
									<label for="country">Country:</label> <span style="color: red;"
										ng-show="frm.country.$error.required">*</span> <input
										type="text" name="country" ng-model="country" required>
								</div>
								<br>
								<div class="question">
									<label for="gst">GST Registered:</label> <span
										style="color: red;" ng-show="frm.gst.$error.required">*</span>
									<button type="button" id="checkgst">Yes</button>
									<button type="button" id="checkgst1">No</button>
								</div>
								<div class="question" id="gst">
									<label for="gstno">GST number:</label> <span
										style="color: red;" ng-show="frm.country.$error.required">*</span>
									<input type="text" name="gstno" ng-model="gstno">
								</div>
								<br> <a id="all"><button
										class="btn btn-outline-primary">Back</button></a>
								<button type="submit" id="secondbtn" onclick="validation()"
									class="btn btn-outline-primary">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>

	</div>
	<script>
		function validation() {
			if (document.getElementById("offno").value.length != 10) {
				alert("Invalid Office Mobile number")
			}
			pass = document.getElementById("pass").value
			cpass = document.getElementById("cpass").value
			if (pass != cpass) {
				alert("Passwords did not match")
			}

		}
	</script>
	<script>
		$(document).ready(function() {
			$("#second").hide();
			$("#firstbtn").click(function() {
				$("#first").hide();
				$("#second").show();

			});
			$("#all").click(function() {
				$("#first").show();
				$("#second").hide();

			});

		});
	</script>
	<script>
		$(document).ready(function() {
			$("#gst").hide();
			$("#checkgst").click(function() {
				$("#gst").show();
			});
			$("#checkgst1").click(function() {
				$("#gst").hide();
			});
		});
	</script>
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