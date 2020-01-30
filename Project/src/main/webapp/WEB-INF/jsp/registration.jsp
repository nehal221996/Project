<%@include file="/resources/header/bootstrapCdn.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="/resources/jqueryValidation/jquery.min.js"></script>
<script src="/resources/jqueryValidation/jquery.validate.min.js"></script>

<style>
.error {
	color: red;
}
</style>
<title>Registation</title>
</head>
<body>


	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">Registration</div>
				<div class="panel-body">
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<form action="save" method="POST" id="demoForm"
							enctype="multipart/form-data">

							<div class="form-group">
								<label>Enter your School Name</label> <input
									class="form-control" type="text" name="school_name" id="" />
							</div>

							<div class="form-group">
								<label>School Email</label> <input class="form-control"
									type="email" name="school_email" id="" />
							</div>

							<div class="form-group">
								<label>Password</label> <input class="form-control"
									type="password" name="school_pass" id="school_pass" />
							</div>

							<div class="form-group">
								<label>Confirm Password</label> <input class="form-control"
									type="password" name="con_pass" id="con_pass" />
							</div>

							<div class="form-group">
								<label>select</label> <input class="form-control" type="file"
									name="image" id="image" />
							</div>

							<div class="form-group">
								<input type="submit" name="submit" value="register"
									class="submit" id="submit" />
							</div>

							<div class="form-group">
								<a href="/school/index">Already have an account? Login here</a>
							</div>

						</form>
						<button
							onclick=" window.location.href ='https://accounts.google.com/o/oauth2/v2/auth?redirect_uri=http://localhost:8080/callback&prompt=consent&response_type=code&client_id=732118873335-vcaolepnkn18gu13tlonpo6p1i5beotc.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.me+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&access_type=offline';"
							id="google">Sign up With Google</button>
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
								school_name : "required",
								school_email : {
									required : true,
									// Specify that email should be validated
									// by the built-in "email" rule
									email : true
								},
								school_pass : {
									required : true,
									minlength : 5
								},
								con_pass : {
									required : true,
									equalTo : "#school_pass",
								},
								image : "required"
							},
							// Specify validation error messages
							messages : {
								school_name : "Please enter your school name",
								school_email : {
									required : "Please provide a school email adress",
									email : "Please enter valid email address"
								},
								school_pass : {
									required : "Please provide a password",
									minlength : "Your password must be at least 5 characters long"
								},
								con_pass : {
									required : "Confirm password required",
									equalTo : "Password not match",
								},
								image : "Please select your School Logo"
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