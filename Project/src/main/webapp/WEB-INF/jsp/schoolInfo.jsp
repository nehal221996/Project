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
<title>Admin Home</title>

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
				to ${school.school_name} ${student.name }</div>
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
						<!-- Default panel contents -->
						<div class="panel-heading">School Information</div>
						<h1>${msg }</h1>
						<div class="panel-body">

							<!-- <ul>
								<li style="float: left;"><button class="btn default" onclick="myFunction()">Graph</button></li>
								li><button class="btn default">
							<a href="line">Graph</a>
						</button></li>

								<li style="float: right;"><button class="btn default">
										<a href="logout">Logout</a>
									</button></li>
							</ul> -->

							<!-- Table -->
							<table class="table">
								<!-- <table align="center" border="1"> -->
								<tr>
									<th>School Id</th>
									<th>School Name</th>
									<th>School Email</th>
									<!-- <th>Image</th> -->
									<!-- <th colspan="2">Action</th> -->
								</tr>
								<%-- <c:forEach items="${sdata}" var="dt"> --%>
								<tr>
									<td>${schoolId}</td>
									<td>${school.school_name}</td>
									<td>${school.school_email}</td>
									<%-- <td><img style="height: 200px; width: 200px"/>${school.image }</td>  --%>
								</tr>
								<%-- </c:forEach> --%>


							</table>
						</div>
						<!-- </table> -->
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>


	</div>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>



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
</body>
</html>



