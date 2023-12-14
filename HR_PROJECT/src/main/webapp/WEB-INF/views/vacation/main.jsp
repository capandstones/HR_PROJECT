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
/*    border: 5px solid #5291EA; */
   cursor: pointer;
   border-radius: 0.5rem;
   box-shadow: 0 0 5px 5px #5291EA;
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

#upcommingVacation {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

#upcommingVacation td {
   border-bottom: 1px solid #e6e9e8;
   padding: 16px;
   text-align: left;
   font-size: 16px;
}

#upcommingVacation tr {
   transition: background-color 0.3s ease;
}

#upcommingVacation tr:hover {
   background-color: #ddeeff;
}

@media screen and (max-width: 600px) {
   #upcommingVacation, #upcommingVacation th, #upcommingVacation td {
      display: block;
   }
   #upcommingVacation th, #upcommingVacation td {
      text-align: right;
      padding-left: 50%;
   }
   #upcommingVacation th {
      position: absolute;
      top: -9999px;
      left: -9999px;
   }
   #upcommingVacation td {
      border: none;
      position: relative;
      padding-left: 50%;
   }
   #upcommingVacation td:before {
      position: absolute;
      left: 10px;
      width: 45%;
      padding-right: 10px;
      white-space: nowrap;
   }
   #upcommingVacation td:nth-of-type(1):before {
      content: "휴가 이름";
   }
   #upcommingVacation td:nth-of-type(2):before {
      content: "시작 날짜";
   }
   #upcommingVacation td:nth-of-type(3):before {
      content: "종료 날짜";
   }
}

#memberVacationList {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

#memberVacationList thead {
   background-color: #f2f2f2;
}

#memberVacationList td, #memberVacationList td {
   border-bottom: 1px solid #e6e9e8;
   padding: 16px;
   text-align: left;
   font-size: 16px;
}

#memberVacationList tr, #memberVacationList tr {
   transition: background-color 0.3s ease;
}

#memberVacationList tr:hover, #memberVacationList tr:hover {
   background-color: #ddeeff;
}

@media screen and (max-width: 600px) {
   #memberVacationList, #memberVacationList th, #memberVacationList td, #memberVacationList, #memberVacationList th, #memberVacationList td {
      display: block;
   }
   #memberVacationList th, #memberVacationList td, #memberVacationList th, #memberVacationList td {
      text-align: right;
      padding-left: 50%;
   }
   #memberVacationList th, #memberVacationList th {
      position: absolute;
      top: -9999px;
      left: -9999px;
   }
   #memberVacationList td, #memberVacationList td {
      border: none;
      position: relative;
      padding-left: 50%;
   }
   #memberVacationList td:before, #memberVacationList td:before {
      position: absolute;
      left: 10px;
      width: 45%;
      padding-right: 10px;
      white-space: nowrap;
   }
   #memberVacationList td:nth-of-type(1):before {
      content: "이름";
   }
   #memberVacationList td:nth-of-type(2):before {
      content: "사번";
   }
   #memberVacationList td:nth-of-type(3):before {
      content: "직급";
   }
   #memberVacationList td:nth-of-type(4):before {
      content: "기간";
   }
   #memberVacationList td:nth-of-type(5):before {
      content: "종류";
   }
   #memberVacationList td:nth-of-type(6):before {
      content: "일수";
   }
   #memberVacationList td:nth-of-type(7):before {
      content: "증명자료";
   }
   #memberVacationList td:nth-of-type(8):before {
      content: "승인";
   }
}

#memberVacationList2 {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

#memberVacationList2 thead {
   background-color: #f2f2f2;
}

#memberVacationList2 td, #memberVacationList2 td {
   border-bottom: 1px solid #e6e9e8;
   padding: 16px;
   text-align: left;
   font-size: 16px;
}

#memberVacationList2 tr, #memberVacationList2 tr {
   transition: background-color 0.3s ease;
}

#memberVacationList2 tr:hover, #memberVacationList2 tr:hover {
   background-color: #ddeeff;
}

@media screen and (max-width: 600px) {
   #memberVacationList2, #memberVacationList2 th, #memberVacationList2 td, #memberVacationList2, #memberVacationList2 th, #memberVacationList2 td {
      display: block;
   }
   #memberVacationList2 th, #memberVacationList2 td, #memberVacationList2 th, #memberVacationList2 td {
      text-align: right;
      padding-left: 50%;
   }
   #memberVacationList2 th, #memberVacationList2 th {
      position: absolute;
      top: -9999px;
      left: -9999px;
   }
   #memberVacationList2 td, #memberVacationList2 td {
      border: none;
      position: relative;
      padding-left: 50%;
   }
   #memberVacationList2 td:before, #memberVacationList2 td:before {
      position: absolute;
      left: 10px;
      width: 45%;
      padding-right: 10px;
      white-space: nowrap;
   }
   #memberVacationList2 td:nth-of-type(1):before {
      content: "이름";
   }
   #memberVacationList2 td:nth-of-type(2):before {
      content: "사번";
   }
   #memberVacationList2 td:nth-of-type(3):before {
      content: "부서";
   }
   #memberVacationList2 td:nth-of-type(4):before {
      content: "직급";
   }
   #memberVacationList2 td:nth-of-type(5):before {
      content: "잔여연차";
   }
   #memberVacationList2 td:nth-of-type(6):before {
      content: "잔여반차";
   }
}
</style>

<title>Vacation</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
<c:if test="${not empty vacations}">
   <script>
      var vacationsData = ${vacations};
   </script>
</c:if>
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">
         <main>
            <div class="container-fluid px-4">

               <div class="menu">
                  <a href="#1" onclick="showMyVacation()" class="menu-item selected"><strong>내 휴가</strong></a>
                  <a href="#2" onclick="showMembersVacation()" class="menu-item"><strong>구성원 휴가</strong></a>
               </div>

               <div id="myVacation" class="content" style="display: block; ">
                  <div class="divider" style="margin-bottom: 30px;"></div>
                  <h2><strong>휴가 등록</strong></h2>
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
                        <h4><strong>예정 휴가</strong></h4>
                     </div>

                     <table id="upcommingVacation">
                        <tbody>
                              
                        </tbody>
                     </table>
                  </div>

                  <div style="margin-top: 20px;">
                     <h4><strong>사용 기록</strong></h4>
                  </div>
                  <table id="vacationHistory">
                     <tbody>

                     </tbody>
                  </table>
               </div>

               <div id="membersVacation" class="content" style="display: none;">

                  <div class="menu">
                     <a href="#3" onclick="showVacationRequest()" class="menu-item2 selected"><strong>휴가 신청내역</strong></a>
                     <a href="#4" onclick="showVacationStatus()" class="menu-item2"><strong>휴가보유/사용현황</strong></a>
                  </div>

                  <div class="divider"></div>

                  <div id="vacationRequest" class="content" style="display: block;">
                     <h2>휴가 신청내역</h2>
                     <table id="memberVacationList">
                        <thead>
                           <tr>
                              <td>이름</td>
                              <td>사번</td>
                              <td>직급</td>
                              <td>기간</td>
                              <td>종류</td>
                              <td>일수</td>
                              <td>증명자료</td>
                              <td>승인</td>
                           </tr>
                        </thead>
                        <tbody>

                        </tbody>
                     </table>
                  </div>

                  <div id="vacationStatus" class="content" style="display: none;">
                     <h2>휴가보유/사용현황</h2>
                     <div id="vacationRequest" class="content" style="display: block;">
                        <h2>휴가 신청내역</h2>
                        <table id="memberVacationList2">
                           <thead>
                              <tr>
                                 <td>이름</td>
                                 <td>사번</td>
                                 <td>부서</td>
                                 <td>직급</td>
                                 <td>잔여연차</td>
                                 <td>잔여반차</td>
                              </tr>
                           </thead>
                           <tbody>

                           </tbody>
                        </table>
                     </div>
                  </div>

                  <div class="divider"></div>

               </div>
            </div>
         </main>
      </div>
   </div>

   <script>
      function fetchMyVacations() {
         var xhr = new XMLHttpRequest();
         xhr.open('GET', '${root}vacation/getVacations?employee_id=${employee_id}', true);
         xhr.onload = function() {
            if (this.status === 200) {
               var vacations = JSON.parse(this.responseText);
               displayVacations(vacations);
            } else {
               console.error('서버로부터 데이터를 가져오는데 실패했습니다.');
            }
         };
         xhr.send();
      }
      function displayVacations(vacations) {
          var vacationsList = document.querySelector('#upcommingVacation tbody');
          vacationsList.innerHTML = '';

          vacations.forEach(function(vacation) {
              var startDate = vacation.vacation_start_date.split(' ')[0];
              var endDate = vacation.vacation_end_date.split(' ')[0];
              var comment = vacation.vacation_comment ? vacation.vacation_comment : '';
              var row = document.createElement('tr');
              row.innerHTML = '<td>' + vacation.vacation_name + '</td>'
                          + '<td>' + startDate + ' ~ ' + endDate + '</td>'
                          + '<td>' + comment + '</td>'
                          + '<td>' + vacation.vacation_state + '</td>'
                          + '<td><button onclick="cancelVacation(' + vacation.VA_idx + ')"  style="border-radius: 10px;" >신청취소</button></td>';
              vacationsList.appendChild(row);
          });
      }
      document.addEventListener('DOMContentLoaded', function() {
         fetchMyVacations();
      });
      
      function cancelVacation(VA_idx) {
          var xhr = new XMLHttpRequest();
          xhr.open('POST', '${root}vacation/cancelVacation', true);
          xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
          xhr.onload = function() {
              if (this.status === 200) {
                  fetchMyVacations();
              } else {
                  console.error('휴가 취소에 실패했습니다.');
              }
          };
          xhr.send('VA_idx=' + VA_idx);
      }
   </script>
   <!-- <script>
      function fetchMyHistory() {
         var xhr = new XMLHttpRequest();
         xhr.open('GET', '${root}vacation/getVacations?employee_id=${employee_id}', true);
         xhr.onload = function() {
            if (this.status === 200) {
               var vacations = JSON.parse(this.responseText);
               displayVacations(vacations);
            } else {
               console.error('서버로부터 데이터를 가져오는데 실패했습니다.');
            }
         };
         xhr.send();
      }
      function displayVacations(vacations) {
         var vacationsList = document
               .querySelector('#upcommingVacation tbody');
         vacationsList.innerHTML = '';
         vacations.forEach(function(vacation) {
            var startDate = vacation.vacation_start_date.split(' ')[0];
             var endDate = vacation.vacation_end_date.split(' ')[0];
             var comment = vacation.vacation_comment ? vacation.vacation_comment : '';
            var row = document.createElement('tr');
            row.innerHTML = '<td>' + vacation.vacation_name + '</td>'
                  + '<td>' + startDate + ' ~ ' + endDate + '</td>'
                  + '<td>' + comment + '</td>'
                  + '<td>' + vacation.vacation_state + '</td>'
                  + '<td><button onclick="cancelVacation(' + vacation.VA_idx + ')">신청취소</button></td>';
            vacationsList.appendChild(row);
         });
      }
      document.addEventListener('DOMContentLoaded', function() {
         fetchMyVacations();
      });
      
      function cancelVacation(VA_idx) {
           var xhr = new XMLHttpRequest();
           xhr.open('POST', '${root}vacation/cancelVacation', true);
           xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
           xhr.onload = function() {
             if (this.status === 200) {
               fetchMyVacations();
             } else {
               console.error('휴가 취소에 실패했습니다.');
             }
           };
           xhr.send('VA_idx=' + VA_idx);
         }
   </script> -->

   <script>
      function fetchMyVacations() {
         var xhr = new XMLHttpRequest();
         xhr.open('GET', '${root}vacation/getVacations?employee_id=${employee_id}', true);
         xhr.onload = function() {
            if (this.status === 200) {
               var vacations = JSON.parse(this.responseText);
               displayVacations(vacations);
            } else {
               console.error('서버로부터 데이터를 가져오는데 실패했습니다.');
            }
         };
         xhr.send();
      }
      function displayVacations(vacations) {
          var vacationsList = document.querySelector('#upcommingVacation tbody');
          vacationsList.innerHTML = '';

          vacations.forEach(function(vacation) {
              var startDate = vacation.vacation_start_date.split(' ')[0];
              var endDate = vacation.vacation_end_date.split(' ')[0];
              var comment = vacation.vacation_comment ? vacation.vacation_comment : '';
              var row = document.createElement('tr');
              row.innerHTML = '<td>' + vacation.vacation_name + '</td>'
                          + '<td>' + startDate + ' ~ ' + endDate + '</td>'
                          + '<td>' + comment + '</td>'
                          + '<td>' + vacation.vacation_state + '</td>'
                          + '<td><button onclick="cancelVacation(' + vacation.VA_idx + ')">신청취소</button></td>';
              vacationsList.appendChild(row);
          });
      }
      document.addEventListener('DOMContentLoaded', function() {
         fetchMyVacations();
      });   

      function cancelVacation(VA_idx) {
         var userConfirmation = confirm("신청취소하시겠습니까?");

         if (userConfirmation) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '${root}vacation/cancelVacation', true);
            xhr.setRequestHeader('Content-Type',
                  'application/x-www-form-urlencoded');
            xhr.onload = function() {
               if (this.status === 200) {
                  alert("취소되었습니다.");
                  fetchMyVacations();
               } else {
                  console.error('휴가 취소에 실패했습니다.');
               }
            };
            xhr.send('VA_idx=' + VA_idx);
         }
      }
   </script>

   <script>
   function fetchMemberVacations() {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', '${root}vacation/getMemberVacations?employee_id=${employee_id}', true);
      xhr.onload = function() {
         if (this.status === 200) {
            var memberVacations = JSON.parse(this.responseText);
            displayMemberVacations(memberVacations);   
         } else {
            console.error('서버로부터 데이터를 가져오는데 실패했습니다.');
         }
      };
      xhr.send();
      }
      function displayMemberVacations(memberVacations) {
         var memberVacationsList = document.querySelector('#memberVacationList tbody');
         memberVacationsList.innerHTML = '';
         memberVacations.forEach(function(membervacation) {
                  var startDate = membervacation.vacation_start_date.split(' ')[0];
                  var endDate = membervacation.vacation_end_date.split(' ')[0];

                  var row = document.createElement('tr');
                  row.innerHTML = '<td>' + membervacation.employee_name + '</td>'
                        + '<td>' + membervacation.employee_id + '</td>'
                        + '<td>' + membervacation.employee_position + '</td>'
                        + '<td>' + startDate + ' ~ ' + endDate + '</td>'
                        + '<td>' + membervacation.vacation_name + '</td>'
                        + '<td>' + membervacation.vacation_days  + '</td>'
                        + '<td>' + membervacation.vacation_attachment + '</td>'
                        + '<td>' + membervacation.vacation_state + '</td>';
                        memberVacationsList.appendChild(row);
               });
      }
      document.addEventListener('DOMContentLoaded', function() {
         fetchMemberVacations();
      });
   </script>
   <script>
      document.addEventListener("DOMContentLoaded", function() {

         var userPosition = "${employee_position}";

         var membersVacationMenu = document
               .querySelector('.menu-item[href="#2"]');
         var membersVacationContent = document
               .getElementById('membersVacation');

         if (userPosition === "사원" || userPosition === "대리") {
            membersVacationMenu.style.display = 'none';
            membersVacationContent.style.display = 'none';
         } else {
            membersVacationMenu.style.display = 'block';
            membersVacationContent.style.display = 'none';
            membersVacationMenu.addEventListener('click',
                  showMembersVacation);
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

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>