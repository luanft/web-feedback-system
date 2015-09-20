<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ page import ="wfs.l2t.dto.*" %>
  <%@ page import ="java.util.HashMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Resume Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">



<link rel="stylesheet" href="${pageContext.request.contextPath}/view/resource/css/resume_profile.css">
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<!-- Bootstrap Validation CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrapValidator.min.css">

<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Validation JS -->
<script src="view/resource/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="view/resource/lib/add-resume.js"></script>


</head>

<body>

	<div class="container">
		<!-- menu top -->
		<nav
			class="navbar navbar-inverse navbar-fixed-top custom_navbar_color">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="navbar-header">
							<img
								src="http://thumbs.dreamstime.com/x/job-search-3d-icon-16095671.jpg"
								class="img-circle navbar-brand" width="60" height="70"> <a
								class="navbar-brand custom_color_white"> RECOMMENDATION
								SYSTEM</a>
						</div>
					</div>
					<div class="col-md-8">
						<div>
							<ul class="nav navbar-nav  navbar-right">
								<li><a href="#">Home</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-user"></span>
										Xin chào, HIhIhi</a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-log-in"></span> Thoát</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- chia trang thanh 2 cot -->

		<div class="container-fluid">
			<br> <br> <br>
			<div class="row">
				<div class="col-md-3">
					<div data-spy="affix" data-offset-top="0">
						<div class="container-fluid col-md-offset-0">
							<h4>Xin chào!</h4>
							<img
								src="http://vui3g.com/files/posts/images/5-2014/girl-xinh-dan-toc-mong.jpg"
								class="img-rounded" width="170" height="170">
						</div>
						<br>
						<div>

							<ul class="nav nav-pills nav-stacked custom_font_bold">
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> CÔNG VIỆC MỚI
										NHẤT</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> LĨNH VỰC QUAN
										TÂM</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-thumbs-up"></span> THÔNG BÁO</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-cog"></span> THIẾT LẬP HỆ THỐNG</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-list-alt"></span> XEM HỒ SƠ CỦA BẠN</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-question-sign"></span> TRỢ GIÚP</a></li>
								<li class><a href="#"><span
										class="glyphicon glyphicon-envelope"></span> FEEDBACK</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color">
					<br>
					<div class="container-fluid">
						<div class="panel panel-default">
							<!-- Personal Detail -->
							<div class="panel-heading">Danh sách CV</div>
							<div class="panel-body">
								<%
									if ((int) request.getAttribute("listCount") == 0)
										out.print("Bạn chưa có CV nào!");
								%>
								<c:forEach var="entry" items="${listTitle}">
									<p>
										<a
											href="${pageContext.request.contextPath}/resume?id=${entry.key}">${entry.value}
										</a><a href="#" name="remove" onclick="removeResume(${entry.key})">Xóa</a>
									<p>
								</c:forEach>
								<br>
								<a href='#' id='add-resume-link'>Thêm CV</a>
							</div>
							<div class="panel-heading">Thông tin cơ bản</div>
							<div class="panel-body">
								<form method="post" id="add-resume-form" action="" role="form"
									class="form-horizontal">
									<p class="pull-right">Các nội dung có đánh dấu <span id="required">*</span> là bắt buộc</p>
									<fieldset>
										<legend>Tiêu đề CV</legend>
										<div class="form-group">
										<label for="title_input" class="control-label col-md-5 clearfix">Tiêu
											đề<span id="required">*</span></label>
										<div class="input-group">
											<input type="text" class="form-control" name="title_input"
												id="title-input">
											<p id="title_error" class="text-danger">Chưa nhập tiêu đề</p>
											</div>
										</div>

									</fieldset>
									<fieldset>
										<legend>Thông tin cá nhân</legend>
										<div class="form-group">
											<label for="full-name-input" class="control-label col-md-5">Họ
												Tên<span id="required">*</span></label>
											<div class="input-group">
												<input class="form-control " type="text"
													id="name-input"name="full_name_input" value="${resume.name}">
												<p id="name_error" class="text-danger">Chưa nhập họ tên</p>
											</div>
										</div>
										<div class="form-group">
											<label for="gender-input" class="control-label col-md-5">Giới
												tính<span id="required">*</span></label>
											<div class="input-group">
												<select name="gender_input" class="form-control">
													<option
														<c:if test="${resume.gender=='Nam' || resume.gender==''}">selected='selected'</c:if>>Nam</option>
													<option
														<c:if test="${resume.gender=='Nữ'}">selected='selected'</c:if>>Nữ</option>
													<option
														<c:if test="${resume.gender=='Khác'}">selected='selected'</c:if>>Khác</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="day" class="control-label col-md-5">Ngày
												sinh<span id="required">*</span></label>
											<div class="input-group">
												<select id="day" name="day">
													<option>...</option>
													<c:forEach var="i" begin="1" end="31">
														<option
															<c:if test="${resume.day==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select> <select id="month" name="month">
													<option>...</option>
													<c:forEach var="i" begin="1" end="12">
														<option
															<c:if test="${resume.month==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select> <select id="year" name="year">
													<option>...</option>
													<c:forEach var="i" begin="1945" end="2015">
														<option
															<c:if test="${resume.year==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select>
												<p class="text-danger" id="birthday_error">Chưa nhập ngày sinh</p>
											</div>
										</div>
										<div class="form-group">
											<label for="status_select" class="control-label col-md-5">Tình
												trạng hôn nhân</label> <select name="status_select"
												class="form-control">
												<option value="false"
													<c:if test="${!resume.maritalStatus}">selected=selected</c:if>>Độc
													thân</option>
												<option value="true"
													<c:if test="${resume.maritalStatus}">selected=selected</c:if>>Có
													gia đình</option>
												<option value="false"> </option>
											</select>
										</div>
										<div class="form-group">
											<label for="nationality_input" class="control-label col-md-5">Quốc
												tịch<span id="required">*</span></label>
											<div class="input-group">
												<select name="nationality_input" class="form-control">
													<option
														<c:if test="${resume.nationality=='Việt Nam'}">selected='selected'</c:if>>Việt
														Nam</option>
													<option
														<c:if test="${resume.nationality=='Nước Ngoài'}">selected='selected'</c:if>>Nước
														ngoài</option>
												</select>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend>Thông tin liên lạc</legend>
										<div class="form-group">
											<label for="address-input" class="control-label col-md-5">Địa
												chỉ</label>
											<div class="input-group">
												<input class="form-control" type="text" name="address_input"
													placeholder="Địa chỉ" value="${resume.address}">
											</div>
										</div>
										<div class="form-group">
											<label for="email-input" class="control-label col-md-5">Email<span id="required">*</span></label>
											<div class="input-group">
												<input class="form-control" type="text" placeholder="Email"
													name="email_input" id="email"
													
													value="${resume.email}">
												<p id="email2_error" class="text-danger">Email Không hợp lệ</p>
												<p id="email_error" class="text-danger">Chưa nhập Email</p>
											</div>
										</div>

										<div class="form-group">
											<label for="phone-input" class="control-label col-md-5">Số
												điện thoại</label>

											<div class="input-group">
												<input class="form-control" type="text" id="phone_input" name="phone_input"
													placeholder="Điện thoại" maxlength="15"
													value="${resume.phone}">
												<p id="phone_error" class="text-danger">Số điện thoại Không hợp lệ</p>
											</div>
											
										</div>
									</fieldset>
									<fieldset>
										<legend>Sở thích</legend>
										<div class="form-group">
											<div class="input-group">
												<textarea style="margin-left: 20px" name="hobbies_input"
													class="form-control">${resume.hobby}</textarea>
											</div>
										</div>
									</fieldset>
									<button id="add-resume-button"name="add-resume-button" type="submit"
										class="btn btn-primary col-md-offset-4">Tiếp tục</button>
									<button id="cancel-add-resume-button" type="button"
										class="btn btn-default">Huỷ bỏ</button>
								</form>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	</div>

</body>
</html>
