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
<title>HR</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<link rel="shortcut icon" href="#">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
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

.employee-main-li {
   display: flex;
   height: 160px;
   width: 400px;
   border: 1px solid lightgray;
   border: none;
}

.employee-list-profile {
   height: 140px;
   width: 120px;
   margin-left: 10px;
   border-radius: 3%;
}

.employee-profile-wrap {
   display: flex;
   margin-bottom: 10px;
}

.status-active {
   border: 3px solid #64CD3C;
}

.status-inactive {
   border: 3px solid red;
}

.employee-info-wrap {
   width: 300px;
   margin-left: 20px;
   margin-top: 5px;
}

.employee-name1 {
   font-size: 16px;
   font-weight: 600;
   margin-top: 10px;
   margin-bottom: 5px;
}

.employee-email {
   display: flex;
   align-items: center;
}

.employee-info-wrap div {
   margin-top: 2px;
}

/* 정우존 */
.commute-table {
	border-collapse: collapse;
}

.commute-table, .commute-table th, .commute-table td {
	border: none;
}

.table-centered th, .table-centered td {
	text-align: center;
}

.table-no-border, .table-no-border th, .table-no-border td, .table-no-border thead tr, .table-no-border tbody tr {
	border: none;
}

.table-spacing {
	margin-top: 30px;
}

.employee-row {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
}

.employee-card {
	display: flex;
	align-items: center;
	text-align: left;
	margin-bottom: 10px;
}

.employee-card img {
	width: 80px;
	height: 80px;
	margin-right: 10px;
	border-radius: 50%;
}

.employee-position {
	font-size: 13px;
	margin-right: 10px;
}

.employee-name {
	font-size: 16px;
	margin-right: 10px;
}

.employee-status {
	font-size: 14px;
	color: green;
	margin-right: 10px;
}

.department-info {
   display: flex;
   align-items: stretch;
}

.employee-rows-container {
   margin-top: 10px;
   display: flex;
   flex-direction: column;
   flex-grow: 1;
}

.vacation-info-container {
   display: flex;
   align-items: center;
}

.department-image-container {
   display: flex;
   align-items: center;
   flex-grow: 0;
}

.department-image {
   max-width: 200px;
   height: auto;
}

.department-buttons {
    float: right;
    margin: 0;
}

.btn-transparent {
    background-color: transparent;
    border: none;
    color: #333;
    padding: 5px 10px;
    border-radius: 5px;
    margin-left: 5px;
    margin-top: 0;
    margin-bottom: 0;
}

.btn-transparent:hover {
    background-color: rgba(0, 0, 0, 0.1); /* 마우스 오버시 배경색 변경 */
}


</style>
</head>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: rgb(224, 224, 224);">
         <main>
            <div class="container-fluid px-4">
               <div class="row">
                  <div class="col-xl-4 col-md-4">
                     <div class="card text-black mb-4 " style="height: 220px; color: #fff;">
                        <div class="card-header">
                           나의 정보
                           <button type="button" class="btn btn-outline-dark" onclick="location.href='${root}user/modify'" style="float: right; font-size: 10px; font-weight: normal; text-align: center; line-height: 1.1em; border-style: solid; border-color: rgb(190, 190, 190);">관리</button>
                        </div>
                        <div class="card-body">
                           <ul style="padding: 0px;">
                              <li class="employee-main-li">
                                 <div class="employee-profile-wrap">
                                    <div class="employee-profile-inner-img">
                                       <img class="employee-list-profile" src="${root}upload/${employeeInfo.employee_profile_picture}" />
                                    </div>
                                    <div class="employee-info-wrap">
                                       <div class="employee-name1">${employeeInfo.employee_name}(${employeeInfo.employee_first_name} ${employeeInfo.employee_last_name})</div>
                                       <div class="departmentName">
                                          <i class="fa-solid fa-user-group"></i> 부서 : ${employeeInfo.department_name}
                                       </div>
                                       <div class="employee-position1">
                                          <i class="fa-solid fa-building-user"></i> 직책 : ${employeeInfo.employee_position}
                                       </div>
                                       <div class="employee-email">
                                          <i class="fa-solid fa-envelope"></i>&nbsp; 이메일 : ${employeeInfo.employee_email}
                                       </div>
                                       <div class="employee-phone">
                                          <i class="fa-solid fa-phone"></i>&nbsp; 전화번호 : ${employeeInfo.employee_phone}
                                       </div>
                                    </div>
                                 </div>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
                 <div class="col-xl-4 col-md-4">
              <div class="card text-black mb-4" style="height: 220px; color: #fff">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                  <table class="table table-hover table-sm text-center align-middle" id="board_list" style="margin-top: -9px;">
                    <tbody>
                      <c:forEach var="obj" items="${list1 }">
                        <tr>
                          <th width="60%"><a style="text-decoration: none; color:navy;" href="${root }notice/all_read/read?board_info_idx=1&content_idx=${obj.content_idx}&page1">${obj.content_subject }</a></th>
                          <td class="text-right d-none d-xl-table-cell">${obj.content_date }</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-md-4">
              <div class="card text-black mb-4" style="height: 220px; color: #fff">
                <div class="card-header">부서 공지사항</div>
                <div class="card-body">
                  <table class="table table-hover table-sm text-center align-middle" id="board_list" style="margin-top: -9px">
                    <tbody>
                      <c:forEach var="obj" items="${list2 }">
                        <tr>
                          <th width="60%"><a style="text-decoration: none; color:navy;" href="${root }notice/sub_read/read?board_info_idx=${obj.content_board_idx}&content_idx=${obj.content_idx}&page1">${obj.content_subject }</a></th>
                          <td class="text-center d-none d-xl-table-cell">${obj.content_date }</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
                  <div class="col-xl-9 col-md-9">
                     <div class="card text-black mb-4" style="position: relative; height: 260px; color: #fff;">
                        <div class="card-header">근로시간</div>
                        <div class="card-body">
                           <%
                           java.util.Date currentDate = new java.util.Date();
                           java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM월dd일(E)");
                           String formattedDate = dateFormat.format(currentDate);
                           %>

                           <div style="font-size: 13pt; margin-bottom: 0px;"><%=formattedDate%>
                              기준
                           </div>

                           <div style="color: black; font-size: 17pt; margin-top: 25px;">
                              <p>
                                 14시간 00분 <strong>( 21시간 00분 부족 )</strong>
                              </p>
                              <p>근무했습니다</p>
                              <p style="font-size: 10pt; color: grey;">잔여 기본 근로시간: 49시간 00분 (잔여일수 12일)</p>
                           </div>
                           <div class="card text-black mb-4" style="position: absolute; top: 40px; right: 20px; height: 170px; width: 50%; color: #fff; margin-top: 25px;">
                              <div class="card-header">출퇴근 시간</div>
                              <div class="card-body">

                                 <div id="attendanceTime" style="color: black; font-weight: bold; text-align: center;">
                                    <table id="attendanceTable" style="border-color: transparent; background-color: #E6E6E6; text-align: center; width: 90%; margin: 0 auto; height: 40px;">
                                       <tr>
                                          <td style="width: 80px;">출근 시간 :</td>
                                          <td id="startTimeCell" style="width: 80px;"></td>
                                          <td style="width: 80px;">퇴근 시간 :</td>
                                          <td id="endTimeCell" style="width: 80px;"></td>
                                       </tr>
                                    </table>
                                 </div>

                                 <table style="border-color: transparent; margin-left: 30px;">
                                    <tr>
                                       <td style="width: 350px; margin-left: 50px;">점심시간</td>
                                       <td style="text-align: right;">12:30~14:00</td>
                                    </tr>
                                    <tr>
                                       <td style="width: 350px;">전일 근로 시간</td>
                                       <td style="text-align: right;">7h 0m 0s</td>
                                    </tr>
                                 </table>

                              </div>
                           </div>

                        </div>
                     </div>
                  </div>
                  <div class="col-xl-3 col-md-3">
                     <div class="card text-black mb-4" style="height: 260px; color: #fff;">
                        <div class="card-header">일일 나의 근태</div>
                        <div class="card-body">

                           <table class="commute-table">
                              <tr>
                                 <td style="width: 80px;">12.17(일)</td>
                                 <td>-</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.18(월)</td>
                                 <td>출근(09:00) 퇴근(17:30)</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.19(화)</td>
                                 <td>-</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.20(수)</td>
                                 <td>-</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.21(목)</td>
                                 <td>-</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.22(금)</td>
                                 <td>-</td>
                              </tr>
                              <tr>
                                 <td style="width: 80px;">12.23(토)</td>
                                 <td>-</td>
                              </tr>
                           </table>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-3 col-md-3">
                     <div class="card text-black mb-4" style="height: 280px; color: #fff;">
                        <div class="card-header">휴가 정보</div>
                        <div class="card-body">
                           <div class="vacation-info-container">
                              <img src="${root}image/vacation.png" alt="휴가 이미지" style="width: 80px; height: 80px; margin-right: 10px;">
                              <div>
                                 <span style="font-size: 19px;">올해 사용 가능한 휴가는 <strong>${employee_annual_leave }</strong>일 입니다.
                                 </span>
                              </div>
                           </div>
                           <table class="table table-bordered table-no-border table-spacing table-centered">
                              <tr>
                                 <th>발생일 수</th>
                                 <th>사용일 수</th>
                                 <th>잔여일 수</th>
                              </tr>
                              <tr>
                                 <td style="font-size: 15pt;"><strong>20</strong>일</td>
                                 <td style="font-size: 15pt;"><strong>${20-employee_annual_leave }</strong>일</td>
                                 <td style="font-size: 15pt;"><strong>${employee_annual_leave }</strong>일</td>
                              </tr>
                           </table>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-md-9">
                     <div class="card text-black mb-4" style="height: 280px; color: #fff;">
                        <div id="regularEmployeeAttendance" style="display: none;">
                           <div class="card-header">부서원 근태</div>
                           <div class="card-body">
                              <div class="department-info">
                                 <div class="employee-rows-container">
                                    <div class="employee-row">
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage4.png">
                                          <div>
                                             <div class="employee-position">팀장</div>
                                             <div class="employee-name">레이</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage5.png">
                                          <div>
                                             <div class="employee-position">과장</div>
                                             <div class="employee-name">오해원</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage6.png">
                                          <div>
                                             <div class="employee-position">과장</div>
                                             <div class="employee-name">설윤</div>
                                             <div class="employee-status">휴직</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage7.png">
                                          <div>
                                             <div class="employee-position">대리</div>
                                             <div class="employee-name">다니엘</div>
                                             <div class="employee-status">퇴근</div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="employee-row">
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage8.png">
                                          <div>
                                             <div class="employee-position">대리</div>
                                             <div class="employee-name">이혜인</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage9.png">
                                          <div>
                                             <div class="employee-position">사원</div>
                                             <div class="employee-name">사쿠라</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage10.png">
                                          <div>
                                             <div class="employee-position">사원</div>
                                             <div class="employee-name">김채원</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card">
                                          <img src="${root}upload/userImage11.png">
                                          <div>
                                             <div class="employee-position">사원</div>
                                             <div class="employee-name">허윤진</div>
                                             <div class="employee-status">퇴근</div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="department-image-container">
                                    <img src="${root}image/개발1팀.png" class="department-image">
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div id="managerAttendance" style="display: none;">
                           <div class="card-header">
                              부서원 근태
                              <div class="department-buttons">
                                 <button type="button" id="devDeptBtn" class="btn-transparent" >개발부</button>
                                 <button type="button" id="devTeam1Btn" class="btn-transparent">개발1팀</button>
                                 <button type="button" id="devTeam2Btn" class="btn-transparent">개발2팀</button>
                              </div>
                           </div>

                           <div id="devDeptContent" class="team-content" style="display: none;">
                              <div class="card-body">
                                 <div class="department-info">
                                    <div class="employee-rows-container" style="display: flex; flex-direction: row;">
                                       <div class="employee-card" style="margin-left: 20px;">
                                          <img src="${root}upload/userImage1.png" style="width: 100px; height: 100px;">
                                          <div>
                                             <div class="employee-position">부장</div>
                                             <div class="employee-name">강해린</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                       <div class="employee-card"  style="margin-left: 20px;">
                                          <img src="${root}upload/userImage2.png" style="width: 100px; height: 100px;">
                                          <div>
                                             <div class="employee-position">차장</div>
                                             <div class="employee-name">김민지</div>
                                             <div class="employee-status">휴직</div>
                                          </div>
                                       </div>
                                       <div class="employee-card"  style="margin-left: 20px;">
                                          <img src="${root}upload/userImage3.png" style="width: 100px; height: 100px;">
                                          <div>
                                             <div class="employee-position">차장</div>
                                             <div class="employee-name">팜하니</div>
                                             <div class="employee-status">출근</div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="department-image-container" style="width: 400px; height: auto;">
                                       <table style="width: 100%; table-layout: fixed;">
                                          <tr>
                                             <td style="border: 1px solid #ccc; height: 50px;">&nbsp;</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">개발부</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">개발1팀</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">개발2팀</td>
                                          </tr>
                                          <tr>
                                             <td style="border: 1px solid #ccc; height: 50px;">출근</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">2</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">4</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">7</td>
                                          </tr>
                                          <tr>
                                             <td style="border: 1px solid #ccc; height: 50px;">퇴근</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">0</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">2</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">0</td>
                                          </tr>
                                          <tr>
                                             <td style="border: 1px solid #ccc; height: 50px;">휴가</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">0</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">1</td>
                                             <td style="border: 1px solid #ccc; height: 50px;">0</td>
                                          </tr>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div id="devTeam1Content" class="team-content" style="display: none;">
                              <div class="card-body">
                                 <div class="department-info">
                                    <div class="employee-rows-container">
                                       <div class="employee-row">
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage4.png">
                                             <div>
                                                <div class="employee-position">팀장</div>
                                                <div class="employee-name">레이</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage5.png">
                                             <div>
                                                <div class="employee-position">과장</div>
                                                <div class="employee-name">오해원</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage6.png">
                                             <div>
                                                <div class="employee-position">과장</div>
                                                <div class="employee-name">설윤</div>
                                                <div class="employee-status">휴직</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage7.png">
                                             <div>
                                                <div class="employee-position">대리</div>
                                                <div class="employee-name">다니엘</div>
                                                <div class="employee-status">퇴근</div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="employee-row">
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage8.png">
                                             <div>
                                                <div class="employee-position">대리</div>
                                                <div class="employee-name">이혜인</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage9.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">사쿠라</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage10.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">김채원</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage11.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">허윤진</div>
                                                <div class="employee-status">퇴근</div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="department-image-container">
                                       <img src="${root}image/개발1팀.png" class="department-image">
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div id="devTeam2Content" class="team-content" style="display: none;">
                              <div class="card-body">
                                 <div class="department-info">
                                    <div class="employee-rows-container">
                                       <div class="employee-row">
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage12.png">
                                             <div>
                                                <div class="employee-position">팀장</div>
                                                <div class="employee-name">카즈하</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage13.png">
                                             <div>
                                                <div class="employee-position">과장</div>
                                                <div class="employee-name">홍은채</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage14.png">
                                             <div>
                                                <div class="employee-position">과장</div>
                                                <div class="employee-name">카리나</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage15.png">
                                             <div>
                                                <div class="employee-position">대리</div>
                                                <div class="employee-name">지젤</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="employee-row">
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage16.png">
                                             <div>
                                                <div class="employee-position">대리</div>
                                                <div class="employee-name">윈터</div>
                                                <div class="employee-status">휴직</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage17.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">닝닝</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage18.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">장원영</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                          <div class="employee-card">
                                             <img src="${root}upload/userImage19.png">
                                             <div>
                                                <div class="employee-position">사원</div>
                                                <div class="employee-name">리즈</div>
                                                <div class="employee-status">출근</div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="department-image-container">
                                       <img src="${root}image/개발2팀.png" class="department-image">
                                    </div>
                                 </div>
                              </div>
                           </div>

                        </div>

                     </div>
                  </div>
               </div>
            </div>
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
   <script>
      document.addEventListener('DOMContentLoaded', function() {
         var userPosition = "${employee_position}";
         var regularEmployeeAttendance = document.getElementById('regularEmployeeAttendance');
         var managerAttendance = document.getElementById('managerAttendance');

         if (userPosition.trim() === "부장") {
            managerAttendance.style.display = 'block';
            regularEmployeeAttendance.style.display = 'none';
         } else {
            regularEmployeeAttendance.style.display = 'block';
            managerAttendance.style.display = 'none';
         }
      });
   </script>
   <script>
      document.addEventListener('DOMContentLoaded', function() {
         showContent('devDeptContent');
      });

      function showContent(sectionId) {
         var contents = document.getElementsByClassName('team-content');
         for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = 'none';
         }

         var selectedContent = document.getElementById(sectionId);
         if (selectedContent) {
            selectedContent.style.display = 'block';
         }
      }

      document.getElementById('devDeptBtn').addEventListener('click',
            function() {
               showContent('devDeptContent');
            });
      document.getElementById('devTeam1Btn').addEventListener('click',
            function() {
               showContent('devTeam1Content');
            });
      document.getElementById('devTeam2Btn').addEventListener('click',
            function() {
               showContent('devTeam2Content');
            });
   </script>

                  <table class="commute-table">
                    <tr>
                      <td style="width: 80px">12.17(일)<%-- <%=formattedDate%> --%>
                      </td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.18(월)</td>
                      <td>출근(09:00) 퇴근(17:30)</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.19(화)</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.20(수)</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.21(목)</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.22(금)</td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td style="width: 80px">12.23(토)</td>
                      <td>-</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-3">
              <div class="card text-black mb-4" style="height: 280px; color: #fff">
                <div class="card-header">휴가 정보</div>
                <div class="card-body">
                  <div class="vacation-info-container">
                    <img src="${root}image/vacation.png" alt="휴가 이미지" style="width: 80px; height: 80px; margin-right: 10px" />
                    <div>
                      <span style="font-size: 19px">올해 사용 가능한 휴가는 <strong>7</strong>일 입니다.
                      </span>
                    </div>
                  </div>
                  <table class="table table-bordered table-no-border table-spacing table-centered">
                    <tr>
                      <th>발생일 수</th>
                      <th>사용일 수</th>
                      <th>잔여일 수</th>
                    </tr>
                    <tr>
                      <td style="font-size: 15pt"><strong>20</strong>일</td>
                      <td style="font-size: 15pt"><strong>13</strong>일</td>
                      <td style="font-size: 15pt"><strong>7</strong>일</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-xl-9 col-md-9">
              <div class="card text-black mb-4" style="height: 280px; color: #fff">
                <div class="card-header">부서원 근태</div>
                <div class="card-body">
                  <div class="department-info">
                    <div class="employee-rows-container">
                      <div class="employee-row">
                        <div class="employee-card">
                          <img src="${root}image/userImage1.png" />
                          <div>
                            <div class="employee-position">팀장</div>
                            <div class="employee-name">카리나</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage2.png" />
                          <div>
                            <div class="employee-position">과장</div>
                            <div class="employee-name">윈터</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage3.png" />
                          <div>
                            <div class="employee-position">과장</div>
                            <div class="employee-name">지젤</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage4.png" />
                          <div>
                            <div class="employee-position">대리</div>
                            <div class="employee-name">닝닝</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                      </div>
                      <div class="employee-row">
                        <div class="employee-card">
                          <img src="${root}image/userImage1.png" />
                          <div>
                            <div class="employee-position">대리</div>
                            <div class="employee-name">예지</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage2.png" />
                          <div>
                            <div class="employee-position">사원</div>
                            <div class="employee-name">류진</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage3.png" />
                          <div>
                            <div class="employee-position">사원</div>
                            <div class="employee-name">유나</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                        <div class="employee-card">
                          <img src="${root}image/userImage4.png" />
                          <div>
                            <div class="employee-position">사원</div>
                            <div class="employee-name">채령</div>
                            <div class="employee-status">출근</div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="department-image-container">
                      <img src="${root}image/출퇴근현황.png" class="department-image" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
