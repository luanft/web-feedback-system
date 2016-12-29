<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>JobRecSys - Thông báo</title>
<link rel="shortcut icon" href="view/resource/image/logo_uit_icon.ico" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
</head>
<body>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<br>
			<panel class="panel-info">
			<div class="panel-heading">				
				<p class="text-center">
					<i><% String mess = (String)request.getAttribute("Message");
						if(mess != null){
							out.write(mess);						
						}
					%></i>
				</p>
				<p style = "display:none;"> <%=request.getAttribute("Error") %></p>
			</div>			
			</panel>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>