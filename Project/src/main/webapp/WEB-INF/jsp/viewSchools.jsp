<%@include file="/resources/header/login_head.jsp"%>
<%@include file="/resources/header/employee_viewTable.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>


</head>
<body>
	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading p-3 mb-2 bg-secondary text-white">ADMIN
				VIEW</div>
			<div class="list-group list-group-flush ">
				<!-- <a href="display"
					class="list-group-item list-group-item-action bg-light">School
					Information</a> -->
				<a href="/school/admin"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-address-book mr-3"></span>Student View</a> <a
					href="/school/allschool"
					class="list-group-item list-group-item-action bg-light"><span
					class="fa fa-group mr-3"></span>School View</a>


			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
			<!-- <button class="btn btn-primary" id="menu-toggle">Menu</button> -->
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
						class="nav-link dropdown-toggle fa fa-user-circle-o mr-3" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> User Option </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/school/index">Login Here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item fa fa-sign-out mr-3" href="logout">LogOut</a>
						</div></li>
				</ul>
			</div>
			</nav>
			<div class="container-fluid">
				<div class="co-md-12">

					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">School Details</div>
						<div class="panel-body"></div>
						<!-- Table -->
						<table id="example" class="display" style="width: 100%">

							<thead>
								<tr>
									<th>Id</th>
									<th>School Name</th>
									<th>School Email</th>
									<th>Google_Id</th>
									<th>Random Key</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Id</th>
									<th>School Name</th>
									<th>School Email</th>
									<th>Google_Id</th>
									<th>Random Key</th>
								</tr>
							</tfoot>


						</table>
						<!-- </table> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/js/datatable/jquery-3.3.1.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

	<script src="/resources/js/datatable/jquery.dataTables.min.js"></script>
	<script src="/resources/js/datatable/school_datatable.js"></script>



</body>
</html>



