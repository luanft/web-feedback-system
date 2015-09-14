<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ page import ="wfs.l2t.dto.*" %>
  <%@ page import ="java.util.HashMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Resume Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/resume_profile.css">
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<script src="view/resource/lib/add-resume.js"></script>

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
								<li><a href="#"><span class="glyphicon glyphicon-user"></span>
										Xin chào, HIhIhi</a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-log-in"></span> Thoát</a></li>
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
					<div class="container-fluid">
						<div class="panel panel-default">
	
							
							<!-- Personal Detail -->
							<div class="panel-heading">
							Danh sách CV
							</div>
							<div class="panel-body">
								<% if((int)request.getAttribute("listCount")==0) out.print("Bạn chưa có CV nào!");%>
								<c:forEach var="entry" items="${listTitle}">
									<a href="<%out.print(request.getContextPath());%>/resume?id=${entry.key}">${entry.value}</a>
								</c:forEach>
								<br><a href='#' id= 'add-resume-link'>Thêm CV</a>
							</div>
							<div id="add-resume-div">
							<jsp:include page="./add-resume.jsp"></jsp:include>
							</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
</html>