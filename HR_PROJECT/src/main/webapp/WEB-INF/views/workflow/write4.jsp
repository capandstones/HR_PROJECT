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
<title>지출결의서</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>	
	
<script>
// 모달 열기
function openModal() {
  // 모달 엘리먼트 가져오기
  var modal = document.getElementById('myModal');

  // 리스트 엘리먼트 가져오기
  var list = document.getElementById('myList');

  // 리스트 초기화
  list.innerHTML = '';

  // 모달 열기
  modal.style.display = 'block';

  
}

// 모달 닫기
function closeModal() {
  var modal = document.getElementById('myModal');
  modal.style.display = 'none';
}

//모달 열기
function openModal2() {
  // 모달 엘리먼트 가져오기
  var modal = document.getElementById('myModal2');

  // 리스트 엘리먼트 가져오기
  var list = document.getElementById('myList2');

  // 리스트 초기화
  list.innerHTML = '';

  // 모달 열기
  modal.style.display = 'block';

  
}

// 모달 닫기
function closeModal2() {
  var modal = document.getElementById('myModal2');
  modal.style.display = 'none';
}

//모달 열기
function openModal3() {
  // 모달 엘리먼트 가져오기
  var modal = document.getElementById('myModal3');

  // 리스트 엘리먼트 가져오기
  var list = document.getElementById('myList3');

  // 리스트 초기화
  list.innerHTML = '';

  // 모달 열기
  modal.style.display = 'block';

  
}

// 모달 닫기
function closeModal3() {
  var modal = document.getElementById('myModal3');
  modal.style.display = 'none';
}

//111111111111111111111111
//모달에 표시할 리스트 아이템 생성 (예제로 1부터 5까지의 숫자를 리스트에 추가)
function fetchDepartmentInfo(department) {
	  // 여기에 AJAX 요청을 보내는 코드를 추가하세요.
	  $.ajax({
	    url: '${root}workflow/getlist/'+department,
	    method: 'GET',
	    dataType: "json",
	    success: function(response) {
	    	var print='';
	    	for (var i = 0; i < response.length; i++) {
	    		print+= "<div  id='list' style='display:flex;'>"
	    		+ "<div>"+response[i].department_name+" · "+response[i].employee_position+" · "+response[i].employee_name+"</div>"
	    		+ "<button id='list' value='" + response[i].employee_id + "' style='position: absolute; right: 80px;' onclick='selectEmployee(\"" + response[i].employee_name + "\", \"" + response[i].department_name + "\", \"" + response[i].employee_position + "\", \"" + response[i].employee_id+ "\")'>선택</button>"
	    		+ "</div>";
	    	}
	    	$('#myList').html(print);
	    	
	      }
	
	  });
}
//선택 버튼을 눌렀을 때 호출되는 함수
function selectEmployee(employeeName, departmentName, employeePosition, employeeId) {
    // ${list[1].employee_name}, ${list[1].department_name}, ${list[1].employee_position} 값을 업데이트
    // 이 부분을 원하는 대상에 맞게 수정하세요
	$('#selectedEmployeeId').val(employeeId);
    $('#selectedEmployeeName').text(employeeName+" · "+departmentName+" · "+employeePosition);
    

    // 모달 닫기
    closeModal();
}


//222222222222222222222222
//모달에 표시할 리스트 아이템 생성 (예제로 1부터 5까지의 숫자를 리스트에 추가)
function fetchDepartmentInfo2(department) {
	console.log('fetchDepartmentInfo2 called with department:', department);
	  // 여기에 AJAX 요청을 보내는 코드를 추가하세요.
	  $.ajax({
	    url: '${root}workflow/getlist/'+department,
	    method: 'GET',
	    dataType: "json",
	    success: function(response) {
	    	var print='';
	    	for (var i = 0; i < response.length; i++) {
	    		print+= "<div  id='list' style='display:flex;'>"
	    		+ "<div>"+response[i].department_name+" · "+response[i].employee_position+" · "+response[i].employee_name+"</div>"
	    		+ "<button id='list' value='" + response[i].employee_id + "' style='position: absolute; right: 80px;' onclick='selectEmployee2(\"" + response[i].employee_name + "\", \"" + response[i].department_name + "\", \"" + response[i].employee_position + "\", \"" + response[i].employee_id+ "\")'>선택</button>"
	    		+ "</div>";
	    	}
	    	$('#myList2').html(print);
	    	
	      }
	
	  });
	}
//선택 버튼을 눌렀을 때 호출되는 함수
function selectEmployee2(employeeName, departmentName, employeePosition, employeeId) {
  // ${list[1].employee_name}, ${list[1].department_name}, ${list[1].employee_position} 값을 업데이트
  // 이 부분을 원하는 대상에 맞게 수정하세요
	$('#selectedEmployeeId2').val(employeeId);
  $('#selectedEmployeeName2').text(employeeName+" · "+departmentName+" · "+employeePosition);
  

  // 모달 닫기
  closeModal2();
}


//33333333333333333333333333
//모달에 표시할 리스트 아이템 생성 (예제로 1부터 5까지의 숫자를 리스트에 추가)
function fetchDepartmentInfo3(department) {
	  // 여기에 AJAX 요청을 보내는 코드를 추가하세요.
	  $.ajax({
	    url: '${root}workflow/getlist/'+department,
	    method: 'GET',
	    dataType: "json",
	    success: function(response) {
	    	var print='';
	    	for (var i = 0; i < response.length; i++) {
	    		print+= "<div  id='list' style='display:flex;'>"
	    		+ "<div>"+response[i].department_name+" · "+response[i].employee_position+" · "+response[i].employee_name+"</div>"
	    		+ "<button id='list' value='" + response[i].employee_id + "' style='position: absolute; right: 80px;' onclick='selectEmployee3(\"" + response[i].employee_name + "\", \"" + response[i].department_name + "\", \"" + response[i].employee_position + "\", \"" + response[i].employee_id+ "\")'>선택</button>"
	    		+ "</div>";
	    	}
	    	$('#myList3').html(print);
	    	
	      }
	
	  });
	}
//선택 버튼을 눌렀을 때 호출되는 함수
function selectEmployee3(employeeName, departmentName, employeePosition, employeeId) {
  // ${list[1].employee_name}, ${list[1].department_name}, ${list[1].employee_position} 값을 업데이트
  // 이 부분을 원하는 대상에 맞게 수정하세요
	$('#selectedEmployeeId3').val(employeeId);
  $('#selectedEmployeeName3').text(employeeName+" · "+departmentName+" · "+employeePosition);
  

  // 모달 닫기
  closeModal3();
}


function submitForm() {
	  document.wirteFrm.submit();
}

</script>
</head>



<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<style type="text/css">

::-webkit-scrollbar {
	width: 10px;
}

::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
	border-radius: 10px;
}

::-webkit-scrollbar-track {
	background-color: #f2f2f2;
	border-radius: 10px;
}
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

div#list{
	margin-bottom: 5px;
	height: 35px;
	font-size: 14pt;
	font-family: sans-serif;
	padding-top: 6px;
}


button#list{
	height: 28px;
	font-size: 12pt;
	border-radius: 0.5rem;
	border: 1px solid gray;
	background: #6C98C4;
	border: none;
	color: white;

}

button#cate{
	height:35px;
	margin-bottom: 15px;
	border-radius: 0.5rem;
	border: 1px solid gray;
	background: #415971;
	border: none;
	color: white;
}

button#modal{    
	border-radius: 0.5rem;
	border: 1px solid gray;
	background: #6C98C4;
	border: none;
	color: white;
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
	margin: 5px 5px;
}

input.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd;
	width: 650px;
	height: 40px;
	font-weight: bold;
	font-size: 13pt;
}

textarea.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd; /* #b3b3b3 */
	width: 650px;
	height: 380px;
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
	outline: 1px solid #415971;
}

textarea:focus {
	outline: 1px solid #415971;
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



  /* 모달 스타일링 */
   #myModal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    width: 500px; /* 가로 크기 */
    height: 600px; /* 세로 크기 */
    overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
    
  }
  
  #myModal2 {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    width: 500px; /* 가로 크기 */
    height: 600px; /* 세로 크기 */
    overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
  }
  
  #myModal3 {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    width: 500px; /* 가로 크기 */
    height: 600px; /* 세로 크기 */
    overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
  }




 /* 닫기 버튼 스타일링 */
    #closeBtn {
      position: absolute;
      top: 10px;
      right: 10px;
      cursor: pointer;
    }
</style>


<body class="sb-nav-fixed" style=" overflow: hidden;">
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
								<img src="${root}image/receipt.svg" style="width: 40px; height: auto;"> <span id="fontSubject" style="font-size: 20pt;">지출 결의서</span>
								<h5>아래 양식을 맞춰 작성하세요.</h5>
								<div id="contents">
									제목<br>
									<div class="daterange" style="margin-top: 5px;">
										<input type="text" class="startdate search" id="daterange" name="draft_subject" value="(지출결의서)" placeholder="제목" style="margin-top: 5px; padding-left: 10px;"/>
									</div>
								
								</div>
								<div id="contents">
									내용
									<div style="margin-top: 5px;">
										<textarea  class="search" rows="20" name="draft_text" id="daterange" style="margin-top: 5px; padding: 6px 10px;">
1. 작성 안내
직인을 받은 지출 결의서를 파일로 첨부해주세요.




2. 작성 기한
매달 5일




3. 승인 설정
1,000만원 이상
해당 팀 총무담당자, 부장, 부사장
1,000만원 이하
해당 팀 총무담당장, 팀장, 부장
						</textarea>
									</div>
								</div>
								<div id="contents">
									희망마감날짜<br>
									<div class="daterange" style="margin-top: 5px;">
										<input type="date" class="startdate search" id="daterange" name="draft_hope_date" placeholder="날짜 선택" style="margin-top: 5px; padding-left: 10px; margin-bottom: 10px;" />
										<input id="selectedEmployeeId" type="hidden" name="draft_looker_id1" value="${list[0].employee_id}">
										<input id="selectedEmployeeId2" type="hidden" name="draft_looker_id2" value="${list[1].employee_id}">
										<input id="selectedEmployeeId3" type="hidden" name="draft_looker_id3" value="${list[2].employee_id}">
										<input type="hidden" name="draft_info_id" value="0">
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
                        <button type="button" class="headerBtn" onclick="submitForm()" style="margin-left: 300px; margin-right:10px; margin-bottom:30px;  background-color: #415971">
                                    <i class="bi bi-send" style="margin-right: 10px;"></i> 보내기
                                </button>
                           <div style="border: 1px solid #ccced0; width: 400px; margin-top: 20px; border-radius: 10px;">
                              <div style="padding: 25px 10px 25px 25px; border-bottom: 0.5px solid #ddd; font-size: 15pt; font-weight: bold;">승인 대상</div>
                              <button id="modal" type="button" onclick="openModal()" style='position: absolute; right: 150px; margin-top: 18px; height: 30px; width: 50px; background-color: #415971;'>변경</button> 
                              <div id="selectedEmployeeName" style="padding: 20px 10px 20px 20px; font-size: 13pt; font-weight: bold;">${list[1].employee_name} · ${list[1].department_name} · ${list[1].employee_position} </div>
							  <button id="modal" type="button" onclick="openModal2()" style='position: absolute; right: 150px; margin-top: 18px; height: 30px; width: 50px; background-color: #415971;'>변경</button>                              
                              <div id="selectedEmployeeName2" style="padding: 20px 10px 20px 20px; font-size: 13pt; font-weight: bold;">${list[2].employee_name} · ${list[2].department_name} · ${list[2].employee_position} </div>
                              <button id="modal" type="button" onclick="openModal3()" style='position: absolute; right: 150px; margin-top: 18px; height: 30px; width: 50px; background-color: #415971;'>변경</button> 
                              <div id="selectedEmployeeName3" style="padding: 20px 10px 20px 20px; font-size: 13pt; font-weight: bold;">${list[0].employee_name} · ${list[0].department_name} · ${list[0].employee_position}</div>
                           </div>
                        </div>
                     </div>         
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>
	
	
<!-- 모달1 -->
<div id="myModal">
  <!-- 닫기 버튼 -->
  <div id="closeBtn" onclick="closeModal()">X</div>
  
  <!-- 부서 리스트 -->
  <div style="display: flex; ">
  <div id="team" style="display: flex; flex-direction: column; width: 100px; margin-top: 15px;">
  <button id="cate" onclick="fetchDepartmentInfo('개발부')">개발부</button>
  <button id="cate" onclick="fetchDepartmentInfo('영업부')">영업부</button>
  <button id="cate" onclick="fetchDepartmentInfo('인사부')">인사부</button>
  <button id="cate" onclick="fetchDepartmentInfo('기획부')">기획부</button>
  <button id="cate" onclick="fetchDepartmentInfo('디자인부')">디자인부</button>
  <button id="cate" onclick="fetchDepartmentInfo('테스트부')">테스트부</button>
  </div>
  <div id="myList" style="width: 300px; margin-left: 20px; margin-top: 7px;">
    <!-- 여기에 동적으로 리스트 아이템이 추가될 것입니다. -->
  </div>
</div>
</div>

<!-- 모달2 -->
<div id="myModal2">
    <!-- 닫기 버튼 -->
    <div id="closeBtn" onclick="closeModal2()">X</div>

    <!-- 부서 리스트 -->
    <div style="display: flex; ">
        <div id="team" style="display: flex; flex-direction: column; width: 100px; margin-top: 15px;">
            <button type="button" id="cate" onclick="fetchDepartmentInfo2('개발부')">개발부</button>
            <button id="cate" onclick="fetchDepartmentInfo2('영업부')">영업부</button>
            <button id="cate" onclick="fetchDepartmentInfo2('인사부')">인사부</button>
            <button id="cate" onclick="fetchDepartmentInfo2('기획부')">기획부</button>
            <button id="cate" onclick="fetchDepartmentInfo2('디자인부')">디자인부</button>
            <button id="cate" onclick="fetchDepartmentInfo2('테스트부')">테스트부</button>
        </div>
        <div id="myList2" style="width: 300px; margin-left: 20px; margin-top: 7px;">
            <!-- 여기에 동적으로 리스트 아이템이 추가될 것입니다. -->
        </div>
    </div>
</div>

<!-- 모달3 -->
<div id="myModal3">
    <!-- 닫기 버튼 -->
    <div id="closeBtn" onclick="closeModal3()">X</div>

    <!-- 부서 리스트 -->
    <div style="display: flex; ">
        <div id="team" style="display: flex; flex-direction: column; width: 100px; margin-top: 15px;">
            <button id="cate" onclick="fetchDepartmentInfo3('개발부')">개발부</button>
            <button id="cate" onclick="fetchDepartmentInfo3('영업부')">영업부</button>
            <button id="cate" onclick="fetchDepartmentInfo3('인사부')">인사부</button>
            <button id="cate" onclick="fetchDepartmentInfo3('기획부')">기획부</button>
            <button id="cate" onclick="fetchDepartmentInfo3('디자인부')">디자인부</button>
            <button id="cate" onclick="fetchDepartmentInfo3('테스트부')">테스트부</button>
        </div>
        <div id="myList3" style="width: 300px; margin-left: 20px; margin-top: 7px;">
            <!-- 여기에 동적으로 리스트 아이템이 추가될 것입니다. -->
        </div>
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