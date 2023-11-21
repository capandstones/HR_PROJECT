<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 20px; height: auto; background-color: rgb(224, 224, 224);">
			<main>
			<div class="col-sm-6">
         <div class="card shadow">
            <div class="card-body">
               <form:form action="${root }user/modify_pro" method="post" modelAttribute="modifyUserBean">
               <div class="form-group">
                  <form:label path="employee_name">이름</form:label>
                  <form:input path="employee_name" class="form-control" readonly="true"/>
               </div>
               <div class="form-group">
                  <form:label path="employee_id">아이디</form:label>
                  <form:input path="employee_id" class="form-control" readonly="true"/>
               </div>
               <div class="form-group">
                  <form:label path="employee_password">비밀번호</form:label>
                  <form:password path="employee_password" class="form-control"/>
                  <form:errors path="employee_password" style='color:red'/>
               </div>
               <div class="form-group">
                  <form:label path="employee_password2">비밀번호 확인</form:label>
                  <form:password path="employee_password2" class="form-control"/>
                  <form:errors path="employee_password2" style='color:red'/>
               </div>
               <div class="form-group">
                  <div class="text-right">
                     <form:button class="btn btn-primary">정보수정</form:button>
                  </div>
               </div>
       
               </form:form>
            </div>
         </div>
      </div>
			</main>

		</div>
	</div>
	<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
      crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>