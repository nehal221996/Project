<%@include file="/resources/header/login_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
					<!-- <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="login">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li> -->
				</ul>
			</div>
			</nav>

			<div class="container-fluid">
				<div class="co-md-12">

					<div class="panel panel-info">
						<!-- Default panel contents -->

						<div class="panel-heading">Student Profile</div>
						<div class="panel-body">
							<h5>${msg }</h5>
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
								</tr>

								<tr>
									<td>${student.pincode }</td>
									<td></td>
									<td>${student.contact_no }</td>
									<td></td>
									<td>${student.doj }</td>
									<td></td>
									<td>${student.password }</td>
								</tr>

							</table>
						</div>
						<!-- </table> -->
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
















	<%-- <div class="container">
		<div class="row">

			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">School Detail</div>
				<div class="panel-body">

					<ul>
						<!-- <li style="float: left;"><button class="btn default" onclick="myFunction()">Graph</button></li> -->
						<!-- li><button class="btn default">
							<a href="line">Graph</a>
						</button></li> -->

						<li style="float: right;"><button class="btn default">
								<a href="logout">Logout</a>
							</button></li>
					</ul>

					<!-- Table -->
					<table class="table">
						<!-- <table align="center" border="1"> -->
						<tr>
							<th>School Id</th>
							<th>School Name</th>
							<th>School Email</th>
							<th>Image</th>
							<th colspan="2">Action</th>
						</tr>
						<c:forEach items="${sdata}" var="dt">
						<tr>
							<td>${school.id}</td>
							<td>${school.school_name}</td>
							<td>${school.school_email}</td>
							<td><img style="height: 80px; width: 70px"
								src="data:image/png;base64,${Image }" /> 	<td><a href="delete?did=${dt.id}">Delete</a></td>
							<td><a href="add_student">Add Student</a></td>
							<td><a href="student_view">View List Of Student</a></td>
						</tr>
						</c:forEach>


					</table>
				</div>
				<!-- </table> -->
			</div>
		</div>
	</div> --%>
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



