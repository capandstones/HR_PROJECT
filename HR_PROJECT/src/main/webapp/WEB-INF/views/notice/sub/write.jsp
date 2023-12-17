<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>부서별 공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
.head {
  margin-left: 5%;
  font-weight: bold;
  text-shadow: 3px 3px 3px lightgray;
}
</style>
</head>
<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />
<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/admin_side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto;">
         <main>
            <!-- top 시작 -->
            <div>
               <h2 class="head">부서별 공지사항</h2>
            </div>
            <hr />
            <!-- top 끝 -->

            <div class="container" style="margin-top: 100px">
               <div class="row">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-6">
                     <div class="card shadow">
                        <div class="card-body">
                           <form:form action="${root}notice/sub/write_pro " method="post" modelAttribute="writeContentBean" enctype="multipart/form-data">
                              <form:hidden path="content_board_idx" />
                              <div class="form-group">
                                 <form:label path="content_subject">제목</form:label>
                                 <form:input path="content_subject" class="form-control" />
                                 <form:errors path='content_subject' style='color:red;' />
                              </div>
                              <div class="form-group">
                                 <form:label path="content_text">내용</form:label>
                                 <form:textarea path="content_text" class="form-control" rows="10" style="resize:none" />
                                 <form:errors path='content_text' style='color:red' />
                              </div>
                              <div class="form-group">
                                 <form:label path="content_file">첨부 이미지</form:label>
                                 <form:input type='file' path='upload_file' class="form-control" accept="image/*" />
                              </div>
                              <div class="form-group">
                                 <div class="text-right">
                                    <form:button type="submit" class="btn btn-primary">작성하기</form:button>
                                 </div>
                              </div>
                           </form:form>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-3"></div>
               </div>
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