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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>



</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Menu</div>
			<div class="list-group list-group-flush">
				<a href="schoolInfo"
					class="list-group-item list-group-item-action bg-light">School
					Information</a><a href="profile"
					class="list-group-item list-group-item-action bg-light">Student
					Information</a><a href="update?uid=${student.id }"
					class="list-group-item list-group-item-action bg-light">Update
					Profile</a> <a href="resetpassword"
					class="list-group-item list-group-item-action bg-light">Reset
					Password</a><a href="logout"
					class="list-group-item list-group-item-action bg-light">LogOut</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->



		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
			<button class="btn btn-primary" id="menu-toggle">Menu</button>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link"
						href="registration">Register here <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="/school/index">Login here <span class="sr-only">(current)</span>
					</a></li>

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

									<div class="form-group">
										<form:label path="password">Password</form:label>
										<form:hidden class="form-control" path="password"
											name="password" />
									</div>

									<div class="form-group">
										<input class="" type="hidden" name="schoolId" value="schoolId"
											id="" />
									</div>

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
</body>
</html>



