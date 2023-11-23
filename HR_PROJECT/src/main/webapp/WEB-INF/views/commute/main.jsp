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
<title>Dashboard - SB Admin</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<style>
/* 스타일이 진짜 제일 겁나 힘들어 하기 싫어*/
</style>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: rgb(255, 255, 255);">
         <main>
            <h1>근무 시간 통계</h1>

            <h2>이번주 근무 시간</h2>
            <table border="1">
               <tr>
                  <th>이번주 누적 근무시간</th>
                  <th>이번주 초과 근무시간</th>
                  <th>이번주 잔여 근무시간</th>
               </tr>
               <tr>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
               </tr>
            </table>

            <h2>이번달 근무 시간</h2>
            <table border="1">
               <tr>
                  <th>이번달 누적 근무시간</th>
                  <th>이번달 연장 근무시간</th>
               </tr>
               <tr>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
               </tr>
            </table>

            <h2>주차별 근무 시간</h2>
            <table border="1">
               <tr>
                  <th>주차</th>
                  <th>누적 근무시간</th>
                  <th>초과 근무시간</th>
               </tr>
               <tr>
                  <td>1주차</td>
                  <td>00h 00m 00s</td>
                  <td>00h 00m 00s</td>
               </tr>

            </table>

            <h2>근무 시간 상세</h2>

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
   <script>
      // 데이터베이스가 필요한가..?
   </script>
</body>
</html>