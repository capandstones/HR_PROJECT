<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<link href="css/loginstyle.css" rel="stylesheet" />
</head>


<body>

	<div class="wrapper">
		<img src="${root}image/attention.svg" style="position:absolute; top: 100px; width: 350px; height: auto ">
		<div class="container">
		
			<div class="sign-up-container">
				<form>
					<h1>회원가입</h1>
					<div class="social-links">
						<div>
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
					<span>or use your email for registration</span> <input type="text"
						placeholder="Name"> <input type="email"
						placeholder="Email"> <input type="password"
						placeholder="Password">
					<button class="form_btn">가입하기</button>
				</form>
			</div>
			<div class="sign-in-container">
				<form>
					<h1>Login</h1>
					<div class="social-links">
						<div>
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
					<span>or use your account</span> <input type="email"
						placeholder="Email"> <input type="password"
						placeholder="Password">
					<button type="button" class="form_btn" onclick="location.href='${root}main/main' ">로그인</button>
				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay-left">
					<h1>Login</h1>
					<p>계정이 있으시다면</p>
					<button id="signIn" class="overlay_btn">로그인</button>
				</div>
				<div class="overlay-right">
					<h1>회원가입</h1>
					<p>계정이 없으시다면</p>
					<button id="signUp" class="overlay_btn">가입하기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
const signUpBtn = document.getElementById("signUp");
const signInBtn = document.getElementById("signIn");
const container = document.querySelector(".container");

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});
</script>
</body>
</html>