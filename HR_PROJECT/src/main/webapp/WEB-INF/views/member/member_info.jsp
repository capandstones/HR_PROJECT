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
<title>member_info</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>


<style type="text/css">
.card {
   width: 310px;
   height: 190px;
   border: 2px solid gray;
   margin: 25px 20px;
   padding: 10px;
   border-color: #cccccc;
   border-radius: 0.5rem;
}

.card:hover {
   background-color: #efefef;
   cursor: pointer;
   border-radius: 0.5rem;
}

div#fontSubject {
   font-size: 15pt;
   font-weight: bold;
   margin-top: 25px;
   margin-left: 13px;
   margin-bottom: 3px;
   color: #4d4d4d;
}

div#fontpurpose {
   font-size: 12pt;
   margin-left: 13px;
   margin-top: 2px;
}

/* img { */

/*    width: 40px; */
/*    height: 40px; */
/*    margin: 13px; */
/* } */
div#parent {
   display: flex;
   justify-content: space-between;
}

div#child {
   flex: 0.15;
}

div#parent2 {
   display: flex;
   justify-content: space-between;
}

div#child2 {
   flex: 0.15;
}
</style>



</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

   <header>
   <h1>MemberInfo </h1>
   
   </header>
   <main>
   
   </main>
   <footer>
      
   </footer>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>