<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<style>
	.employee-div { margin: 10px 0px; }
	.employee-div p { margin: 0px; }
	.employee-info-profile-wrap { width: 200px; }
	.employee-info-profile-img { width: 130px; height: 130px; border-radius: 50%; }
	.employee-span-name { font-size: 20px; font-weight: 800; }
	.employee-info-txt { color: #888; font-size: 14px; font-weight: 800; }
	.employee-info-table td { padding: 5px 8px; }
</style>

<div class="modalWindow hidden" id="modalWindow">
	<div class="mainContainer">
		<div class="employee-div employee-info-profile-wrap">
			<div class="">
				<img class="employee-info-profile-img" src="${root}/image/userImage1.png"/>
			</div>
			<div class="employee-div">
				<span class="employee-span-name">강해린</span>
			</div>
			<div>
				<p class="employee-span-wrap">
					<span class="employee-info-txt employee-span-department">개발부</span>
					<span class="employee-info-txt employee-span-position">부장</span>
				</p>
				<p class="employee-info-txt employee-span-email">test@test.co.kr</p>
			</div>
			<div class="employee-div employee-inner-status-wrap" style="justify-content: center;">
				<div class="employee-inner-status-icon"></div>
				<span class="employee-span-status">재직중</span>
			</div>
		</div>
	</div>
</div>