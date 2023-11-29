<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연차</title>
</head>
<body>

	<form action="/vacation/submitVacationForm" method="post" enctype="multipart/form-data">
		<label for="employeeName">이름:</label>
		<input type="text" id="employee_name" name="employee_name" value="김민지" readonly="readonly" required>
		<br>

		<label for="vacationType">휴가종류:</label>
		<input type="text" id="vacation_name" name="vacation_name" value="연차" readonly="readonly" required>
		<br>

		<label for="approver">결제자:</label>
		<input type="text" id="employee_id_ch" name="employee_id_ch" required>
		<button>검색</button>
		<br>

		<label for="reference">참조:</label>
		<input type="text" id="employee_id_ch2" name="employee_id_ch2" required>
		<button>검색</button>
		<br>

		<label for="vacationDate">휴가일자:</label>
		<input type="date" id="vacation_start_date" name="vacation_start_date" required>
		~
		<input type="date" id="vacation_end_date" name="vacation_end_date" required>
		<br>

		<label for="vacationDays">휴가일수:</label>
		<input type="number" id="vacation_days" name="vacation_days" required>
		<br>

		<label for="vacationReason">휴가내용:</label>
		<textarea id="vacation_reason" name="vacation_reason" rows="4" required></textarea>
		<br>

		<label for="attachment">첨부파일:</label>
		<input type="file" id="attachment" name="attachment">
		<br>
		<input type="submit" value="휴가 신청">
	</form>

</body>
</html>