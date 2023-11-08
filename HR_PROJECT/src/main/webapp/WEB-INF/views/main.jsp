<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </head>
    
    <c:import url="/WEB-INF/views/include/top_menu.jsp" />
    
     
    
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
      
      <c:import url="/WEB-INF/views/include/side_menu.jsp" /> 

            <div id="layoutSidenav_content" class="container" style="margin-top: 10px">
         <div class="row">
            <div class="col-lg-4" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">
                        내 정보 <a href="board_main.html" class="btn btn-primary">관리</a>
                     </h4>
                     <hr />
                     <table style="width: 100%">
                        <tr>
                           <th rowspan="3"><img src="error-404-monochrome.svg" alt="이미지" style="width: 100px; height: 100px;"></th>
                           <th>이름</th>
                           <td>박정민</td>
                           <th>사번</th>
                           <td>123456</td>
                        </tr>
                        <tr>
                           <th>소속부서</th>
                           <td>우주최강4조</td>
                           <td></td>
                           <td></td>
                        </tr>
                        <tr>
                           <th>직종</th>
                           <td>인사</td>
                           <th>직무</th>
                           <td>팀장</td>
                        </tr>
                     </table>

                  </div>
               </div>
            </div>

            <div class="col-lg-4" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">공지사항</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

            <div class="col-lg-4" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">메뉴 바로가기(즐겨찾기)</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

            <div class="col-lg-6" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">근로시간</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

            <div class="col-lg-6" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">일일 나의 근태</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

            <div class="col-lg-6" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">휴가정보</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

            <div class="col-lg-6" style="margin-top: 20px">
               <div class="card shadow">
                  <div class="card-body">
                     <h4 class="card-title">부서원 근태</h4>

                     <a href="board_main.html" class="btn btn-primary">더보기</a>
                  </div>
               </div>
            </div>

         </div>
      </div>
       
        </div>
       
       
       
    </body>
    
</html>