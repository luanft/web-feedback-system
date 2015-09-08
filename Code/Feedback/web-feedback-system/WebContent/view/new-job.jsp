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
</head>
<body>
	<div class="container">
		<!-- menu top -->
		<nav class="navbar navbar-inverse navbar-fixed-top custom_navbar_color">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="navbar-header">
							<img src="http://thumbs.dreamstime.com/x/job-search-3d-icon-16095671.jpg"
								class="img-circle navbar-brand" width="60" height="70"
							> <a class="navbar-brand custom_color_white"> RECOMMENDATION SYSTEM</a>
						</div>
					</div>
					<div class="col-md-7">
						<div>
							<ul class="nav navbar-nav  navbar-right">
								<li><a href="#">Home</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
										class="glyphicon glyphicon-user"
									></span> Xin chào, ABC<span class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#">Thay đổi mật khẩu</a></li>
										<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
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
							<img src="http://vui3g.com/files/posts/images/5-2014/girl-xinh-dan-toc-mong.jpg"
								class="img-rounded" width="170" height="170"
							>
						</div>
						<br>
						<div>
							<ul class="nav nav-pills nav-stacked custom_font_bold">
								<li class><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> CÔNG VIỆC
										MỚI NHẤT</a></li>
								<li class><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> LĨNH VỰC
										QUAN TÂM</a></li>
								<li class><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> THÔNG BÁO</a></li>
								<li class><a href="#"><span class="glyphicon glyphicon-list-alt"></span> XEM HỒ SƠ
										CỦA BẠN</a></li>
								<li class><a href="#"><span class="glyphicon glyphicon-question-sign"></span> TRỢ
										GIÚP</a></li>
								<li class><a href="#"><span class="glyphicon glyphicon-envelope"></span> FEEDBACK</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color panel-group">
					<br>
					<div class="panel panel-info">
						<div class="panel-heading">
							<a id="see-more" class="btn btn-link"> <b><%=request.getAttribute("jobTitle")%></b></a>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="company">
									<pre>Công ty: <%=request.getAttribute("company")%></pre>
								</div>
								<div class="location">
									<pre>Địa chỉ: <%=request.getAttribute("location")%></pre>
								</div>
								<div class="salary">
									<pre><%=request.getAttribute("salary")%></pre>
								</div>
								<div id="short-description">
									<pre>We are looking for a talented Ruby on Rails Developer who wants to work with new Developers in an interactive working Environment. If you are young,...</pre>
								</div>
								<div id="full-info" class="collapse">
									<div class="description">
										<pre>Description:
<%=request.getAttribute("description")%>
										</pre>
									</div>
									<div class="requirement">
										<pre>Requirement:
<%=request.getAttribute("requirement")%> </pre>
									</div>
									<div class="benifit">
										<pre>Benifit:
<%=request.getAttribute("benifit")%></pre>
									</div>
									<div class="expired">
										<pre>Expired:<%=request.getAttribute("expired")%></pre>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<label>Bạn thấy công việc này có phù hợp với bạn không?</label> <a href="#"
								class="btn btn-default glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
								title="Việc này phù hợp với tôi!"
							></a> <a href="#" class="btn btn-default glyphicon glyphicon-thumbs-down" data-toggle="tooltip"
								title="Việc này không hợp, bỏ đi!" style="margin-left: 8px; margin-right: 8px;"
							></a>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<a id="see-more" class="btn btn-link"> <b><%=request.getAttribute("jobTitle")%></b></a>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="company">
									<pre>Công ty: <%=request.getAttribute("company")%></pre>
								</div>
								<div class="location">
									<pre>Địa chỉ: <%=request.getAttribute("location")%></pre>
								</div>
								<div class="salary">
									<pre><%=request.getAttribute("salary")%></pre>
								</div>
								<div id="short-description">
									<pre>We are looking for a talented Ruby on Rails Developer who wants to work with new Developers in an interactive working Environment. If you are young,...</pre>
								</div>
								<div id="full-info" class="collapse">
									<div class="description">
										<pre>Description:
<%=request.getAttribute("description")%>
										</pre>
									</div>
									<div class="requirement">
										<pre>Requirement:
<%=request.getAttribute("requirement")%> </pre>
									</div>
									<div class="benifit">
										<pre>Benifit:
<%=request.getAttribute("benifit")%></pre>
									</div>
									<div class="expired">
										<pre>Expired:<%=request.getAttribute("expired")%></pre>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<label>Bạn thấy công việc này có phù hợp với bạn không?</label> <a href="#"
								class="btn btn-default glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
								title="Việc này phù hợp với tôi!"
							></a> <a href="#" class="btn btn-default glyphicon glyphicon-thumbs-down" data-toggle="tooltip"
								title="Việc này không hợp, bỏ đi!" style="margin-left: 8px; margin-right: 8px;"
							></a>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<a id="see-more" class="btn btn-link"> <b><%=request.getAttribute("jobTitle")%></b></a>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="company">
									<pre>Công ty: <%=request.getAttribute("company")%></pre>
								</div>
								<div class="location">
									<pre>Địa chỉ: <%=request.getAttribute("location")%></pre>
								</div>
								<div class="salary">
									<pre><%=request.getAttribute("salary")%></pre>
								</div>
								<div id="short-description">
									<pre>We are looking for a talented Ruby on Rails Developer who wants to work with new Developers in an interactive working Environment. If you are young,...</pre>
								</div>
								<div id="full-info" class="collapse">
									<div class="description">
										<pre>Description:
<%=request.getAttribute("description")%>
										</pre>
									</div>
									<div class="requirement">
										<pre>Requirement:
<%=request.getAttribute("requirement")%> </pre>
									</div>
									<div class="benifit">
										<pre>Benifit:
<%=request.getAttribute("benifit")%></pre>
									</div>
									<div class="expired">
										<pre>Expired:<%=request.getAttribute("expired")%></pre>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<label>Bạn thấy công việc này có phù hợp với bạn không?</label> <a href="#"
								class="btn btn-default glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
								title="Việc này phù hợp với tôi!"
							></a> <a href="#" class="btn btn-default glyphicon glyphicon-thumbs-down" data-toggle="tooltip"
								title="Việc này không hợp, bỏ đi!" style="margin-left: 8px; margin-right: 8px;"
							></a>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<a id="see-more" class="btn btn-link"> <b><%=request.getAttribute("jobTitle")%></b></a>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="company">
									<pre>Công ty: <%=request.getAttribute("company")%></pre>
								</div>
								<div class="location">
									<pre>Địa chỉ: <%=request.getAttribute("location")%></pre>
								</div>
								<div class="salary">
									<pre><%=request.getAttribute("salary")%></pre>
								</div>
								<div id="short-description">
									<pre>We are looking for a talented Ruby on Rails Developer who wants to work with new Developers in an interactive working Environment. If you are young,...</pre>
								</div>
								<div id="full-info" class="collapse">
									<div class="description">
										<pre>Description:
<%=request.getAttribute("description")%>
										</pre>
									</div>
									<div class="requirement">
										<pre>Requirement:
<%=request.getAttribute("requirement")%> </pre>
									</div>
									<div class="benifit">
										<pre>Benifit:
<%=request.getAttribute("benifit")%></pre>
									</div>
									<div class="expired">
										<pre>Expired:<%=request.getAttribute("expired")%></pre>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<label>Bạn thấy công việc này có phù hợp với bạn không?</label> <a href="#"
								class="btn btn-default glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
								title="Việc này phù hợp với tôi!"
							></a> <a href="#" class="btn btn-default glyphicon glyphicon-thumbs-down" data-toggle="tooltip"
								title="Việc này không hợp, bỏ đi!" style="margin-left: 8px; margin-right: 8px;"
							></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="view/resource/lib/collapse-job.js" async></script>
</body>
</html>