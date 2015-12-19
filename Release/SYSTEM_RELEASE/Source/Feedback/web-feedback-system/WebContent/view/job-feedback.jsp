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
	int count=(int)request.getAttribute("listRecCount");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Việc Làm Gợi Ý</title>
<link rel="shortcut icon" href="view/resource/image/logo_uit_icon.ico" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/lib/notify.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<style>
.panel-footer {
	background-color: #F6F7F8;
}

.panel.search {
	padding: 40px;
	background-color: #00B9F2;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<!-- menu top -->
		<jsp:include page="menu/top-menu.jsp" />

		<!-- chia trang thanh 2 cot -->

		<div class="container-fluid main-content">
			<div class="row">
				<div class="col-md-3">
					<jsp:include page="menu/left-menu.jsp" />

				</div>
				<div class="col-md-9 custom_background_color panel-group">
				<p>Số lượng công việc: <%=count %></p>
					<br>
					<!-- show jobs -->
					<div id="content-wrapper"></div>
					
					<!-- loading icon -->
					<div id="loading" style="margin: 0 auto;"
						class="loading-icon custom_hiden"></div>
				</div>

			</div>
		</div>
	</div>
	<!-- go to top button -->
	<a href="#" class="go-to-top"></a>
	<script type="text/javascript"
		src="view/resource/lib/job-feedback-utility.js">
		
	</script>
</body>
</html>