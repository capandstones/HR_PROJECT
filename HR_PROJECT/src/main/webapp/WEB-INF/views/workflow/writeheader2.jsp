<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  

<style type="text/css">
a.link:link {color: #cccccc;}
a:visited {text-decoration: none; color: #cccccc;}
a.link:hover {text-decoration: none; color: gray;}
a.mylink:hover {text-decoration: none; }
a:active {text-decoration: none; color: #cccccc;}

	button.headerBtn {
		border-radius: 0.5rem;
		border: 1px solid gray;
		background: #6C98C4;
		margin-left:75%;
		width: 150px;
		height: 45px;
		border: none;
		color: white;
		font-weight: bold;
	}
	

</style>    

<script type="text/javascript">

	function goWrite() {
			
		//줄바꿈 저장
		  const frm = document.wirteFrm;
          frm.method = "POST";
          frm.action = "${root}/workflow/writeEnd.yolo";
          frm.submit();
		
	}

</script> 

<div style="display: flex; padding-top: 20px; padding-left: 40px; padding-bottom: 20px;]" class="border-bottom">
	 <span ><a class="mylink" href="javascript:location.href='${root}workflow/selectWrite'" style="color: #404040; font-size: 23pt; font-weight: bold; padding-right: 20px;"><</a></span>
	 <span style="color:#404040; font-size: 23pt; font-weight: bold;" onclick="javascript:location.href='${root}workflow/selectWrite'">작성하기</span>
</div >


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">