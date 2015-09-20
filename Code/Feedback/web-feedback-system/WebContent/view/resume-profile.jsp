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
							<h2>${resume.name}</h2><p class="pull-right">Các nội dung có đánh dấu <span id="required">*</span> là bắt buộc</p><br>
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
								<form id="personal-form" method="post" class="form-horizontal">
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
													
													<c:forEach var="i" begin="1" end="31">
														<option
															<c:if test="${resume.day==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select> <select id="month" name="month">
													
													<c:forEach var="i" begin="1" end="12">
														<option
															<c:if test="${resume.month==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select> <select id="year" name="year">
													
													<c:forEach var="i" begin="1945" end="2015">
														<option
															<c:if test="${resume.year==i}">selected='selected'</c:if>><c:out
																value="${i}" /></option>
													</c:forEach>
												</select>
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
												<option value="false"></option>
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
									<button type="submit" class="btn btn-primary col-md-offset-4"
										name="personal-submit">Lưu</button>
									<button class="btn btn-default" id="personal-cancel">Hủy bỏ</button>
								</form>
							</div>
							<!-- Contact Information -->
							
							<div class="panel-heading">Thông tin liên lạc
							<button type="button" class="glyphicon glyphicon-pencil btn-link pull-right" id="contact-edit-button"></button></div>
							<div class="panel-body">
								
									<label class="label-control col-md-5">Địa chỉ</label>
									<p>${resume.address}</p><br>
									<label class="label-control col-md-5">Email</label>
									<p>
										<a href="mailto:coxanh21294@gmail.com">${resume.email}</a>
									</p><br>
									<label class="label-control col-md-5" >Số điện thoại</label>
									<p>${resume.phone}</p>
								
								<form role="form" id="contact-form" method="post" class="form-horizontal">
									<div class="form-group">
											<label for="address-input" class="control-label col-md-5">Địa
												chỉ</label>
											<div class="input-group">
												<input class="form-control" type="text" name="address_input"
													placeholder="Địa chỉ" value="${resume.address}">
											</div>
										</div>
										<div class="form-group">
											<label for="email_input" class="control-label col-md-5">Email<span id="required">*</span></label>
											<div class="input-group">
												<input class="form-control" type="text" placeholder="Email"
													id="email_input" name="email_input" value="${resume.email}">
												<p id="email_error" class="text-danger">Email Không hợp lệ</p>
											</div>
										</div>

										<div class="form-group">
											<label for="phone-input" class="control-label col-md-5">Số
												điện thoại</label>

											<div class="input-group">
												<input class="form-control" type="text" name="phone_input"
													placeholder="Điện thoại" maxlength="15"
													value="${resume.phone}">
												<p id="phone_error" class="text-danger">Số điện thoại Không hợp lệ</p>
											</div>
										</div>
									<button type="submit" class="btn btn-primary col-md-offset-4"
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
								
									<label class="col-md-5"><fmt:formatDate pattern="MM/yyyy" value="${edu.startDate}"/> - <fmt:formatDate pattern="MM/yyyy" value="${edu.endDate}"/></label>
									<p class="col-md-offset-3">${edu.schoolName}<button type="button" class="glyphicon glyphicon-remove btn-link " name="education-remove-button" onclick="removeEduEven(${edu.educationId})"></button></p><br>
									<label class="col-md-5">Ngành học</label>
									<p class="col-md-offset-3">${edu.educationMajor}</p><br>
									<label class="col-md-5">Cấp độ (cử nhân/thạc sĩ)</label>
									<p class="col-md-offset-3">${edu.educationLevel}</p><br>
									<label class="col-md-5">Địa điểm học</label>
									<p class="col-md-offset-3">${edu.educationLocation}</p><br>
									<label class="col-md-5">Mô tả</label>
									<p class="col-md-offset-3">${edu.educationDescription}</p><br>
								
							</c:forEach>
								<form id="education-form" method="POST" class="form-horizontal">
									<div class="form-group">
										<label for="edu-school" class="control-label col-md-5">Trường<span id="required">*</span></label>
										<div class="input-group	">
											<select id="edu-school-select"name="edu-school-select" class="form-control">
											<c:forEach var="s" items="${schools}">
												<option value="${s.schoolID}">${s.schoolName}</option>
											</c:forEach>
											</select><br>
											
											<p>khác:<p> 
											<input type="text" style="width: 300px" class="form-control" name="edu-another-school" >
										</div>
									</div>
									<div class="form-group">
										<label for="edu-major" class="control-label col-md-5">Ngành<span id="required">*</span></label>
										 <div class="input-group">
											 <input type="text" id="edu-major" name="edu-major" class="form-control">
										
										 </div>
									 </div>
									 <div class="form-group">
										<label for="edu-level" class="control-label col-md-5">Cấp độ</label>
										<div class="input-group">
										<input type="text" name="edu-level" class="form-control">
										</div>
									 </div>
									 <div class="form-group">
									<label for="edu-location" class="control-label col-md-5">Địa điểm</label>
									<div class="input-group">
									 <input type="text" name="edu-location" class="form-control" >
									 </div>
									 </div>
									 <div class="form-group">
									<label for="edu-startdate" class="control-label col-md-5">Ngày bắt đầu</label>
									<div class="input-group">
									Tháng
									<select name="edu-start-month">
										<c:forEach var="i" begin="1" end="12" >
											<option>${i}</option>
										</c:forEach>
									</select>
									Năm
									<select name="edu-start-year">
										<c:forEach var="i" begin="1970" end="2019">
											<option>${i}</option>
										</c:forEach>
									</select>
									</div>
									</div>
									<div class="from-group">
									<label for="edu-endDate" class="control-label col-md-5">Ngày kết thúc</label>
									<div class="input-group">
									Tháng
									<select name="edu-end-month">
										<c:forEach var="i" begin="1" end="12" >
											<option>${i}</option>
										</c:forEach>
									</select>
									Năm
									<select name="edu-end-year">
										<c:forEach var="i" begin="1970" end="2019">
											<option>${i}</option>
										</c:forEach>
									</select>
									</div>
									</div>
									<div class="form-group">
									<label for="edu-description" class="control-label col-md-5">Mô tả</label>
									<div class="input-group"><textarea name="edu-description" class="form-control"></textarea></div>
									</div>
								
								<button type="submit" class="btn btn-primary col-md-offset-4"
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
								
									<label class="col-md-5" >Tên công việc</label>
									<p class="col-md-offset-3">${exp.jobTitle}<button type="button" class="glyphicon glyphicon-remove btn-link " name="experience-remove-button" onclick="removeExpEven(${exp.experienceId})"></button></p><br>
									<label class="col-md-5" >Vị trí</label>
									<p class="col-md-offset-3">${exp.position}</p><br>
									<label class="col-md-5">Công ty</label>
									<p class="col-md-offset-3">${exp.companyName}</p><br>
									<label class="col-md-5">Mô tả</label>
									<p class="col-md-offset-3">${exp.description}</p><br>
									<label class="col-md-5" >Thời gian</label>
									<p class="col-md-offset-3">${exp.period}</p><br>
								
							</c:forEach>
								<form id="experience-form" method="POST"  class="form-horizontal">
									<div class="form-group">
										<label for="epx-job-title" class="control-label col-md-5">Tên công việc<span id="required">*</span></label>
										<div class="input-group">
										<input type="text" id="exp-job-title" name="exp-job-title" class="form-control"/>
										
										</div>
									</div>
									<div class="form-group">	
										<label for="epx-position" class="control-label col-md-5">Vị trí</label>
										<div class="input-group">
										<input type="text" name="exp-position" class="form-control"/>
										</div>
									</div>
									<div class="form-group">	
										<label for="epx-company" class="control-label col-md-5">Công ty</label>
										<div class="input-group">
										<input type="text" name="exp-company" class="form-control"/>
										</div>
									</div>
									<div class="form-group">
										<label for="exp-description" class="control-label col-md-5">Mô tả</label>
										<div class="input-group">
											<textarea name="exp-description"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="exp-period" class="control-label col-md-5">Thời gian<span id="required">*</span></label>
										<div class="input-group">
										<input type="text" name="exp-period" class="form-control"/>
										</div>
									</div>
									
								<button type="submit" class="btn btn-primary col-md-offset-4"
										id="experience-submit" name="exp-submit">Lưu</button>
									<button class="btn btn-default" id="experience-cancel">Hủy bỏ</button>
								</form>
							</div>
							<div class="panel-heading">Kỹ năng
							<button type="button" class="glyphicon glyphicon-plus btn-link pull-right" data-toggle="collapse" data-target="#skill-add-form" id="skill-add-button"></button>
							</div>
							<div class="panel-body">
							
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
								<form id="skill-add-form" method="POST" class="form-horizontal">
										<div class="form-group">
										<label for="skill-name" class="label-control col-md-5">Tên<span id="required">*</span></label>
										<div class="input-group">
										<input type ="text" name="skill-name" class="form-control">
										</div>
										</div>
										<div class="form-group">
										<label for="skill-name" class="label-control col-md-5">Cấp độ<span id="required">*</span></label>
											<div class="input-group">
												<select name="skill-level" class="form-control">
													<option>Tốt</option>
													<option>Khá</option>
													<option>Trung bình</option>
												</select>
											</div>
										</div>
									<button type="submit" class="btn btn-primary col-md-offset-4" 
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
								<form id="reference-form" method="post"  class="form-horizontal">
									<div class="form-group">
										<label for="ref-name" class="label-control col-md-5">Tên<span id="required">*</span></label>
										<div class="input-group">
										<input type="text" name="ref-name" class="form-control">
										
										</div>
										</div>
										
									<div class="form-group">
										<label for="ref-job" class="label-control col-md-5">Công việc</label>
										<div class="input-group">
										<input type="text" name="ref-job"  class="form-control">
										</div>
										</div>
									<div class="form-group">
										<label for="ref-name" class="label-control col-md-5">Số điện thoại</label>
											<div class="input-group">
												<input type="text" name="ref-phone"  id="ref_phone_input"class="form-control">
												<p id="ref_phone_error" class="text-danger">Số điện thoại không hợp lệ</p>
											</div>
										</div>
									<div class="form-group">	
										<label for="ref-email" class="c col-md-5">Email<span id="required">*</span></label>
										<div class="input-group">
										<input type="text" name="ref-email" id="ref_email_input" class="form-control">
										<p id="ref_email_error" class="text-danger">Email không hợp lệ</p>
									</div>
									</div>
									<button type="submit" class="btn btn-primary col-md-offset-4"
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
								<div id="career-object-list">
									<label class="col-md-5">Mức lương mong muốn</label><p class="col-md-offset-3" >${carObject.desireSalary} triệu VNĐ</p>
									<label class="col-md-5">Mức lương hiện tại </label><p class="col-md-offset-3" >${carObject.recentSalary} triệu VNĐ</p>
									<label class="col-md-5">Vị trí</label><p class="col-md-offset-3" >${carObject.positionType}</p><br>
									<label class="col-md-5">Mức độ công việc mong muốn</label><p class="col-md-offset-3" > ${carObject.desireCareerLevel}</p><br>
									<label class="col-md-5">Địa điểm mong muốn </label><p class="col-md-offset-3" >${carObject.desireWorkLocation}</p><br>
									<label class="col-md-5">Có thể thay đổi nơi sống</label><p class="col-md-offset-3" >${carObject.willingToRelocate}</p><br>
									<label class="col-md-5">Có thể đi xa</label><p class="col-md-offset-3" >${carObject.willingToTravel}</p><br>
									<label class="col-md-5">Mục đích nghề nghiệp</label><p class="col-md-offset-3" >${carObject.careerObjective}</p>
								</div>
							
							<form id="career-object-form" method="post" class="form-horizontal">
								<div class="form-group">
									<label for="desire-salary" class="label-control col-md-5">Mức lương mong muốn</label>
									<div class="input-group">
									<input type="text" name="desire-salary" value="${carObject.desireSalary}"> triệu VNĐ
									</div>
								</div>
								<div class="form-group">	
									<label for="recent-salary" class="label-control col-md-5">Mức lương hiện tại</label>
									<div class="input-group">
									<input type="text" name="recent-salary" value="${carObject.recentSalary}"> triệu VNĐ
									</div>
								</div>
								<div class="form-group">
									<label for="position-type" class="label-control col-md-5">Vị trí</label>
									<div class="input-group">
									<input type="text" name="position-type"class="form-control" value="${carObject.positionType}">
									</div>
								</div>							
								<div class="form-group">	
									<label for="desire-career-level" class="label-control col-md-5">Mức độ công việc mong muốn<span id="required">*</span></label>
									<div class="input-group">
									<select name="desire-career-level"class="form-control">
										<option>Sinh viên/thực tập</option>
										<option>Part-time</option>
										<option>Full-time</option>
										<option>Khác</option>
									</select>
									</div>
								</div>
								<div class="form-group">	
									<label for="desire-work-location" class="label-control col-md-5">Địa điểm mong muốn</label>
									<div class="input-group">
									<input type="text" name="desire-work-location"class="form-control" value="${carObject.desireWorkLocation}">
									</div>
								</div>
								<div class="form-group">	
									<label for="willing-to-relocation" class="label-control col-md-5">Có thể thay đổi nơi sống</label>
									<div class="input-group">
									<input type="checkbox" name="willing-to-relocation" <%cao= (dtoCareerObjective)request.getAttribute("carObject");if(cao.getWillingToRelocate()=="Yes") out.print("checked='checked'"); %>>Yes
									</div>
								</div>
								<div class="form-group">	
									<label for="willing-to-travel" class="label-control col-md-5">Có thể đi xa</label>
									<div class="input-group">
										<input type="checkbox" name="willing-to-travel"<%if(cao.getWillingToTravel()=="Yes")out.print("checked='checked'"); %>>Yes
									</div>
								</div>
								
									<div class="form-group">
									<label for="ref-email" class="label-control col-md-5">Mục đích nghề nghiệp<span id="required">*</span>
									</label>
									<div class="input-group">
									<textarea id="career-objective-text" name="career-objective" class="form-control">${carObject.careerObjective}</textarea>
									</div>
									</div>
								
								<button type="submit" class="btn btn-primary col-md-offset-4" id="career-object-submit" name="cao-submit">Lưu</button>
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