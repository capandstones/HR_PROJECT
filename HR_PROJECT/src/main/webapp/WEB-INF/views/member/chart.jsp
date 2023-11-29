<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>조직도</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
.head {
	margin-left: 5%;
	font-weight: bold;
	text-shadow: 3px 3px 3px lightgray;
}

hr {
	border-bottom: 10px;
	width: 95%;
	text-align: center;
	margin: auto;
	width: 95%;
}

.side {
	margin-left: 0px;
	border: 1px solid black;
}

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
#myModal {
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

/*
#myModal svg {
	background: white;
	border: 1px solid lightgray;
}*/

/* 모달 스타일링 끝 ------------------*/
.divLeader {
	border: 1px solid black;
}

.divFollower {
	border: 1px solid black;
}
</style>

<script>
	
<%request.setCharacterEncoding("utf-8");%>
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

	$(document).ready(
			function() {
				$.ajaxSetup({
					success : function(result) {
						alert(result);
					},
					error : function(jqXHR) {
						alert("jqXHR status code:" + jqXHR.status + " message:"
								+ jqXHR.responseText);
					}
				}); // ajax setup	

				$("#dep1").click(function() {
					$.ajax({
						type : "GET",
						url : "/HR_Project/getEmpInfo",
						success : function(empList) {
							$("#divLeader").empty();
							$.each(empList, function(i, emp) {
								$("#divLeader").append(emp.employee_name+" "+emp.department_name+" "+emp.employee_position+" "+"<br>").css("background","lightgray");
								
							});
						} // success

					}); // ajax
				}); // 
			}); //document ready
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
				<hr />
				<!-- top 끝 -->

				<!-- main_container 시작 -->
				<div class="main_container">

					<!--  side 시작 -->
					<div class="side">
						<div>
							<ul>
								<li>
									<button id="dep1" class="depth1">개발부</button>
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

					<!--  동적 HTML 저장할 div  -->
					<div id="list_area" class="list_area">

						<div id="divLeader" class="divLeader">부장, 차장 자리입니다.</div>

						<br />

						<div id="divFollower" class="divFollower">팀원 자리입니다.</div>

					</div>
					<!--  동적 HTML 저장할 div 종료  -->

				</div>
				<!-- main_container 종료 -->
			</main>


		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${root }assets/demo/chart-area-demo.js"></script>
	<script src="${root }assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="${root }js/datatables-simple-demo.js"></script>
</body>
</html>