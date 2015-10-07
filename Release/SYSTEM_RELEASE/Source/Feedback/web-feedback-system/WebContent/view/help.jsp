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
						<div>
							<ul class="nav nav-stacked nav-pills custom_font_bold" role="tablist">
								<li><a href="<%out.print(request.getContextPath());%>"><span
										class="glyphicon glyphicon glyphicon-home"></span> Việc Làm Mới</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/recommendation");%>"><span
										class="glyphicon glyphicon glyphicon-pencil"></span> Việc Làm Gợi Ý</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/listresume");%>"><span
										class="glyphicon glyphicon-list-alt"></span> Hồ Sơ Của Bạn</a></li>								
								<li ><a 
									href="<%out.print(request.getContextPath() + "/care");%>"><span
										class="glyphicon glyphicon-heart"></span> Việc Đã Lưu</a></li>
								<li ><a
									href="<%out.print(request.getContextPath() + "/settings");%>"><span
										class="glyphicon glyphicon-cog"></span> Thiết Lập Gửi Mail</a></li>

								<li class="active"><a
									href="<%out.print(request.getContextPath() + "/help");%>"><span
										class="glyphicon glyphicon-question-sign"></span> Trợ Giúp</a></li>
								<li ><a
									href="<%out.print(request.getContextPath() + "/help?about");%>"><span
										class="glyphicon glyphicon-question-sign"></span> About</a></li>										
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<br> <br>
					<div class="jumbotron">
						<h1>Hướng dẫn!</h1>
						<p>
							Đây là hệ thống giới thiệu việc làm. Hiện tại chúng tôi sẽ thu
							thập việc làm và giới thiệu cho bạn. Bạn sẽ nhận được các việc
							làm mới nhất từ các lĩnh vực mà bạn quan tâm. Để phục vụ các bạn
							tốt hơn chúng tôi mong muốn nhận được các phản hồi từ các bạn đối
							với các công việc được đề nghị để phục vụ các bạn tốt hơn! <br>
							Các tính năng chính của hệ thống:
						<ol>
							<li><b>Xem công việc mới:</b> <br> Mỗi ngày, hệ thống
								sẽ tự động thu thập các việc làm mới nhất từ mọi ngành nghề. Các
								việc làm này được lấy từ các website tuyển dụng hàng đầu như
								careerlink, vietnamworks,.. Các bạn có thể xem thông tin các
								việc làm này từ menu <b>"CÔNG VIỆC MỚI"</b>.<br> <br></li>
							<li><b>Xem công việc mà bạn quan tâm(thích): </b><br>
								Đây là tính năng cho phép bạn có thể xem lại những công việc mà
								bạn đã quan tâm. Bạn có thể sử dụng tính năng này bằng menu <b>"CÔNG
									VIỆC QUAN TÂM"</b>.<br> <br></li>
							<li><b>Khảo sát:</b> <br> Khi sử dụng menu này, hệ
								thống sẽ đưa ra khoảng từ 5 đến 10 công việc thuộc lĩnh vực mà
								bạn quan tâm. Hệ thống sẽ gửi mail việc làm cho bạn hàng tuần
								cho bạn. Bạn có thể thiết lập nhận mail bằng cách truy cập menu
								<b>"THIẾT LẬP GỬI MAIL"</b><br> <br> Để tham gia khảo
								sát bạn có 2 lựa chọn sau:<br> <img
								src="<%out.print(request.getContextPath()
					+ "/view/resource/image/khao_sat.PNG");%>">
								<br> <br> Bạn chọn dấu sao: Nghĩa là công việc này phù
								hợp <br> Bạn chọn dấu x: Công việc này không phù hợp với
								bạn. Bạn sẽ không thấy công việc này nữa.<br> <br></li>
							<li><b>Thiết lập gửi mail:</b> <br> Hệ thống chúng tôi
								sẽ gửi việc làm định kỳ cho các bạn qua email. Để thuận tiện cho
								các bạn chúng tôi cung cấp tính năng này để các bạn có thể lựa
								chọn các lĩnh vực việc làm mà bạn quan tâm, số việc làm mà bạn
								muốn nhận trong một lần gửi, và thời điểm mà bạn muốn nhận mail.
								Để sử dụng tính năng này bạn có thể truy cập menu <b>"THIẾT"LẬP
									GỬI MAIL"</b>.<br> <br></li>

							<li><b>Xem hồ sơ của bạn:</b> <br> Đây là tính năng cho
								phép bạn xem hồ sơ(CV) của mình, thêm hoặc chỉnh sửa hồ sơ. Bạn
								có thể sử dụng tính năng này bằng cách truy cập menu <b>"XEM
									HỒ SƠ CỦA BẠN"</b>.<br></li>
						</ol>
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






