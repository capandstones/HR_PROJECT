<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<%--     <c:import url="/WEB-INF/views/include/side_menu.jsp" /> --%>

<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="sb-sidenav-footer">
						<div class="small">접속자명</div>
						박정민
					</div>
					<div>
						<form>
							<input type='button' value='출근하기' />
						</form>
					</div>
					<div class="nav">
						<div class="sb-sidenav-menu-heading">알림</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMessenger" aria-expanded="false"
							aria-controls="collapseMessenger"> 메신저
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseMessenger" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="Messenger-received.html">받은 메신저</a> <a class="nav-link" href="Messenger-send.html">보낸 메신저</a>
							</nav>
						</div>
						<a class="nav-link" href="news.html"> 새로운 소식 </a>
						<div class="sb-sidenav-menu-heading">메뉴</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false"
							aria-controls="collapseNotice"> 공지사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="notice-all.html">전체 공지사항</a> <a class="nav-link" href="notice-department.html">부서 공지사항</a> <a class="nav-link"
									href="notice-favorites.html">즐겨찾기</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMember" aria-expanded="false"
							aria-controls="collapseMember"> 구성원
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseMember" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="member.html">구성원</a> <a class="nav-link" href="organization-chart.html">조직도</a>
							</nav>
						</div>
						<a class="nav-link" href="calendar.html"> 캘린더 </a> <a class="nav-link" href="commute.html"> 출퇴근 </a> <a class="nav-link" href="workflow.html">
							워크플로우 </a> <a class="nav-link" href="vacation.html"> 휴가 </a> <a class="nav-link" href="salary.html"> 급여 </a>
					</div>
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content" class="container" style="margin-top: 10px">
			<div class="row">
				<div class="col-lg-4" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">
								내 정보 <a href="board_main.html" class="btn btn-primary">관리</a>
							</h4>
							<hr />
							<table style="width: 100%">
								<tr>
									<th rowspan="3"><img src="error-404-monochrome.svg" alt="이미지" style="width: 100px; height: 100px;"></th>
									<th>이름</th>
									<td>박정민</td>
									<th>사번</th>
									<td>123456</td>
								</tr>
								<tr>
									<th>소속부서</th>
									<td>우주최강4조</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>직종</th>
									<td>인사</td>
									<th>직무</th>
									<td>팀장</td>
								</tr>
							</table>

						</div>
					</div>
				</div>

				<div class="col-lg-4" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">공지사항</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-4" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">메뉴 바로가기(즐겨찾기)</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">근로시간</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">일일 나의 근태</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">휴가정보</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6" style="margin-top: 20px">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">부서원 근태</h4>

							<a href="board_main.html" class="btn btn-primary">더보기</a>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
</body>

</html>