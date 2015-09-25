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
	<div class="container-fluid">
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
			<form action="" class = "form" role = "form" method = "post">
				<div class = "form-group col-lg-4"></div>				
				<div class = "form-group col-lg-4 jumbotron">
					<p class = "text-center">Reset your password!</p>
					<div class = "form-group">
						<lable> Please enter your email or your user name!</lable>
						<input type = "text" class = "form-control" placeholder = "email or user name">
					</div>
					<div class = "form-group form-inline pull-right" >
						<button type = "button" class = "form-control btn btn-info"> Submit</button>
						<button type = "button" class = "form-control btn btn-default"> Cancel</button>												
					</div>
				</div>				
				<div class = "form-group col-lg-4"></div>				
			</form>
		</div>
	</div>
</body>
</html>