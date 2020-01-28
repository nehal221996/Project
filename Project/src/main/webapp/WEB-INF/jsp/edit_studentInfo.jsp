<%@include file="/resources/header/login_head.jsp"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="/resources/jqueryValidation/jquery.min.js"></script>
<script src="/resources/jqueryValidation/jquery.validate.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Student View</title>

<style>
.error {
	color: red;
}
</style>

<style>
.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
	background-color: RoyalBlue;
}
</style>

</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Menu</div>
			<div class="list-group list-group-flush">
				<!-- <a href="display"
					class="list-group-item list-group-item-action bg-light">School
					Information</a> -->
				<a href="add_student"
					class="list-group-item list-group-item-action bg-light">Add
					Student</a> <a href="student_view"
					class="list-group-item list-group-item-action bg-light">View
					List Of Student</a> <a href="line"
					class="list-group-item list-group-item-action bg-light">Graph</a><a
					href="schoolResetPassword"
					class="list-group-item list-group-item-action bg-light">Reset
					Password</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
			<button class="btn" id="menu-toggle">
				<i class="fa fa-bars"></i>
			</button>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto mt-2 mt-lg-0">


					<!-- <li class="nav-item active"><a class="nav-link"
						href="registration">Register here <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="/school/index">Login here <span class="sr-only">(current)</span>
					</a></li> -->
					<!-- <li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/school/index">Login Here</a> <a
								class="dropdown-item" href="display">School Profile</a> <a
								class="dropdown-item" onclick="myFunction()" href="">Download
								file</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout">LogOut</a>
						</div></li>
				</ul>
			</div>
			</nav>

			<div class="container-fluid">
				<div class="co-md-12">

					<div class="panel panel-info">
						<!-- Default panel contents -->
						<div class="panel-body"></div>
						<div class="panel-heading">Add Student Information</div>
						<div class="panel-body"></div>
						<div class="col-md-12"></div>


						<form action="/school/updateStd" method="post"
							modelAttribute="user" id="demoForm">
							<input type="hidden" name="id" id="std_id"> <input
								type="hidden" id="password" name="password"> <input
								type="hidden" id="schoolId" name="schoolId">

							<div class="col-md-12">

								<div class="form-group">
									<label>Name</label> <input class="form-control" type="text"
										name="name" id="std_name"> <br>
								</div>

								<div class="form-group">
									<label>Date of Birth</label> <input class="form-control"
										type="date" name="dob" id="dob"> <br>
								</div>

								<div class="form-group">
									<label>Gender</label> <select class="form-control"
										name="gender" id="gender">
										<option></option>
										<option value="female">Female</option>
										<option value="male">Male</option>
										<option value="other">Other</option>
									</select> <br>
								</div>

								<div class="form-group">
									<label>Email</label> <input class="form-control" type="text"
										name="email" id="std_email"> <br>
								</div>

								<div class="form-group">
									<label>Address</label> <input class="form-control" type="text"
										name="address" id="address"> <br>
								</div>

								<div class="form-group">
									<label>City</label> <input class="form-control" type="text"
										name="city" id="city"> <br>
								</div>

								<div class="form-group">
									<label>State</label> <input class="form-control" type="text"
										name="state" id="state">
								</div>

								<div class="form-group">
									<label>Pincode</label> <input class="form-control" type="text"
										name="pincode" id="pincode"> <br>
								</div>

								<div class="form-group">
									<label>Contact_no</label> <input class="form-control"
										type="text" name=contact_no id="contact_no">
								</div>

								<div class="form-group">
									<label>Date of Joining</label> <input class="form-control"
										type="date" name="doj" id="doj"> <br>
								</div>


								<div class="form-group">
									<input type="submit" name="submit" value="update"
										class="submit" id="submit" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>



	<script type="text/javascript">
		$(function() {
			// Initialize form validation on the registration form.
			// It has the name attribute "registration"
			$("#demoForm")
					.validate(
							{
								// Specify validation rules
								rules : {
									name : "required",
									email : {
										required : true,
										// Specify that email should be validated
										// by the built-in "email" rule
										email : true
									},
									dob : "required",
									gender : "required",
									address : "required",
									state : "required",
									city : "required",
									pincode : "required",
									contact_no : "required",
									doj : "required",
									password : {
										required : true,
										minlength : 5
									}
								},
								// Specify validation error messages
								messages : {
									name : "Please enter your user name",
									email : {
										required : "Please provide a email address",
										email : "Please enter valid email address"
									},
									dob : "Please enter date of birth name",
									gender : "Please select your gender",
									address : "Please enter address",
									state : "Please enter state",
									city : "Please enter city",
									pincode : "Please enter pincode",
									contact_no : "Please enter your mobile number",
									doj : "Please enter joining date",
									password : {
										required : "Please provide a password",
										minlength : "Your password must be at least 5 characters long"
									}

								},
								// Make sure the form is submitted to the destination defined
								// in the "action" attribute of the form when valid
								submitHandler : function(form) {
									form.submit();
								}
							});
		});
	</script>
	<script src="/resources/js/edit_student.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>