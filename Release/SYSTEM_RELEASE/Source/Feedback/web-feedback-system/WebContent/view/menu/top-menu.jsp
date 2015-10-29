<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getAttribute("user");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);
	Boolean hasSavedJob = account.hasSavedJob(userId);
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
					href="<%out.print(request.getContextPath());%>"> RECOMMENDATION
					SYSTEM</a>
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
<nav
	class="navbar navbar-inverse navbar-fixed-top custom_navbar_color navbar-small ">
	<div class='row' id='web-brand-content'>
		<a class=" web-brand navbar-brand custom_color_white"
			href="<%out.print(request.getContextPath());%>"> RECOMMENDATION
			SYSTEM</a>

	</div>
	<ul class="nav navbar-nav ">
		<li>
			<button class="toggle-link navbar-brand glyphicon glyphicon-list "
				id="toggle-link-id"></button>
		</li>

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
</nav>
<jsp:include page="left-menu-toggle.jsp" />
<div id="disablingDiv"></div>



<%

if(!hasSavedJob)
{
	out.print("<div id='div1' class='navbar-fixed-top' data-spy='affix' style='width: 100%; display: none; height: 120px; background-color: black; color: white; font-weight: bold;'>");	
	out.print("<center><h1>Mẹo!</h1><p>Bấm vào nút ");
	out.print("<a style='margin-left: 15px; margin-right: 15px; color: #AFB4BD; font-size: 15px;'href='#/; class='bookmark'><span class='glyphicon glyphicon-floppy-saved'></span> Lưu việc làm</a>");
	out.print("để lưu lại các công việc mà bạn cảm thấy phù hợp với mình. Chúng tôi dựa vào những công việc bạn đã lưu để giới thiệu các công việc tương tự khác!");
	out.print("</p></center></div><br>");
	out.print("<script>");
	out.print("function getPage(){var url = window.location.href;var sk=url.substring(url.lastIndexOf('/')+1,url.length);return sk;}");
	out.print("function setCookie(cname, cvalue, exdays){var d = new Date();d.setTime(d.getTime() + (exdays*24*60*60*1000));var expires = 'expires='+d.toUTCString();document.cookie = cname + '=' + cvalue + '; ' + expires;}");
	out.print("function getCookie(cname) {var name = cname + '=';var ca = document.cookie.split(';');for(var i=0; i<ca.length; i++) {var c = ca[i];while (c.charAt(0)==' ') c = c.substring(1);if (c.indexOf(name) == 0) return c.substring(name.length,c.length);}return '';}");
	out.print("$(document).ready(function() {var page =  getPage();if(page == '' || page == 'home' || page == 'recommendation'){if(getCookie('tip')!='ok'){$('#div1').delay(10000).fadeIn();$('#div1').delay(20000).fadeOut();setCookie('tip', 'ok', 2);}}});");
	out.print("</script>");
}

%>







 

 


