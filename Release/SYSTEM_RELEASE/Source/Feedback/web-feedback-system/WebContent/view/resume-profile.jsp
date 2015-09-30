<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="wfs.l2t.dto.*"%>
<%@ page import="wfs.l2t.model.ModelResume"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%@ page import="java.util.List"%>

<%
	String userId = (String) request.getAttribute("user");
	String resumeId = (String) request.getAttribute("id");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Resume Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/bootstrap/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/view/resource/lib/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/css/resume_profile.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/css/theme_customize.css">


<script
	src="${pageContext.request.contextPath}/view/resource/datepicker/js/bootstrap-datepicker.js"></script>


<script
	src="${pageContext.request.contextPath}/view/resource/lib/form_validate.js"></script>
<script
	src="${pageContext.request.contextPath}/view/resource/lib/form_submit.js"></script>
</head>

<body>


	<!-- Xu ly tren submit form -->


	<div class="container">
		<!-- menu top -->
		<nav
			class="navbar navbar-inverse navbar-fixed-top custom_navbar_color">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="navbar-header">
						<img
							src="<%out.print(request.getContextPath()
					+ "/view/resource/image/logo.jpg");%>"
							class="img-circle navbar-brand" width="60" height="70"> <a
							href="<%out.print(request.getContextPath());%>"
							class="navbar-brand custom_color_white"> RECOMMENDATION
							SYSTEM</a>
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<ul class="nav navbar-nav  navbar-right">
							<li><a href="<%out.print(request.getContextPath());%>">Home</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <span
									class="glyphicon glyphicon-user"></span> Xin chào <%=dtoAcc.userName%><span
									class="caret"></span>
							</a>
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
								src="<%out.print(request.getContextPath() + dtoAcc.avatar);%>"
								class="img-rounded" width="170" height="170">
						</div>
						<br>
						<div>
							<ul class="nav nav-stacked nav-pills custom_font_bold" role="tablist">
								<li><a href="<%out.print(request.getContextPath());%>"><span
										class="glyphicon glyphicon glyphicon-home"></span> Việc Làm Mới</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/recommendation");%>"><span
										class="glyphicon glyphicon glyphicon-pencil"></span> Có Thể Bạn Quan Tâm</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/listresume");%>"><span
										class="glyphicon glyphicon-list-alt"></span> Hồ Sơ Của Bạn</a></li>								
								<li ><a 
									href="<%out.print(request.getContextPath() + "/care");%>"><span
										class="glyphicon glyphicon-heart"></span> Việc Đã Lưu</a></li>
								<li ><a
									href="<%out.print(request.getContextPath() + "/settings");%>"><span
										class="glyphicon glyphicon-cog"></span> Thiết Lập Gửi Mail</a></li>

								<li ><a
									href="<%out.print(request.getContextPath() + "/help");%>"><span
										class="glyphicon glyphicon-question-sign"></span> Trợ Giúp</a></li>
								<li ><a
									href="<%out.print(request.getContextPath() + "/help?about");%>"><span
										class="glyphicon glyphicon-question-sign"></span> About</a></li>										
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 ">


					<br>
					<%
						ModelResume cvModel = new ModelResume();
						dtoResume cv = cvModel.getResume(resumeId);
					%>
					<div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									Thông tin cá nhân
									<button id="btn_edit_cv" type="button"
										class="btn btn-primary navbar-right custom_margin">Chỉnh
										sửa</button>
								</h4>
							</div>
							<div class="panel-body">

								<div id="form_enter_resume" class="custom_hiden">
									<form id="form_update_profile" role="form" method="post"
										action="resume">


										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">
										<div class="form-group">
											<label for="cv_title">Tên của CV:</label> <input type="text"
												name="title_input" value="<%out.print(cv.resumeTitle);%>"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Họ và tên:</label> <input type="text"
												class="form-control" value="<%out.print(cv.name);%>"
												name="full_name_input" id="email">
										</div>

										<div class="form-group">
											<label for="birthday">Ngày Sinh:</label> <input
												class="form-control" id="birthday" readonly
												data-date-format="dd-mm-yyyy" name="birthday_input"
												value="<%out.print(cv.birthday);%>">
										</div>


										<div class="form-group">
											<label for="cv_title">Giới tính:</label> <label
												class="radio-inline"> <input checked="checked"
												type="radio" name="gender_input" value="Nam">Nam
											</label> <label class="radio-inline"> <input type="radio"
												name="gender_input" value="Nữ">Nữ
											</label>
										</div>




										<div class="form-group">
											<label for="cv_title">Tình trạng hôn nhân:</label> <label
												class="radio-inline"> <input value="0"
												checked="checked" type="radio" name="status_select">Chưa
												kết hôn
											</label> <label class="radio-inline"> <input value="1"
												type="radio" name="status_select">Đã kết hôn
											</label>
										</div>

										<div class="form-group">
											<label for="selelect_qt">Quốc tịch:</label> <select
												class="form-control" name="nationality_input" id="selelect_qt">
												<option>Vietnam</option>
												<option>Afghanistan</option>
												<option>Albania</option>
												<option>Algeria</option>
												<option>Andorra</option>
												<option>Angola</option>
												<option>Antigua and Barbuda</option>
												<option>Argentina</option>
												<option>Armenia</option>
												<option>Australia</option>
												<option>Austria</option>
												<option>Azerbaijan</option>
												<option>Bahamas</option>
												<option>Bahrain</option>
												<option>Bangladesh</option>
												<option>Barbados</option>
												<option>Belarus</option>
												<option>Belgium</option>
												<option>Belize</option>
												<option>Benin</option>
												<option>Bhutan</option>
												<option>Bolivia</option>
												<option>Bosnia and Herzegovina</option>
												<option>Botswana</option>
												<option>Brazil</option>
												<option>Brunei Darussalam</option>
												<option>Bulgaria</option>
												<option>Burkina Faso</option>
												<option>Burma</option>
												<option>Burundi</option>
												<option>Cambodia</option>
												<option>Cameroon</option>
												<option>Canada</option>
												<option>Cape Verde</option>
												<option>Central African Republic</option>
												<option>Chad</option>
												<option>Chile</option>
												<option>China</option>
												<option>Colombia</option>
												<option>Comoros</option>
												<option>Congo, Republic of</option>
												<option>Congo, Democratic Republic of the</option>
												<option>Costa Rica</option>
												<option>CÃ´te d'Ivoire</option>
												<option>Croatia</option>
												<option>Cuba</option>
												<option>Cyprus</option>
												<option>Czech Republic</option>
												<option>Denmark</option>
												<option>Djibouti</option>
												<option>Dominica</option>
												<option>Dominican Republic</option>
												<option>Ecuador</option>
												<option>Egypt</option>
												<option>El Salvador</option>
												<option>Equatorial</option>
												<option>Eritrea</option>
												<option>Estonia</option>
												<option>Ethiopia</option>
												<option>Fiji</option>
												<option>Finland</option>
												<option>France</option>
												<option>Gabon</option>
												<option>Gambia, The</option>
												<option>Georgia</option>
												<option>Germany</option>
												<option>Ghana</option>
												<option>Greece</option>
												<option>Grenada</option>
												<option>Guatemala</option>
												<option>Guinea</option>
												<option>Guinea-Bissau</option>
												<option>Guyana</option>
												<option>Haiti</option>
												<option>Honduras</option>
												<option>Hungary</option>
												<option>Iceland</option>
												<option>India</option>
												<option>Indonesia</option>
												<option>Iran</option>
												<option>Iraq</option>
												<option>Ireland</option>
												<option>Israel</option>
												<option>Italy</option>
												<option>Jamaica</option>
												<option>Japan</option>
												<option>Jordan</option>
												<option>Kazakhstan</option>
												<option>Kenya</option>
												<option>Kiribati</option>
												<option>Korea, North</option>
												<option>Korea, South</option>
												<option>Kuwait</option>
												<option>Kyrgyzstan</option>
												<option>Laos</option>
												<option>Latvia</option>
												<option>Lebanon</option>
												<option>Lesotho</option>
												<option>Liberia</option>
												<option>Libya</option>
												<option>Liechtenstein</option>
												<option>Lithuania</option>
												<option>Luxembourg</option>
												<option>Macedonia</option>
												<option>Madagascar</option>
												<option>Malawi</option>
												<option>Malaysia</option>
												<option>Maldives</option>
												<option>Mali</option>
												<option>Malta</option>
												<option>Marshall Islands</option>
												<option>Mauritania</option>
												<option>Mauritius</option>
												<option>Mexico</option>
												<option>Micronesia</option>
												<option>Moldova</option>
												<option>Monaco</option>
												<option>Mongolia</option>
												<option>Montenegro</option>
												<option>Morocco</option>
												<option>Mozambique</option>
												<option>Myanmar</option>
												<option>Namibia</option>
												<option>Nauru</option>
												<option>Nepal</option>
												<option>Netherlands</option>
												<option>New Zealand</option>
												<option>Nicaragua</option>
												<option>Niger</option>
												<option>Nigeria</option>
												<option>Norway</option>
												<option>Oman</option>
												<option>Pakistan</option>
												<option>Palau</option>
												<option>Palestinian State</option>
												<option>Panama</option>
												<option>Papua New Guinea</option>
												<option>Paraguay</option>
												<option>Peru</option>
												<option>Philippines</option>
												<option>Poland</option>
												<option>Portugal</option>
												<option>Qatar</option>
												<option>Romania</option>
												<option>Russia</option>
												<option>Rwanda</option>
												<option>St. Kitts and Nevis</option>
												<option>St. Lucia</option>
												<option>St. Vincent and The Grenadines</option>
												<option>Samoa</option>
												<option>San Marino</option>
												<option>SÃ£o TomÃ© and PrÃ­ncipe</option>
												<option>Saudi Arabia</option>
												<option>Senegal</option>
												<option>Serbia</option>
												<option>Seychelles</option>
												<option>Sierra Leone</option>
												<option>Singapore</option>
												<option>Slovakia</option>
												<option>Slovenia</option>
												<option>Solomon Islands</option>
												<option>Somalia</option>
												<option>South Africa</option>
												<option>Spain</option>
												<option>Sri Lanka</option>
												<option>Sudan</option>
												<option>Suriname</option>
												<option>Swaziland</option>
												<option>Sweden</option>
												<option>Switzerland</option>
												<option>Syria</option>
												<option>Taiwan</option>
												<option>Tajikistan</option>
												<option>Tanzania</option>
												<option>Thailand</option>
												<option>Togo</option>
												<option>Tonga</option>
												<option>Trinidad and Tobago</option>
												<option>Tunisia</option>
												<option>Turkey</option>
												<option>Turkmenistan</option>
												<option>Tuvalu</option>
												<option>Uganda</option>
												<option>Ukraine</option>
												<option>United Arab Emirates</option>
												<option>United Kingdom</option>
												<option>United States</option>
												<option>Uruguay</option>
												<option>Uzbekistan</option>
												<option>Vanuatu</option>
												<option>Vatican City</option>
												<option>Venezuela</option>
												<option>Western Sahara</option>
												<option>Yemen, Republic of</option>
												<option>Yugoslavia</option>
												<option>Zaire</option>
												<option>Zambia</option>
												<option>Zimbabwe</option>
											</select>
										</div>


										<div class="form-group">
											<label for="cv_title">Địa chỉ:</label> <input type="text"
												class="form-control" value="<%out.print(cv.address);%>"
												name="address_input" id="email">
										</div>


										<div class="form-group">
											<label for="cv_title">Email liên hệ:</label> <input
												type="email" class="form-control"
												value="<%out.print(cv.email);%>" name="email_input"
												id="email">
										</div>


										<div class="form-group">
											<label for="cv_title">Số điện thoại:</label> <input
												type="text" class="form-control"
												value="<%out.print(cv.phone);%>" name="phone_input"
												id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Sở thích cá nhân:</label> <input
												type="text" class="form-control"
												value="<%out.print(cv.hobby);%>" id="email"
												name="hobbies_input">
										</div>

										<button type="submit" class="btn btn-primary"
											name="add_resume_button">Cập nhật CV</button>

										<button id="btn_cancel_cv" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
								</div>
								<div id="profile_content">
									<h1>
										<%
											out.print(cv.name);
										%>
									</h1>
									<h5>
										<b>Ngày Sinh:</b>
										<%
											out.print(cv.birthday);
										%>
									</h5>
									<h5>
										<b>Giới tính:</b>
										<%
											out.print(cv.gender);
										%>
									</h5>
									<h5>
										<b>Tình trạng hôn nhân:</b>
										<%
											if (cv.maritalStatus)
												out.print("Đã kết hôn");
											else
												out.print("Chưa kết hôn");
										%>
									</h5>
									<h5>
										<b>Email:</b>
										<%
											out.print(cv.email);
										%>
									</h5>
									<h5>
										<b>Điện thoại:</b>
										<%
											out.print(cv.phone);
										%>
									</h5>
									<h5>
										<b>Địa chỉ:</b>
										<%
											out.print(cv.address);
										%>
									</h5>
									<h5>
										<b>Quốc tịch:</b>
										<%
											out.print(cv.nationality);
										%>
									</h5>
									<h5>
										<b>Sở thích cá nhân:</b>
										<%
											out.print(cv.hobby);
										%>
									</h5>
								</div>
							</div>
						</div>


						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									Trình độ học vấn
									<button id="btn_add_education" type="button"
										class="btn btn-primary navbar-right custom_margin">+
										Thêm</button>
								</h4>
							</div>
							<div class="panel-body">

								<div id="form_nhap_education" class="custom_hiden">
									<form id="form_update_education" role="form" method="post" action="resume">


										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">


										<div class="form-group">
											<label for="cv_title">Tên trường:</label> <input type="text"
												name="school_name" class="form-control"
												value="Đại Học Công Nghệ Thông Tin - ĐHQG TPHCM" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Trình độ đào tạo:</label> <input
												type="text" class="form-control" value="Đại học"
												name="education_level" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Chuyên ngành đào tạo:</label> <input
												type="text" class="form-control" name="education_major"
												value="Công nghệ thông tin" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Mô tả:</label> <input type="text"
												class="form-control" name="education_description" id="email">
										</div>

										<div class="form-group">
											<label for="birthday">Ngày bắt đầu:</label> <input
												class="form-control" id="startday_input" readonly
												data-date-format="dd-mm-yyyy" name="startday_input"
												value="01/01/2006">
										</div>

										<div class="form-group">
											<label for="birthday">Ngày kết thúc:</label> <input
												class="form-control" id="endday_input" readonly
												data-date-format="dd-mm-yyyy" name="endday_input"
												value="01/01/2010">
										</div>

										<button type="submit" class="btn btn-primary"
											name="btn_add_education">Thêm trường học</button>

										<button id="btn_cancel_education" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
									<br>
								</div>
								<div id="education_content">
									<%
										List<dtoEducation> edu = cvModel.getEducation(resumeId);
										for (dtoEducation i : edu) {

											out.print("<p><b>" + i.schoolName + " "
													+ "<button type=\"button\" onclick=\"location.href='"
													+ "resume?id=" + i.resumeId + "&delete_education="
													+ i.educationId
													+ "'\" class=\"btn btn-danger btn-xs\">Xóa</button>"
													+ " </b><br>");
											out.print("<b>Trình độ</b>: " + i.educationLevel + "<br>");
											out.print("<b>Chuyên ngành</b>:" + i.educationMajor + "<br>");
											out.print("<b>Thời gian đào tạo</b>: Từ ngày " + i.startDate
													+ " đến ngày " + i.endDate + "<br></p><hr>");
										}
									%>
								</div>

							</div>
						</div>


						<div class="panel panel-default">
							<div class="panel-heading">

								<h4>
									Trình độ ngoại ngữ
									<button id="btn_add_language" type="button"
										class="btn btn-primary navbar-right custom_margin">+
										Thêm</button>
								</h4>
							</div>
							<div class="panel-body">
								<div id="form_nhap_language" class="custom_hiden">
									<form id="form_update_language" role="form" method="post" action="resume">


										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">

										<div class="form-group">
											<label for="cv_title">Tên chứng chỉ:</label> <input
												type="text" name="language_name" class="form-control"
												id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Cấp độ/Điểm:</label> <input type="text"
												class="form-control" name="language_level" id="email">
										</div>

										<button type="submit" class="btn btn-primary"
											name="btn_add_language">Thêm bằng cấp</button>

										<button id="btn_cancel_language" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
									<br>
								</div>
								<div id="language_content">
									<%
										List<dtoLanguage> languages = cvModel.getAllLanguage(resumeId);
										for (dtoLanguage i : languages) {
											out.print("<p>");
											out.print("<h4><b>Chứng chỉ:</b> "
													+ i.name
													+ "   <button type=\"button\" onclick=\"location.href='"
													+ "resume?id=" + i.resumeId + "&delete_language="
													+ i.languageId
													+ "'\" class=\"btn btn-danger btn-xs\">Xóa</button>"
													+ "</h4>");
											out.print("<b>Cấp độ/Điểm:</b> " + i.level + "<br>");
											out.print("</p><hr>");
										}
									%>
								</div>
							</div>
						</div>


						<div class="panel panel-default">
							<div class="panel-heading">

								<h4>
									Kinh nghiệm làm việc
									<button id="btn_add_experience" type="button"
										class="btn btn-primary navbar-right custom_margin">+
										Thêm</button>
								</h4>
							</div>
							<div class="panel-body">
								<div id="form_nhap_experience" class="custom_hiden">
									<form id="form_update_experience" role="form" method="post" action="resume">


										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">

										<div class="form-group">
											<label for="cv_title">Tên Công Ty:</label> <input type="text"
												name="company_name" class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Tên Công Việc:</label> <input
												type="text" class="form-control" name="job_name" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Vị Trí:</label> <input type="text"
												class="form-control" name="job_position" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Mô Tả:</label> <input type="text"
												class="form-control" name="job_description" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Thời Gian:</label> <input type="text"
												class="form-control" name="job_time" id="email">
										</div>
										<button type="submit" class="btn btn-primary"
											name="btn_add_experience">Thêm kinh nghiệm</button>

										<button id="btn_cancel_experience" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
									<br>
								</div>

								<div id="experience_content">
									<%
										List<dtoExperience> epx = cvModel.getExperience(resumeId);
										for (dtoExperience i : epx) {
											out.print("<p>");
											String url = "   <button type=\"button\" onclick=\"location.href='"
													+ "resume?id="
													+ i.resumeId
													+ "&delete_experience="
													+ i.experienceId
													+ "'\" class=\"btn btn-danger btn-xs\">Xóa</button>";

											out.print("<h4>" + i.jobTitle + " tại " + i.companyName + " "
													+ url + " </h4>");
											out.print("Vị Trí: " + i.position + "<br>");
											out.print("Mô Tả: " + i.description + "<br>");
											out.print("Thời Gian: " + i.period + "<br>");
											out.print("</p><hr>");
										}
									%>
								</div>
							</div>
						</div>


						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									Kỹ năng
									<button id="btn_add_skill" type="button"
										class="btn btn-primary navbar-right custom_margin">+
										Thêm</button>
								</h4>
							</div>
							<div class="panel-body">
								<div  id="form_nhap_skill" class="custom_hiden">
									<form id="form_update_skills" role="form" method="post" action="resume">

										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">

										<div class="form-group">
											<label for="cv_title">Tên Kỹ Năng:</label> <input type="text"
												name="skill_name" class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Mô Tả/Level:</label> <input type="text"
												class="form-control" name="skill_level" id="email">
										</div>
										<button type="submit" class="btn btn-primary"
											name="btn_add_skill">Thêm kỹ năng</button>

										<button id="btn_cancel_skill" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
									<br>

								</div>
								<div id="skill_list">
									<%
										List<dtoSkill> skills = cvModel.getSkill(resumeId);
										for (dtoSkill i : skills) {
											String url = "   <button type=\"button\" onclick=\"location.href='"
													+ "resume?id="
													+ i.resumeId
													+ "&delete_skill="
													+ i.skillId
													+ "'\" class=\"btn btn-danger btn-xs\">Xóa</button>";
											out.print("<p>");
											out.print("<h4>");
											out.print(i.name + " " + url);
											out.print("</h4>");
											out.print(i.level);
											out.print("<br><hr></p>");
										}
									%>

								</div>

							</div>
						</div>


						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									Mục tiêu nghề nghiệp
									<button id="btn_add_objective" type="button"
										class="btn btn-primary navbar-right custom_margin">Cập
										nhật</button>
								</h4>
							</div>



							<div class="panel-body">
								<div id="form_nhap_objective" class="custom_hiden">

									<%
										dtoCareerObjective objective = cvModel.getObjective(resumeId);
									%>

									<form id="form_update_objective" role="form" method="post" action="resume">

										<input name="id" type="hidden"
											value="<%out.print(resumeId);%>">


										<div class="form-group">
											<label for="cv_title">Mức lương mong muốn(VND):</label> <input
												type="text" value="<%out.print(objective.desireSalary);%>"
												name="desireSalary" class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Mức lương gần đây(VND):</label> <input
												type="text" name="recentSalary"
												value="<%out.print(objective.recentSalary);%>"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Cấp bậc mong muốn:</label> <input
												type="text" name="desireCareerLevel"
												value="<%out.print(objective.desireCareerLevel);%>"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Loại công việc:</label> <input
												type="text" name="positionType"
												value="<%out.print(objective.positionType);%>"
												class="form-control" id="email">
										</div>

										<div class="form-group">
											<label for="cv_title">Nơi làm việc ưa thích:</label> <input
												type="text" name="desireWorkLocation"
												value="<%out.print(objective.desireWorkLocation);%>"
												class="form-control" id="email">
										</div>



										<div class="form-group">
											<label for="txt_CareerObjective">Mục tiêu nghề nghiệp:</label>
											<textarea class="form-control" rows="5"
												id="txt_CareerObjective"" name="CareerObjective"><%out.print(objective.careerObjective);%></textarea>
										</div>

										<div class="form-group">
											<label class="checkbox-inline"> <input 
												name="opt_object" type="checkbox" value="willingToRelocate"
												<%if (objective.willingToRelocate.equals("1"))
				out.print("checked");%>>Có
												thể đổi chỗ ở
											</label> <label class="checkbox-inline"><input
												name="opt_object" type="checkbox" value="WillingToTravel"
												<%if (objective.willingToTravel.equals("1"))
				out.print("checked");%>
												name="opt_object">Có thể đi công tác</label>
										</div>

										<button type="submit" class="btn btn-primary"
											name="btn_add_objective">Cập nhật</button>

										<button id="btn_cancel_objective" type="button"
											class="btn btn-primary">Hủy</button>
									</form>
									<br>
								</div>
								<div id="objective_content">
									<h4>
										Mức lương mong muốn(VND):
										<%
										out.print(objective.desireSalary);
									%>
									</h4>
									<hr>
									<h4>
										Mức lương gần đây(VND):
										<%
										out.print(objective.recentSalary);
									%>
									</h4>
									<hr>
									<h4>
										Loại công việc:
										<%
										out.print(objective.positionType);
									%>
									</h4>
									<hr>
									<h4>
										Cấp bậc mong muốn:
										<%
										out.print(objective.desireCareerLevel);
									%>
									</h4>
									<hr>
									<h4>
										Nơi làm việc mong muốn:
										<%
										out.print(objective.desireWorkLocation);
									%>
									</h4>
									<hr>
									<h4>
										Có thể đi công tác:
										<%
										if (objective.willingToTravel.equals("1"))
											out.print("Có thể");
										else
											out.print("Không");
									%>
									</h4>
									<hr>
									<h4>
										Có thể đổi chỗ ở:
										<%
										if (objective.willingToRelocate.equals("1"))
											out.print("Có thể");
										else
											out.print("Không");
									%>
									</h4>
									<hr>
									<h4>
										Mục tiêu nghề nghiệp:
										<%
										out.print(objective.careerObjective);
									%>
									</h4>
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