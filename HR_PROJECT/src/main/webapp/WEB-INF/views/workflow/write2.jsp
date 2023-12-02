<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HR</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>



<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<style type="text/css">
.container {
	/* text-align: center;  */
	/* 	margin-left: 30%; */
	
}

.content {
	padding: 20px 0px 0px 70px;
}

.card:hover {
	background-color: #efefef;
	cursor: pointer;
	border-radius: 0.5rem;
}

span#fontSubject {
	font-size: 25pt;
	font-weight: bold;
	margin-top: 25px;
	margin-left: 5px;
	vertical-align: bottom;
}

div#information {
	font-size: 13pt;
	margin-left: 5px;
	margin-top: 10px;
}

img#icon {
	width: 40px;
	height: 40px;
	margin: 5px;
}

div#contents {
	font-size: 15pt;
	color: #4d4d4d;
	font-weight: bold;
	margin: 25px 5px;
}

input.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd;
	width: 650px;
	height: 45px;
	font-weight: bold;
	font-size: 13pt;
}

textarea.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd; /* #b3b3b3 */
	width: 650px;
	height: 200px;
	font-weight: bold;
	font-size: 13pt;
}

span#modalprof {
	width: 45px;
	height: 45px;
	border-radius: 40%;
	/* background-color: #239afe; */
	color: white;
	border: 0px solid #ccced0;
	font-size: 12pt;
	text-align: center;
	padding: 9px 7px;
}

table#mytable {
	border: 1px solid #ccced0;
	/*  border-style: hidden; */
	/*  box-shadow: 1 1 1 1px #ccced0; */
	width: 400px;
	/*  height : 500px;   */
	font-size: 15pt;
}

td.td-1 {
	/* padding :10px 15px; */ /* 이거만 살리기 */
	/* border : 1px solid; */
	padding-top: 14.5px;
	padding-bottom: 14.5px;
}

td.td-2 {
	width: 50%;
}

span#status2 {
	width: 60px;
	height: 30px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	font-weight: bold;
	font-size: 14pt;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

hr {
	background: #bfbfbf;
	height: 1px;
	border: 0;
}

input:focus {
	outline: 2px solid #66cc66;
}

textarea:focus {
	outline: 2px solid #66cc66;
}

textarea::placeholder {
	color: #999999;
	font-weight: normal;
}

div#attachArea {
	width: 80%;
	margin: 0 10% 15px 0px;
}

.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 70%;
	border-radius: 0.4rem;
	color: #999999;
}

.filebox .upload-name:focus {
	outline: 2px solid #66cc66;
}

.filebox label {
	display: inline-block;
	padding: 9px 20px;
	color: #fff;
	vertical-align: middle;
	text-align: center;
	background-color: #496785;
	cursor: pointer;
	width: 25%;
	height: 40px;
	margin-left: 5px;
	margin-top: 5px;
	border-radius: 0.4rem;
}

</style>


<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<c:import url="/WEB-INF/views/include/side_menu.jsp" />
		<div id="layoutSidenav_content"
			style="padding-top: 0x; height: auto; background-color: #fff; justify-content: unset;">
			<c:import url="/WEB-INF/views/workflow/writeheader2.jsp" />
			<main>
				<div class="contain" style="overflow-x: hidden;">
					<form name="wirteFrm" action="${root}workflow/write_pro" method="post" enctype="multipart/form-data">
						<div class="row" style="padding: 0px;">
							<div class="col-7 content">
								<img src="${root}image/paper.svg"> <span id="fontSubject">계약서
									검토 신청</span>
								<h5>작성 시 계약 서류를 첨부해주세요.</h5>
								<div id="contents">
									제목<br>
									<div class="daterange" style="margin-top: 5px;">
										<input type="text" class="startdate search" id="daterange" name="draft_subject" value="(계약서검토신청)" placeholder="제목" style="margin-top: 5px; padding-left: 10px;"/>
									</div>
								</div>
								<div id="contents">
									내용
									<div style="margin-top: 5px;">
										<textarea class="search" name="draft_text" id="daterange" style="margin-top: 5px; padding: 6px 10px;">
1.계약서를 첨부해주세요


2.검토 내용			
						</textarea>
									</div>
								</div>
								<div id="contents">
									희망마감날짜<br>
									<div class="daterange" style="margin-top: 5px;">
										<input type="date" class="startdate search" id="daterange" name="draft_hope_date" placeholder="날짜 선택" style="margin-top: 5px; padding-left: 10px;" />
									</div>
								</div>
								<div id="attachArea">
									<div class="filebox">
										<input type="file" id="file"  name="upload_file">
									</div>
								</div>
							</div>
							<!-- =================================================================== -->

							<div class="col-5 "
								style="margin-top: 20px; padding-left: 20px; width: 500px; margin-left: 80px;">
								<div style="float: left; ">
								<button type="submit" class="headerBtn" style="margin-left: 300px; margin-right:10px; margin-bottom:30px;  background-color: #496785">
                              <i class="bi bi-send" style="margin-right: 10px;"></i> 보내기
                           </button>
									<table style="border-collapse: collapse; border-radius: 10px;"
										id="mytable">
										<thead>
											<tr>
												<th colspan="3" style="padding: 25px 10px 25px 25px; border-bottom: 0.5px solid #ddd;">승인 대상</th>
											</tr>
											<tr >
												<th colspan="3" id="draft_looker_id1" style="padding: 20px 10px 20px 20px; font-size: 13pt;">${list[1].employee_name} · ${list[1].department_name} · ${list[1].employee_position}</th>
											</tr>
											<tr >
												<th colspan="3" id="draft_looker_id2" style="padding: 20px 10px 20px 20px; font-size: 13pt;">${list[2].employee_name} · ${list[2].department_name} · ${list[2].employee_position}</th>
											</tr>
											<tr >
												<th colspan="3" id="draft_looker_id3" style="padding: 20px 10px 20px 20px; font-size: 13pt;">${list[0].employee_name} · ${list[0].department_name} · ${list[0].employee_position}</th>
											</tr>
										</thead>
									</table>
									<input type="hidden" name="draft_looker_id1" value="${list[0].employee_id}">
									<input type="hidden" name="draft_looker_id2" value="${list[1].employee_id}">
									<input type="hidden" name="draft_looker_id3" value="${list[2].employee_id}">
									<input type="hidden" name="draft_info_id" value="0">
								</div>
							</div>
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>	<script src="${root }js/scripts.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }assets/demo/chart-area-demo.js"></script>
	<script src="${root }assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>