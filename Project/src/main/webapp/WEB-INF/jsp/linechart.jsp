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
<title>LineChart</title>
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
			<div class="sidebar-heading p-3 mb-2 bg-secondary text-white">Welcome To ${school.school_name}</div>
			<div class="list-group list-group-flush">
				<div class="img logo rounded-circle mb-5">
					<img style="height: 150px; width: 200px"
						src="data:image/png;base64,${Image }" />
				</div>
					
				<a href="add_student"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-user mr-3"></span>Add Student</a> <a href="student_view"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-address-book mr-3"></span>View List Of Student</a> <a
					href="schoolResetPassword"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-key mr-3"></span>Reset Password</a>

				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a href=""
						class="list-group-item list-group-item-action bg-light dropdown-toggle"
						id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span class="fa fa-bar-chart mr-3"></span>Charts</a>
						<div class="dropdown-menu " aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="line"><span
								class="fa fa-line-chart mr-3"></span>Line Chart</a>
							<!-- <a
								class="dropdown-item" href="#"><span
								class="fa fa-bar-chart mr-3"></span>Bar Chart</a> -->
						</div></li>
				</ul>
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
								class="dropdown-item" href="display">School Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item fa fa-sign-out mr-3" href="logout">LogOut</a>
						</div></li>
				</ul>
			</div>
			</nav>

			<div class="container-fluid">
				<div class="co-md-12">
					<div class="panel panel-info">
						<!-- Default panel contents -->
						<div class="panel-heading">Graph</div>
						<div class="panel-body">
							<div style="height: 440px">
								<div class="container-fluid">
									<div class="co-md-12">
										<div id="container" class=""></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

	<script src="/resources/js/highchart/highcharts.js"></script>
	<script src="/resources/js/highchart/jquery.js"></script>
	<script src="/resources/js/highchart/index.js"></script>
</body>
</html>



