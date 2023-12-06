<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  
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
<style type="text/css">
/* 전체 테이블 스타일 */
table {
  width: 70%;
  margin: auto; /* 뷰포트 중앙에 위치 */
  border-collapse: collapse;
  text-align: center; /* 텍스트 중앙 정렬 */
}

/* 테이블 헤더 스타일 */
thead {
  background-color: gray; /* 회색 처리 */
  color: white;
}

/* 검색박스 스타일 */
#search-box {
  padding: 0.5rem;
  margin-top: 1.5rem;
  margin-right: 1.5rem;
  margin-bottom: 1.5rem;
}

label{
  margin-left:15%
}

/* 테이블 셀(열) 스타일 */
td, th {
  padding: 0.5rem;
  border: 1px solid black;
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
</script>

</head>

<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />



<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/admin_side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 20px; height: auto; background-color: #fff;">
			<main>
				<h1>&nbsp; 인사발령</h1>
				
				<label for="search-box">
  <strong>검색</strong>    
</label>
<input type="search" id="search-box">
<table id="table">
  <thead>
    <tr>
      <th>이름</th>
      <th>사번</th>
      <th>부서</th>
      <th>팀명</th>
      <th>직위</th>
      <th>수정</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>안나</td>
      <td>독일</td>
      <td>B반</td>
      <td>B+</td>
      <td>윤OO</td>
    </tr>
    <tr>
      <td>다케시</td>
      <td>일본</td>
      <td>B반</td>
      <td>B-</td>
      <td>윤OO</td> 
    </tr>
    <tr>
      <td>셰인</td>
      <td>아일랜드</td>
      <td>A반</td>
      <td>A+</td>
      <td>김OO</td>
    </tr>  
    <tr>
      <td>강샤오</td>
      <td>중국</td>
      <td>C반</td>
      <td>A-</td>
      <td>박OO</td> 
    </tr>
    <tr>
      <td>애슐리</td>
      <td>미국</td>
      <td>B반</td>
      <td>B+</td>
      <td>김OO</td>
    </tr>   
    <tr>
      <td>쳔동</td>
      <td>대만</td>
      <td>C반</td>
      <td>C+</td>
    <td>박OO</td>
    <tr>
      <td>다케시</td>
      <td>일본</td>
      <td>C반</td>
      <td>A-</td>
      <td>한OO</td>
    </tr>      
    <tr>
      <td>유코</td>
      <td>일본</td>
      <td>D반</td>
      <td>C+</td>
      <td>한OO</td>
    </tr>
  </tbody>
</table>


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