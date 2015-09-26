<%@page import="wfs.l2t.dto.dtoCategory"%>
<%@page import="wfs.l2t.model.ModelCategory"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="wfs.l2t.dto.dtoJob"%>
<%@ page import="wfs.l2t.model.ModelJob"%>
<%@ page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@ page import="wfs.l2t.controller.ControllerHome"%>
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
<title>Recommendation System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<script src="view/resource/bootstrap/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap-multiselect.css" />
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
								class="img-circle navbar-brand" width="60" height="70">
							<a class="navbar-brand custom_color_white"
								href="<%out.print(request.getContextPath());%>">
								RECOMMENDATION SYSTEM</a>
						</div>
					</div>
					<div class="col-md-7">
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
												class="glyphicon glyphicon-log-in"></span> Đăng
												xuất</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- chia trang thanh 2 cot -->
		<br> <br> <br>
		<div class="container-fluid">
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
							<ul class="nav nav-pills nav-stacked custom_font_bold">
								<li><a href="<%out.print(request.getContextPath());%>"><span
										class="glyphicon glyphicon glyphicon-home"></span> CÔNG VIỆC
										MỚI</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/care");%>"><span
										class="glyphicon glyphicon-heart"></span> CÔNG VIỆC QUAN TÂM</a></li>

								<li><a
									href="<%out.print(request.getContextPath() + "/recommendation");%>"><span
										class="glyphicon glyphicon glyphicon-pencil"></span> KHẢO SÁT</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/settings");%>"><span
										class="glyphicon glyphicon-cog"></span> THIẾT LẬP GỬI MAIL</a></li>
								<li class><a
									href="<%out.print(request.getContextPath() + "/listresume");%>"><span
										class="glyphicon glyphicon-list-alt"></span> XEM HỒ SƠ CỦA BẠN</a></li>
								<li class><a
									href="<%out.print(request.getContextPath() + "/help");%>"><span
										class="glyphicon glyphicon-question-sign"></span> TRỢ GIÚP</a></li>
								<li class><a
									href="<%out.print(request.getContextPath() + "/help?about");%>"><span
										class="glyphicon glyphicon-question-sign"></span> ABOUT</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color ">

					<br> <br>
					<div id="content-wrapper" class="panel-group"></div>
					<div style="text-align: center" id="loading" class="custom_hiden">
						<button class="btn btn-default pull-center">
							<i class="glyphicon glyphicon-repeat gly-spin"></i> Đang lấy dữ
							liệu...
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="view/resource/lib/job-utility.js"></script>
</body>
</html>