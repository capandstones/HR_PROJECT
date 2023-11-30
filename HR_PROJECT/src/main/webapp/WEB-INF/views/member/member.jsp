<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
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
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<style>
.head {
	margin-left: 5%;
	font-weight: bold;
	text-shadow: 3px 3px 3px lightgray;
}

hr {
	
}

/* .side { */
/* 	float: left; */
/* } */
.depth1 {
	width: 100px;
	height: 40px;
	margin-top: 15px;
	color: black;
	background: white;
	border: none;
	font-weight: bold;
	font-size: 19px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-shadow: 2px 2px 2px lightgray;
}

.depth2 {
	width: 100px;
	height: 30px;
	margin-left: 15px;
	color: darkcyan;
	background: white;
	border: none;
	font-weight: bold;
	font-size: 17px;
	box-shadow: 2px 2px 2px 2px lightgray;
	text-shadow: 1px 1px 1px lightgray;
	margin-top: 10px;
}

ul {
	list-style-type: none;
}

.side>div {
	
}

.depth1, .depth2 {
	cursor: pointer;
}

.depth1:hover {
	background: azure;
}

.depth2:hover {
	background: azure;
}

/* 버튼을 안누른 기본 레이아웃은 숨겨짐 */
.hidden {
	display: none;
}

.member_card {
	width: 280px;
	height: 100px;
	background-color: azure;
	margin-left: 50px;
	padding: 10px;
	display: flex;
	box-shadow: 2px 2px 2px 2px lightgray;
	border: 1px solid lightgray;
	mragin-top: 30px;
	margin-bottom: 20px;
	cursor: pointer;
}

.userImage {
	width: 80px;
	height: 80px;
}

.b1 {
	margin-left: 15px;
	margin-bottom: -10px;
	font-size: 18px;
	text-shadow: 2px 2px 2px lightgray;
}

.b2 {
	margin-left: 15px;
	font-size: 16px;
}

.icons {
	margin-top: -34px;
	margin-left: 15px;
	font-size: 12px;
}

.icons>button {
	background: white;
	border: 1px solid lightgray;
}

.main_container {
	display: flex;
}

#showTeam1, #showTeam2, #showTeam3 {
	margin-top: 20px;
	text-align: center;
}

.teamNameButton {
	background: white;
	border: 1px solid lightgray;
	margin-bottom: 10px;
	color: purple;
}

/* ---------------- 모달 내부 스타일링 ------------------*/
#modalWindow {
	display: none;
	position: fixed;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ccc;
	width: 700px;
	height: 700px;
	transform: translate(-50%, -50%);
}

.modal_userImage {
	width: 150px;
	height: 150px;
}

.exitButton {
	cursor: pointer;
	margin-left: 650px;
}

.privacyList {
	display: none;
}



/* 모달 스타일링 끝 ------------------*/
</style>

<script>
	/* 서브 버튼을 눌렀을 때 하부 카테고리 표시, 다시 누르면 감추기 */
	function toggleButtons(buttonId) {
		var subButtons = document.getElementById(buttonId + "-subbuttons");
		subButtons.classList.toggle("hidden");
	}

	function toggleScreen11() {
		var screen = document.getElementById("showTeam1");
		if (screen.style.display === "none" || screen.style.display === "") {
			screen.style.display = "block"; // Display the content
		} else {
			screen.style.display = "none"; // Hide the content
		}

	}

	function toggleScreen12() {
		var screen = document.getElementById("showTeam2");
		if (screen.style.display === "none" || screen.style.display === "") {
			screen.style.display = "block"; // Display the content
		} else {
			screen.style.display = "none"; // Hide the content
		}
	}

	function toggleScreen13() {
		var screen = document.getElementById("showTeam3");
		if (screen.style.display === "none" || screen.style.display === "") {
			screen.style.display = "block"; // Display the content
		} else {
			screen.style.display = "none"; // Hide the content
		}
	}

	// ------------------------------------------------------------------------

	
</script>


</head>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<c:import url="/WEB-INF/views/include/side_menu.jsp" />
		<div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">

			<main>
				<!-- top 시작 -->
				<div>
					<h2 class="head">구성원 / 조직도</h2>
				</div>
				<hr style="border-bottom: 10px; width: 95%;text-align: center; margin: auto; width: 95%;"/>


				<!-- top 끝 -->


				<!-- main_container 시작 -->
				<div class="main_container">

					<!--  side 시작 -->
					<div class="side">
						<div>
							<ul>
								<li>
									<button class="depth1" onclick="toggleButtons('button1')">개발부</button>
									<ul id="button1-subbuttons" class="hidden">
										<li><button class="depth2" onclick="toggleScreen11(), toggleButtons('button11')">부차장</button></li>
										<li><button class="depth2" onclick="toggleScreen12(), toggleButtons('button12')">개발 1팀</button></li>
										<li><button class="depth2" onclick="toggleScreen13(), toggleButtons('button13')">개발 2팀</button></li>
									</ul>
								</li>
								<li>
									<button class="depth1" onclick="toggleButtons('button2')">영업부</button>
									<ul id="button2-subbuttons" class="hidden">
										<li><button class="depth2">영업 1팀</button></li>
										<li><button class="depth2">영업 2팀</button></li>
									</ul>
								</li>
								<li>
									<button class="depth1" onclick="toggleButtons('button3')">인사부</button>
									<ul id="button3-subbuttons" class="hidden">
										<li><button class="depth2">인사 1팀</button></li>
										<li><button class="depth2">인사 2팀</button></li>
									</ul>
								</li>
								<li>
									<button class="depth1" onclick="toggleButtons('button4')">기획부</button>
									<ul id="button4-subbuttons" class="hidden">
										<li><button class="depth2">기획 1팀</button></li>
										<li><button class="depth2">기획 2팀</button></li>
									</ul>
								</li>
								<li>
									<button class="depth1" onclick="toggleButtons('button5')">디자인부</button>
									<ul id="button5-subbuttons" class="hidden">
										<li><button class="depth2">디자인 1팀</button></li>
										<li><button class="depth2">디자인 2팀</button></li>
									</ul>
								</li>
								<li>
									<button class="depth1" onclick="toggleButtons('button6')">테스트부</button>
									<ul id="button6-subbuttons" class="hidden">
										<li><button class="depth2">테스트 1팀</button></li>
										<li><button class="depth2">테스트 2팀</button></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<!--  side 종료 -->

					<br />

					<!-- 부서별 팀 시작 -->
					<div id="showTeam1" class="hidden">
						<div>
							<button class="teamNameButton">부차장</button>
							<!-- 팀원 개개인의 멤버카드 시작  -->
							<div class="member_card" id="id3">
								<img class="userImage" src="${root }image/userImage1.png" alt="사원1 이미지" />
								<div>
									<p class="member_name">
										<b class="b1">강해린</b>
										<br />
										<b class="b2">개발부장</b>
									</p>
									<br />

									<div class="icons">
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
											  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
											</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
											  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
											</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
											  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
											</svg>
										</button>
										<button>
											<b style="font-size: 12px;">재직중</b>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card" id="myDiv">
							<img class="userImage" src="${root }image/userImage2.png" alt="사원2 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">김민지</b>
									<br />
									<b class="b2">개발차장</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
										  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
										</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
										  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
										</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
					</div>
					<!-- 부서별 팀 종료 -->


					<!-- 부서별 팀 시작 -->
					<div id="showTeam2" class="hidden">
						<div>
							<button class="teamNameButton">개발 1팀</button>
							<!-- 팀원 개개인의 멤버카드 시작  -->
							<div class="member_card">
								<img class="userImage" src="${root }image/userImage1.jpg" alt="사원1 이미지" />
								<div>
									<p class="member_name">
										<b class="b1">강해린</b>
										<br />
										<b class="b2">개발1팀 - 팀장</b>
									</p>
									<br />

									<div class="icons">
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
										</button>
										<button>

											<b style="font-size: 12px;">재직중</b>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage2.png" alt="사원2 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">김민지</b>
									<br />
									<b class="b2">개발1팀 - 과장</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage3.png" alt="사원3 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">팜하니</b>
									<br />
									<b class="b2">개발1팀 - 대리</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage4.png" alt="사원4 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">장원영</b>
									<br />
									<b class="b2">개발1팀 - 사원</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
					</div>
					<!-- 부서별 팀 종료 -->

					<!-- 부서별 팀 시작 -->
					<div id="showTeam3" class="hidden">
						<div>
							<button class="teamNameButton">개발 2팀</button>
							<!-- 팀원 개개인의 멤버카드 시작  -->
							<div class="member_card">
								<img class="userImage" src="${root }image/userImage1.jpg" alt="사원1 이미지" />
								<div>
									<p class="member_name">
										<b class="b1">강해린</b>
										<br />
										<b class="b2">개발1팀 - 팀장</b>
									</p>
									<br />

									<div class="icons">
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
										</button>
										<button>
											<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
										</button>
										<button>

											<b style="font-size: 12px;">재직중</b>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage2.png" alt="사원2 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">김민지</b>
									<br />
									<b class="b2">개발1팀 - 과장</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage3.png" alt="사원3 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">팜하니</b>
									<br />
									<b class="b2">개발1팀 - 대리</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
						<!-- 팀원 개개인의 멤버카드 시작  -->
						<div class="member_card">
							<img class="userImage" src="${root }image/userImage4.png" alt="사원4 이미지" />
							<div>
								<p class="member_name">
									<b class="b1">장원영</b>
									<br />
									<b class="b2">개발1팀 - 사원</b>
								</p>
								<br />

								<div class="icons">
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
										  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
										</svg>
									</button>
									<button>
										<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
										  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
										</svg>
									</button>
									<button>

										<b style="font-size: 12px;">재직중</b>
									</button>
								</div>
							</div>
						</div>
						<!-- 팀원 개개인의 멤버카드 종료  -->
					</div>
					<!-- 부서별 팀 종료 -->

				</div>
				<!-- main_container 종료 -->
			</main>



		</div>
	</div>

	<!------------------------------------ 모달 시작 ------------------------------------>
	<div id="modalWindow">
		<svg class="exitButton" onclick="closeModal()" xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 30 30">
			<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
			<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
		</svg>
		<br />

		<div style="display: flex; margin-bottom: 20px;">
			<img src="${root }image/userImage4.png" style="width: 160px; height: 180px; margin-left: 20px; border: 1px solid black;" />

			<div style="padding-left: 30px;">
				<p style="padding-top: 10px; padding-bottom: 0px;">
					<b style="font-size: 18px;">강해린</b>
				</p>
				<p>
					<b style="font-size: 14px;">부서</b> &nbsp;&nbsp; <b style="font-size: 13px;">개발부</b>
				</p>
				<p>
					<b style="font-size: 14px;">직책</b> &nbsp;&nbsp; <b style="font-size: 13px;">부장</b>
				</p>
				<div style="padding-top: 5px;">
					<button>
						<svg style="" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
						</svg>
					</button>
					<button>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
							<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
						</svg>
					</button>
					<button>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
							<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
						</svg>
					</button>
					<button>
						<!-- <div id="circle"></div> -->
						<b style="font-size: 12px;">재직중</b>
					</button>
				</div>
			</div>
		</div>
		<div>
			<div style="display:flex; margin-left:10 margin-bottom:10px;">
				<button class="personnelListBtn">인사 정보</button> &nbsp;&nbsp;
				<button class="privacyListBtn">개인 정보</button>
			</div>
			<hr />
			<ul class="personnelList">
				<li>사번 &nbsp;&nbsp; id1</li> 
				<li>입사일 &nbsp;&nbsp; 2023-01-01</li>
				<li>부서 &nbsp;&nbsp; 개발부</li>
				<li>직책 &nbsp;&nbsp; 부장</li>
				<li>이메일 &nbsp;&nbsp; email@naver.com</li>
			</ul>
			<ul class="privacyList">
				<li>주민번호 &nbsp;&nbsp; 010101-3</li>
				<li>전화번호 &nbsp;&nbsp; 010-1234-1234</li>
				<li>집주소 &nbsp;&nbsp; 서울시 종로구</li>
				<li>영어이름 &nbsp;&nbsp; "employee_last_name" +"employee_first_name"</li>
			</ul>
			<div style="border: 1px solid black;">
				자기소개칸 / 모달 style 고민중
			</div>
		</div>
	</div>
	<!------------------------------------ 모달 종료 ------------------------------------>
<script>
	<!------------------ 모달 스크립트 ----------------->
	const modal = document.querySelector("#modalWindow");
	
	document.querySelector("#id3").addEventListener('click', function() {
		modal.style.display = "block";
	});

	function closeModal() {
		modal.style.display = 'none';
	}
	
/*
	window.onclick = function(event) {
        if (event.target === modal) {
            closeModal();
        }
    };
*/
    
	document.querySelector(".personnelListBtn").addEventListener("click", function() {
		document.querySelector(".privacyList").style.display = "none";
		document.querySelector(".personnelList").style.display = "block";
	});

    document.querySelector(".privacyListBtn").addEventListener("click", function() {
    	document.querySelector(".personnelList").style.display = "none";
    	document.querySelector(".privacyList").style.display = "block";
	});
    
</script>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="${root }js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="${root }assets/demo/chart-area-demo.js"></script>
		<script src="${root }assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
		<script src="${root }js/datatables-simple-demo.js"></script>
</body>
</html>