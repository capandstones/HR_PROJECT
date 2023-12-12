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
                  <div class="mainContainer">
                    <div class="employee-div employee-info-profile-wrap">
                      <div>
                        <img class="employee-info-profile-img" src="${root}upload/userImage1.png" style="width: 100px; height: 120px;"/>
                      </div>
                      <div class="employee-div">
                        <span class="employee-span-name">강해린</span>
                      </div>
                      <div>
                        <p class="employee-span-wrap">
                          <span class="employee-info-txt employee-span-department">개발부</span> <span class="employee-info-txt employee-span-position">부장</span>
                        </p>
                        <p class="employee-info-txt employee-span-email">test@test.co.kr</p>
                      </div>
                      <div class="employee-div employee-inner-status-wrap" style="justify-content: center">
                        <div class="employee-inner-status-icon"></div>
                        <span class="employee-span-status">재직중</span>
                      </div>
                    </div>
                    <div class="employee-info-detail-wrap">
                      <div>
                        <p class="employee-info-detail-txt empInfoDetailTxt">회사명</p>
                        <p class="employee-info-detail-txt empInfoDetailTxt">부서</p>
                        <p class="employee-info-detail-txt empInfoDetailTxt">휴대전화</p>
                        <p class="employee-info-detail-txt empInfoDetailTxt">입사일</p>
                      </div>
                      <div>
                        <p class="employee-info-detail-txt2">(주)Attention</p>
                        <p class="employee-info-detail-txt2 employee-p-department">디자인부</p>
                        <p class="employee-info-detail-txt2 employee-p-phone">010-0000-0000</p>
                        <p class="employee-info-detail-txt2 employee-p-start-date">20-05-10</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-md-4">
              <div class="card text-black mb-4 " style="height: 220px; color: #fff;">
                <div class="card-header">공지사항</div>
                <div class="card-body"></div>
              </div>
            </div>
            <div class="col-xl-4 col-md-4">
              <div class="card text-black mb-4 " style="height: 220px; color: #fff;">
                <div class="card-header">메뉴 바로가기</div>
                <div class="card-body"></div>
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