<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%
String userId = (String) request.getAttribute("user");
ModelAccount account = new ModelAccount();
dtoAccount dtoAcc = account.getAccountById(userId);
%>
<div class="left-menu" id="left-menu" data-spy="affix"
	data-offset-top="0">
	<div class="container-fluid col-md-offset-0">
		<h4>Xin chào!</h4>
		<img src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
			class="img-rounded" width="170" height="170">
	</div>
	<br>
	<div>
		<ul class="nav nav-stacked nav-pills custom_font_bold" role="tablist">
			<li class="active"><a
				href="<%out.print(request.getContextPath());%>"><span
					class="glyphicon glyphicon glyphicon-home"></span> Việc Làm Mới</a></li>
			<li><a
				href="<%out.print(request.getContextPath() + "/recommendation");%>"><span
					class="glyphicon glyphicon glyphicon-pencil"></span> Việc Làm Gợi Ý</a></li>
			<li class><a
				href="<%out.print(request.getContextPath() + "/listresume");%>"><span
					class="glyphicon glyphicon-list-alt"></span> Hồ Sơ Của Bạn</a></li>
			<li><a href="<%out.print(request.getContextPath() + "/care");%>"><span
					class="glyphicon glyphicon-heart"></span> Việc Đã Lưu</a></li>
			<li><a
				href="<%out.print(request.getContextPath() + "/settings");%>"><span
					class="glyphicon glyphicon-cog"></span> Thiết Lập Gửi Mail</a></li>

			<li><a href="<%out.print(request.getContextPath() + "/help");%>"><span
					class="glyphicon glyphicon-question-sign"></span> Trợ Giúp</a></li>
			<li><a
				href="<%out.print(request.getContextPath() + "/help?about");%>"><span
					class="glyphicon glyphicon-question-sign"></span> About</a></li>
			<li class><a
				href="${pageContext.request.contextPath}/account"><span
					class="glyphicon glyphicon-user"></span> Quản lý tài khoản</a></li>
	
			<li class><a
				href= "${pageContext.request.contextPath}//home?logout=true"><span
					class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
		</ul>	
	</div>
</div>
