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

<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


</head>
<body>

	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Student Detail</div>
				<div class="panel-body"></div>

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
						<th>Action</th>
					</tr>
					<c:forEach items="${sdata}" var="dt">
						<tr>
							<td>${dt.id}</td>
							<td>${dt.name}</td>
							<td>${dt.email}</td>
							<td>${dt.dob}</td>
							<td>${dt.gender}</td>
							<td>${dt.address}</td>
							<td>${dt.state }</td>
							<td>${dt.city }</td>
							<td>${dt.pincode }</td>
							<td>${dt.contact_no }</td>
							<td>${dt.doj }</td>
							<td><a href="delete?did=${dt.id}">Delete</a></td>
						</tr>
					</c:forEach>


				</table>
				<!-- </table> -->
			</div>
		</div>
	</div>

	

</body>
</html>



