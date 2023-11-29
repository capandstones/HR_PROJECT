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


<style type="text/css">
div.row {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

div.v-line {
	border-left: thin solid #cccccc;
	height: 80% px;
	padding: 0px;
}

span#number {
	color: #00cc00;
	font-weight: bold;
	font-size: 11pt;
}

span#subject {
	font-weight: bold;
	font-size: 13pt;
}

a.link:link {
	color: #cccccc;
}

a:visited {
	text-decoration: none;
	color: #cccccc;
}

a.link:hover {
	text-decoration: none;
	color: gray;
}

a.mylink:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
	color: #cccccc;
}

/* div#leftFirst { overflow: scroll; }	
	div#rightFirst { overflow: scroll; }	 */
div#leftFirst {
	height: 780px;
	padding: 0px;
}

input[type="checkbox"] {
	-webkit-appearance: none;
	position: relative;
	width: 20px;
	height: 20px;
	cursor: pointer;
	outline: none !important;
	border: 2px solid #cccccc;
	border-radius: 2px;
	background: #fbfbfb;
}

input[type="checkbox"]::before {
	content: "\2713";
	position: absolute;
	top: 50%;
	left: 50%;
	overflow: hidden;
	transform: scale(0) translate(-50%, -50%);
	line-height: 1;
}

input[type="checkbox"]:hover {
	border-color: rgba(170, 170, 170, 0.5);
}

input[type="checkbox"]:checked {
	background-color: #2eb82e;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}

input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

label#sub {
	font-size: 13pt;
	padding-top: 0px;
	margin-top: 0px;
	font-weight: bold;
	margin-left: 10px;
}

span#status {
	width: 53px;
	height: 25px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

span#needstatus {
	width: 58px;
	height: 25px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

div#contents:hover {
	background-color: #efefef;
	cursor: pointer;
}

span#profile {
	width: 35px;
	height: 35px;
	border-radius: 40%;
	background-color: #239afe;
	color: white;
	border: 1px solid #ccced0;
	font-size: 9pt;
	text-align: center;
	padding: 7px 5px;
}

span#profile2 { /*테스트용  */
	width: 35px;
	height: 35px;
	border-radius: 40%;
	background-color: purple;
	color: white;
	border: 1px solid #ccced0;
	font-size: 9pt;
	text-align: center;
	padding: 7px 5px;
}

div#modalStatus {
	width: 450px;
	height: 50px;
	background-color: #eafaea;
	border-radius: 15px;
	border: 1px solid #c1f0c1;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: 10px 8px 20px 8px;
	padding-top: 11.5px;
}

div#modalContents {
	margin-top: 40px;
	width: 500px;
	height: 100%;
}

div#modalNumber {
	width: 35px;
	height: 35px;
	border-radius: 50%;
	border: 1px solid #ccced0;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
}

span#modalSubContents {
	width: 500px;
	height: 400%;
	border-radius: 15px;
	border: 1px solid gray;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin-top: 10px;
	margin-left: 10px;
	padding: 20px 10px;
}

/*     span#modalprof{
		width: 40px; 
		height: 40px; 
		border-radius: 40%; 
		background-color: #239afe;
		color: white;
		border: 1px solid #ccced0;
		font-size: 10pt;
		text-align: center;
		padding: 9px 7px;
	} */
span#modalprof {
	width: 45px;
	height: 45px;
	border-radius: 40%;
	background-color: #239afe;
	color: white;
	border: 0px solid #ccced0;
	font-size: 12pt;
	text-align: center;
	padding: 9px 7px;
}

table {
	border: 1px solid #ccced0;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #ccced0;
	width: 380px;
	height: 80px;
}

td {
	
}

td.td-2 {
	width: 50%;
}

td {
	/* padding :10px 15px; */ /* 이거만 살리기 */
	/* border : 1px solid; */
	
}

/*   td.td-2 {
  	width: 50%;
  }	 */

/*   span#status2{
	width: 55px; 
	height: 25px; 
	background-color: #c1f0c1;
	border-radius: 20%; 
	color: black;
	text-align: center;
	 border: 1px solid #ccced0; 
	margin: auto;
  } */
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

span#status3 {
	width: 53px;
	height: 25px;
	background-color: #ff9999;
	border-radius: 20%;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

div#modal-body {
	height: 100%;
	margin-bottom: 30px;
}

div#startContents {
	height: 638px;
}

span#sizebold {
	font-size: 12pt;
	font-weight: bold;
}

div#parent {
	width: 100%;
	display: flex;
}

div#icon {
	flex: 1
}

div#iconhover:hover {
	width: 63px;
	height: 32px;
	background-color: #efefef;
	cursor: pointer;
	border-radius: 15px;
}

div#child {
	flex: 9
}

button#denial {
	width: 65px;
	height: 35px;
	border: 1px solid #ccced0;
	border-radius: 17.5px;
	background: white;
	margin-top: 30px;
	font-size: 12pt;
	padding: 4px 5px;
	font-weight: bold;
	color: #404040;
}

button#accept {
	width: 75px;
	height: 35px;
	border: 1px solid #39ac39;
	border-radius: 17.5px;
	background: #53c653;
	margin-top: 30px;
	font-size: 12pt;
	padding: 4px 5px;
	font-weight: bold;
	color: white;
}

.bhover:hover {
	background-color: #efefef;
	transition: 0.7s;
}

span.font {
	font-size: 13pt;
	font-weight: bold;
	color: #404040;
}

.p:hover {
	background-color: #efefef;
	transition: 0.7s;
	height: 30px;
	border-radius: 15px;
}

button.bottom-line {
	padding: 0px 0px 10px 0px;
	margin-right: 20px;
	background-color: white;
	border: none;
}

.rightFirst {
	overflow-y: scroll;
	height: 780px;
}

.rightFirst::-webkit-scrollbar {
	width: 10px;
}

.rightFirst::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
	border-radius: 10px;
}

.rightFirst::-webkit-scrollbar-track {
	background-color: #f2f2f2;
	border-radius: 10px;
}

.startContents {
	overflow-y: scroll;
}

.startContents::-webkit-scrollbar {
	width: 10px;
}

.startContents::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
	border-radius: 10px;
}

.startContents::-webkit-scrollbar-track {
	background-color: #f2f2f2;
	border-radius: 10px;
}

button#delete {
	float: right;
	margin-right: 45px;
	background-color: white;
	border: 2px solid #bfbfbf;
	border-radius: 5px;
	width: 26px;
	height: 26px;
	padding: 0px;
}

button#delete:hover {
	background-color: #efefef;
}
</style>


</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="height: auto; background-color: #fff;">
			<c:import url="/WEB-INF/views/workflow/header.jsp" />
			<main>
				<div class="">
					<div class="row">

						<div id="leftFirst" class="col-4">

							<div style="padding: 15px 10px 0px 35px;">

								<button class="bottom-line" id="wating"
									style="border-bottom: 4px solid #00cc00;"
									onclick="waitingDm(1);">
									<span id=subject class="doc1" style="color: balck;">진행 중
									</span><span id="number" class="num1"> </span>
								</button>
								<button class="bottom-line" id="mine" onclick="myDocument(1);">
									<span id=subject class="doc2" style="color: gray;">내가 쓴
										문서 </span><span id="number" class="num2">
									</span>
								</button>
								<button class="bottom-line" id="complete"
									onclick="completeDm(1);">
									<span id=subject class="doc3" style="color: gray;">완료</span> <span
										id="number" class="num3">${requestScope.completeTotalCnt}
									</span>
								</button>

							</div>
							<div id="documentContent" class="border-top">

								<div id="startContents" class="border-bottom startContents">

								</div>

								<div style="margin: 20px auto auto 25px;" id="pageBar"></div>
							</div>
						</div>

						<div id="rightFirst" class="col-8 rightFirst border-left"
							style="text-align: left; padding: 20px 20px;"></div>

					</div>



					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title fs-2" id="exampleModalLabel"
										style="font-weight: bold; font-size: 15pt;">승인 · 참조 현황</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" id="modal-body">



								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 끝 -->
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