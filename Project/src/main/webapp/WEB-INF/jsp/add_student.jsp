<%@include file="/resources/header/login_head.jsp"%>
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

<title>Student Registration</title>

</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading text-primary">Welcome To ${school.school_name}</div>
			<div class="list-group list-group-flush">
				<div class="img logo rounded-circle mb-5">
					<img style="height: 150px; width: 200px"
						src="data:image/png;base64,${Image }" />
				</div>
				<!-- <a href="display"
					class="list-group-item list-group-item-action bg-light">School
					Information</a> -->
				<a href="add_student"
					class="list-group-item list-group-item-action bg-light"><span class="fa fa-user mr-3"></span>Add
					Student</a> <a href="student_view"
					class="list-group-item list-group-item-action bg-light"><span class="fa fa-address-book mr-3"></span>View
					List Of Student</a> <a href="line"
					class="list-group-item list-group-item-action bg-light"><span class="fa fa-line-chart mr-3"></span>Graph</a><a
					href="schoolResetPassword"
					class="list-group-item list-group-item-action bg-light"><span class="fa fa-key mr-3"></span>Reset
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


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle fa fa-user-circle-o mr-3" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> User Option </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/school/index">Login Here</a> <a
								class="dropdown-item" href="display">School Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item fa fa-sign-out mr-3" href="logout">LogOut</a>
						</div></li>

				</ul>
			</div>
			</nav>

			<div class="container-fluid">
				<div class="co-md-12">
					<form action="saveStudent" method="POST" id="demoForm">
						<div class="panel panel-info">
							<div class="panel-heading">Student Registration</div>
							<div class="panel-body">

								<div class="form-group">
									<input type="hidden" name="id" value="id">
								</div>

								<table class="table">
									<tr>
										<th>Enter Student Name</th>
										<td><input class="form-control" type="text" name="name"
											id="" /></td>
									</tr>

									<tr>
										<th>Student Email</th>
										<td><input class="form-control" type="email" name="email"
											id="" /></td>
									</tr>

									<tr>
										<th>Date Of Birth</th>
										<td><input class="form-control" type="date" name="dob"
											id="" /></td>
									</tr>


									<tr>
										<th>Gender</th>
										<td><input type="radio" name="gender" value="male">
											Male <input type="radio" name="gender" value="female">
											Female<br></td>
									</tr>

									<tr>
										<th>Address</th>
										<td><input class="form-control" type="text"
											name="address" id="" /></td>
									</tr>

									<tr>
										<th>State</th>
										<td><input class="form-control" type="text" name="state"
											id="" /></td>
									</tr>

									<tr>
										<th>City</th>
										<td><input class="form-control" type="text" name="city"
											id="" /></td>
									</tr>

									<tr>
										<th>Pincode</th>
										<td><input class="form-control" type="text"
											name="pincode" id="" /></td>
									</tr>

									<tr>
										<th>Mobile No</th>
										<td><input class="form-control" type="text"
											name=contact_no id="" /></td>
									</tr>


									<tr>
										<th>Date of Joining</th>
										<td><input class="form-control" type="date" name=doj
											id="" /></td>
									</tr>

									<tr>
										<th>Password</th>
										<td><input class="form-control" type="password"
											name=password id="" /></td>
									</tr>

									<tr>
										<th></th>
										<td><input class="" type="hidden" name="schoolId"
											value="schoolId" id="" /></td>
									</tr>

									<tr>
										<th></th>
										<td><input type="submit" name="submit" value="register"
											class="submit" id="submit" /></td>
									</tr>


								</table>


							</div>
						</div>
					</form>
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
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>








<!-- <div class="form-group">
										<input type="hidden" name="id" value="id">
									</div>

									<div class="form-group">
										<label>Enter Student Name</label> <input class="form-control"
											type="text" name="name" id="" />
									</div>

									<div class="form-group">
										<label>Student Email</label> <input class="form-control"
											type="email" name="email" id="" />
									</div>

									<div class="form-group">
										<label>Date Of Birth</label> <input class="form-control"
											type="date" name="dob" id="" />
									</div>

									<div class="form-group">
										<label>Gender</label> <input type="radio" name="gender"
											value="male"> Male <input type="radio" name="gender"
											value="female"> Female<br>
									</div>

									<div class="form-group">
										<label>Address</label> <input class="form-control" type="text"
											name="address" id="" />
									</div>

									<div class="form-group">
										<label>State</label> <input class="form-control" type="text"
											name="state" id="" />
									</div>


									<div class="form-group">
										<label>City</label> <input class="form-control" type="text"
											name="city" id="" />
									</div>

									<div class="form-group">
										<label>Pincode</label> <input class="form-control" type="text"
											name="pincode" id="" />
									</div>

									<div class="form-group">
										<label>Mobile No</label> <input class="form-control"
											type="text" name="contact_no" id="" />
									</div>

									<div class="form-group">
										<label>Date of Joining</label> <input class="form-control"
											type="date" name="doj" id="" />
									</div>
									<div class="form-group">
										<label>Password</label> <input class="form-control"
											type="password" name="password" id="" />
									</div>

									<div class="form-group">
										<input class="" type="hidden" name="schoolId" value="schoolId"
											id="" />
									</div>

									<div class="form-group">
										<input type="submit" name="submit" value="register"
											class="submit" id="submit" />
									</div> -->

