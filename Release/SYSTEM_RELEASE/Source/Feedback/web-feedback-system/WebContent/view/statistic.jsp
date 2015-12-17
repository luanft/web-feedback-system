<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="view/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="view/resource/css/statistic.css">
<title>Thống kê</title>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}">JOB RECOMMENDATION SYSTEM</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}">Trang chủ</a>
                    </li>
                    <li>
                        <a id="user_list_menu"href="#">Danh sách người dùng</a>
                    </li>
                    <li>
                        <a id="job_list_menu" href="#">Danh sách công việc </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <header class="">
    	<div class="container" >
        <h1 style="color: white; margin-top: 50px;"><a href="${pageContext.request.contextPath}/statistic" style="color: white; text-decoration: none">Trang thống kê</a></h1>
        </div>
    </header>
    <!-- Content Section -->
    <section>
		<div class="container">
			<div id="user_list">
				<h2>Danh sách người dùng</h2>
				<p>Hiện tại có <span style="color: red">${numberUser}</span> người dùng, có <span style="color: red">${numberJobRated}</span> việc làm đã đánh giá và <span style="color: red">${numberJobSent}</span> công việc đã gửi.
				</p>
				<table class="table .table-striped">
					<thead>
						<tr>
							<th>Tên người dùng</th>
							<th>Email</th>
							<th>Số việc làm đã gửi</th>
							<th>Số việc làm đã đánh giá</th>
							<th>Chi tiết</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="acc" items="${accountList}">
						<tr>
							<td><c:out value="${acc.userName}"/></td>
							<td><c:out value="${acc.email}"/></td>
							<td><c:out value="${acc.numberJobSent}"/></td>
							<td><c:out value="${acc.numberJobRated}"/></td>
							<td>
								<a href="${pageContext.request.contextPath}/statistic?userId=${acc.accountId}">Xem chi tiết...</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="job_list">
			<label for="area-select"></label>
			<!-- Hiện danh sách lĩnh vực -->
			<h2>Danh sách công việc được đánh giá</h2>
				<label for="area-select">Chọn lĩnh vực: </label>
				<select name="area-select" class="form-control" style="width: 20%">
						<option>Tất cả lĩnh vực</option>
						<c:forEach var="cate" items="${categoryList}">
							<option onclick="loadJob(${cate.categoryId})"><c:out value="${cate.categoryName}"/></option>
						</c:forEach>
				</select>
				<br>
				<div id="no-result" class="bg-danger"></div>
				<table id="job-table"class="table .table-striped">
					<thead>
						<tr>
							<th>Tên việc làm</th>
							<th>Lĩnh vực</th>
							<th>Số lược đánh giá</th>
							<th>Lược đánh giá 5 sao</th>
							<th>Chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="job" items="${jobList}">
						<tr>
							<td><c:out value="${job.jobName}"/></td>
							<td><c:out value="${job.category}"/></td>
							<td><c:out value="${job.numberRating}"/></td>
							<td><c:out value="${job.fiveStarRating}"/></td>
							<td><a href="${pageContext.request.contextPath}/statistic?jobId=${job.jobId}">Xem chi tiết</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.container -->
    </section>
    <!-- Footer -->
      <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Nhóm sv UIT</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </footer>
    <script src="view/resource/lib/jquery-2.1.4.min.js"></script>
<script src="view/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="view/resource/lib/statistic.js"></script>
</body>
</html>