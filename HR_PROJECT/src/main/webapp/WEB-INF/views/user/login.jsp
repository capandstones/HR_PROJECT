<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	font-family : "Montserrat", sans-serif;
	margin: 0 auto;
	padding: 0;

}

.wrapper {
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(to bottom, #2C3E50 50%, #fff 50%);
    overflow: hidden;
}

.container {
    border-radius: 10px;
    border: 2px solid #2C3E50;
    position: absolute;
    width: 500px;
    min-height: 480px;
    overflow: hidden;
}

form {
	background: #fff;
	display: flex;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	justify-content: center;
	align-items: center;
}

form input {
	background: #E8E9EC;
	padding: 16px;
	margin: 8px 0;
	width: 85%;
	border: 0;
	outline: none;
	border-radius: 20px;
}

input:focus {outline: 2px solid #2C3E50;} /* outline 테두리 속성 수정 */

button {
	border-radius: 20px;
	border: none;
	outline: none;
	font-size: 12px;
	font-weight: bold;
	padding: 15px 45px;
	margin: 14px;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	transition: transform 80ms ease-in;
}

.form_btn {
	background-color: #2C3E50;
    color: #fff;
}

.form_btn:active {
	box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
}

.overlay_btn {
	background-color: #2C3E50;
	color: #fff;
	box-shadow: -5px -5px 10px #496785, 5px 5px 8px #1C2833;
}

.sign-in-container {
	position: absolute;
	left: 0;
	width: 100%;
	height: 100%;
}


form h1 {
	font-size :30pt;
	font-weight: bold;
	margin: 0;
	color: #000;
}

p {
	font-size: 16px;
	font-weight: bold;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
	color: #707070;
	letter-spacing: 0.5px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<img src="${root}image/attention_white.png" style="position:absolute; top: 70px; width: 350px; height: auto ">
		<div class="container" style="">	
			<div class="sign-in-container">
				<form:form action="${root}user/login_pro" method="get" modelAttribute="tempLoginUserBean">
					<img src="${root}image/login.svg" style="width: 200px; height: auto;">
					<br>
					<br> 
					<form:input path="employee_id" placeholder="사번" class="form-control"/> 
					<form:password path="employee_password" placeholder="Password" class="form-control"/>
					<form:errors path="employee_id" style="color:red"/>
					<span>초기 비밀번호는 주민번호 앞 6자리입니다</span>
					<br>
					<form:button class="form_btn"  >로그인</form:button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>


