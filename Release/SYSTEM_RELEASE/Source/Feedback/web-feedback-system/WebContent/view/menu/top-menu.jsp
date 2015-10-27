<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) request.getAttribute("user");
ModelAccount account = new ModelAccount();
dtoAccount dtoAcc = account.getAccountById(userId);
%>
<script src="view/resource/lib/menu.js"></script>
<link rel="stylesheet" href="view/resource/css/menu.css">
<nav
	class="navbar-large navbar navbar-inverse navbar-fixed-top custom_navbar_color ">
		<div class="row">
			<div class="col-md-5">
				<div class="navbar-header">
					<img
						src="<%out.print(request.getContextPath()
					+ "/view/resource/image/logo.jpg");%>"
						class="img-circle navbar-brand" width="60" height="70"> <a
						class="navbar-brand custom_color_white"
						href="<%out.print(request.getContextPath());%>">
						RECOMMENDATION SYSTEM</a>
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<ul class="nav navbar-nav  navbar-right">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img
								src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
								class="img-rounded" width="32" height="32"> <%=dtoAcc.userName%><span
								class="caret"></span> </a>
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
</nav>
<nav class="navbar navbar-inverse navbar-fixed-top custom_navbar_color navbar-small ">
<div class='row' id='web-brand-content'>
		<a class=" web-brand navbar-brand custom_color_white"
								href="<%out.print(request.getContextPath());%>">
						RECOMMENDATION SYSTEM</a>
	
</div>
		<ul class="nav navbar-nav ">
		<li>
		<button class="toggle-link navbar-brand glyphicon glyphicon-list " id="toggle-link-id"></button></li>
		
		<li class="dropdown">
		
		 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
			class="img-rounded" width="32" height="32"> <%=dtoAcc.userName%><span
				class="caret"></span>
			</a> 
			
			<ul class="dropdown-menu">
				<li><a 
					href="<%out.print(request.getContextPath() + "/account");%>">Quản
						lý tài khoản</a></li>
				<li><a
					href="<%out.print(request.getContextPath() + "/home?logout=true");%>"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
			</ul>
		</li>
		</ul>
</nav>
<jsp:include page="left-menu-toggle.jsp"/>
<div id="disablingDiv"></div>
