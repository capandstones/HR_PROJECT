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
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<body class="sb-nav-fixed">
  <div id="layoutSidenav">
    <c:import url="/WEB-INF/views/include/side_menu.jsp" />
    <div id="layoutSidenav_content" style="padding-top: 20px; height: auto">
      <main>
        <!-- top 시작 -->
        <div>
          <h2 class="head">부서별 공지사항</h2>
        </div>
        <hr />
        <!-- top 끝 -->
        <!-- 게시글 리스트 -->

        <div class="container" style="margin-top: 100px">
          <div class="row">
            <c:forEach var="sub_list" items="${list }" varStatus="idx">
              <div class="col-lg-6" style="margin-top: 20px">
                <div class="card shadow">
                  <div class="card-body">
                    <h4 class="card-title">
                      <b>${noticeMenuList[idx.index].board_info_name }</b>
                    </h4>
                    <table class="table table-hover" id="board_list">
                      <thead>
                        <tr>
                          <th class="text-center w-25">글번호</th>
                          <th>제목</th>
                          <th class="text-center w-25 d-none d-xl-table-cell">작성날짜</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="obj" items="${sub_list }">
                          <tr>
                            <td class="text-center">${obj.content_idx }</td>
                            <th><a href="${root }notice/sub_read/read?board_info_idx=${noticeMenuList[idx.index].board_info_idx}&content_idx=${obj.content_idx}&page1">${obj.content_subject }</a></th>
                            <td class="text-center d-none d-xl-table-cell">${obj.content_date }</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <a href="${root }notice/sub_read/noticeSubDetail?board_info_idx=${noticeMenuList[idx.index].board_info_idx}" class="btn btn-primary">더보기</a>
                  </div>
                </div>
              </div>
            </c:forEach>
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
