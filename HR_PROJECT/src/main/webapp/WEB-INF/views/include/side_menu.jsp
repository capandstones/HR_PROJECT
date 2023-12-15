<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="sb-sidenav-footer" style="left-padding: 30px">
        <img src="${root }image/Black-_-White-Minimal-Business-Logo.svg" style="float: left; width: 50px; height: auto; margin-right: 10px" />
        <div>${username}님</div>
        <div>환영합니다!</div>
      </div>
      <div class="nav">
        <button id="attendanceButton" style="margin-top: 10px; height: 40px; border-radius: 20px; border-style: solid; border-color: rgb(190, 190, 190);" onclick="toggleAttendance()">출근하기</button>
        <div class="sb-sidenav-menu-heading">메뉴</div>
        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false" aria-controls="collapseNotice"> 공지사항
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" style="background-color: #415971">
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="${root}notice/all_read/noticeAll?board_info_idx=1">전체 공지사항</a> <a class="nav-link" href="${root}notice/sub_read/noticeSubDetail">부서 공지사항</a>
          </nav>
        </div>
        <a class="nav-link" href="${root}member/chart"> 구성원 </a> <a class="nav-link" href="${root}calendar/main"> 캘린더 </a> <a class="nav-link" href="${root}commute/main"> 출퇴근 </a> <a class="nav-link" href="${root}workflow/document"> 전자결재 </a> <a class="nav-link" href="${root}vacation/main"> 휴가 </a>
      </div>
    </div>
  </nav>
</div>

<script>
	var startTime = '';
	var endTime = '';

	function showConfirmation(message, callback) {
		var isConfirmed = confirm(message);
		callback(isConfirmed);
	}

	function toggleAttendance() {
		var attendanceButton = document.getElementById('attendanceButton');
		var buttonText = attendanceButton.innerText;

		if (buttonText === '출근하기') {
			startTime = '';
			endTime = '';
			document.getElementById('startTimeCell').innerHTML = '';
			document.getElementById('endTimeCell').innerHTML = '';
			attendanceButton.innerText = '퇴근하기';
			showAttendanceTime('출근');
			alert('출근했습니다');
		} else {
			showConfirmation('퇴근하시겠습니까?', function(isConfirmed) {
				if (isConfirmed) {
					endTime = getCurrentTime();
					alert('퇴근했습니다');
					attendanceButton.innerText = '출근하기';
					showAttendanceTime('퇴근');

					if (startTime !== '') {
						showWorkHours();
					}
				}
			});
		}
	}

	function showAttendanceTime(type) {
		var currentTime = new Date();
		var hours = currentTime.getHours();
		var minutes = currentTime.getMinutes();
		var formattedHours = String(hours).padStart(2, '0');
		var formattedMinutes = String(minutes).padStart(2, '0');
		var attendanceTable = document.getElementById('attendanceTable');

		if (type === '출근' && startTime === '') {
			var newRow = attendanceTable.insertRow();
			startTime = formattedHours + ':' + formattedMinutes;
			document.getElementById('startTimeCell').innerHTML = startTime;
		}

		if (type === '퇴근') {
			var lastRow = attendanceTable.rows[attendanceTable.rows.length - 1];
			vendTime = formattedHours + ':' + formattedMinutes;
			document.getElementById('endTimeCell').innerHTML = endTime;
		}
		attendanceTimeDiv.innerHTML += type + ' 시간: ' + formattedHours + ':'
				+ formattedMinutes + '<br />';
	}

	function getCurrentTime() {
		var currentTime = new Date();
		var hours = currentTime.getHours();
		var minutes = currentTime.getMinutes();
		var formattedTime = String(hours).padStart(2, '0') + ':'
				+ String(minutes).padStart(2, '0');
		return formattedTime;
	}
</script>
