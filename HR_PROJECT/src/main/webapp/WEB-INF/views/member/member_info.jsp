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
.member_head {
   display: flex;
   justify-content: space-between;
   align-items: center;
}

h3 {
   margin-left: 80px;
   font-size: 30px;
   font-weight: bold;
}

tr {
   width: 200px;
   height: 40px;
}

.dropdown-menu li {
   margin: 0;
   padding: 0;
   list-style: none;
   position: static;
   font: bold 15px arial;
   text-decoration: none;
}

dropdown-item1:hover  dropdown-item1 {
   left: 100%;
}

.btn-list1 {
   float: right;
}

.userProfile {
   width: 150px;
   height: 180px;
   margin-left: 100px;
}

button {
   background: CCCCCC;
   border: none;
}

#circle {
   width: 10px;
   height: 10px;
   border-radius: 50%;
   background-color: lightgreen;
}

.hr_info {
   text-decoration: none;
   float: left;
   margin-left: 100px;
   margin-top: 20px;
   margin-bottom: 6px;
   font-weight: bold;
   color: black;
   font-size: 15px;
   background-color: ligtgray;
   border-bottom: 4px solid green;
   margin-bottom: -15px;
   
}

.pr_info {
   text-decoration: none;
   float: left;
   margin-left: 40px;
   margin-top: 20px;
   margin-bottom: 6px;
   font-weight: bold;
   color: black;
   font-size: 15px;
   background-color: white;
   border: none;
}

button.bottom-line {
   float: left;
   margin-left: 100px;
   width: 80px;
   height: 5px;
   background: green;
}
</style>


</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">
         <main>

            <div style="margin-left: 120px;">
               <p style="font-weight: bold; font-size: 14px;">구성원 / 강해린</p>
            </div>

            <div style="display: flex">
               <img class="userProfile" src="${root }image/userProfile.jpg" alt="프로필 이미지" />
               <div style="padding-left: 30px;">
                  <p style="padding-top: 10px; padding-bottom: 10px;">
                     <b style="font-size: 18px;">강해린</b>
                  </p>

                  <p>
                     <b style="font-size: 14px;">부서</b> &nbsp;&nbsp; <b style="font-size: 13px;">인사1팀</b>
                  </p>
                  <p>
                     <b style="font-size: 14px;">직책</b> &nbsp;&nbsp; <b style="font-size: 13px;">과장</b>
                  </p>
                  <div style="padding-top: 10px;">
                     <button>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
                     </button>
                     <button>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
</svg>
                     </button>
                     <button>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
                     </button>
                     <button>
                        <!--                         <div id="circle"></div> -->
                        <b style="font-size: 12px;">재직중</b>
                     </button>
                  </div>

               </div>
            </div>
            <br />

            <div>

               <button class="hr_info" href="">인사 정보</button>
               <button class="pr_info" href="">개인 정보</button>


               <button style="float: right; margin-right: 50px; margin-top: 20px; margin-bottom: 12px;">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock-history" viewBox="0 0 16 16">
  <path d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z" />
  <path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z" />
  <path d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z" />
</svg><b style="font-size: 12px;">&nbsp;정보변경내역</b>
               </button>
            </div>

            <div align="center">
               <hr style="width: 95%; height: 5%;">
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