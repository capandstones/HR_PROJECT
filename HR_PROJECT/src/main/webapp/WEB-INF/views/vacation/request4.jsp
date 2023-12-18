<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>병가</title>

<!-- External Libraries -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css">
<link rel="stylesheet" href="${root}css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>

   <div id="layoutSidenav_content" style="padding: 20px; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh;">
      <div class="card shadow" style="width: 400px;">
         <div class="card-body">
            <form action="${root}vacation/submit_pro" method="post" enctype="multipart/form-data">
               <input type="hidden" id="employee_id" name="employee_id" value="${employee_id }" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               <input type="hidden" id="line_name" name="line_name" value="${line_name }" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               <input type="hidden" id="department_name" name="department_name" value="${department_name }" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               <input type="hidden" id="employee_position" name="employee_position" value="${employee_position }" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               <div class="mb-3">
                  <label for="vacationType" class="form-label">휴가종류:</label>
                  <input type="text" id="vacation_name" name="vacation_name" value="병가" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               </div>
               <div class="mb-3">
                  <label for="employeeName" class="form-label">이름:</label>
                  <input type="text" id="employee_name" name="employee_name" value="${username }" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               </div>
               <div class="mb-3">
                  <label for="approver" class="form-label">결재자:</label>
                  <input type="text" id="employee_id_approver" name="employee_id_approver" class="form-control" required>
               </div>
               <input type="hidden" id="employee_id_referrer" name="employee_id_referrer" value="인사부" class="form-control" required>
               <div class="mb-3">
                  <label for="vacationDate" class="form-label">휴가일자:</label>
                  <div class="row">
                     <div class="col">
                        <input type="date" id="vacation_start_date" name="vacation_start_date" class="form-control" required>
                     </div>
                     <div class="col">
                        <input type="date" id="vacation_end_date" name="vacation_end_date" class="form-control" required>
                     </div>
                  </div>
               </div>
               <div class="mb-3">
                  <label for="vacationDays" class="form-label">휴가일수:</label>
                  <input type="number" id="vacation_days" name="vacation_days" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               </div>
               <div class="mb-3">
                  <label for="vacationReason" class="form-label">휴가내용:</label>
                  <textarea id="vacation_reason" name="vacation_reason" rows="4" class="form-control" required></textarea>
               </div>
               <div class="mb-3">
                  <label for="attachment" class="form-label">첨부파일:</label>
                  <input type="file" id="vacation_attachment" name="vacation_attachment" class="form-control">
               </div>
               <input type="hidden" id="vacation_state" name="vacation_state" value="대기" class="form-control" readonly="readonly" style="background: #D1D1D1;" required>
               <div class="mb-3">
               <input type="submit" value="휴가 신청">
               </div>
            </form>
         </div>
      </div>
   </div>

   <script>
      $(document).ready(
            function() {
               $("#vacation_start_date, #vacation_end_date").change(
                     function() {
                        var startDate = new Date($(
                              "#vacation_start_date").val());
                        var endDate = new Date($("#vacation_end_date")
                              .val());
                        var totalDays = getWeekdaysBetweenDates(
                              startDate, endDate);
                        $("#vacation_days").val(totalDays);
                     });

               function getWeekdaysBetweenDates(startDate, endDate) {
                  var daysDiff = Math.round((endDate - startDate)
                        / (1000 * 60 * 60 * 24)) + 1;
                  var weekDays = 0;

                  for (var i = 0; i < daysDiff; i++) {
                     var currentDate = new Date(startDate);
                     currentDate.setDate(startDate.getDate() + i);
   
                     if (currentDate.getDay() !== 0
                           && currentDate.getDay() !== 6) {
                        weekDays++;
                     }
                  }

                  return weekDays;
               }
            });
   </script>

   <script>
    $(document).ready(function () {
        $("form").submit(function (event) {
           event.preventDefault();
            var formData = new FormData();
            formData.append("employee_id", $("#employee_id").val());
            formData.append("line_name", $("#line_name").val());
            formData.append("department_name", $("#department_name").val());
            formData.append("employee_position", $("#employee_position").val());
            formData.append("vacation_name", $("#vacation_name").val());
            formData.append("employee_name", $("#employee_name").val());
            formData.append("employee_id_approver", $("#employee_id_approver").val());
            formData.append("employee_id_referrer", $("#employee_id_referrer").val());
            formData.append("vacation_start_date", $("#vacation_start_date").val());
            formData.append("vacation_end_date", $("#vacation_end_date").val());
            formData.append("vacation_days", $("#vacation_days").val());
            formData.append("vacation_reason", $("#vacation_reason").val());
            formData.append("vacation_attachment", $("#vacation_attachment").val());
            formData.append("vacation_state", $("#vacation_state").val());
            console.log("FormData:", formData);

            $.ajax({
                type: "POST",
                url: "submit_pro",
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    alert('신청이 완료되었습니다.');
                    window.close();
                },
                error: function (error) {
                    alert('신청이 완료되었습니다');
                    console.error(error);
                    window.close();
                }
            });
        });
    });
</script>

</body>
</html>