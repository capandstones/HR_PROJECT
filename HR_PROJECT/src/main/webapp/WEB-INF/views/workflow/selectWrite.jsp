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
	box-shadow: 0 0 5px 5px rgba(36,65,128,.3);
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



</style>



</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 20px; height: auto; background-color: #fff;">
			<main>
				<div id="parent">
					<form name="selectFrm" style="margin-left: 20px; ">
						<div class="card" onclick="goWrite()" id="child">
							<img class="icon" src="${root}image/free-icon-bulk-buying-3040081.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
								<div id="fontSubject">
									비품 신청 <input type="hidden" name="subject" value="비품 신청" readonly />
									<input type="hidden" name="information"
										value="일하는 데 필요한 물품을 신청해주세요!" readonly />
								<textarea style="display: none;" name="guide_form">품명 :		

상품 정보(링크) :

수량:

단가:

금액:

사유:  

				 </textarea>
							</div>
							<div id="fontpurpose">구매 신청</div>
						</div>
					</form>
					<form name="selectFrm2">
						<div class="card" onclick="goWrite2()" id="child">
							<img class="icon" src="${root}image/free-icon-marriage-3370933_1.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
							<div id="fontSubject">
								경조비 신청 <input type="hidden" name="subject" value="경조비 신청"
									readonly /> <input type="hidden" name="information"
									value="아래 양식에 맞추어 신청해 주세요" readonly />
								<textarea style="display: none;" name="guide_form">경조내용  :		

경조 대상자 성명 :

관계(본인, 본인의 OO) :

경조일 :

				 </textarea>
							</div>
							<div id="fontpurpose">복리 후생</div>
						</div>
					</form>
					<form name="selectFrm3">
						<div class="card" onclick="goWrite3()" id="child">
							<img class="icon" src="${root}image/free-icon-user-860784.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
							<div id="fontSubject">
								계정 신청 <input type="hidden" name="subject" value="계정 신청" readonly />
								<input type="hidden" name="information"
									value="G Suite, AWS, Zeplin 등 필요한 계정의 담당자를 지정하여 계정 신청을 해주세요."
									readonly />
								<textarea style="display: none;" name="guide_form">요청 계정:		

희망 ID :

사유 : 
				 </textarea>
							</div>
							<div id="fontpurpose">구매 신청</div>
						</div>
					</form>

					<form name="selectFrm4" style="margin-right: 20px">
						<div class="card" onclick="goWrite5()" id="child">
							<img class="icon" src="${root}image/free-icon-award-11239533.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
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
				</div>

				<div id="parent2">
					<form name="selectFrm5" style="margin-left: 20px;">
						<div class="card" onclick="goWrite6()" id="child2">
							<img class="icon" src="${root}image/free-icon-parenting-3079243.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
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
					<form name="selectFrm6">
						<div class="card" onclick="goWrite7()" id="child2">
							<img class="icon" src="${root}image/free-icon-project-5956597.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
							<div id="fontSubject">
								신규 프로젝트 <input type="hidden" name="subject" value="신규 프로젝트"
									readonly /> <input type="hidden" name="information"
									value="신규 프로젝트를 아래와 같이 작성해주세요." readonly />
								<textarea style="display: none;" name="guide_form">요청 사항 :
				 </textarea>
							</div>
							<div id="fontpurpose">업무 신청</div>
						</div>
					</form>
					<form name="selectFrm7">
						<div class="card" onclick="goWrite8()" id="child2">
							<img class="icon" src="${root}image/free-icon-receipt-866091.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
							<div id="fontSubject">
								개인경비청구서 <input type="hidden" name="subject" value="개인경비청구서 "
									readonly /> <input type="hidden" name="information"
									value="개인경비청구서 입니다." readonly />
								<textarea style="display: none;" name="guide_form">요청 사항 :
				 </textarea>
							</div>
							<div id="fontpurpose">경비 청구</div>
						</div>
					</form>
					<form name="selectFrm8" style="margin-right: 20px;">
						<div class="card" onclick="goWrite9()" id="child2">
							<img class="icon" src="${root}image/free-icon-receipt-866091.svg" style="width: 50px; height: auto; margin-top: 10px; margin-left: 10px;">	
							<div id="fontSubject">
								지출결의서 <input type="hidden" name="subject" value="지출결의서" readonly />
								<input type="hidden" name="information"
									value="작성 시 영수증을 첨부해 주세요." readonly />
								<textarea style="display: none;" name="guide_form">1. 작성 안내
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