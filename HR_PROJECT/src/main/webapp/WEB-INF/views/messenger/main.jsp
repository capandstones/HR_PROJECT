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
<title>조직도</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="${root}css/member/chart.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://kit.fontawesome.com/f07bfb696a.js" crossorigin="anonymous"></script>
<c:import url="/WEB-INF/views/member/memberInfoModal.jsp" />

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<body class="sb-nav-fixed">
  <div id="layoutSidenav">
    <c:import url="/WEB-INF/views/include/side_menu.jsp" />
    <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">
      <main>

        <h2>받은 쪽지 목록</h2>
        <table border="1">
          <tr>
            <th>보낸 사람</th>
            <th>제목</th>
            <th>받은 시간</th>
            <th>조회</th>
          </tr>
          <%-- 여기에 서버로부터 받은 쪽지 목록 데이터를 반복문을 통해 표시 --%>
        </table>
        <a href="send.jsp">쪽지 보내기</a>

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