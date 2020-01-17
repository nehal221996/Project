<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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




<title>Admin Login</title>


</head>
<body>


	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">Login</div>
				<div class="panel-body">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h3>Registrtion Successfull</h3>
						<form action="alllogin" method="POST" id="demoForm">
							<div class="form-row">

								<div class=" form-group">
									<label>Select Login As</label> <select class="form-control"
										name="login_as" id="login_as" value="login_as" class="sel"
										placeholder="login as">
										<option value="">select Login as</option>
										<option value="school">School</option>
										<option value="student">Student</option>
									</select>
								</div>

								<div class=" form-group">
									<label>Email</label> <input class="form-control" name="email"
										id="" />
								</div>

								<div class=" form-group">
									<label>Password</label> <input class="form-control"
										type="password" name="password" id="password" />
								</div>

								<div class=" form-group">
									<input class="form-control" type="submit" name="submit"
										value="login" id="submit">
								</div>

								<div class="form-group">
									<a href="registration">Don't have account? Create an
										account</a>
								</div>

							</div>
						</form>
						 <p id="" class="message">-----Or-----</p>
						<button
							onclick=" window.location.href ='https://accounts.google.com/o/oauth2/v2/auth?redirect_uri=http://localhost:8080/callback&prompt=consent&response_type=code&client_id=732118873335-vcaolepnkn18gu13tlonpo6p1i5beotc.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.me+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&access_type=offline';"
							id="google">Login With Google</button> 

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(function() {
		// Initialize form validation on the registration form.
		// It has the name attribute "registration"
		$("#demoForm")
				.validate(
						{
							// Specify validation rules
							rules : {

								loginas : "required",
								email : {
									required : true,
									// Specify that email should be validated
									// by the built-in "email" rule
									email : true
								},
								password : {
									required : true,
									minlength : 3
								}
							},
							// Specify validation error messages
							messages : {
								loginas : "Please select login option",
								email : {
									required : "Please provide a email adress",
									email : "Please enter valid email address"
								},
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


