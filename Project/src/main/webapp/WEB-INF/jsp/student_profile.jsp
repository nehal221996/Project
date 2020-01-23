<%@include file="/resources/header/login_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Admin Home</title>

<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"> -->

<!-- Optional theme -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> -->

<!-- Latest compiled and minified JavaScript -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
 -->
<!-- Bootstrap core CSS -->
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 -->
<!-- Custom styles for this template -->
<!-- <link href="/resources/css/simple-sidebar.css" rel="stylesheet"> -->


</head>
<body>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">Menu</div>
			<div class="list-group list-group-flush">
				<a href="schoolInfo"
					class="list-group-item list-group-item-action bg-light">School
					Information</a><a href="update?uid=${student.id }"
					class="list-group-item list-group-item-action bg-light">Update
					Profile</a> <a href="resetpassword"
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
								class="dropdown-item" href="profile">Student Profile</a>
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

						<div class="panel-heading">Student Profile</div>
						<div class="panel-body">
							<div class="alert alert-success" role="alert">${msg }</div>
							
							 <!-- Table -->

							<table class="table">

								<tr>
									<th>School Id</th>
									<th></th>
									<th>Student Name</th>
									<th></th>
									<th>Email</th>
									<th></th>
									<th>Date Of Birth</th>
									<th></th>
								</tr>


								<tr>
									<td>${student.schoolId }</td>
									<td></td>
									<td>${student.name }</td>
									<td></td>
									<td>${student.email }</td>
									<td></td>
									<td>${student.dob }</td>
									<td></td>
								</tr>

								<tr>
									<th>Gender</th>
									<th></th>
									<th>Address</th>
									<th></th>
									<th>City</th>
									<th></th>
									<th>State</th>
									<th></th>
								</tr>

								<tr>
									<td>${student.gender }</td>
									<td></td>
									<td>${student.address }</td>
									<td></td>
									<td>${student.city }</td>
									<td></td>
									<td>${student.state }</td>
									<td></td>
								</tr>

								<tr></tr>

								<tr>
									<th>Pincode</th>
									<th></th>
									<th>Mobile</th>
									<th></th>
									<th>Date Of Joining</th>
									<th></th>
									<th>Password:</th>
									<th></th>
									<th>Random key</th>
								</tr>

								<tr>
									<td>${student.pincode }</td>
									<td></td>
									<td>${student.contact_no }</td>
									<td></td>
									<td>${student.doj }</td>
									<td></td>
									<td>${student.password }</td>
									<td></td>
									<td>${student.studentRandom_key }</td>
								</tr>
								
								

							</table> 
							<button type="submit" class="btn btn-primary" id="btnAddkey">Generate
								Random Key</button>
						</div>
						<!-- </table> -->
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/validation/studentRandom_key.js"></script>
	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
</body>
</html>



