<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a.link:link {color: #cccccc;}
a:visited {text-decoration: none; color: #cccccc;}
a.link:hover {text-decoration: none; color: gray;}
a.mylink:hover {text-decoration: none; }
a:active {text-decoration: none; color: #cccccc;}

	button.headerBtn {
		border-radius: 0.5rem;
		border: 1px solid gray;
		background: #415971;
		margin-left:65%;
		width: 170px;
		height: 45px;
		border: none;
		color: white;
		font-weight: bold;
		padding-top: 10px;
		
	}
	
	
</style>    
</head>
<body>
<div style=" padding-top: 20px; padding-left: 40px; padding-bottom: 0px; display: flex; ">
	<div style="color: #404040; font-size: 23pt; font-weight: bold; padding-right: 20px; font-family: sans-serif;">문서함</div>
	<button type="button" class="headerBtn" onclick="javascript:location.href='${root}workflow/selectWrite'" style="margin-left: 1100px;">
	<div style="text-align: center; padding-bottom: 7px; padding-right: 3px;">
		<i class="bi bi-pencil-fill"></i>
		 작성하기
		 </div>
	</button>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</body>
</html>