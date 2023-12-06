<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<title>반차</title>
</head>
<body>

   <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff; justify-content: center; align-items: center; padding-bottom: 100px;">
      <div class="card shadow">
         <div class="card-body">
            <form action="${root }vacation/submit_pro" method="post" enctype="multipart/form-data">
               <div class="form-group">
                  <label for="vacationType">휴가종류:</label>
                  <input type="text" id="vacation_name" name="vacation_name" value="반차" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               </div>
               <div class="form-group">
                  <label for="employeeName">이름:</label>
                  <input type="text" id="employee_name" name="employee_name" class="form-control" required>
               </div>
               <div class="form-group">
                  <label for="approver">결제자:</label>
                  <input type="text" id="employee_id_ch" name="employee_id_ch" class="form-control" required>
                  <!-- <button>검색</button> -->
               </div>
               <div class="form-group">
                  <label for="reference">참조:</label>
                  <input type="text" id="employee_id_ch2" name="employee_id_ch2" class="form-control" required>
                  <!-- <button>검색</button> -->
               </div>
               <div class="form-group">
                  <label for="vacationDate">휴가일자:</label>
                  <input type="date" id="vacation_start_date" name="vacation_start_date" class="form-control" required>
                  ~
                  <input type="date" id="vacation_end_date" name="vacation_end_date" value="#date" class="form-control" readonly="readonly" required>
               </div>
               <div class="form-group">
                  <label for="vacationDays">휴가일수:</label>
                  <input type="number" id="vacation_days" name="vacation_days" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               </div>
               <div class="form-group">
                  <label for="vacationReason">휴가내용:</label>
                  <textarea id="vacation_reason" name="vacation_reason" rows="4" class="form-control" required></textarea>
               </div>
               <!-- 
      <label for="attachment">첨부파일:</label>
      <input type="file" id="attachment" name="attachment">
      <br> -->
               <input type="submit" value="휴가 신청">
            </form>
         </div>
      </div>
   </div>

   <script>
      $(document).ready(function() {
         $("#vacation_start_date").change(function() {
            var startDateValue = $(this).val();
            $("#vacation_end_date").val(startDateValue);
         });
      });
   </script>
   
   <script>
      $(document).ready(
         function() {
            $("#vacation_start_date, #vacation_end_date").change(
               function() {
                  var startDate = new Date($("#vacation_start_date").val());
                  var endDate = new Date($("#vacation_end_date").val());
                  var timeDiff = (Math.round((endDate - startDate) / (1000 * 60 * 60 * 24))) + 1;
                  $("#vacation_days").val(timeDiff);
               });
         });
   </script>

   <script>
   $(document).ready(
      function() {
         $("form").submit(
            function(event) {
               event.preventDefault();
                  var formData = new FormData();
                     formData.append("vacation_name", $("#vacation_name").val());
                     formData.append("employee_name", $("#employee_name").val());
                     formData.append("employee_id_ch", $("#employee_id_ch").val());
                     formData.append("employee_id_ch2", $("#employee_id_ch2").val());
                     formData.append("vacation_start_date", $("#vacation_start_date").val());
                     formData.append("vacation_end_date", $("#vacation_end_date").val());
                     formData.append("vacation_days", $("#vacation_days").val());
                     formData.append("vacation_reason", $("#vacation_reason").val());
                     console.log("FormData:", formData);

            $.ajax({
               type : "POST",
               url : "submit_pro",
               data : formData,
               contentType : false,
               processData : false,
               success : function(response) {
                  alert('신청이 완료되었습니다.');
                  window.close();
               },
               error : function(error) {
                  alert('신청이 완료되었습니다');
                  console.error(error);
                  window.close();
               }
            });
         });
      });
   </script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>
</body>
</html>