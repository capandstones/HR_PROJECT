<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<style>
body {
   font-family: Arial, sans-serif;
}

.menu {
   display: flex;
   justify-content: flex-start;
   padding: 10px;
}

.menu a {
   text-decoration: none;
   padding: 5px;
   cursor: pointer;
   color: #bdc3c7;
   font-size: 25px;
}

.menu a.selected {
   color: #000000;
   font-size: 25px;
   border-bottom: 2px solid #000000;
}

.divider {
   border-top: 1px solid #ccc;
   margin-top: 10px;
}

.content {
   padding: 20px;
}

.vacation-types {
   display: flex;
   justify-content: space-between;
   margin-top: 20px;
}

.vacation-type {
   width: 48%;
   border: 1px solid #ccc;
   padding: 10px;
   margin-bottom: 10px;
   margin-right: 2%;
}

.year-select {
   float: right;
   margin-top: 20px;
}

.vacation-heading {
   display: flex;
   justify-content: space-between;
   align-items: center;
}
</style>

<title>Vacation</title>

<link
   href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
   rel="stylesheet" />
<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
   crossorigin="anonymous"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content"
         style="padding-top: 20px; height: auto; background-color: #fff;">
         <main>
            <div class="container-fluid px-4">

               <div class="menu">
                  <a href="#1" onclick="showMyVacation()" class="menu-item selected">내
                     휴가</a> <a href="#2" onclick="showMembersVacation()" class="menu-item">구성원
                     휴가</a>
               </div>

               <div id="myVacation" class="content" style="display: block;">
               <div class="divider"></div>
                  <h2>휴가 등록</h2>
                  <div class="vacation-types">
                     <div class="vacation-type">
                        <p>연차(남은일수)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>반차(남은일수)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>조의(신청시 지급)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>병가(남은 일수)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                  </div>
                  <div class="vacation-types">
                     <div class="vacation-type">
                        <p>여름휴가(남은일수)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>결혼(신청시 지급)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>긴급(신청시 하루 지급)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                     <div class="vacation-type">
                        <p>기타(신청시 하루 지급)</p>
                        <!-- 추가 휴가 정보 추가 -->
                     </div>
                  </div>

                  <div>
                     <div class="vacation-heading">
                        <h3>예정 휴가</h3>
                        <div class="year-select" id="yearSelect">
                           <label for="year">년도 선택: </label> <select id="year" name="year">
                              <option value="2023">2023년</option>
                              <option value="2024">2024년</option>
                              <option value="2025">2025년</option>
                              <option value="2026">2026년</option>
                           </select>
                        </div>
                     </div>

                     <p>예정 휴가 내용 추가</p>

                  </div>

                  <div>
                     <h3>사용 기록</h3>
                     <p>사용 기록 추가</p>
                  </div>

               </div>

               <div id="membersVacation" class="content" style="display: none;">

                  <div class="menu">
                     <a href="#3" onclick="showVacationRequest()" class="menu-item2 selected">휴가 신청내역</a>
                     <a href="#4" onclick="showVacationStatus()" class="menu-item2">휴가보유/사용현황</a>
                  </div>

                  <div class="divider"></div>

                  <div id="vacationRequest" class="content" style="display: block;">
                     <h2>휴가 신청내역</h2>
                     <p>휴가 신청내역 내용</p>
                  </div>

                  <div id="vacationStatus" class="content" style="display: none;">
                     <h2>휴가보유/사용현황</h2>
                     <p>휴가보유/사용현황 내용</p>
                  </div>

                  <div class="divider"></div>

               </div>
            </div>
         </main>
      </div>
   </div>

   <script>
      function showMyVacation() {
         var myVacationContent = document.getElementById('myVacation');
         var membersVacationContent = document
               .getElementById('membersVacation');

         if (myVacationContent && membersVacationContent) {
            myVacationContent.style.display = 'block';
            membersVacationContent.style.display = 'none';
         }

         var menuItems = document.querySelectorAll('.menu-item');
         menuItems.forEach(function(item) {
            item.classList.remove('selected');
         });

         var selectedMenuItem = document
               .querySelector('.menu-item[href="#1"]');
         if (selectedMenuItem) {
            selectedMenuItem.classList.add('selected');
         }
      }

      function showMembersVacation() {
         var myVacationContent = document.getElementById('myVacation');
         var membersVacationContent = document
               .getElementById('membersVacation');

         if (myVacationContent && membersVacationContent) {
            myVacationContent.style.display = 'none';
            membersVacationContent.style.display = 'block';
         }

         var menuItems = document.querySelectorAll('.menu-item');
         menuItems.forEach(function(item) {
            item.classList.remove('selected');
         });

         var selectedMenuItem = document
               .querySelector('.menu-item[href="#2"]');
         if (selectedMenuItem) {
            selectedMenuItem.classList.add('selected');
         }
      }

      function showVacationRequest() {
         var vacationRequestContent = document
               .getElementById('vacationRequest');
         var vacationStatusContent = document
               .getElementById('vacationStatus');

         if (vacationRequestContent && vacationStatusContent) {
            vacationRequestContent.style.display = 'block';
            vacationStatusContent.style.display = 'none';
         }

         var menuItems = document.querySelectorAll('.menu-item2');
         menuItems.forEach(function(item) {
            item.classList.remove('selected');
         });

         var selectedMenuItem = document
               .querySelector('.menu-item2[href="#3"]');
         if (selectedMenuItem) {
            selectedMenuItem.classList.add('selected');
         }
      }

      function showVacationStatus() {
         var vacationRequestContent = document
               .getElementById('vacationRequest');
         var vacationStatusContent = document
               .getElementById('vacationStatus');

         if (vacationRequestContent && vacationStatusContent) {
            vacationRequestContent.style.display = 'none';
            vacationStatusContent.style.display = 'block';
         }

         var menuItems = document.querySelectorAll('.menu-item2');
         menuItems.forEach(function(item) {
            item.classList.remove('selected');
         });

         var selectedMenuItem = document
               .querySelector('.menu-item2[href="#4"]');
         if (selectedMenuItem) {
            selectedMenuItem.classList.add('selected');
         }
      }
   </script>

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