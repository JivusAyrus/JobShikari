<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register as an Employee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.js"
	integrity="sha256-Ld9+920D/5mOtGgV8hjGd4hX5fRTl0i3kjA2IDwvrqc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css"
	integrity="sha256-uKEg9s9/RiqVVOIWQ8vq0IIqdJTdnxDMok9XhiqnApU="
	crossorigin="anonymous" />

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
<link rel="stylesheet" href="css/employee.css">
<script src="js/particles.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>

<!-- Style tag overrides some properties of tags input for interests field   -->
<style>
.bootstrap-tagsinput .tag {
	color: #FFFFFF;
	background: #007bff;
	padding-left: 5px;
	border-radius: 5px;
}

.bootstrap-tagsinput {
	width: 90%;
}
}
</style>

</head>


<script>
        function validation() {
        	
                        pass = document.getElementById("pass").value
            cpass = document.getElementById("cpass").value
            if(pass && cpass){
            	if (pass != cpass) {
                    alert("Passwords did not match")
                }
            }
                        
            if (document.getElementById("phone").value.length != 10) {
            				alert("Invalid Phone number")
            }
            

        }
    </script>

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
			<div class="col-lg-4"></div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">JobShikari</h5>
						<form name="frm" action="EmployeeRegistrationServlet"
							method="POST">

							<h3>Register as an Employee</h3>
							<br>
							<div id="first">
								<div class="question">
									<label for="fname">First Name:</label> <span
										style="color: red;" ng-show="frm.fname.$error.required">*</span>
									<input type="text" name="fname" ng-model="fname" required>
								</div>
								<div class="question">
									<label for="lname">Last Name:</label> <span style="color: red;"
										ng-show="frm.lname.$error.required">*</span> <input
										type="text" name="lname" ng-model="lname" required>
								</div>

								<div class="question">
									<label for="mail">Email:</label> <span style="color: red;"
										ng-show="frm.mail.$error.required">*</span> <input
										type="email" name="mail" ng-model="mail" required> <span
										style="color: red;" ng-show="frm.mail.$error.email">Invalid
										Email </span>
								</div>

								<div class="question">
									<label for="phone">Phone Number:</label> <span
										style="color: red;" ng-show="frm.phone.$error.required">*</span>
									<input type="text" name="phone" ng-model="phone" id="phone"
										minlength="10" maxlength="10" pattern="\d*" required>
								</div>
								<div class="question">
									<label for="gender">Gender:</label> <span style="color: red;"
										ng-show="frm.gender.$error.required">*</span><br> <select
										name="gender" ng-model="gender"
										style="width: 90%; height: 30px; border: 1px solid black;"
										required>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>

									</select>
								</div>

								<div class="question">
									<label for="pass">Password:</label> <span style="color: red;"
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
								<br> <a id="firstbtn"><button
										class="btn btn-outline-primary">Next</button></a>
							</div>
							<div id="second">
								<div class="question">
									<label for="dob">Date of birth:</label> <span
										style="color: red;" ng-show="frm.date.$error.required">*</span><br>
									<input type="date" name="date" ng-model="date" required>
								</div>
								<div class="question">
									<label for="qualify">Qualification:</label> <span
										style="color: red;" ng-show="frm.qualify.$error.required">*</span><br>
									<input type="text" name="qualify" ng-model="qualify" required>
								</div>
								<div class="question">
									<label for="experience">Experience:</label> <input type="text"
										name="experience" ng-model="experience">
								</div>
								<div class="question">
									<label for="pcomp">Previous Company:</label> <input type="text"
										name="pcomp" ng-model="pcomp">
								</div>

								<div class="question">
									<label for="interest">Interests:</label> <input type="text"
										name="interest" ng-model="interest" data-role="tagsinput"
										id="tags" class="form-control"
										placeholder="Ex:Java,Javascript..">
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