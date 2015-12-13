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
<title>Chi tiết ${user.userName}</title>
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
                        <a href="#">Trang cá nhân</a>
                    </li>
                    <li>
                        <a id="user_list_menu" href="${pageContext.request.contextPath}/statistic">Danh sách người dùng</a>
                    </li>
                    <li>
                        <a id="job_list_menu" href="${pageContext.request.contextPath}/jobList">Danh sách công việc</a>
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
			<h2>Kết quả đánh giá của ${user.userName}</h2>
			<p>Số việc làm được đánh giá:
			 5 sao: <span style="color: red">${user.rateFiveStar}</span>
			|4 sao: <span style="color: red">${user.rateFourStar}</span>
			|3 sao: <span style="color: red">${user.rateThreeStar}</span>
			|2 sao: <span style="color: red">${user.rateTwoStar}</span>
			|1 sao: <span style="color: red">${user.rateOneStar}</span></p>
			<table class="table .table-striped">
				<thead>
					<tr>
						<th>Tên việc làm</th>
						<th>Lĩnh vực</th>
						<th>Thời điểm đánh giá</th>
						<th>Điểm đánh giá</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="job" items="${listJob}">
					<tr>
						<td><c:out value="${job.jobName}"/></td>
						<td><c:out value="${job.category}"/></td>
						<td><c:out value="${job.time}"/></td>
						<td><c:out value="${job.rating}"/></td>
					</tr>
				</c:forEach>
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
<script src="view/resource/lib/statistic.js"></script>hnb
</body>
</html>