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
a.mylink:link {color: #cccccc;}
a:visited {text-decoration: none; color: #cccccc;}
a.mylink:hover {text-decoration: none; color: gray;}
a.link:hover {text-decoration: none; }
a:active {text-decoration: none; color: #cccccc;}

	button.headerBtn {
		border-radius: 0.5rem;
		border: 1px solid gray;
		background: #6C98C4;
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
	 <span><a class="mylink" href="javascript:location.href='${root}workflow/document'"style=" font-size: 20pt; font-weight: bold; padding-right: 20px;">내 문서함</a></span>
	 <span><a class="link" href="javascript:location.href='${root}workflow/cpDocument'" style="color: black; font-size: 20pt; font-weight: bold; padding-left: 20px;">회사 문서함</a></span>
	
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</body>
</html>