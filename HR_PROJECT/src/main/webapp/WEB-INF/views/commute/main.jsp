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
<style>
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

.new-table tr, .new-table td {
   border: 2px solid #ccc;
   width: 4em;
   height: 3em;
   text-align: center;
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
   max-height: 0;
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
               <div id="current-date"></div>
               <div class="next-month" onclick="changeMonth(1)">&#62;</div>
               <div class="today" onclick="goToToday()">Today</div>
            </div>

            <table class="new-table">
               <tr>
                  <td>이번주 누적</td>
                  <td>이번주 초과</td>
                  <td>이번주 잔여</td>
                  <td>이번달 누적</td>
                  <td>이번달 연장</td>
               </tr>
               <tr>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
               </tr>
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

      function generateWeekTables() {
         var weekTableContainer = document.querySelector('.week-table-container');
         weekTableContainer.innerHTML = '';

         var weeksInMonth = getWeeksInMonth(currentDate.getFullYear(), currentDate.getMonth() + 1);

         weeksInMonth.forEach(function (week, index) {
            var weekTable = document.createElement('table');
            weekTable.classList.add('week-table');
            weekTable.onclick = function () {
               toggleWeekDetails(index + 1);
            };

            var weekNumber = index + 1;
            weekTable.innerHTML = '<tr><th>' + weekNumber + '주차</th></tr><tr class="no-style"><th style="text-align: center; font-weight: 200;">누적 근무시간 00h 00m 00s </br> 초과 근무 시간 0h 0m 0s</th></tr>';

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

         for (var currentDay = new Date(startOfWeek); currentDay <= endOfWeek; currentDay.setDate(currentDay.getDate() + 1)) {
            var dayOfWeek = currentDay.toLocaleDateString('kr-KR', { weekday: 'long' });
            var isCurrentMonth = currentDay.getMonth() === (currentDate.getMonth() + 1);
            var style = isCurrentMonth ? '' : 'color: gray;';
            var rowData = "<tr style='" + style + "'><td>" + currentDay.getDate() + "일 " + dayOfWeek + "</td><td>09:00:00</td><td>17:30:00</td><td>7h0m0s</td><td>기본7h0m0s 연장0h0m0s 야간0h0m0s</td></tr>";
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
   </script>
</body>
</html>