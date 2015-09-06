<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Recommendation System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js" async></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js" async></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<script src="view/resource/lib/check-register.js" async></script>
<script src="view/resource/lib/clickable-button.js" async></script>
</head>
<body>
	<div class="container-fluid" style="background-color: #D6D6FF;">
		<div class="container-fluid row" style="background-color: #00CCFF;">
			<div class="col-lg-7">
				<h1 class="text-center">JOB RECCOMENDATION SYSTEM</h1>
			</div>
			<div class="col-lg-5 row">
				<form class="form" role="form" action="ControllerLogin" method="post">
					<div class="col-lg-5">
						<div style="margin-top: 5px" class="form-group checkbox">
							<lable> Email </lable>
							<input type="email" class="form-control" placeholder="Email" name="login-email"> <input
								type="checkbox" style="margin-left: 0px;" name="login-check"
							>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Duy trì đăng nhập
						</div>
						<div>
							<p style="color: red;">
								<%=request.getAttribute("Message") != null ? request.getAttribute("Message") : ""%>
							</p>
						</div>
					</div>
					<div class="col-lg-5">
						<div style="margin-top: 5px" class="form-group">
							<lable for="pwd"> Mật khẩu</lable>
							<input type="password" class="form-control" name="login-pass"> <a href=""
								onclick="redirect(this);"
							> Quên mật khẩu à?</a>
						</div>
					</div>
					<div class="col-lg-2">
						<div style="margin-top: 25px;"></div>
						<div>
							<button type="submit" name="submit" class="btn btn-primary" value="login">Đăng nhập</button>
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
				<form action="ControllerLogin" class="form" role="form" method="post">
					<div class="form-group">
						<div class="form-group">
							<lable>Email</lable>
							<input name="reg-email" type="email" placeholder="Email" class="form-control" id="reg-email">
							<div id="txtHintEmail">								
							</div>
						</div>
						<div class="form-group">
							<lable>Tên tài khoản</lable>
							<input name="reg-username" type="text" placeholder="Your user name" class="form-control"
								id="reg-user"
							>
							<div id="txtHintUserName">								
							</div>
						</div>
						<div class="radio-inline">
							<label style="margin-right: 10px;"> Loại tài khoản </label> <label
								class="radio-inline disabled" data-toggle="tooltip"
								title="chức năng này chưa được kích hoạt"
							> <input class="disabled" type="radio" name="radio" value="employer">Nhà tuyển dụng
							</label> <label class="radio-inline"> <input type="radio" name="radio" value="job-seeker">Người
								tìm việc
							</label>
						</div>
						<div class="form-group">
							<lable>Mật khẩu</lable>
							<input name="reg-password" type="password" placeholder="mật khẩu" class="form-control"
								id="reg-pwd"
							>
							<div id="txtHintpwd">				
							</div>
						</div>
						<div class="form-group">
							<lable>Nhập lại mật khẩu</lable>
							<input name="reg-re-type-password" type="password" placeholder="mật khẩu"
								class="form-control" id="reg-rpwd"
							>
							<div id="txtHintrpwd">				
							</div>
						</div>
						<div class="form-group">
							<button type="submit" name="submit" class="form-control btn btn-info" value="register">Đăng
								ký</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>