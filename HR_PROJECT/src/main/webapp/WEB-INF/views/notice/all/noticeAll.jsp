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
    <div id="layoutSidenav_content" style="padding-top: 20px; height: auto">
      <main>
        <!-- top 시작 -->
        <div>
          <h2 class="head">전체 공지사항</h2>
        </div>
        <hr />
        <!-- top 끝 -->
        <!-- 게시글 리스트 -->

        <div class="container" style="margin-top: 100px">
          <div class="card shadow">
            <div class="card-body">
              <h4 class="card-title">
                <b style="color: #415971;">Attention</b>
              </h4>
              <table class="table table-hover" id="board_list">
                <thead>
                  <tr>
                    <th class="text-center d-none d-md-table-cell">글번호</th>
                    <th class="w-50">제목</th>
                    <th class="text-center d-none d-md-table-cell">작성자</th>
                    <th class="text-center d-none d-md-table-cell">작성날짜</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${contentList}" var="obj">
                    <tr>
                      <td class="text-center d-none d-md-table-cell">${obj.content_idx}</td>
                      <td><a style="color: navy; text-decoration: none;" href="${root}notice/all/read?board_info_idx=1&content_idx=${obj.content_idx}">${obj.content_subject}</a></td>
                      <td class="text-center d-none d-md-table-cell">${obj.content_writer_name}</td>
                      <td class="text-center d-none d-md-table-cell">${obj.content_date}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>

              <div class="d-none d-md-block">
                <ul class="pagination justify-content-center">
                  <c:choose>
                    <c:when test="${pageBean.prevPage <= 0 }">
                      <li class="page-item disabled"><a href="#" class="page-link">이전</a></li>
                    </c:when>
                    <c:otherwise>
                      <li href="${root }notice/all/noticeAll?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}" class="page-item disabled"><a href="#" class="page-link">이전</a></li>
                    </c:otherwise>
                  </c:choose>

                  <c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
                    <c:choose>
                      <c:when test="${idx==pageBean.currentPage }">
                        <li class="page-item active"><a href="#" class="page-link" style="background-color: #415971; border-color: #415971;">${idx }</a></li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item"><a href="${root }notice/all/noticeAll?board_info_idx=${board_info_idx}&page=${idx}" class="page-link" style="color: #415971;">${idx }</a></li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>

                  <c:choose>
                    <c:when test="${pageBean.max >= pageBean.pageCnt }">
                      <li class="page-item disabled"><a href="#" class="page-link">다음</a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a href="${root }notice/all/noticeAll?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link">다음</a></li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </div>

              <div class="text-right">
                <a href="${root }notice/all/write?board_info_idx=${noticeList[0].board_info_idx }" class="btn" style="background-color: #415971; color: white;">글쓰기</a>
              </div>
            </div>
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