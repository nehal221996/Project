<%@include file="/resources/header/login_head.jsp"%>
<%@include file="/resources/header/employee_viewTable.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>


</head>
<body>

	<div class="container">
		<div class="row">

			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Student Detail</div>
				<div class="panel-body"></div>
				<a href="logout">LogOut</a>
				<!-- Table -->
							<table id="example" class="display" style="width: 100%">

								<thead>
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
										

									</tr>
								</thead>
								<tfoot>
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

									</tr>
								</tfoot>


							</table>
							<!-- </table> -->
			</div>
		</div>
	</div>

	<script src="/resources/js/datatable/jquery-3.3.1.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/datatable/jquery.dataTables.min.js"></script>
	<script src="/resources/js/datatable/admin_datatable.js"></script>
</body>
</html>



