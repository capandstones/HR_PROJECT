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
.commute-table {
   border-collapse: collapse;
}

.commute-table, .commute-table th, .commute-table td {
   border: none;
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
                           <button type="button" class="btn btn-outline-dark" style="float: right; font-size: 10px; font-weight: normal; text-align: center; line-height: 1.1em; border-style: solid; border-color: rgb(190, 190, 190);">관리</button>
                        </div>
                        <div class="card-body"></div>
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
                     <div class="card text-black mb-4" style="height: 260px; color: #fff;">
                        <div class="card-header">근로시간</div>
                        <div class="card-body">
                           <%
                           java.util.Date currentDate = new java.util.Date();
                           java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM월dd일(E)");
                           String formattedDate = dateFormat.format(currentDate);
                           %>
                           <div style="font-size: 13pt; margin-bottom: 0px;"><%=formattedDate%> 기준</div>
                           <div class="card text-black mb-4" style="height: 170px; width: 50%; color: #fff; float: right;">
                              <div class="card-header">출퇴근 시간</div>
                              <div class="card-body">

                                 <div id="attendanceTime" style="color: black; font-weight: bold; text-align: center;">
                                    <table id="attendanceTable"  style="border-color: transparent; background-color: #E6E6E6; text-align: center; width: 80%; margin: 0 auto;">
                                       <tr>
                                          <td style="width: 80px;">출근 시간 :</td>
                                          <td id="startTimeCell" style="width: 80px;"></td>
                                          <td style="width: 80px;">퇴근 시간 :</td>
                                          <td id="endTimeCell" style="width: 80px;"></td>
                                       </tr>
                                    </table>
                                 </div>

                                 <table style="border-color: transparent;">
                                    <tr>
                                       <td style="width: 500px;">점심시간</td>
                                       <td style="text-align: right;">12:30~14:00</td>
                                    </tr>
                                    <tr>
                                       <td style="width: 500px;">전일 근로 시간</td>
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
                           <%-- <%
                           java.util.Date currentDate = new java.util.Date();
                           java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM.dd(E)");
                           String formattedDate = dateFormat.format(currentDate);
                           %> --%>

                           <table class="commute-table">
                              <tr>
                                 <td style="width: 80px;">12.17(일)<%-- <%=formattedDate%> --%></td>
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
                        <div class="card-body"></div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-md-9">
                     <div class="card text-black mb-4" style="height: 280px; color: #fff;">
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