<%@include file="/resources/header/login_head.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<script src="/resources/jqueryValidation/jquery.min.js"></script>

<script src="/resources/jqueryValidation/jquery.validate.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Home</title>

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
			<div class="sidebar-heading p-3 mb-2 bg-secondary text-white">Welcome
				 ${student.name }</div>
			<div class="list-group list-group-flush">
				<a href="schoolInfo"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-info-circle mr-3"></span>School Information</a><a
					href="update?uid=${student.id }"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-user-plus mr-3"></span>Update Profile</a> <a
					href="resetpassword"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-key mr-3"></span>Reset Password</a>
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
						class="nav-link dropdown-toggle fa fa-user-circle-o mr-3" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> User Option </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/school/index">Login Here</a> <a
								class="dropdown-item" href="profile">Student Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item fa fa-sign-out mr-3" href="logout">LogOut</a>
						</div></li>
				</ul>
			</div>
			</nav>
			<div class="container-fluid">
				<div class="co-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">Update Student</div>
						<div class="panel-body">

							<div class="col-md-12">
								<form:form action="updateStudent" method="post" id="demoForm"
									modelAttribute="student">

									<form:hidden path="id" />
									<form:hidden path="schoolId" />
									<div class="form-group">
										<form:label path="name">Student Name</form:label>
										<form:input class="form-control" path="name" name="name" />
									</div>

									<div class="form-group">
										<form:label path="email">Student Email</form:label>
										<form:input class="form-control" path="email" name="email" />
									</div>

									<div class="form-group">
										<form:label path="email">Date Of Birth</form:label>
										<form:input class="form-control" type="date" path="dob"
											name="dob" />
									</div>

									<div class="form-group">
										<div class="form-group">
											<form:label path="gender">Gender</form:label>
											<form:radiobutton path="gender" value="Male" label="Male"
												name="gender" />
											<form:radiobutton path="gender" value="Female" label="Female"
												name="gender" />
										</div>
									</div>

									<div class="form-group">
										<form:label path="address">Address</form:label>
										<form:input class="form-control" path="address" name="address" />
									</div>

									<div class="form-group">
										<form:label path="state">State</form:label>
										<form:input class="form-control" path="state" name="state" />
									</div>

									<div class="form-group">
										<form:label path="city">City</form:label>
										<form:input class="form-control" path="city" name="city" />
									</div>

									<div class="form-group">
										<form:label path="pincode">Pincode</form:label>
										<form:input class="form-control" path="pincode" name="pincode" />
									</div>

									<div class="form-group">
										<form:label path="contact_no">Mobile No</form:label>
										<form:input class="form-control" path="contact_no"
											name="contact_no" />
									</div>

									<div class="form-group">
										<form:label path="doj">Date of Joining</form:label>
										<form:input class="form-control" type="date" path="doj"
											name="doj" />
									</div>

									<form:hidden path="password" />

									<%-- <div class="form-group">
										<form:label path="password">Password</form:label>
										<form:hidden class="form-control" path="password"
											name="password" />
									</div> --%>

									<!-- <div class="form-group">
										<input class="" type="hidden" name="schoolId" value="schoolId"
											id="" />
									</div> -->
									<form:hidden path="schoolId" />

									<div class="form-group">
										<input type="submit" name="submit" value="update"
											class="submit" id="submit" />
									</div>
								</form:form>
								<%-- </form> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
			$("#demoForm").validate({
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
					doj : "required"
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
					doj : "Please enter joining date"
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



