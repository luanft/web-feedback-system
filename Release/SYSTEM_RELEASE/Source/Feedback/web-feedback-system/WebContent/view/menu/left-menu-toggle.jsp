<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%
String userId = (String) request.getAttribute("user");
ModelAccount account = new ModelAccount();
dtoAccount dtoAcc = account.getAccountById(userId);
%>
<div class="left-menu-toggle" id="left-menu-toggle">
	<div class="container-fluid col-md-offset-0">
		<h4>Xin chào!</h4>
		<img src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
			class="img-rounded" width="170" height="170">
	</div>
	<br>
	<ul class="nav nav-pills nav-stacked custom_font_bold">
		<li><a href="<%out.print(request.getContextPath());%>"><span
				class="glyphicon glyphicon glyphicon-home"></span> CÔNG VIỆC MỚI</a></li>
		<li><a href="<%out.print(request.getContextPath() + "/care");%>"><span
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
	
		<li class><a
			href="${pageContext.request.contextPath}/account"><span
				class="glyphicon glyphicon-user"></span> Quản lý tài khoản</a></li>
	
		<li class><a
			href= "${pageContext.request.contextPath}//home?logout=true"><span
				class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
	</ul>
	
</div>