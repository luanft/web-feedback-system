<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="wfs.l2t.dto.*"%>
<%@ page import="wfs.l2t.model.ModelResume"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>
<%@ page import="java.util.List"%>

<%
	String userId = (String) request.getAttribute("user");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Resume Profile</title>
<!-- Latest compiled and minified CSS -->

<script
	src="${pageContext.request.contextPath}/view/resource/lib/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/bootstrap/css/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/css/resume_profile.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/resource/css/theme_customize.css">


<script
	src="${pageContext.request.contextPath}/view/resource/datepicker/js/bootstrap-datepicker.js"></script>

</head>

<body>


	<script type="text/javascript">
		$(document).ready(function() {

			//bấm nút thêm cv
			$("#btn_add_cv").click(function() {

				$("#form_enter_resume").slideDown();
				$("#btn_add_cv").hide();
			});

			//bấm nút hủy cv
			$("#btn_cancel_cv").click(function() {

				$("#form_enter_resume").slideUp();
				$("#btn_add_cv").show();
			});

			$('#birthday').datepicker({
				format : 'dd/mm/yyyy'
			});
		});
	</script>


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

							<ul class="nav nav-pills nav-stacked custom_font_bold">
								<li><a href="<%out.print(request.getContextPath());%>"><span
										class="glyphicon glyphicon glyphicon-home"></span> CÔNG VIỆC
										MỚI</a></li>
								<li><a
									href="<%out.print(request.getContextPath() + "/care");%>"><span
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
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 ">
					<br>
					<div>
						<div id="form_enter_resume"
							class="panel panel-default custom_hiden">
							<div class="panel-heading">
								<h3>Thêm một CV</h3>
							</div>
							<div class="panel-body">




								<form role="form" method="post" action="listresume">
									<div class="form-group">
										<label for="cv_title">Tên của CV:</label> <input type="text"
											name="title-input" class="form-control" id="email">
									</div>


									<div class="form-group">
										<label for="cv_title">Họ và tên:</label> <input type="text"
											class="form-control" name="full-name-input" id="email">
									</div>

									<div class="form-group">
										<label for="birthday">Ngày Sinh:</label> <input
											class="form-control" id="birthday" readonly
											data-date-format="dd-mm-yyyy" name="birthday-input"
											value="26/05/1994">
									</div>


									<div class="form-group">
										<label for="cv_title">Giới tính:</label> <label
											class="radio-inline"> <input checked="checked"
											type="radio" name="gender-input" value="Nam">Nam
										</label> <label class="radio-inline"> <input type="radio"
											name="gender-input" value="Nữ">Nữ
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
										<label for="sel1">Quốc tịch:</label> <select
											class="form-control" name="nationality_input" id="sel1">
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
											class="form-control" name="address-input" id="email">
									</div>


									<div class="form-group">
										<label for="cv_title">Email liên hệ:</label> <input
											type="email" class="form-control" name="email-input"
											id="email">
									</div>


									<div class="form-group">
										<label for="cv_title">Số điện thoại:</label> <input
											type="text" class="form-control" name="phone-input"
											id="email">
									</div>

									<div class="form-group">
										<label for="cv_title">Sở thích cá nhân:</label> <input
											type="text" class="form-control" id="email"
											name="hobbies-input">
									</div>

									<button type="submit" class="btn btn-primary"
										name="add-resume-button">Thêm CV</button>

									<button id="btn_cancel_cv" type="button"
										class="btn btn-primary">Hủy</button>
								</form>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>
									CV của bạn
									<button id="btn_add_cv" type="button"
										class="btn btn-primary navbar-right custom_margin">Thêm
										một CV</button>
								</h3>
							</div>
							<div class="panel-body">

								<%
									ModelResume resumeModel = new ModelResume();
									List<dtoResume> list = resumeModel.getUserResumes(userId);
									for (dtoResume i : list) {
										out.print("<h4><a href=\"resume?id="
												+ i.resumeId
												+ "\">"
												+ i.resumeTitle
												+ "</a><a href=\"listresume?delete="
												+ i.resumeId
												+ "\" class=\"navbar-right custom_margin\">Xóa</a></h4><hr>");

									}
								%>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>