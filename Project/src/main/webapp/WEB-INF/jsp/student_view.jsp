<%@include file="/resources/header/login_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Student View</title>


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
					href="schoolResetPassword"
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
					<!-- <li class="nav-item active"><a class="nav-link" onclick="myFunction()" href="">Download
							<span class="sr-only">(current)</span>
					</a></li> -->
					<li style="float: right"><button class="btn default"
							onclick="myFunction()">Download File</button></li>


				</ul>
			</div>
			</nav>



			<div class="container-fluid">
				<div class="row">

					<div class="panel panel-info">
						<!-- Default panel contents -->
						<div class="panel-body"></div>
						<div class="panel-heading">Student Detail</div>
						<div class="panel-body"></div>
						<div class="col-md-4">

							<!-- Table -->
							<table class="table">
								<!-- <table align="center" border="1"> -->
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Email</th>
									<th>Date Of Birth</th>
									<th>Gender</th>
									<th>Address</th>
									<th>State</th>
									<th>City</th>
									<th>Pincode</th>
									<th>Mobile No</th>
									<th>Date of Joining</th>
									<!-- <th>Password</th> -->
									<th colspan="2">Action</th>
								</tr>
								<c:forEach items="${stddata}" var="dt">
									<tr>
										<td>${dt.id}</td>
										<td>${dt.name}</td>
										<td>${dt.email}</td>
										<td>${dt.dob}</td>
										<td>${dt.gender}</td>
										<td>${dt.address}</td>
										<td>${dt.city}</td>
										<td>${dt.state}</td>
										<td>${dt.pincode}</td>
										<td>${dt.contact_no}</td>
										<td>${dt.doj}</td>
										<%-- <td>${dt.password}</td>  --%>
										<td><a href="delete?did=${dt.id}">Delete</a></td>

									</tr>
								</c:forEach>


							</table>
							<!-- </table> -->
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<script src="/resources/js/studentdownload.js"></script>
</body>
</html>



