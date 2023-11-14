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

<!--
-->
.btn-group>a {text
   
}
</style>


</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">

         <header>
         
         <a href="${root }member/member_info">구성원정보</a>
         
            <div>
               <div class="member_head">
                  <h3>구성원</h3>
                  <button type="button" class="btn btn-primary">+ 구성원 등록하기</button>
               </div>

               <hr />


               <div class="btn-list1">
                  <button type="button" id="btn_search" class="btn btn_search">
                     <i class="fas fa-search"></i>
                  </button>

                  <button type="button" id="btn_download" class="btn btn_search" data-toggle="tooltip" data-placement="top" title="구성원 정보 다운로드">
                     <i class="fas fa-download"></i>
                  </button>
               </div>
               <br>
               <hr />
               
               <button type="button" class="btn btn-secondary" style="float: right";>필터초기화</button>
               
               <!-- 드롭다운 메뉴 시작 -->

               <div>
                  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">+필터추가</button>
                  <ul class="dropdown-menu">
                     <li><a href="#">직위</a>
                        <ul class=Cate1>
                           <li><a href="#">사장</a></li>
                           <li><a href="#">부장</a></li>
                           <li><a href="#">차장</a></li>
                           <li><a href="#">과장</a></li>
                           <li><a href="#">대리</a></li>
                           <li><a href="#">사원</a></li>
                        </ul></li>
                     <li><a href="#">부서</a>
                        <ul>
                           <li><a href="#">개발부</a>
                              <ul>
                                 <li><a href="#">개발1팀</a></li>
                                 <li><a href="#">개발2팀</a></li>
                              </ul></li>
                           <li><a href="#">영업부</a>
                              <ul>
                                 <li><a href="#">영업1팀</a></li>
                                 <li><a href="#">영업2팀</a></li>
                              </ul></li>
                           <li><a href="#">인사부</a>
                              <ul>
                                 <li><a href="#">인사1팀</a></li>
                                 <li><a href="#">인사2팀</a></li>
                              </ul></li>
                           <li><a href="#">디자인부</a>
                              <ul>
                                 <li><a href="#">디자인1팀</a></li>
                                 <li><a href="#">디자인2팀</a></li>
                              </ul></li>
                           <li><a href="#">기획부</a>
                              <ul>
                                 <li><a href="#">기획1팀</a></li>
                                 <li><a href="#">기획2팀</a></li>
                              </ul></li>
                           <li><a href="#">테스트부</a>
                              <ul>
                                 <li><a href="#">테스트1팀</a></li>
                                 <li><a href="#">테스트2팀</a></li>
                              </ul></li>
                        </ul></li>
                     <li><a href="#">재직상태</a>
                        <ul>
                           <li><a href="#">재직중</a></li>
                           <li><a href="#">휴직중</a></li>
                        </ul></li>

                  </ul>
               </div>

               <!-- 드롭다운 메뉴 종료 -->

               <hr />

            </div>
         </header>

         <main>
            <div align="center">
               <table class="table table-bordered" style="border: 1px; text-align: center; width: 1200px;">

                  <thead>
                     <tr>
                        <th rowspan="2">이름</th>
                        <th colspan="6">기본 정보</th>
                        <th colspan="2">인사 정보</th>
                        <th colspan="3">개인 정보</th>
                     </tr>
                     <tr>
                        <th>상태</th>
                        <th>사번</th>
                        <th>입사일</th>
                        <th>퇴사일</th>
                        <th>근속기간</th>
                        <th>근무일수</th>
                        <th>부서</th>
                        <th>직위</th>
                        <th>이메일</th>
                        <th>성별</th>
                        <th>휴대전화</th>
                     </tr>
                  </thead>

                  <tbody>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>

                  </tbody>
               </table>

               <nav aria-label="Page navigation example" style="float: center;">
                  <ul class="pagination">
                     <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                     </a></li>
                     <li class="page-item"><a class="page-link" href="#">1</a></li>
                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                     <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                     </a></li>
                  </ul>
               </nav>
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