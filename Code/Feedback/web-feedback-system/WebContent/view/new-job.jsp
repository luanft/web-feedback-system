<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="wfs.l2t.dto.dtoJob"%>
<%@ page import="wfs.l2t.model.ModelJob"%>
<%@ page import="java.util.List"%>
<%@page import="java.util.*"%>
<%
	ModelJob mdj = new ModelJob();
	List<dtoJob> jobList = mdj.getJob(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Recommendation System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js" ></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js" ></script>

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
								<li ><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> CÔNG VIỆC	MỚI NHẤT</a></li>
								<li ><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> LĨNH VỰC QUAN TÂM</a></li>
								<li ><a href="#"><span class="glyphicon glyphicon-thumbs-up"></span> THÔNG BÁO</a></li>
								<li ><a href="#"><span class="glyphicon glyphicon-list-alt"></span> XEM HỒ SƠ CỦA BẠN</a></li>
								<li ><a href="#"><span class="glyphicon glyphicon-question-sign"></span> TRỢ GIÚP</a></li>
								<li ><a href="#"><span class="glyphicon glyphicon-envelope"></span> FEEDBACK</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color panel-group">
					<br>
					<%
					
						dtoJob job = new dtoJob();
						for (int i = 0; i < jobList.size(); i++)
						{
							job = jobList.get(i);
							out.print("<div class=\"panel panel-info\">");
							out.print("<div class='panel-heading'>");
							out.print("<a id=\"see-more" + job.jobId + "\" class=\"btn btn-link\"onclick=\"myCollapse('"+job.jobId+"')\"> <b>" + job.jobName + "</b></a>");
							out.print("</div>");
							out.print("<div class='panel-body'>");
							out.print("<div class='row'>");
							out.print("<div class='company'>");
							out.print("<pre>Công ty: " + job.company + "</pre>");
							out.print("</div>");
							out.print("<div class='location'>");
							out.print("<pre>Địa chỉ: " + job.location + "</pre>");
							out.print("</div>");
							out.print("<div class='salary'>");
							out.print("<pre>Salary: " + job.salary + " </pre>");
							out.print("</div>");
							out.print("<div id='short-description"+job.jobId+"'>");
							out.print("<pre>We are looking for a talented Ruby on Rails Developer who wants to work with new Developers in an interactive working Environment. If you are young,...</pre>");
							out.print("</div>");
							out.print("<div id='full-info"+job.jobId+"' class='custom_hiden'>");
							out.print("<div class='description'>");
							out.print("<pre>Description:");
							out.print(job.description);
							out.print("</pre>");
							out.print("</div>");
							out.print("<div class='requirement'>");
							out.print("<pre>Requirement:");
							out.print(job.requirement);
							out.print("</pre>");
							out.print("</div>");
							out.print("<div class='benifit'>");
							out.print("<pre>Benifit:");
							out.print(job.benifit);
							out.print("</pre>");
							out.print("</div>");
							out.print("<div class='expire'>");
							out.print("<pre>Expired: " + job.expired + " </pre>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("<div class='panel-footer'>");
							out.print("<label>Bạn thấy công việc này có phù hợp với bạn không?</label>");
							out.print("<a href='#'	class='btn btn-default glyphicon glyphicon-thumbs-up' data-toggle='tooltip'	title='Việc này phù hợp với tôi!'></a>");
							out.print("<a href='#' class='btn btn-default glyphicon glyphicon-thumbs-down' data-toggle='tooltip' title='Việc này không hợp, bỏ đi!' style='margin-left: 8px; margin-right: 8px;'></a>");
							out.print("</div>");
							out.print("</div>");
						}
						
					%>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src = "view/resource/lib/collapse-job.js"> </script>
	
</body>
</html>