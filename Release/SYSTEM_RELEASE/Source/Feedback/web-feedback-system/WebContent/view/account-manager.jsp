<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%
	String userId = (String) request.getAttribute("user");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);
%>
<!DOCTYPE html>
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
										class="glyphicon glyphicon-user"></span> Xin chào <%=dtoAcc.userName%><span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a
											href="<%out.print(request.getContextPath() + "/account");%>">Quản
												lý tài khoản</a></li>
										<li><a
											href="<%out.print(request.getContextPath() + "/home?logout=true");%>"><span
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
								src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
								class="img-rounded" width="170" height="170">
						</div>
						<br>
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

								<li ><a
									href="<%out.print(request.getContextPath() + "/help");%>"><span
										class="glyphicon glyphicon-question-sign"></span> Trợ Giúp</a></li>
								<li ><a
									href="<%out.print(request.getContextPath() + "/help?about");%>"><span
										class="glyphicon glyphicon-question-sign"></span> About</a></li>										
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color">
					<br>
					<%
						String error = (String) request.getAttribute("error_message");
						if (error != null) {
							out.print("<div class=\"alert alert-danger fade in\">");
							out.print("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
							out.print("<strong>Lỗi!</strong> " + error + " </div>");
						}
					%>
					<div>
						<div class="panel panel-primary">
							<div class="panel-heading">Thay đổi mật khẩu</div>
							<div class="panel-body">
								<form role="form" method="post" action="account">
									<div class="form-group">
										<label for="pwd">Mật khẩu cũ:</label> <input type="password"
											name="fcp-old-pass" class="form-control" id="pwd">
									</div>
									<div class="form-group">
										<label for="pwd">Mật khẩu mới:</label> <input type="password"
											name="fcp-new-pass" class="form-control" id="pwd">
									</div>
									<div class="form-group">
										<label for="pwd">Xác nhận mật khẩu mới:</label> <input
											type="password" name="fcp-confirm-pass" class="form-control"
											id="pwd">
									</div>
									<button type="submit" name="btnChangePass"
										value="fcp-btn-change"
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
												src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
												class="img-rounded col-md-offset-3" width="170" height="170" id="avartar_preview">
										</div>
										<div class="col-md-6">
											<form role="form" method="post" action="account"
												enctype="multipart/form-data">
												<div class="form-group">
													<label for="file">Url ảnh:</label> <input type="file"
														accept="image/*" onchange="loadFile(event)" class="file" name="image-avatar"
														id="file">
												</div>
												<div class="form-group">
													<button type="submit" name="btnChangeAvatar"
														value="fca-btn-change"
														class="btn btn-primary navbar-right custom_margin">Thay
														đổi</button>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>
						</div>											
						<script>
							var loadFile = function(event) {
								var output = document.getElementById('avartar_preview');
								output.src = URL
										.createObjectURL(event.target.files[0]);
							};
						</script>
						<div class="panel panel-primary">
							<div class="panel-heading">Thay đổi tên truy cập</div>
							<div class="panel-body">
								<form role="form" method="post" action="account">
									<div class="form-group">
										<label for="pwd">Tên truy cập mới:</label> <input type="text"
											name="fcn-new-user-name" class="form-control"
											value="<%=dtoAcc.userName%>" id="pwd">
									</div>
									<button type="submit" name="changeUserName"
										class="btn btn-primary navbar-right custom_margin">Thay
										đổi</button>
								</form>
							</div>
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






