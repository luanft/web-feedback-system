<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ page import ="wfs.l2t.dto.*" %>
  <%@page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Resume Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/view/resource/css/resume_profile.css">
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="view/resource/css/theme_customize.css">
<script src="view/resource/lib/resume.js"></script>
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
							<h2>${resume.name}</h2><br>
							<h3>${resume.resumeTitle}</h3>
							<%!dtoResume resume;
							dtoCareerObjective cao;
							SimpleDateFormat sm;
							dtoEducation edu;
							%>
							<!-- Personal Detail -->
							<div class="panel-heading">
								Thông tin cá nhân
								<button type="button" class="glyphicon glyphicon-pencil btn-link pull-right" id="personal-edit-button"></button>
							</div>
							<div class="panel-body">
								<ul class="detail-list" id="personal-list">
								<%resume= (dtoResume)request.getAttribute("resume");
									%>
									<li>Giới tính :<strong>${resume.gender}</strong></li>
									<li>Ngày sinh: <strong><fmt:formatDate pattern="dd/MM/yyyy" value="${resume.birthday}"/></strong></li>
									<li>Tình trạng hôn nhân: <strong><% if(resume.getMaritalStatus()==false) {out.print("Độc thân");} 
									else out.print("có gia đình");%></strong></li>
									<li>Quốc gia: <strong>${resume.nationality}</strong></li>
									
								</ul>
								<br/>
								<form id="personal-form" method="post">
									<dl class="mydl">
										<dt>Giới tính </dt>
										<dd>
										<input type="text" name="gender_input" value="${resume.gender}">
										
										</dd>
										<dt>Ngày sinh</dt>
										<dd><input type="date" name="birthday_input" value="${resume.birthday}"></dd>
									
										<dt> Tình trạng hôn nhân</dt>  
										<dd><select
											name="status_select">
											<option value="false"<% if(resume.getMaritalStatus()==false) out.print("selected='selected'");%>>Độc thân</option>
											<option value="true"<% if(resume.getMaritalStatus()==true) out.print("selected='selected'");%>>Có gia đình</option>
										</select></dd>
										<dt>Quốc gia</dt>
										<dd><input type="text" name="nationality_input" value="${resume.nationality}"></dd>
									</dl>	
									<button type="submit" class="btn btn-default"
										name="personal-submit">Lưu</button>
									<button class="btn btn-default" id="personal-cancel">Hủy bỏ</button>
								</form>
							</div>
							<!-- Contact Information -->
							
												<div class="panel-heading">Thông tin liên lạc
							<button type="button" class="glyphicon glyphicon-pencil btn-link pull-right" id="contact-edit-button"></button></div>
							<div class="panel-body">
								<dl class="mydl" id="contact-list">
									<dt>Địa chỉ</dt>
									<dd>${resume.address}</dd>
									<dt>Email</dt>
									<dd>
										<a href="mailto:coxanh21294@gmail.com">${resume.email}</a>
									</dd>
									<dt>Số điện thoại</dt>
									<dd>${resume.phone}</dd>
								</dl>
								<form role="form" id="contact-form" method="post">
									<dl>
										<dt>Địa chỉ</dt><dd><input type="text" name="address-input" value="${resume.address}"></dd>
										<dt>Email</dt><dd><input type="email" name="email-input" value="${resume.email}"></dd>
										<dt>Số điện thoại</dt><dd><input type="text" name="phone-input" value="${resume.phone}"></dd>
									</dl>
									<button type="submit" class="btn btn-default"
										name="contact-submit">Lưu</button>
									<button class="btn btn-default" id="contact-cancel">Hủy bỏ</button>
								</form>
							</div>
							<!-- Education -->
							<div class="panel-heading">Trình độ học vấn
							<button type="button" class="glyphicon glyphicon-plus btn-link pull-right" data-toggle="collapse" data-target="#education-form" id="education-add-button"></button>
							</div>
							<div class="panel-body">
							<c:forEach var="edu" items="${education}" varStatus="loop">
								<dl class="mydl" id="education-list">
									<dt><fmt:formatDate pattern="dd/MM/yyyy" value="${edu.startDate}"/> - <fmt:formatDate pattern="dd/MM/yyyy" value="${edu.endDate}"/></dt>
									<dd>${edu.schoolName}<button type="button" class="glyphicon glyphicon-remove btn-link " name="education-remove-button" onclick="removeEduEven(${edu.educationId})"></button></dd>
									<dt>Ngành học</dt>
									<dd>${edu.educationMajor}</dd>
									<dt>Cấp độ (cử nhân/thạc sĩ)</dt>
									<dd>${edu.educationLevel}</dd>
									<dt>Địa điểm học</dt>
									<dd>${edu.educationLocation}</dd>
									<dt>Mô tả</dt>
									<dd>${edu.educationDescription}</dd>
								</dl>
							</c:forEach>
								<form id="education-form" method="POST">
								<dl class="mydl" id="">
									<dt>Trường</dt>
									<dd><select name="edu-school">
									<c:forEach var="s" items="${schools}">
										<option value="${s.schoolID}">${s.schoolName}</option>
									</c:forEach>
									</select></dd>
									<dt></dt>
									<dd>khác: <input type="text" name="edu-another-school" ></dd>
									<dt>Ngành</dt>
									<dd> <input type="text" name="edu-major" ></dd>
									<dt>Cấp độ</dt>
									<dd> <input type="text" name="edu-level" ></dd>
									<dt>Địa điểm</dt>
									<dd> <input type="text" name="edu-location" ></dd>
									<dt>Ngày bắt đầu</dt><dd><input type="date" name="edu-start-date" ></dd>
									<dt>Ngày kết thúc</dt><dd><input type="date" name="edu-end-date"></dd>
									<dt>Mô tả</dt><dd><textarea name="edu-description"></textarea></dd>
									
								</dl>
								<button type="submit" class="btn btn-default"
										id="education-submit" name="education-submit-button">Lưu</button>
									<button class="btn btn-default" id="education-cancel" name="education-cancel-button">Hủy bỏ</button>
								</form>
							</div>
							<!-- Experience -->
							<div class="panel-heading">Kinh nghiệm
							<button type="button" class="glyphicon glyphicon-plus btn-link pull-right" data-toggle="collapse" data-target="#experience-form" id="experience-add-button"></button>
							</div>
							<div class="panel-body">
							
							<c:forEach var="exp" items="${experience}" varStatus="loop">
								<dl class="mydl" id="experience-list_${loop.index}">
									<dt >Tên công việc</dt>
									<dd>${exp.jobTitle}<button type="button" class="glyphicon glyphicon-remove btn-link " name="experience-remove-button" onclick="removeExpEven(${exp.experienceId})"></button></dd>
									<dt>Vị trí</dt>
									<dd>${exp.position}</dd>
									<dt>Công ty</dt>
									<dd>${exp.companyName}</dd>
									<dt>Mô tả</dt>
									<dd>${exp.description}</dd>
									<dt>Thời gian</dt>
									<dd>${exp.period}</dd>
								</dl>
							</c:forEach>
								<form id="experience-form" method="POST">
									<dl class="mydl" id="">
										<dt>Tên công việc</dt>
										<dd><input type="text" name="exp-job-title"/></dd>
										<dt>Vị trí</dt>
										<dd><input type="text" name="exp-position"/></dd>
										<dt>Công ty</dt>
										<dd><input type="text" name="exp-company"/></dd>
										<dt>Mô tả</dt>
										<dd><textarea name="exp-description"></textarea></dd>
										<dt>Thời gian</dt>
										<dd><input type="text" name="exp-period" /></dd>
									</dl>
								<button type="submit" class="btn btn-default"
										id="experience-submit" name="exp-submit">Lưu</button>
									<button class="btn btn-default" id="experience-cancel">Hủy bỏ</button>
								</form>
							</div>
							<div class="panel-heading">Kỹ năng
							<button type="button" class="glyphicon glyphicon-plus btn-link pull-right" data-toggle="collapse" data-target="#skill-add-form" id="skill-add-button"></button>
							</div>
							<div class="panel-body">
							<input type=hidden id="ski-count" value="${skiCount}"/>
								<ul id="skill-list">
								<c:forEach var ="skill" items="${skills}" varStatus="loop">
									<li>
										<ul class="detail-list-${loop.index}">
											<li><p><strong><c:out value="${skill.name}"/></strong> 
											<button type="button" name= 'skill-remove-button' class="glyphicon glyphicon-remove btn-link " onclick="removeSkillEven(${skill.skillId})"></button></p></li>
											<li><p><c:out value="${skill.level}" /></p></li>
											
										</ul>
										
									</li>
								</c:forEach>
								</ul>
								<form id="skill-add-form" method="POST">
									<dl class="mydl">
										<dt>Tên</dt>
										<dd><input type ="text" name="skill-name"></dd>
										<dt>Mức độ: </dt>
										<dd><input type="text" name="skill-level"></dd>
									</dl>
									<button type="submit" class="btn btn-default"
										id="skill-add-submit" name="skill-submit">Lưu</button>
									<button class="btn btn-default" id="skill-add-cancel">Hủy bỏ</button>
								</form>
								
							</div>
							<!-- References -->
							<div class="panel-heading">Người tham khảo
							<button type="button" class=" glyphicon glyphicon-plus btn-link pull-right " data-toggle="collapse" data-target="#reference-form" id="reference-add-button"></button>
							</div>
							<div class="panel-body">
							
								<ul id="reference-list">
								<c:forEach var="ref" items="${references}" varStatus="loop">
									<li>
										<ul class="detail-list">
											<li><strong><c:out value="${ref.name}"/></strong> <button class="glyphicon glyphicon-remove btn-link" name="reference-remove-button" onclick="removeRefEven(${ref.id})" ></button></li>
											<li><c:out value="${ref.jobTitle}"/></li>
											<li><c:out value="${ref.phone}"/></li>
											<li><a href="mailto:hoannam80@gmail.com"><c:out value="${ref.email}"></c:out></a></li>
	
										</ul>
									</li>
								</c:forEach>
								</ul>
								<form id="reference-form" method="post">
									<dl class="mydl">
										<dt>Tên</dt>
										<dd><input type="text" name="ref-name"></dd>
										<dt>Công việc</dt>
										<dd><input type="text" name="ref-job"></dd>
										<dt>Số điện thoại</dt>
										<dd><input type="" name="ref-phone"></dd>
										<dt>Email</dt>
										<dd><input type="email" name="ref-email"></dd>
									</dl>
									<button type="submit" class="btn btn-default"
										id="reference-submit" name="ref-submit">Lưu</button>
									<button class="btn btn-default" id="reference-cancel">Hủy bỏ</button>
								</form>
							</div>
							<!-- hobbies -->
							<div class="panel-heading">Sở thích
							<button type="button" class=" glyphicon glyphicon-pencil btn-link pull-right " id="hobbies-edit-button"></button>
							</div>
							<div class="panel-body" >
								<ul class="detail-list" id="hobbies-list">
									<li>${resume.hobby}</li>
								</ul>
								<form id="hobbies-edit-form" method="post">
									<textarea name="hobbies">${resume.hobby}</textarea><br><br>
									<button type="submit" class="btn btn-default"
										id="hobbies-edit-submit" name="hobbies-button">Lưu</button>
									<button class="btn btn-default" id="hobbies-edit-cancel">Hủy bỏ</button>
								</form>
								
							</div>
							<!-- Career Object -->
							<div class="panel-heading">Mục đích nghề nghiệp
							<button type="button" class=" glyphicon glyphicon-pencil btn-link pull-right " id="career-object-edit-button"></button>
							</div>
							<div class="panel-body">
								<dl class="mydl" id="career-object-list">
									<dt>Mức lương mong muốn</dt><dd>${carObject.desireSalary} triệu VNĐ</dd>
									<dt>Mức lương hiện tại</dt><dd>${carObject.recentSalary} triệu VNĐ</dd>
									<dt>Vị trí</dt><dd>${carObject.positionType}</dd>
									<dt>Mức độ công việc mong muốn </dt><dd>${carObject.desireCareerLevel}</dd>
									<dt>Địa điểm mong muốn </dt><dd>${carObject.desireWorkLocation}</dd>
									<dt>Có thể thay đổi nơi sống</dt><dd>${carObject.willingToRelocate}</dd>
									<dt>Có thể đi xa</dt><dd>${carObject.willingToTravel}</dd>
									<dt>Mục đích nghề nghiệp</dt><dd>${carObject.careerObjective}</dd>
								</dl>
							
							<form id="career-object-form" method="post">
								<dl >
									<dt>Mức lương mong muốn</dt>
									<dd><input type="text" name="desire-salary" value="${carObject.desireSalary}"> triệu VNĐ</dd>
									<dt>Mức lương hiện tại</dt>
									<dd><input type="text" name="recent-salary"value="${carObject.recentSalary}"> triệu VNĐ</dd>
									<dt>Vị trí</dt>
									<dd><input type="text" name="position-type" value="${carObject.positionType}"></dd>
									<dt>Mức độ công việc mong muố</dt>
									<dd><input type="text" name="desire-career-level"value="${carObject.desireCareerLevel}"></dd>
									<dt>Địa điểm mong muốn</dt>
									<dd><input type="text" name="desire-work-location"value="${carObject.desireWorkLocation}"></dd>
									<dt>Có thể thay đổi nơi sống</dt>
									<dd><input type="checkbox" name="willing-to-relocation"<%cao= (dtoCareerObjective)request.getAttribute("carObject");if(cao.getWillingToRelocate()=="Yes") out.print("checked='checked'"); %>>Yes</dd>
									<dt>Có thể đi xa</dt>
									<dd><input type="checkbox" name="willing-to-travel"<%if(cao.getWillingToTravel()=="Yes")out.print("checked='checked'"); %>>Yes</dd>
									<dt>Mục đích nghề nghiệp</dt>
									<dd><textarea name="career-objective">${carObject.careerObjective}</textarea></dd>
								</dl>
								<button type="submit" class="btn btn-default" id="career-object-submit" name="cao-submit">Lưu</button>
								<button class="btn btn-default" id="career-object-cancel">Hủy bỏ</button>
							</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>