<%@page import="wfs.l2t.dto.dtoResume"%>
<%@page import="wfs.l2t.model.ModelResume"%>
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
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%
	String userId = (String) request.getAttribute("user");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);

	//get category list
	ModelCategory mdc = new ModelCategory();
	List<dtoCategory> categoryList = mdc.getAllCategory();

	//get resume to check condition show notification invite user input a CV
	ModelResume mdr = new ModelResume();
	List<dtoResume> listResume = mdr.getUserResumes(userId);
	
	String link = "";				
    try {
        BufferedReader in = new BufferedReader(new FileReader(getServletContext().getResource("/WEB-INF/url-config.txt").getPath()));
        String str;
        while ((str = in.readLine()) != null) {
            link +=str;
        }
        in.close();
    } catch (IOException e) {
    }
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
<script src="view/resource/notifIt-master/notifIt/js/notifIt.js"></script>
<link rel="stylesheet"
	href="view/resource/notifIt-master/notifIt/css/notifIt.css">

<script src="view/resource/lib/jquery.jpanelmenu.js"></script>
<script src="view/resource/lib/menu.js"></script>
<link rel="stylesheet" href="view/resource/css/menu.css">
<style>
.panel-footer {
	background-color: #F6F7F8;
}

.panel.search {
	padding: 40px;
	background-color: #00B9F2;
	margin-top: 20px;
}

.dropdown-menu {
	min-width: auto;
	width: 100%;
}

.scrollable-menu {
	height: auto;
	max-height: 200px;
	overflow-x: hidden;
}
</style>
</head>
<body>


	<div class="container">
		<!-- menu top -->
		<jsp:include page="menu/top-menu.jsp"/>
		<jsp:include page="menu/left-menu-toggle.jsp"/>
		<!-- chia trang thanh 2 cot -->
		<br> <br> <br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<jsp:include page="menu/left-menu.jsp"/>
				</div>
				<div class="col-md-9 custom_background_color ">
					<div class="panel search panel-default">
						<label style="color: white"><i> Tùy chọn lĩnh vực ngành nghề của bạn!</i></label>

						<div class="input-group" style="width: 60%; margin: 0 auto;">
							<div class="dropdown center">
								<%
									if (request.getParameter("cate") != null)
										out.write("<button class='btn btn-primary dropdown-toggle' type='button' data-toggle='dropdown' style='width: 100%'>"
												+ mdc.getCategoryName(request.getParameter("cate"))
												+ " <span class='caret'></span></button>");
									else
										out.write("<button class='btn btn-primary dropdown-toggle' type='button' data-toggle='dropdown' style='width: 100%'>Tất cả ngành nghề <span class='caret'></span></button>");
								%>

								<ul class="dropdown-menu scrollable-menu" role="menu">
									<%
										for (dtoCategory cate : categoryList) {
											out.write("<li> <a href ='" + request.getContextPath()
													+ "/home?cate=" + cate.categoryId + "'>"
													+ cate.categoryName + "</a></li>");
										}
									%>
								</ul>
							</div>
						</div>

					</div>
					<br>
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
	<%
		if (listResume.size() == 0) {
			out.print("<script type = 'text/javascript'>notif({	msg: \"<b>Xin chào <br>" + dtoAcc.userName + "! Bạn chưa có CV nào! <br>Hãy <br><a style = 'color : #E62016' target = '_blank' href = '"+ link+"listresume'>tạo CV</a> ngay bây giờ để nhận nhiều cơ hội việc làm!</b>\",	type: 'warning',width :'100',bgcolor: 'rgb(0,185,242)',	autohide:false,	position: 'right', multiline : true});</script>");
		}
	%>

	<script type="text/javascript" src="view/resource/lib/job-utility.js"></script>
</body>
</html>