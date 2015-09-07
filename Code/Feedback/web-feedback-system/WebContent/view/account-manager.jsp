<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Web theme</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
<script src="resource/lib/jquery-2.1.4.min.js"></script>
<script src="resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resource/css/theme_customize.css">
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
								src="http://thumbs.dreamstime.com/x/job-search-3d-icon-16095671.jpg"
								class="img-circle navbar-brand" width="60" height="70"> <a
								class="navbar-brand custom_color_white"> RECOMMENDATION
								SYSTEM</a>
						</div>
					</div>
					<div class="col-md-8">
						<div>
							<ul class="nav navbar-nav  navbar-right">
								<li><a href="#">Home</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"> <span
										class="glyphicon glyphicon-user"></span> Xin chào, ABC<span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"><span
												class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
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
						<div class="container-fluid col-md-offset-0">
							<h4>Xin chào!</h4>
							<img
								src="http://vui3g.com/files/posts/images/5-2014/girl-xinh-dan-toc-mong.jpg"
								class="img-rounded" width="170" height="170">
						</div>
						<br>
						<div>
							<ul class="nav nav-pills nav-stacked custom_font_bold">
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> CÔNG VIỆC MỚI
										NHẤT</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> LĨNH VỰC QUAN
										TÂM</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> THÔNG BÁO</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-cog"></span> THIẾT LẬP HỆ THỐNG</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-list-alt"></span> XEM HỒ SƠ CỦA BẠN</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-question-sign"></span> TRỢ GIÚP</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-envelope"></span> FEEDBACK</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color">
					<br>
					<!-- làm nhỏ lại-->

					<div class="container-fluid">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div>
									<div class="panel panel-primary">
										<div class="panel-heading">Thay đổi mật khẩu</div>
										<div class="panel-body">
											<form role="form">
												<div class="form-group">
													<label for="pwd">Password:</label> <input type="password"
														class="form-control" id="pwd">
												</div>
												<div class="form-group">
													<label for="pwd">Password:</label> <input type="password"
														class="form-control" id="pwd">
												</div>
												<button type="submit"
													class="btn btn-primary navbar-right custom_margin">Cập
													nhật mật khẩu</button>
											</form>
										</div>
									</div>

									<div class="panel panel-primary">
										<div class="panel-heading">Thay đổi ảnh đại diện</div>
										<div class="panel-body">
											<div class="container-fluid">
												<div class="row">
													<div class="col-md-6">
														<img
															src="http://vui3g.com/files/posts/images/5-2014/girl-xinh-dan-toc-mong.jpg"
															class="img-rounded col-md-offset-3" width="170"
															height="170">
													</div>
													<div class="col-md-6">
														<form role="form">
															<div class="form-group">
																<label for="pwd">Url ảnh:</label> <input type="file"
																	accept="image/*" class="file" id="pwd">
															</div>
															<button type="submit"
																class="btn btn-primary navbar-right custom_margin">Thay
																đổi</button>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="panel panel-primary">
										<div class="panel-heading">Thay đổi tên truy cập</div>
										<div class="panel-body">

											<form role="form">
												<div class="form-group">
													<label for="pwd">Tên truy cập mới:</label> <input
														type="text" class="form-control" id="pwd">
												</div>
												<button type="submit"
													class="btn btn-primary navbar-right custom_margin">Thay
													đổi</button>
											</form>

										</div>
									</div>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
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





