<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Recommendation System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
<script src="resource/lib/jquery-2.1.4.min.js"></script>
<script src="resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resource/css/theme_customize.css">
</head>
<body>
	<div class="container-fluid"  style="background-color: #D6D6FF;">
		<div class="container-fluid row" style="background-color: #00CCFF;">
			<div class="col-lg-7">
				<h1 class = "text-center">JOB RECCOMENDATION SYSTEM</h1>
			</div>
			<div class="col-lg-5 row">
				<form class="form" role="form" action="" method="post">
					<div class="col-lg-5">
						<div style="margin-top: 5px" class="form-group checkbox">
							<lable for="email"> Email </lable>
							<input type="email" class="form-control" id="email"> <input type="checkbox"
								style="margin-left: 0px;"
							>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keep me logged in
						</div>
					</div>
					<div class="col-lg-5">
						<div style="margin-top: 5px" class="form-group">
							<lable for="pwd"> Password</lable>
							<input type="password" class="form-control" id="pwd"> <a href=""> Forgot your
								password?</a>
						</div>
					</div>
					<div class="col-lg-2">
						<div style="margin-top: 25px;"></div>
						<div>
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid row">
			<div class="col-lg-7">
				<h1>Welcome to Job Recommendation System!</h1>
				<h2>Getting started to join world employment :D</h2>
			</div>
			<div class="col-lg-5">
				<h2>Sign up for free!</h2>
				<form action="" class="form" role="form" method="post">
					<div class="form-group">
						<div class="form-group">
							<lable>Email</lable>
							<input type="text" placeholder="Email" class="form-control" id="reg-email">
						</div>
						<div class="form-group">
							<lable>User name</lable>
							<input type="text" placeholder="Your user name" class="form-control" id="reg-user">
						</div>
						<div class="radio-inline">
							<label style="margin-right: 10px;"> Account Type</label> <label class="radio-inline">
								<input type="radio" name="optradio">Employer
							</label> <label class="radio-inline"> <input type="radio" name="optradio">Job Seeker
							</label>
						</div>
						<div class="form-group">
							<lable>Password</lable>
							<input type="password" placeholder="Your new password" class="form-control" id="reg-pwd">
						</div>
						<div class="form-group">
							<lable>Re-type password</lable>
							<input type="password" placeholder="Re-type your password" class="form-control" id="reg-rpwd">
						</div>
						<div class="form-group">
							<button type="button" class="form-control btn btn-info">Sign up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>