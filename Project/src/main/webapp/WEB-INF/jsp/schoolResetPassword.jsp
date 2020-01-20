<%@include file="/resources/header/login_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>


</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Menu</div>
			<div class="list-group list-group-flush">
				<a href="display"
					class="list-group-item list-group-item-action bg-light">School
					Information</a> <a href="add_student"
					class="list-group-item list-group-item-action bg-light">Add
					Student</a> <a href="student_view"
					class="list-group-item list-group-item-action bg-light">View
					List Of Student</a> <a href="line"
					class="list-group-item list-group-item-action bg-light">Graph</a><a
					href="updateSchoolPass"
					class="list-group-item list-group-item-action bg-light">Reset
					Password</a> <a href="logout"
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
						<!-- Default panel contents -->
						<div class="panel-heading">Password Reset</div>
						<div class="panel-body">

							<div class="col-md-4"></div>
							<div class="col-md-12">

								<h3>Details</h3>
								<form action="schoolResetPassword" method="POST"
									id="formCheckPassword">

									<!-- <div class="form-group">
						<label>Old Password</label>
						 <input class="form-control" type="password" name="pass_old" id="password_old">	
						<div id="passwordold_error" style="color: red;"></div>
						</div> -->

									<br>
									<div class="form-group">
										<label>New Password</label> <input class="form-control"
											type="password" name="pass" id="password">
									</div>

									<div class="form-group">
										<br> <label>Confirm Password</label> <input
											class="form-control" type="password" id="con_password"
											name="con_pass">
									</div>
									<br> <input class="" type="submit" name="submit"
										value="reset" id="submit">

								</form>
							</div>
						</div>
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
			$("#formCheckPassword").validate({
				/*
				 * here we define the rules for the password and confirmpassword input
				 * type field in the html page.
				 */

				rules : {
					pass : {
						required : true,
						minlength : 6,
						maxlength : 10,
					},
					con_pass : {
						required : true,
						equalTo : "#pass",
						minlength : 6,
						maxlength : 10
					}
				},
				/*
				 * here we define the messages for the password and confirmpassword in
				 * case the user does not fulfill the rules defined above.
				 */
				messages : {
					pass : {
						required : "The password is required",
						minlength : "Minimum 6 characters",
						maxlength : "Maximum 10 characters"
					},
					con_pass : {
						required : "Confirm password required",
						equalTo : "Password not match",
						minlength : "Minimum 6 characters",
						maxlength : "Maximum 10 characters"
					}
				},

				submitHandler : function(form) {
					form.submit();
				}
			});

		});
	</script>
</body>
</html>



