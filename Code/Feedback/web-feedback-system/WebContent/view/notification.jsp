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
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<br>
			<panel class="panel-info">
			<div class="panel-heading">
				<p class="text-center">
					<b> Cảm ơn bạn đã đăng ký thành viên tại </b><a href="#"><i>recsys.com</i></a>
				</p>
				<p class="text-center">
					<i><%=request.getAttribute("Message")%></i>
				</p>
			</div>			
			</panel>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>