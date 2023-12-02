<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<script>
	const modal = document.querySelector("#modalWindow");
	const perList = document.querySelector(".personnelList");
	const priList = document.querySelector(".privacyList");
	
	function closeModal() {
		modal.style.display = 'none';
	}
	
	window.onclick = function(event) {
	    if (event.target === modal) {
	        closeModal();
	    }
	};
	
// 	document.querySelector(".personnelListBtn").addEventListener("click", function() {
// 		priList.style.display = "block";
// 	});
	
// 	document.querySelector(".privacyListBtn").addEventListener("click", function() {
// 		priList.style.display = "block";
// 	});
	
// 	document.querySelector('.exitButton').addEventListener('click', (event) => {
// 		modal.style.display = 'none';
// 	});
</script>

<div id="modalWindow">
	<svg class="exitButton" onclick="closeModal()" xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 30 30">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
	</svg>
	<br />

	<div class="mainContainer">
		<img src=""/>

		<div style="padding-left: 30px;">
			<p style="padding-top: 10px; padding-bottom: 0px;">
				<b style="font-size: 18px;">강해린</b>
			</p>
			<p>
				<b style="font-size: 14px;">부서</b> &nbsp;&nbsp; <b style="font-size: 13px;">개발부</b>
			</p>
			<p>
				<b style="font-size: 14px;">직책</b> &nbsp;&nbsp; <b style="font-size: 13px;">부장</b>
			</p>
			<div style="padding-top: 5px;">
				<button>
					<svg style="" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
					</svg>
				</button>
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
						<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
					</svg>
				</button>
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
						<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
					</svg>
				</button>
				<button>
				<div class="employee-inner-status-wrap">
					<div class="employee-inner-status-icon status-active"></div>
					<span>재직중</span>
				</div>
				</button>
			</div>
		</div>
	</div>
	<div>
		<div class="BtnContainer">
			<button class="personnelListBtn">인사 정보</button> &nbsp;&nbsp;
			<button class="privacyListBtn">개인 정보</button>
		</div>
		<hr class="modalHr" />
		<div class="personnelList">
			<div>
				<p>사번</p>
				<p>부서</p>
				<p>직책</p>
				<p>입사일</p>
			</div>
			<div>
				<p>1001</p>
				<p>개발부</p>
				<p>부장</p>
				<p>23-11-30</p>
			</div>
		</div>
		<div class="privacyList, hidden">
			<div>
				<p>전화번호</p>
				<p>이메일</p>
				<p>집주소</p>
				<p>영어이름</p>
			</div>
			<div>
				<p>010-1234-1234</p>
				<p>empl@naver.com</p>
				<p>서울시 종로구</p>
				<p>kang haerin</p>
			</div>
		</div>
		<div style="border: 1px solid black;">
			자기소개칸 / 모달 style 고민중
		</div>
	</div>
</div>