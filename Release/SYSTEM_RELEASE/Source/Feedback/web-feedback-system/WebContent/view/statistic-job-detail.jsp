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
                <a class="navbar-brand" href="#">JOB RECOMMENDATION SYSTEM</a>
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
		<h2>Chi tiết việc làm ${job.jobName}</h2>
		<p>Công việc này có số lược đánh giá:</p>
		1 sao: <span style="color: red">${job.oneStarRating}</span> lược</p>
		<p>2 sao: <span style="color: red">${job.twoStarRating}</span> lược</p>
		<p>3 sao: <span style="color: red">${job.threeStarRating}</span> lược</p>
		<p>4 sao: <span style="color: red">${job.fourStarRating}</span> lược</p>
		<p>5 sao: <span style="color: red">${job.fiveStarRating}</span> lược</p>
			<table id="job-table"class="table .table-striped">
					<thead>
						<tr>
							<th>Tên công việc</th>
							<th>Người dùng đánh giá 1 sao</th>
							<th>Người dùng đánh giá 2 sao</th>
							<th>Người dùng đánh giá 3 sao</th>
							<th>Người dùng đánh giá 4 sao</th>
							<th>Người dùng đánh giá 5 sao</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:out value="${job.jobName}"/></td>
							<td><c:forEach var="user" items="${job.userRateFiveStar}">
									<a href="${pageContext.request.contextPath}/statistic?userId=${user.accountId}"><c:out value="${user.userName}"/></a>
								</c:forEach>
							</td>
							<td><c:forEach var="user" items="${job.userRateFourStar}">
									<a href="${pageContext.request.contextPath}/statistic?userId=${user.accountId}"><c:out value="${user.userName}"/></a>
								</c:forEach></td>
							<td><c:forEach var="user" items="${job.userRateThreeStar}">
									<a href="${pageContext.request.contextPath}/statistic?userId=${user.accountId}"><c:out value="${user.userName}"/></a>
								</c:forEach></td>
							<td><c:forEach var="user" items="${job.userRateTwoStar}">
									<a href="${pageContext.request.contextPath}/statistic?userId=${user.accountId}"><c:out value="${user.userName}"/></a>
								</c:forEach></td>
							<td><c:forEach var="user" items="${job.userRateOneStar}">
									<a href="${pageContext.request.contextPath}/statistic?userId=${user.accountId}"><c:out value="${user.userName}"/></a>
								</c:forEach></td>
						</tr>
					</tbody>
				</table>
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