<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<script src="https://kit.fontawesome.com/f07bfb696a.js" crossorigin="anonymous"></script>

<script type="text/javascript">
   const closeModal = () => {
      const modal = document.querySelector('.modalWindow')
      console.log(modal);
      modal.style.display = ('none');
   }
   
//   const goToMassenger = () => {
//   $.ajax({
//      url: '${root}member/memberInfoModal',
//      method: 'GET',
//      success: function(response) {
//         window.location.href = '${root}messenger/write.jsp';
//      }
//   });
//}

//    const goToCalender = () => {
//       const getdepartment = document.querySelector(".employee-span-department");
//       const department = getdepartment.textContent;
//       if(department === '개발부') {
         
//       }      
//    }
   
</script>
<style>
  .employee-div {
    margin: 10px 0px;
  }
  .employee-div p {
    margin: 0px;
  }
  .employee-info-profile-wrap {
    width: 200px;
  }
  .employee-info-profile-img {
    width: 130px;
    height: 130px;
    border-radius: 50%;
  }
  .employee-span-name {
    font-size: 20px;
    font-weight: 800;
  }
  .employee-info-txt {
    color: #888;
    font-size: 14px;
    font-weight: 800;
  }
  .employee-info-table td {
    padding: 5px 8px;
  }
  .closeBtn {
     background-color: #FCFCFC;
     border: none;
     float: right;
  }
</style>

<div class="modalWindow hidden" id="modalWindow">
 <button class="closeBtn" onclick="closeModal()"><i class="fa-solid fa-xmark" ></i></button>
  <div class="mainContainer">
    <div class="employee-div employee-info-profile-wrap">
      <div>
        <img class="employee-info-profile-img" src="${root}upload/userImage4.png"/>
      </div>
      <div class="employee-div"><span class="employee-span-name">강해린</span>
      </div>
      <div>
        <p class="employee-span-wrap">
          <span class="employee-info-txt employee-span-department">개발부</span>
          <span class="employee-info-txt employee-span-position">부장</span>
        </p>
        <p class="employee-info-txt employee-span-email">test@test.co.kr</p>
      </div>
      <div
        class="employee-div employee-inner-status-wrap" style="justify-content: center">
        <div class="employee-inner-status-icon"></div>
        <span class="employee-span-status">재직중</span>
      </div>
      <div class="employee-inner-button-wrap">
<!--        <div class="employee-inner-button-message" onclick="goToMassenger()"> -->
<!--           <span><i class="fa-solid fa-at"></i></span> -->
<!--           <span>메신저</span> -->
<!--        </div> -->
<!--        <div class="employee-inner-button-calender" onclick="goToCalender()"> -->
<!--           <span><i class="fa-solid fa-calendar-days"></i></span> -->
<!--           <span>캘린더</span> -->
<!--        </div> -->
      </div>
    </div>
     <div class="employee-info-detail-wrap">
        <div>
           <p class="employee-info-detail-txt empInfoDetailTxt">회사명</p>
           <p class="employee-info-detail-txt empInfoDetailTxt">부서</p>
         <p class="employee-info-detail-txt empInfoDetailTxt">휴대전화</p>        
           <p class="employee-info-detail-txt empInfoDetailTxt">입사일</p>
        </div>
        <div>
           <p class="employee-info-detail-txt">(주)Attention</p>
           <p class="employee-info-detail-txt employee-p-department">디자인부</p>
         <p class="employee-info-detail-txt employee-p-phone">010-0000-0000</p>
           <p class="employee-info-detail-txt employee-p-start-date">20-05-10</p>
           
        </div>
     </div>
  </div>
  <div>
  
  </div>
</div>