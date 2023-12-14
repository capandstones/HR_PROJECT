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
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: 100;
    font-style: normal;
}

input:focus {
   outline: 1px solid #415971;
}

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
/* 전체 테이블 스타일 */
table {
	width: 70%;
	margin: auto; /* 뷰포트 중앙에 위치 */
	border-collapse: collapse;
	text-align: center; /* 텍스트 중앙 정렬 */
}

/* 테이블 헤더 스타일 */
thead {
	background-color: #415971; /* 회색 처리 */
	color: white;
}

/* 검색박스 스타일 */
#search-box {
	height:40px;
	padding: 0.5rem;
	margin-top: 1.5rem;
	margin-right: 1.5rem;
	margin-bottom: 1.5rem;
}

label {
	margin-left: 15%
}

/* 테이블 셀(열) 스타일 */
td, th {
	padding: 0.5rem;
	border: 1px solid black;
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
	width: 400px; /* 가로 크기 */
	height: 500px; /* 세로 크기 */
	overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
	border-radius: 5%;
}

/* 닫기 버튼 스타일링 */
#closeBtn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}
</style>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		// 검색창 element를 id값으로 가져오기
		const payrollSearch = document.querySelector('#search-box');
		// 테이블의 tbody element를 id값으로 가져오기
		const payrollTable = document.querySelector('#table tbody');

		// 검색창 element에 keyup 이벤트 설정. 글자 입력 시마다 발생.
		payrollSearch.addEventListener('keyup', function() {
			// 사용자가 입력한 검색어의 value값을 가져와 소문자로 변경하여 filterValue에 저장
			const filterValue = payrollSearch.value.toLowerCase();
			// 현재 tbody 안에 있는 모든 tr element를 가져와 rows에 저장
			const rows = payrollTable.querySelectorAll('tr');

			// tr들을 for문으로 순회
			for (var i = 0; i < rows.length; i++) {
				// 현재 순회 중인 tr의 textContent를 소문자로 변경하여 rowText에 저장
				var rowText = rows[i].textContent.toLowerCase();
				// rowText가 filterValue를 포함하면 해당 tr은 보여지게 하고, 그렇지 않으면 숨김
				if (rowText.includes(filterValue)) {
					rows[i].style.display = '';
				} else {
					rows[i].style.display = 'none';
				}
			}
		});
	});

	// 모달 열기
	function openModal(employee_id) {
		// 모달 엘리먼트 가져오기
		var modal = document.getElementById('myModal');

		// 리스트 엘리먼트 가져오기
		var list = document.getElementById('myList');

		// 리스트 초기화
		list.innerHTML = '';

		// 모달 열기
		modal.style.display = 'block';
		
		$.ajax({
		    url: '${root}transfer/getinfo/'+employee_id,
		    method: 'GET',
		    dataType: "json",
		    success: function(response) {
		    	var print='';
		    	
		    		print+= 
		    			 '<div style="margin-left:35px; margin-top:30px;">' +
		    			 '<div id="contents" style="margin-top:20px;">' +
		                 '이름<br>' +
		                 '<div class="daterange">' +
		                 '<input type="text" class="startdate search"  id="daterange" name="employee_name" readonly="readonly" value="'+response[0].employee_name+'" style="background: #E8E9EC; border:none; margin-top:5px; padding-left: 10px; width: 280px; height: 30px; font-size: 12pt;"/>' +
		                 '</div>' +
		                 '</div>' +
		                 '<div id="contents" style="margin-top:7px;">' +
		                 '사번<br>' +
		                 '<div class="daterange">' +
		                 '<input type="text" class="startdate search" id="daterange" readonly="readonly" name="employee_id" value="'+response[0].employee_id+'" style="background: #E8E9EC; border:none; margin-top:5px; padding-left: 10px; width: 280px; height: 30px; font-size: 12pt;"/>' +
		                 '</div>' +
		                 '</div>' +
		                 '<div id="contents" style="margin-top:7px;">' +
		                 '직급<br>' +
		                 '<div class="daterange">' +
		                 '<input type="text" class="startdate search" id="daterange" name="employee_position" value="'+response[0].employee_position+'" style="margin-top:5px; padding-left: 10px; width: 280px; height: 30px; font-size: 12pt;"/>' +
		                 '</div>' +
		                 '</div>' +
		                 '<div id="contents" style="margin-top:7px;">' +
		                 '부서명<br>' +
		                 '<div class="daterange">' +
		                 '<input type="text" class="startdate search" id="daterange" name="line_name" value="'+response[0].line_name+'" style="margin-top:5px; padding-left: 10px; width: 280px; height: 30px; font-size: 12pt;"/>' +
		                 '</div>' +
		                 '</div>' +
		                 '<div id="contents" style="margin-top:7px;">' +
		                 '팀명<br>' +
		                 '<div class="daterange">' +
		                 '<input type="text" class="startdate search" id="daterange" name="department_name" value="'+response[0].department_name+'" style="margin-top:5px; padding-left: 10px; width: 280px; height: 30px; font-size: 12pt;"/>' +
		                 '</div>' +
		                 '</div>' +
		                 '<div id="contents" style="margin-top:10px;">' +
		                 '<button type="submit" style="margin-left:180px; border:none; background: #688FB5; color:#fff; margin-top: 10px; border-radius: 0.5rem; width:100px;">' +
		                 '<div style="text-align: center; padding-bottom: 7px; padding-right: 3px; padding-top: 5px; ">' +
		                 '<i class="bi bi-pencil-fill"></i>' +
		                 '변경하기' +
		                 '</div>' +
		                 '</button>' +
		                 '</div>'+
		                 '</div>';
		                 
		               

		    	$('#myList').html(print);
		    	
		      }
		
		  });

		
// 		$.ajax({
// 		    url: '${root}transfer/getinfo/'+employee_id,
// 		    method: 'GET',
// 		    dataType: "json",
// 		    success: function(response) {
// 		    	var print='';
// 		    	for (var i = 0; i < response.length; i++) {
// 		    		print+= "<div  id='list' style='display:flex;'>"
// 		    		+ "<div>"+response[i].department_name+" · "+response[i].employee_position+" · "+response[i].employee_name+"</div>"
// 		    		+ "<button id='list' value='" + response[i].employee_id + "' style='position: absolute; right: 80px;' onclick='selectEmployee(\"" + response[i].employee_name + "\", \"" + response[i].department_name + "\", \"" + response[i].employee_position + "\", \"" + response[i].employee_id+ "\")'>선택</button>"
// 		    		+ "</div>";
// 		    	}
// 		    	$('#myList').html(print);
		    	
// 		      }
		
// 		  });
		
		
		
		
	}

	// 모달 닫기
	function closeModal() {
		var modal = document.getElementById('myModal');
		modal.style.display = 'none';
	}
</script>

</head>

<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />

<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/admin_side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 20px; height: auto; background-color: #fff;">
			<main>
				<h1 style="font-family:GmarketSansMedium;">&nbsp; 인사발령</h1>

				<label for="search-box"> <strong>검색</strong>
				</label> <input type="search" id="search-box">
				<table id="table">
					<thead>
						<tr>
							<th>이름</th>
							<th>사번</th>
							<th>팀명</th>
							<th>직위</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var='obj'>
							<tr>
								<td class="text-center d-none d-md-table-cell">${obj.employee_name}</td>
								<td class="text-center d-none d-md-table-cell">${obj.employee_id}</td>
								<td class="text-center d-none d-md-table-cell">${obj.department_name}</td>
								<td class="text-center d-none d-md-table-cell">${obj.employee_position}</td>
								<td class="text-center d-none d-md-table-cell">
								<button id="modal" type="button" onclick="openModal('${obj.employee_id}')" style="background-color:#688FB5;border-radius: 0.5rem; color: #fff; border: none; " >수정</button> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</main>

		</div>
	</div>
	
	
	<!-- 모달1 -->
<div id="myModal">
  <!-- 닫기 버튼 -->
  <div id="closeBtn" onclick="closeModal()" style="font-size: 15pt; margin-right: 10px;">x</div>
  
  <!-- 부서 리스트 -->
<form name="writeFrm" action="${root}transfer/move_pro" method="get" enctype="form-data">
  <div id="myList" style="width: 300px; margin-left: 0px; margin-top: 7px; ">
    <!-- 여기에 동적으로 리스트 아이템이 추가될 것입니다. -->
  </div>
</form>
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