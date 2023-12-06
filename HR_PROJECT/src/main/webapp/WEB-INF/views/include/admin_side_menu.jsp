<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.InetAddress" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<div id="layoutSidenav_nav">
   <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
      <div class="sb-sidenav-menu">
         
         <div class="nav">
            
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false"   aria-controls="collapseNotice"> 공지사항
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}notice/noticeAll">전체 공지사항</a>
                  <a class="nav-link" href="${root}notice/noticeSub">부서 공지사항</a>
               </nav>
            </div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMove" aria-expanded="false"   aria-controls="collapseNotice"> 인사발령
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseMove" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}transfer/move">인사발령</a>
                  <a class="nav-link" href="${root}transfer/recode">인사발령기록</a>
               </nav>
            </div>
            <a class="nav-link" href="${root}member/chart"> 구성원 </a>
            <a class="nav-link" href="${root}admin/admin_join"> 계정신청 </a>
            <a class="nav-link" href="${root}workflow/document"> 메뉴1 </a>
            <a class="nav-link" href="${root}vacation/main"> 메뉴2 </a>
         </div>
      </div>
   </nav>
</div>

<!-- 출근하기 버튼 클릭시 자동으로 시간계산
퇴근하기 버튼 클릭시 점심시간이 공제된 근무시간 기록
욜로는 이렇게 했는데 점심시간도 자율인 회사를 만들고 싶었지만 너무 어려워 포기해야겠다.
걍 욜로나 따라하자 -->

<script>
   var startTime = "";
   var endTime = "";
   
   function toggleAttendance() {
      var attendanceButton = document.getElementById("attendanceButton");
      var buttonText = attendanceButton.innerText;

      if (buttonText === "출근하기") {
         startTime = "";
         attendanceButton.innerText = "퇴근하기";
         showAttendanceTime("출근");
      } else {
         endTime = getCurrentTime();
         attendanceButton.innerText = "출근하기";
         showAttendanceTime("퇴근");
         if (startTime !== "") {
            showWorkHours();
         }
      }
   }

   function showAttendanceTime(type) {
      var currentTime = new Date();
      var hours = currentTime.getHours();
      var minutes = currentTime.getMinutes();
      var formattedHours = String(hours).padStart(2, '0');
      var formattedMinutes = String(minutes).padStart(2, '0');
      var attendanceTimeDiv = document.getElementById("attendanceTime");
      if (type === "출근" && startTime === "") {
         attendanceTimeDiv.innerHTML = "";
      }

      attendanceTimeDiv.innerHTML += type + " 시간: " + formattedHours + ":" + formattedMinutes + "<br />";
   }

   function showWorkHours() {
      var workHoursDiv = document.getElementById("workHours");
      var start = new Date("01/01/2023 " + startTime);
      var end = new Date("01/01/2023 " + endTime);
      var diff = (end - start) / (1000 * 60 * 60);
      workHoursDiv.innerHTML = "근무 시간: " + diff.toFixed(2) + " 시간<br />";
   }

   function getCurrentTime() {
      var currentTime = new Date();
      var hours = currentTime.getHours();
      var minutes = currentTime.getMinutes();
      var formattedTime = String(hours).padStart(2, '0') + ":" + String(minutes).padStart(2, '0');
      return formattedTime;
   }
</script>