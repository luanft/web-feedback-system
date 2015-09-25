<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Web theme</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
</head>
<body>
	<div class="container">
		<!-- menu top -->
		<nav
			class="navbar navbar-inverse navbar-fixed-top custom_navbar_color">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="navbar-header">
						<img
							src="<%out.print(request.getContextPath()
					+ "/view/resource/image/logo.jpg");%>"
							class="img-circle navbar-brand" width="60" height="70"> <a
							href="<%out.print(request.getContextPath());%>"
							class="navbar-brand custom_color_white"> RECOMMENDATION
							SYSTEM</a>
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<ul class="nav navbar-nav  navbar-right">
							<li><a href="<%out.print(request.getContextPath());%>">Home</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <span
									class="glyphicon glyphicon-user"></span> Xin chào!<span
									class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a
										href="<%out.print(request.getContextPath() + "/account");%>">Quản
											lý tài khoản</a></li>
									<li><a
										href="<%out.print(request.getContextPath() + "/login");%>"><span
											class="glyphicon glyphicon-log-in"></span> Đăng kí</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</nav>
		<!-- chia trang thanh 2 cot -->

		<div class="container-fluid">
			<br> <br> <br>
			<div class="row">
				<div class="col-md-3">
					<div data-spy="affix" data-offset-top="0">
						<div class="container-fluid col-md-offset-0"></div>
						<br>
						<div>

						</div>
					</div>
				</div>
				<div class="col-md-9">
					<br> <br>
					<div class="jumbotron">
						<h1>Về chúng tôi!</h1>
						<p>
							Hệ thống này dùng để giới thiệu việc làm. Hướng đến việc khuyến
							nghị công việc cho người dùng. Hệ thống được xây dựng bởi sinh
							viên UIT với sự hướng dẫn của quý thầy cô khoa công nghệ phần
							mềm. <br> <br> <i>Giáo viên hướng dẫn: ThS Huỳnh
								Ngọc Tín</i> <br> <i>Các thành viên tham gia: Trần Minh
								Luận, Hồ Thị Thanh Thảo, Nguyễn Thanh Anh Tuyên.</i>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	</div>
</body>
</html>






