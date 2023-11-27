<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<style type="text/css">
.card {
	width: 310px;
	height: 190px;
	border: 2px solid gray;
	margin: 25px 20px;
	padding: 10px;
	border-color: #cccccc;
	border-radius: 0.5rem;
}

.card:hover {
	border: 5px solid #5291EA;
	cursor: pointer;
	border-radius: 0.5rem;
	box-shadow: 0 0 5px 5px rgba(36, 65, 128, .3);
}

div#fontSubject {
	font-size: 20pt;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 13px;
	margin-bottom: 3px;
	color: #4d4d4d;
}

div#fontpurpose {
	font-size: 13pt;
	margin-left: 13px;
	margin-top: 2px;
}

/* img { */

/* 	width: 40px; */
/* 	height: 40px; */
/* 	margin: 13px; */
/* } */
div#parent {
	display: flex;
	justify-content: space-between;
}

div#child {
	flex: 0.15;
}

div#parent2 {
	display: flex;
	justify-content: space-between;
}

div#child2 {
	flex: 0.15;
}

.icon  img {
	width: 60px;
	height: auto;
}
</style>


</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 0px; height: auto; background-color: #fff; justify-content: unset;">
			<c:import url="/WEB-INF/views/workflow/writeheader.jsp" />
			<main>
				<div id="parent">
							
					<form name="selectFrm1" style="margin-left: 20px;">
						<div class="card" onclick="location.href='${root}workflow/write'" id="child" >
							<div class="icon">
								<img src="${root}image/key.svg" style="padding-left: 10px">
								<input type="hidden" name="icon" value="key.svg" readonly />
							</div>
							<div id="fontSubject">
								계정 신청 
								
							</div>
							<div id="fontpurpose">구매 신청</div>
						</div>
					</form>

					<form name="selectFrm2" style="margin-right: 0px">
						<div class="card" onclick="location.href='${root}workflow/write2'" id="child">
							<div class="icon">
								<img src="${root}image/paper.svg" style="padding-left: 10px">
								<input type="hidden" name="icon" value="paper.svg" readonly />
							</div>
							<div id="fontSubject">
								계약서 검토 요청 <input type="hidden" name="subject" value="계약서 검토 요청"
									readonly /> <input type="hidden" name="information"
									value="작성 시 계약 서류를 첨부해주세요." readonly />
							</div>
							<textarea style="display: none;" name="guide_form">요청 사항 :
				 </textarea>
							<div id="fontpurpose">계약</div>
						</div>
					</form>
					
					<form name="selectFrm3">
						<div class="card" onclick="location.href='${root}workflow/write3'" id="child2">
							<div class="icon">
								<img src="${root}image/board.svg" style="padding-left: 10px">
								<input type="hidden" name="icon" value="board.svg" readonly />
							</div>
							<div id="fontSubject">
								휴직 신청 <input type="hidden" name="subject" value="휴직 신청" readonly />
								<input type="hidden" name="information"
									value="아래 양식에 맞추어 신청해주세요." readonly />
								<textarea style="display: none;" name="guide_form">요청 사항 :
				 </textarea>
							</div>
							<div id="fontpurpose">양식구분 없음</div>
						</div>
					</form>

					<form name="selectFrm4" style="margin-right: 20px;">
						<div class="card" onclick="location.href='${root}workflow/write4'" id="child2">
							<div class="icon">
								<img src="${root}image/receipt.svg" style="padding-left: 10px">
								<input type="hidden" name="icon" value="receipt.svg" readonly />
							</div>
							<div id="fontSubject">
								지출결의서 <input type="hidden" name="subject" value="지출결의서" readonly />
								<input type="hidden" name="information"
									value="작성 시 영수증을 첨부해 주세요." readonly />
								<textarea style="display: none;" name="guide_form">
1. 작성 안내
원천징수에 대한 지출 결의서를 작성하시고,
직인을 받은 계약서, 통장 사본, 신분증 사본을 파일로 첨부해주세요.

2. 작성 기한
매달 5일

3. 승인·참조 설정
1,000만원 이상
1단계: 조직장(승인), 박부장(참조)
1,000만원 이하
1단계: 조직장(승인), 박부장(참조)
2단계: 대표(승인)
				 </textarea>
							</div>
							<div id="fontpurpose">원청징수</div>
						</div>
					</form>
					
				</div>
				<div style="width:100%; display: flex; justify-content: center;">
				<img src="${root}image/1.png"  >
				</div>
				
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }js/scripts.js"></script>
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