<%@page import="wfs.l2t.dto.dtoAccount"%>
<%@page import="wfs.l2t.dto.dtoCategory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="wfs.l2t.model.ModelCategory"%>
<%@ page import="wfs.l2t.model.ModelAccount"%>

<%
	String userId = (String) request.getAttribute("user");
	ModelAccount account = new ModelAccount();
	dtoAccount dtoAcc = account.getAccountById(userId);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Web theme</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap.min.css">
<script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="view/resource/css/theme_customize.css">
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
								src="<%out.print(request.getContextPath()
					+ "/view/resource/image/logo.jpg");%>"
								class="img-circle navbar-brand" width="60" height="70"> <a
								class="navbar-brand custom_color_white"
								href="<%out.print(request.getContextPath());%>">
								RECOMMENDATION SYSTEM</a>
						</div>
					</div>
					<div class="col-md-7">
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
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 custom_background_color">
					<br>
					<!-- Menu chỉnh thời gian nhận mail -->
					<div class="container-fluid">
						<div class="row">
							<%
								//lay danh account hien tai	
								String currentUserId = (String) request.getAttribute("user");

								ModelAccount ac = new ModelAccount();
								dtoAccount acc_info = ac.getAccountById(currentUserId);
							%>
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">Bạn muốn nhận email vào thời
										gian nào?</div>
									<div class="panel-body">
										<form role="form" id="form-time-email" action="settings"
											method="post">
											<div class="form-group">
												<div class="radio-inline">
													<label><input type="radio" value="daily"
														name="fte-rdo-time"
														<%if (acc_info.timeReceiveEmail.equals("daily"))
				out.print("checked=\"checked\"");%>>Hàng
														ngày </label>
												</div>
												<div class="radio-inline">
													<label><input type="radio" value="weekly"
														name="fte-rdo-time"
														<%if (acc_info.timeReceiveEmail.equals("weekly"))
				out.print("checked=\"checked\"");%>>Hàng
														tuần </label>
												</div>
												<div class="radio-inline">
													<label><input type="radio" value="monthly"
														name="fte-rdo-time"
														<%if (acc_info.timeReceiveEmail.equals("monthly"))
				out.print("checked=\"checked\"");%>>Hàng
														tháng </label>
												</div>
											</div>
											<div class="form-group custom_margin">
												<button type="submit" name="fte-btn-submit"
													class="btn btn-primary navbar-right">Lưu lại</button>
											</div>
										</form>

									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">Bạn muốn nhận bao nhiêu công
										việc trong một email?</div>
									<div class="panel-body">
										<form action="settings" method="post" role="form"
											id="form-number-email">
											<div class="form-group">
												<div class="radio-inline">
													<label><input type="radio" value="5"
														name="fne_rdo_number"
														<%if (acc_info.numberReceiveEmail.equals("5"))
				out.print("checked=\"checked\"");%>>Từ
														0 - 5</label>
												</div>
												<div class="radio-inline">
													<label><input type="radio" value="10"
														name="fne_rdo_number"
														<%if (acc_info.numberReceiveEmail.equals("10"))
				out.print("checked=\"checked\"");%>>Từ
														5 - 10</label>
												</div>
												<div class="radio-inline">
													<label><input type="radio" value="20"
														name="fne_rdo_number"
														<%if (acc_info.numberReceiveEmail.equals("20"))
				out.print("checked=\"checked\"");%>>Từ
														10 - 20</label>
												</div>
											</div>
											<div class="form-group custom_margin">
												<button type="submit" class="btn btn-primary navbar-right"
													value="submit" name="fne-btn-submit">Lưu lại</button>
											</div>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Chọn lĩnh vực người dùng quan tâm -->
					<div>
						<div class="panel panel-primary">
							<div class="panel-heading">Chọn lĩnh vực mà bạn quan tâm</div>
							<div class="panel-body">
								<div>
									<form role="form" action="settings" id="form-care-category"
										method="post">
										<div class="form-group">
											<div class="container-fluid">
												<div class="row">
													<%
														ModelCategory category = new ModelCategory();
														List<dtoCategory> data = category
																.getAllCategoryByUser(currentUserId);
														int index1 = 0;
														int index2 = 0;
														int index3 = 0;
														int item_per_row = 0;
														if (!data.isEmpty()) {
															item_per_row = data.size() / 3;
															index1 = item_per_row;
															index2 = item_per_row * 2;
															index3 = data.size();
														}
													%>
													<div class="col-md-4">
														<div class="checkbox">
															<%
																if (!data.isEmpty()) {
																	for (int i = 0; i < index1; i++) {
																		dtoCategory tmp = data.get(i);
																		out.print("<label class=\"checkbox\"> <input name=\"fcc_ck_cat\" type=\"checkbox\" "
																				+ tmp.checked
																				+ " value=\""
																				+ tmp.categoryId
																				+ "\">" + tmp.categoryName + "</label>");
																	}
																}
															%>
														</div>
													</div>
													<div class="col-md-4">
														<div class="checkbox">
															<%
																if (!data.isEmpty()) {
																	for (int i = index1; i < index2; i++) {
																		dtoCategory tmp = data.get(i);
																		out.print("<label class=\"checkbox\"> <input  name=\"fcc_ck_cat\" type=\"checkbox\" "
																				+ tmp.checked
																				+ " value=\""
																				+ tmp.categoryId
																				+ "\">" + tmp.categoryName + "</label>");
																	}
																}
															%>
														</div>
													</div>
													<div class="col-md-4">
														<div class="checkbox">
															<%
																if (!data.isEmpty()) {
																	for (int i = index2; i < index3; i++) {
																		dtoCategory tmp = data.get(i);
																		out.print("<label class=\"checkbox\"> <input  name=\"fcc_ck_cat\"  type=\"checkbox\" "
																				+ tmp.checked
																				+ " value=\""
																				+ tmp.categoryId
																				+ "\" >" + tmp.categoryName + "</label>");
																	}
																}
															%>
														</div>
													</div>
													<div class="form-group custom_margin">
														<button type="submit" value="submit" name="fcc-btn-submit"
															class="btn btn-primary navbar-right">Lưu lại</button>
													</div>
									</form>
								</div>
							</div>
						</div>
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






