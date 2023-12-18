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
<title>근태관리</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
main {
   margin-left: 50px;
   margin-right: 50px;
}

.date-container {
   display: flex;
   align-items: center;
   justify-content: center;
   font-size: 1.5em;
}

.prev-month, .next-month, .today {
   cursor: pointer;
   margin: 0 10px;
}

.new-table {
   border-collapse: collapse;
   border-spacing: 0;
   margin-top: 20px;
   margin-bottom: 20px;
   width: 100%;
}

.new-table thead tr, .new-table thead td {
   color:#fff;
   background-color:#415971 ;
   border: 1px solid #ccc;
   width: 4em;
   height: 3em;
   text-align: center;
}

.new-table tbody {
   background-color: white;
}

.new-table tbody tr {
   border-bottom: 1px solid #ddd; 
}

.new-table tbody tr:hover {
   background-color: #ccc;
}

.new-table tbody td {
   text-align: center;
   padding: 8px;
}

.week-table-container {
   display: flex;
   flex-direction: row;
   gap: 10px;
   margin-bottom: 20px;
}

.week-table-container>div {
   display: none;
}

.week-table {
   border-collapse: collapse;
   border-spacing: 0;
   width: 100%;
   cursor: pointer;
}

.week-table th, .week-table td {
   border: none;
   border-bottom: 1px solid #ccc;
   width: 4em;
   height: 3em;
   text-align: center;
}

.week-table th::after {
   content: '\25BC';
   display: inline-block;
   margin-left: 5px;
}

.week-table.active th::after {
   content: '\25B2';
}

.no-style th::after {
   content: none;
   display: none;
}

.week-details {
   max-height: none;;
   overflow: hidden;
   transition: max-height 0.3s;
   width: 100%;
}

.week-details table {
   width: 100%;
   border-collapse: collapse;
   border-spacing: 0;
}

.week-details td {
   border: 1px solid #ccc;
   width: 4em;
   height: 3em;
   text-align: center;
}
</style>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: rgb(255, 255, 255);">
         <main>
            <div class="date-container">
               <div class="prev-month" onclick="changeMonth(-1)">&#60;</div>
               <div id="current-date" style="font-size: 22pt;"></div>
               <div class="next-month" onclick="changeMonth(1)">&#62;</div>
               <div class="today" onclick="goToToday()" style="font-size: 25pt;">Today</div>
            </div>

            <table class="new-table" id="new-table">
            <thead>
               <tr>
                  <td>이번주 누적</td>
                  <td>이번주 초과</td>
                  <td>이번주 잔여</td>
                  <td>이번달 누적</td>
                  <td>이번달 잔여</td>
               </tr>
             </thead>
             <tbody>
             
             </tbody>
            </table>

            <div class="week-table-container" style="flex-direction: row;"></div>

            <div class="week-details">
               <table id="weekDetailsTable"></table>
            </div>
         </main>

      </div>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root}js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root}assets/demo/chart-area-demo.js"></script>
   <script src="${root}assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root}js/datatables-simple-demo.js"></script>
   <script>
      var employee_id = "${employee_id}"
      function fetchMyCommute() {
         var xhr = new XMLHttpRequest();
         var today = new Date();
         var dd = String(today.getDate()).padStart(2, '0');
         var mm = String(today.getMonth() + 1).padStart(2, '0');
         var yyyy = today.getFullYear();
         var formattedToday = yyyy + '-' + mm + '-' + dd;
         var url = '${root}commute/getCommuteTotal?employee_id=' + encodeURIComponent(employee_id) + '&today=' + formattedToday;
          xhr.open('GET', url, true);
          xhr.onreadystatechange = function() {
              if (this.readyState === 4 && this.status === 200) {
                  var commutetotal = JSON.parse(this.responseText);
                  displayCommuteTotal(commutetotal);
              } else if (this.readyState === 4) {
                  console.error('서버로부터 데이터를 가져오는데 실패했습니다.');
              }
          };
         xhr.send();
      }
      function displayCommuteTotal(commutetotal) {
         var commutetotalList = document.querySelector('#new-table tbody');
         commutetotalList.innerHTML = '';

         commutetotal.forEach(function(commutetotal1) {

            var row = document.createElement('tr');
            row.innerHTML = '<td>' + commutetotal1.week_work_hour + '</td>'
                  + '<td>' + '0h 0m 0s' + '</td>'
                  + '<td>' + commutetotal1.week_remaining_time + '</td>'
                  + '<td>' + commutetotal1.month_work_hour + '</td>'
                  + '<td>' + commutetotal1.month_remaining_time + '</td>'
                  
            commutetotalList.appendChild(row);
         });
      }
      document.addEventListener('DOMContentLoaded', function() {
         fetchMyCommute();
      });
   </script>
   <script>
      var currentDate = new Date();
      var originalDate = new Date();
      var currentActiveWeek = null;

      function updateDate() {
         var year = currentDate.getFullYear();
         var month = currentDate.getMonth() + 1;
         document.getElementById('current-date').textContent = year + '.' + ('0' + month).slice(-2);
      }

      function changeMonth(amount) {
         if (currentActiveWeek !== null) {
            toggleWeekDetails(currentActiveWeek);
         }

         currentDate.setMonth(currentDate.getMonth() + amount);
         updateDate();
         generateWeekTables();
      }

      function goToToday() {
         if (currentActiveWeek !== null) {
            toggleWeekDetails(currentActiveWeek);
         }

         currentDate = new Date(originalDate);
         updateDate();
         generateWeekTables();
      }

      function getWeeksInMonth(year, month) {
         var firstDayOfMonth = new Date(year, month - 1, 1);
         var lastDayOfMonth = new Date(year, month, 0);

         var weeks = [];
         var currentDate = new Date(firstDayOfMonth);

         currentDate.setDate(currentDate.getDate() - currentDate.getDay());

         while (currentDate <= lastDayOfMonth) {
            var startOfWeek = new Date(currentDate);
            var endOfWeek = new Date(currentDate.setDate(currentDate.getDate() + 6));
            weeks.push({
               start: startOfWeek,
               end: endOfWeek
            });
            currentDate.setDate(endOfWeek.getDate() + 1);
         }
         return weeks;
      }

      function calculateWorkDaysInWeek(startOfWeek, endOfWeek) {
          var workDays = 0;
          for (var day = new Date(startOfWeek); day <= endOfWeek; day.setDate(day.getDate() + 1)) {
              // 월요일(1)부터 금요일(5)까지의 일수를 계산
              if (day.getDay() >= 1 && day.getDay() <= 5) {
                  workDays++;
              }
          }
          return workDays;
      }

      function generateWeekTables() {
          var weekTableContainer = document.querySelector('.week-table-container');
          weekTableContainer.innerHTML = '';

          var weeksInMonth = getWeeksInMonth(currentDate.getFullYear(), currentDate.getMonth() + 1);

          weeksInMonth.forEach(function (week, index) {
              var workDays = calculateWorkDaysInWeek(week.start, week.end);
              var totalWorkHours = workDays * 7;

              var weekTable = document.createElement('table');
              weekTable.classList.add('week-table');
              weekTable.onclick = function () {
                  toggleWeekDetails(index + 1);
              };

              var weekNumber = index + 1;
              weekTable.innerHTML = '<tr><th>' + weekNumber + '주차</th></tr><tr class="no-style"><th style="text-align: center; font-weight: 200;">초과 근무 시간 0h 0m </th></tr>';

              weekTableContainer.appendChild(weekTable);
              weekTableContainer.appendChild(document.createElement('div'));
          });
      }


      function generateWeekDetails(weekNumber) {
          var weekDetailsTable = document.getElementById('weekDetailsTable');
          weekDetailsTable.innerHTML = '<tr><td>일자</td><td>출근시간</td><td>퇴근시간</td><td>근무시간</td><td>근무시간 상세</td></tr>';

          var week = getWeeksInMonth(currentDate.getFullYear(), currentDate.getMonth() + 1)[weekNumber - 1];
          var startOfWeek = week.start;
          var endOfWeek = week.end;
          var today = new Date();
          today.setHours(0, 0, 0, 0);

          for (var currentDay = new Date(startOfWeek); currentDay <= endOfWeek; currentDay.setDate(currentDay.getDate() + 1)) {
              var dayOfWeek = currentDay.toLocaleDateString('kr-KR', { weekday: 'long' });
              var isCurrentMonth = currentDay.getMonth() === currentDate.getMonth();
              var isWeekend = currentDay.getDay() === 0 || currentDay.getDay() === 6; // 일요일이 0, 토요일이 6
              var style = isCurrentMonth ? '' : 'color: gray;';

              var rowData;
              if (isWeekend || currentDay >= today) {
                  rowData = "<tr style='" + style + "'><td>" + currentDay.getDate() + "일 " + dayOfWeek + "</td><td></td><td></td><td></td><td></td></tr>";
              } else {
                  rowData = "<tr style='" + style + "'><td>" + currentDay.getDate() + "일 " + dayOfWeek + "</td><td>09:00:00</td><td>17:30:00</td><td>7h0m0s</td><td>기본7h0m0s 연장0h0m0s</td></tr>";
              }
              
              weekDetailsTable.innerHTML += rowData;
          }

          document.querySelector('.week-details').style.maxHeight = weekDetailsTable.scrollHeight + 'px';
      }


      function toggleWeekDetails(weekNumber) {
         var weekTableContainer = document.querySelector('.week-table-container');
         var weekDetails = document.querySelector('.week-details');
         var currentActiveWeekTable = weekTableContainer.querySelector('.week-table.active');
         var selectedWeekTable = weekTableContainer.children[weekNumber * 2 - 2];

         if (currentActiveWeekTable) {
            currentActiveWeekTable.classList.remove('active');
            weekDetails.style.maxHeight = '0';

            if (currentActiveWeekTable === selectedWeekTable) {
               currentActiveWeek = null;
               return;
            }
         }

         if (!currentActiveWeekTable) {
            selectedWeekTable.classList.add('active');
            generateWeekDetails(weekNumber);
            weekDetails.style.maxHeight = weekDetails.scrollHeight + 'px';
            currentActiveWeek = weekNumber;
         } else {
            setTimeout(function () {
               selectedWeekTable.classList.add('active');
               generateWeekDetails(weekNumber);
               weekDetails.style.maxHeight = weekDetails.scrollHeight + 'px';
               currentActiveWeek = weekNumber;
            }, 300);
         }
      }

      generateWeekTables();
      updateDate();
      
      var today = new Date();
      var weeksInMonth = getWeeksInMonth(today.getFullYear(), today.getMonth() + 1);
      var todayWeekNumber = weeksInMonth.findIndex(function(week) {
         return today >= week.start && today <= week.end;
      }) + 1;

      toggleWeekDetails(todayWeekNumber);
      
   </script>
</body>
</html>
