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
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
.employee-main-li { display: flex; height: 160px; width: 400px; border: 1px solid lightgray;}
.employee-list-profile { height: 140px; width: 120px; margin:10px;}
.employee-profile-wrap { display: flex;}
.status-active { border: 3px solid #64CD3C;}
.status-inactive { border: 3px solid red;}
.employee-info-wrap { margin-left: 20px; margin-top: 10px;}
.employee-name { font-size: 16px; font-weight: 600; margin-top: 10px; margin-bottom:5px;}
.employee-email{ display: flex; align-items: center;}
.employee-info-wrap div { margin-top: 2px;}
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
                  <button type="button" class="btn btn-outline-dark" style="float: right; font-size: 10px; font-weight: normal; text-align: center; line-height: 1.1em; border-style: solid; border-color: rgb(190, 190, 190);">관리</button>
                </div>
                <div class="card-body">
                  <ul>
                    <li class="employee-main-li">
                      <div class="employee-profile-wrap">
                        <div class="employee-profile-inner-img">
                          <img class="employee-list-profile" src="${root}upload/${employeeInfo.employee_profile_picture}" />
                        </div>
                        <div class="employee-info-wrap">
                          <div class="employee-name">${employeeInfo.employee_name} (${employeeInfo.employee_first_name} ${employeeInfo.employee_last_name})</div>
                          <div class="departmentName">
                            <i class="fa-solid fa-user-group"></i> 부서 : ${employeeInfo.department_name}
                          </div>
                          <div class="employee-position">
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
              <div class="card text-black mb-4" style="height: 220px; color: #fff;">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                  <table class="table table-hover table-sm text-center align-middle" id='board_list' style="margin-top: -9px">
                      <tbody>
                        <c:forEach var="obj" items="${list1 }">
                          <tr>
                            <th width="60%"><a href='${root }notice/all_read/read?board_info_idx=1&content_idx=${obj.content_idx}&page1'>${obj.content_subject }</a></th>                                              
                            <td class="text-right d-none d-xl-table-cell">${obj.content_date }</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-md-4">
              <div class="card text-black mb-4 " style="height: 220px; color: #fff;">
                <div class="card-header">부서 공지사항</div>
                <div class="card-body">
                  <table class="table table-hover table-sm text-center align-middle" id='board_list' style="margin-top: -9px">
                      <tbody>
                        <c:forEach var="obj" items="${list2 }">
                          <tr>
                            <th width="60%"><a href='${root }notice/sub_read/read?board_info_idx=${obj.content_board_idx}&content_idx=${obj.content_idx}&page1'>${obj.content_subject }</a></th>
                            <td class="text-center d-none d-xl-table-cell">${obj.content_date }</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                </div>
              </div>
            </div>
            <div class="col-xl-9 col-md-9">
              <div class="card text-black mb-4" style="height: 240px; color: #fff;">
                <div class="card-header">근로시간</div>
                <div class="card-body">
                  <div class="card text-black mb-4" style="height: 170px; width: 50%; color: #fff; float: right;">
                    <div class="card-header">출퇴근 시간</div>
                    <div class="card-body">

                      <div id="attendanceTime" style="color: black; font-weight: bold;"></div>

                      <!-- 점심시간 전일 근로 시간 -->

                    </div>
                  </div>

                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-3">
              <div class="card text-black mb-4" style="height: 240px; color: #fff;">
                <div class="card-header">일일 나의 근태</div>
                <div class="card-body">
                  <%
                  java.util.Date currentDate = new java.util.Date();
                  java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM.dd(E)");
                  String formattedDate = dateFormat.format(currentDate);
                  %>

                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">날짜</th>
                        <th scope="col">근무</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><%=formattedDate%></td>
                        <td>-</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-3">
              <div class="card text-black mb-4" style="height: 300px; color: #fff;">
                <div class="card-header">휴가 정보</div>
                <div class="card-body"></div>
              </div>
            </div>
            <div class="col-xl-9 col-md-9">
              <div class="card text-black mb-4" style="height: 300px; color: #fff;">
                <div class="card-header">부서원 근태</div>
                <div class="card-body"></div>
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