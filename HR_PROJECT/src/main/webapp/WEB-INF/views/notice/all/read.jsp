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
<title>공지사항 전체부서</title>
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
               <h2 class="head">전체 공지사항</h2>
            </div>
            <hr />
            <!-- top 끝 -->

            <div class="container" style="margin-top: 100px">
               <div class="row">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-6">
                     <div class="card shadow">
                        <div class="card-body">
                           <div class="form-group">
                              <label for="board_writer_name">작성자</label> <input type="text" id="board_writer_name" name="board_writer_name" class="form-control" value="${readContentBean.content_writer_name}" disabled="disabled" />
                           </div>
                           <div class="form-group">
                              <label for="board_date">작성날짜</label> <input type="text" id="board_date" name="board_date" class="form-control" value="${readContentBean.content_date }" disabled="disabled" />
                           </div>
                           <div class="form-group">
                              <label for="board_subject">제목</label> <input type="text" id="board_subject" name="board_subject" class="form-control" value="${readContentBean.content_subject }" disabled="disabled" />
                           </div>
                           <div class="form-group">
                              <label for="board_content">내용</label>
                              <textarea id="board_content" name="board_content" class="form-control" rows="10" style="resize: none" disabled="disabled">${readContentBean.content_text }</textarea>
                           </div>

                           <c:if test="${readContentBean.content_file != null }">

                              <div class="form-group">
                                 <label for="board_file">첨부 이미지</label> <img src="${root}upload/${readContentBean.content_file}" width="100%" />
                              </div>

                           </c:if>

                           <div class="form-group">
                              <div class="text-right">
                                 <a style="background-color:#415971; color:white; margin-top:15px;" href="${root }notice/all/noticeAll?board_info_idx=1&page=${page}" class="btn">목록보기</a>
                                 <a style="background-color:#46649B; color:white; margin-top:15px;" href="${root }notice/all/modify?board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}" class="btn">수정하기</a>
                                 <a style="background-color:#CD426B; color:white; margin-top:15px;" href="${root }notice/all/delete?board_info_idx=${board_info_idx}&content_idx=${content_idx}&page=${page}" class="btn">삭제하기</a>
                              </div>
                           </div>
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