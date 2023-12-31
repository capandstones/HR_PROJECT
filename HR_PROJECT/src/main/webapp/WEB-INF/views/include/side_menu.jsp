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
         <div class="sb-sidenav-footer" style="left-padding: 30px">
            <img src="${root }image/Black-_-White-Minimal-Business-Logo.svg"
               style="float: left; width: 50px; height:auto; margin-right: 10px;" />
            <div>${username}님</div>
            <div>환영합니다!</div>
         </div>
         <div class="nav">
            <button id="attendanceButton" style="margin-top: 10px; height: 40px; border-radius: 20px; border-style: solid; border-color: rgb(190, 190, 190);" onclick="toggleAttendance()">출근하기</button>
            <div class="sb-sidenav-menu-heading">알림</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMessenger" aria-expanded="false" aria-controls="collapseMessenger"> 메신저
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseMessenger" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="Messenger-received.html">받은 메신저</a>
                  <a class="nav-link" href="Messenger-send.html">보낸 메신저</a>
               </nav>
            </div>
            <a class="nav-link" href="news.html"> 새로운 소식 </a>
            <div class="sb-sidenav-menu-heading">메뉴</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false"   aria-controls="collapseNotice"> 공지사항
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}notice/all">전체 공지사항</a>
                  <a class="nav-link" href="${root}notice/department">부서 공지사항</a>
                  <a class="nav-link" href="${root}notice/favorites">즐겨찾기</a>
               </nav>
            </div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMember" aria-expanded="false" aria-controls="collapseMember"> 구성원
               <div class="sb-sidenav-collapse-arrow">
                  <i class="fas fa-angle-down"></i>
               </div>
            </a>
            <div class="collapse" id="collapseMember" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
               <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${root}member/member">구성원</a>
                  <a class="nav-link" href="${root}member/chart">조직도</a>
               </nav>
            </div>
            <a class="nav-link" href="${root}calendar/main"> 캘린더 </a>
            <a class="nav-link" href="${root}commute/main"> 출퇴근 </a>
            <a class="nav-link" href="${root}workflow/document"> 워크플로우 </a>
            <a class="nav-link" href="${root}vacation/main"> 휴가 </a>
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