<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<!-- validation -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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




<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>


<title>Student Registration</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">Add Student</div>
				<div class="panel-body">
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<form action="saveStudent" method="POST" id="demoForm">

							<div class="form-group">
								<label>Enter Student Name</label> <input class="form-control"
									type="text" name="name" id="" />
							</div>

							<div class="form-group">
								<label>Student Email</label> <input class="form-control"
									type="email" name="email" id="" />
							</div>

							<div class="form-group">
								<label>Date Of Birth</label> <input class="form-control"
									type="date" name="dob" id="" />
							</div>

							<div class="form-group">
								<label>Gender</label> <input type="radio" name="gender"
									value="male"> Male <input type="radio" name="gender"
									value="female"> Female<br>
							</div>

							<div class="form-group">
								<label>Address</label> <input class="form-control" type="text"
									name="address" id="" />
							</div>

							<div class="form-group">
								<label>State</label> <input class="form-control" type="text"
									name="state" id="" />
							</div>

							<div class="form-group">
								<label>City</label> <input class="form-control" type="text"
									name="city" id="" />
							</div>

							<div class="form-group">
								<label>Pincode</label> <input class="form-control" type="text"
									name="pincode" id="" />
							</div>

							<div class="form-group">
								<label>Mobile No</label> <input class="form-control" type="text"
									name="contact_no" id="" />
							</div>

							<div class="form-group">
								<label>Date of Joining</label> <input class="form-control"
									type="text" name="doj" id="" />
							</div>
							<div class="form-group">
								<label>Password</label> <input class="form-control"
									type="password" name="password" id="" />
							</div>

							<div class="form-group">
								<input class="" type="hidden" name="schoolId" value="schoolId"
									id="" />
							</div>

							<div class="form-group">
								<input type="submit" name="submit" value="register"
									class="submit" id="submit" />
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>


<script type="text/javascript">
	$(function() {
		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		$("#demoForm")
				.validate(
						{
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
								doj : "required",
								password : {
									required : true,
									minlength : 5
								}
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
								doj : "Please enter joining date",
								password : {
									required : "Please provide a password",
									minlength : "Your password must be at least 5 characters long"
								}

							},
							// Make sure the form is submitted to the destination defined
							// in the "action" attribute of the form when valid
							submitHandler : function(form) {
								form.submit();
							}
						});
	});
</script>
</html>