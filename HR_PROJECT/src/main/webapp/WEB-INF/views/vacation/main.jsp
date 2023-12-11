<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<c:set var='width' value='500' />
<c:set var='height' value='850' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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

<style type="text/css">
.card {
   width: 310px;
   height: 190px;
   border: 2px solid gray;
   margin: 25px 20px;
   padding: 10px;
   border-color: #cccccc;
   border-radius: 0.5rem;
}

.card:hover {
   border: 5px solid #5291EA;
   cursor: pointer;
   border-radius: 0.5rem;
   box-shadow: 0 0 5px 5px rgba(36, 65, 128, .3);
}

div#fontSubject {
   font-size: 20pt;
   font-weight: bold;
   margin-top: 10px;
   margin-left: 13px;
   margin-bottom: 3px;
   color: #4d4d4d;
}

div#fontpurpose {
   font-size: 13pt;
   margin-left: 13px;
   margin-top: 2px;
}

div#parent {
   display: flex;
   justify-content: space-between;
}

div#child {
   flex: 0.15;
}

div#parent2 {
   display: flex;
   justify-content: space-between;
}

div#child2 {
   flex: 0.15;
}

.icon  img {
   width: 60px;
   height: auto;
}
</style>

<title>Vacation</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">
         <main>
            <div class="container-fluid px-4">

               <div class="menu">
                  <a href="#1" onclick="showMyVacation()" class="menu-item selected">내 휴가</a>
                  <a href="#2" onclick="showMembersVacation()" class="menu-item">구성원 휴가</a>
               </div>

               <div id="myVacation" class="content" style="display: block;">
                  <div class="divider"></div>
                  <h2>휴가 등록</h2>
                  <div id="parent">
                     <form name="selectFrm1" style="margin-left: 20px;">
                        <div class="card" onclick="goWrite1()" id="child">
                           <div class="icon">
                              <img src="${root}vacation_image/annual.svg" style="padding-left: 10px;">
                              <input type="hidden" name="icon" value="annual.svg" readonly />
                           </div>
                           <div id="fontSubject">연차</div>
                           <div id="fontpurpose">남은일수</div>
                        </div>
                     </form>

                     <form name="selectFrm2">
                        <div class="card" onclick="goWrite2()" id="child">
                           <div class="icon">
                              <img src="${root}vacation_image/calendar.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="calendar.svg" readonly />
                           </div>
                           <div id="fontSubject">반차</div>
                           <div id="fontpurpose">남은일수</div>
                        </div>
                     </form>

                     <form name="selectFrm3">
                        <div class="card" onclick="goWrite3()" id="child">
                           <div class="icon">
                              <img src="${root}vacation_image/funeral.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="funeral.svg" readonly />
                           </div>
                           <div id="fontSubject">조의</div>
                           <div id="fontpurpose">신청시 지급</div>
                        </div>
                     </form>

                     <form name="selectFrm4" style="margin-right: 20px">
                        <div class="card" onclick="goWrite4()" id="child">
                           <div class="icon">
                              <img src="${root}vacation_image/sick.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="sick.svg" readonly />
                           </div>
                           <div id="fontSubject">병가</div>
                           <div id="fontpurpose">신청시지급</div>
                        </div>
                     </form>
                  </div>

                  <div id="parent2">
                     <form name="selectFrm5" style="margin-left: 20px;">
                        <div class="card" onclick="goWrite5()" id="child2">
                           <div class="icon">
                              <img src="${root}vacation_image/summer.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="summer.svg" readonly />
                           </div>
                           <div id="fontSubject">여름휴가</div>
                           <div id="fontpurpose">남은일수</div>
                        </div>
                     </form>

                     <form name="selectFrm6">
                        <div class="card" onclick="goWrite6()" id="child2">
                           <div class="icon">
                              <img src="${root}vacation_image/marriage.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="marriage.svg" readonly />
                           </div>
                           <div id="fontSubject">결혼</div>
                           <div id="fontpurpose">신청일 기준 5일 지급</div>
                        </div>
                     </form>

                     <form name="selectFrm7">
                        <div class="card" onclick="goWrite7()" id="child2">
                           <div class="icon">
                              <img src="${root}vacation_image/siren.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="siren.svg" readonly />
                           </div>
                           <div id="fontSubject">긴급</div>
                           <div id="fontpurpose">신청시 하루 지급</div>
                        </div>
                     </form>

                     <form name="selectFrm8" style="margin-right: 20px;">
                        <div class="card" onclick="goWrite8()" id="child2">
                           <div class="icon">
                              <img src="${root}vacation_image/etc.svg" style="padding-left: 10px">
                              <input type="hidden" name="icon" value="etc.svg" readonly />
                           </div>
                           <div id="fontSubject">기타</div>
                           <div id="fontpurpose">신청시 하루 지급</div>
                        </div>
                     </form>
                  </div>

                  <div>
                     <div class="vacation-heading">
                        <h3>예정 휴가</h3>
                        <div class="year-select" id="yearSelect">
                           <label for="year">년도 선택: </label>
                           <select id="year" name="year">
                              <option value="2023">2023년</option>
                              <option value="2024">2024년</option>
                              <option value="2025">2025년</option>
                              <option value="2026">2026년</option>
                              <option value="2027">2027년</option>
                           </select>
                        </div>
                     </div>

                     <tbody id="upcomingVacationTableBody"></tbody>

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
   document.addEventListener("DOMContentLoaded", function () {

       var userPosition = "${employee_position}";

       var membersVacationMenu = document.querySelector('.menu-item[href="#2"]');
       var membersVacationContent = document.getElementById('membersVacation');
       
       if (userPosition === "사원" || userPosition === "대리") {
           membersVacationMenu.style.display = 'none';
           membersVacationContent.style.display = 'none';
       } else {
           membersVacationMenu.style.display = 'block';
           membersVacationContent.style.display = 'none';
           membersVacationMenu.addEventListener('click', showMembersVacation);
       }
   });
   </script>
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

   <script type="text/javascript">
      function goWrite1() {
         const url = "${root}vacation/request1";
         const name = "vacationRequest1";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite2() {
         const url = "${root}vacation/request2";
         const name = "vacationRequest2";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite3() {
         const url = "${root}vacation/request3";
         const name = "vacationRequest3";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite4() {
         const url = "${root}vacation/request4";
         const name = "vacationRequest4";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite5() {
         const url = "${root}vacation/request5";
         const name = "vacationRequest5";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite6() {
         const url = "${root}vacation/request6";
         const name = "vacationRequest6";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite7() {
         const url = "${root}vacation/request7";
         const name = "vacationRequest7";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }

      function goWrite8() {
         const url = "${root}vacation/request8";
         const name = "vacationRequest8";
         const width = ${width};
         const height = ${height};
         const left = (window.innerWidth - width) / 2;
         const top = (window.innerHeight - height) / 2;

         const newWindow = window.open(url, name, `width=${width}, height=${height}, top=${top}, left=${left}, scrollbars=yes, resizable=yes`);

         newWindow.moveTo(left, top);
         newWindow.focus();
      }
   </script>

   <script>
   const upcomingVacations = [
      { name: '${user_name}', startDate: "2023-12-10", endDate: "2023-12-15", type: "연차", reason: "가족 여행" },
      { name: '${user_name}', startDate: "2023-12-20", endDate: "2023-12-25", type: "반차", reason: "개인 사정" },
   ];

   function populateUpcomingVacations() {
   const tableBody = document.querySelector("#upcomingVacationTable tbody");

   upcomingVacations.forEach(vacation => {
      const row = tableBody.insertRow();    
      row.insertCell(0).textContent = user_name;
      row.insertCell(1).textContent = `${vacation.startDate} ~ ${vacation.endDate}`;
      row.insertCell(2).textContent = vacation.type;
      row.insertCell(3).textContent = vacation.reason;
      });
   }
   populateUpcomingVacations();
   </script>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>