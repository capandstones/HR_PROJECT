<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   <meta name="description" content="" />
   <meta name="author" content="" />
   <title>조직도</title>
   <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
   <link href="${root}css/styles.css" rel="stylesheet" />
   <link rel="stylesheet" href="${root}css/member/chart.css" />
   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <script src="https://kit.fontawesome.com/f07bfb696a.js" crossorigin="anonymous"></script>
   <c:import url="/WEB-INF/views/member/memberInfoModal.jsp" />
   <script>
      
      // render함수 실행
      $(document).ready(() => {
         renderEmployeeList();
          
      });
      
      
      const showEmployeeInfoModal = (employeeInfoKey) => {
         const employeeInfo = getEmployeeInfo(employeeInfoKey);
         
         if (employeeInfo.length !== 0) {
            const modalContainer = document.querySelector('.modalWindow');
            modalContainer.style.display = 'block';
            
            document.querySelector('#modalWindow').classList.toggle("hidden");
            
            const employeeName = document.querySelector('.employee-span-name');
            const employeeDepartment = document.querySelector('.employee-span-department');
            const employeePosition = document.querySelector('.employee-span-position');
            const employeeStatus = document.querySelector('.employee-span-status');
                        
            employeeName.innerText = employeeInfo.employee_name + ' (' + employeeInfo.employee_first_name + ' ' +  employeeInfo.employee_last_name + ')';
            employeeDepartment.innerText = employeeInfo.department_name;
            employeePosition.innerText = employeeInfo.employee_position;
            employeeStatus.innerText = employeeInfo.employee_status;
            
            const employeePDepartment = document.querySelector('.employee-p-department');
            const employeePPhone = document.querySelector('.employee-p-phone');
            const employeePStartDate = document.querySelector('.employee-p-start-date');
            const employeePStatus = document.querySelector('.employee-p-status');
            
            employeePDepartment.innerText = employeeInfo.department_name;
            employeePPhone.innerText = employeeInfo.employee_phone;
            employeePStartDate.innerText = employeeInfo.employee_start_date;
            employeeStatus.innerText = employeeInfo.employee_status;
            
            if (employeeInfo.employee_status === '재직중') {
               document.querySelector('.employee-inner-status-icon').classList.add('status-active');
            } else {
               document.querySelector('.employee-inner-status-icon').classList.add('status-inactive');
            }
         }
      }
      
      // list의 id값을 토대로 모달에 넣을 사원 정보 받아오기
      const getEmployeeInfo  = (employeeInfoKey) => {
         let empInfoDetail = [];
         
         $.ajax({
            type: 'POST',
            url: '/HR_Project/getEmpInfoDetail/',
            data: employeeInfoKey,
            contentType : "application/json",
            async: false,
            success: function(result) {
               empInfoDetail = result;
            }
         });
         
         return empInfoDetail;
      }
            
       // 모든 사원 정보를 받아옴
      const getEmployeeList = () => {
         
         let employeeList = [];
         
         $.ajax({
            type: "GET",
            url: "/HR_Project/getEmpInfo",
            async: false,
            success: function(empList) {
               employeeList = empList;      
            }
         });
         
         return employeeList;
      }
      
      // 받아온 모든 사원정보를 통해 card 형식으로 동적 html 생성
      const renderEmployeeList = () => {
         const divLeader = document.querySelector('.divLeader');
          const employeeList = getEmployeeList(); // 함수 호출 후 return 값 저장
                   
         let isSame = '';
         let html = '';
         
         employeeList.forEach((item, index) => {
            if (isSame !== item.department_name) {
               // 만약 첫 태그 생성이 아니거나 이전에 생성한 부서와 다음 생성할 부서가 다를 경우 다음 부서 ul tag 닫음
               if (isSame !== '' || isSame !== item.department_name) html += '</ul>';
               
               html += '<ul class="employee-ul">';
               html += createEmployeeListItem(item);
               
               isSame = item.department_name;
            } else {
               html += createEmployeeListItem(item);
            }
         });
         
         divLeader.innerHTML = html;
         
         // divLeader에 리스너를 달았지만 closest를 통해 이벤트 위임
         divLeader.addEventListener('click', (event) => {
            // onclick 사용시 함수 값의 직접적인 노출을 피하기 위해 closest 함수 사용함, dataset으로 li에 넣은 값을 갖고 다님
            const employeeInfoKey = event.target.closest('.employee-li').dataset.employeeKey;
            
            // employeeInfoKey가 값을 가지고 있을 때 함수 실행 (null이 아니라면)
            if (employeeInfoKey) {
               const empInfoDetail = showEmployeeInfoModal(employeeInfoKey);
            }
             
            else return;
         });
      }
      
      // html 동적 생성하는 코드
      const createEmployeeListItem = (item) => {
         let html = '';
         
         html += '<li class="employee-li hidden" data-employee-key=' + item.employee_id + ' data-department-name=' + item.department_name + '>';
         html += '   <div class="employee-profile-wrap">';
         html += '      <div class="employee-profile-inner-img">';
         html += '         <img class="employee-list-profile" src=${root}upload/' + item.employee_profile_picture + '/>';
         html += '      </div>';
         html += '      <div class="employee-info-wrap">';
         html += '         <p class="employee-name">' + item.employee_name + '  (' + item.employee_first_name + ' ' + item.employee_last_name + ')</p>';
         html += '         <div class="departmentName">' + item.department_name + '</div>';
         html += '         <div class="employeePosition">' + item.employee_position + '</div>';
         html += '         <div class="employee-wrap-btn">';
         html += '            <div class="employee-inner-status-wrap">';
         html += '               <div id="divCircle" class="employee-inner-status-icon status-active"></div>';
         html += '               <span class="data-employee-status">' + item.employee_status + '</span>';
         html += '            </div>';
         html += '         </div>';
         html += '      </div>';
         html += '   </div>';
         html += '</li>';
         
         return html;
      }
      
      // 부서 버튼 클릭 시 세부 부서 버튼 열기
      const openDeptBtn = (deptNum) => {
         const subButtons = document.getElementById(deptNum+ "-subbuttons");
         
         const employeeLi = document.querySelectorAll('.employee-li');
         
           
         
         employeeLi.forEach((item, index) => {
            const departmentName = item.dataset.departmentName;
//             const employeeStatus = item.querySelector('.data-employee-status').innerText;
//             if(employeeStatus === '휴직중') {
//                 document.querySelector('#divCircle').classList.replace('status-active', 'status-inactive');
//             }
            
            
            if (deptNum === 'dept1' && departmentName === '개발부') {
               item.classList.toggle('hidden');
            }
            
            if (deptNum === 'dept2' && departmentName === '영업부') {
               item.classList.toggle('hidden');
            }
            
            if (deptNum === 'dept3' && departmentName === '인사부') {
               item.classList.toggle('hidden');
               
            }
            
            if (deptNum === 'dept4' && departmentName === '기획부') {
               item.classList.toggle('hidden');
            }
            
            if (deptNum === 'dept5' && departmentName === '디자인부') {
               item.classList.toggle('hidden');
            }
            
            if (deptNum === 'dept6' && departmentName === '테스트부') {
               item.classList.toggle('hidden');
            }
            
         });
         
         if (subButtons) {
              subButtons.classList.toggle("hidden");
          } else {
              console.error("Element not found");
          }
      };
      
      const showDetailInfoBtn = (deptNumDetail) => {

         const employeeLi = document.querySelectorAll('.employee-li');
         
         employeeLi.forEach((item, index) => {
            const departmentName = item.dataset.departmentName;
            
            if (deptNumDetail === 'dept1_1' && departmentName === '개발1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept1_2' && departmentName === '개발2팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept2_1' && departmentName === '영업1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept2_2' && departmentName === '영업2팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept3_1' && departmentName === '인사1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept3_2' && departmentName === '인사2팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept4_1' && departmentName === '기획1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept4_2' && departmentName === '기획2팀') {
               item.classList.toggle('hidden');
            }

            if (deptNumDetail === 'dept5_1' && departmentName === '디자인1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept5_2' && departmentName === '디자인2팀') {
               item.classList.toggle('hidden');
            }

            if (deptNumDetail === 'dept6_1' && departmentName === '테스트1팀') {
               item.classList.toggle('hidden');
            }
            
            if (deptNumDetail === 'dept6_2' && departmentName === '테스트2팀') {
               item.classList.toggle('hidden');
            }
         });
      };
         
    

   </script>
   
</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<body class="sb-nav-fixed">
   <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">

         <main>
            <!-- top 시작 -->
            <div>
               <h2 class="head">조직도</h2>

            </div>
            <hr />
            <!-- top 끝 -->

            <!-- main_container 시작 -->
            <div class="main_container">

               <!--  side 시작 -->
               <div class="side">
                  <div>
                     <ul>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept1')">개발부</button>
                           <ul id="dept1-subbuttons" class="hidden">
                              <li><button id="developTeam1" class="depth2" onclick="showDetailInfoBtn('dept1_1')">개발 1팀</button></li>
                              <li><button id="developTeam2" class="depth2" onclick="showDetailInfoBtn('dept1_2')">개발 2팀</button></li>
                           </ul>
                        </li>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept2')">영업부</button>
                           <ul id="dept2-subbuttons" class="hidden">
                              <li><button id="salesTeam1" class="depth2" onclick="showDetailInfoBtn('dept2_1')">영업 1팀</button></li>
                              <li><button id="salesTeam2" class="depth2" onclick="showDetailInfoBtn('dept2_2')">영업 2팀</button></li>
                           </ul>
                        </li>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept3')">인사부</button>
                           <ul id="dept3-subbuttons" class="hidden">
                              <li><button id="personnelTeam1" class="depth2" onclick="showDetailInfoBtn('dept3_1')">인사 1팀</button></li>
                              <li><button id="personnelTeam2" class="depth2" onclick="showDetailInfoBtn('dept3_2')">인사 2팀</button></li>
                           </ul>
                        </li>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept4')">기획부</button>
                           <ul id="dept4-subbuttons" class="hidden">
                              <li><button id="planningTeam1" class="depth2" onclick="showDetailInfoBtn('dept4_1')">기획 1팀</button></li>
                              <li><button id="planningTeam2" class="depth2" onclick="showDetailInfoBtn('dept4_2')">기획 2팀</button></li>
                           </ul>
                        </li>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept5')">디자인부</button>
                           <ul id="dept5-subbuttons" class="hidden">
                              <li><button id="designTeam1" class="depth2" onclick="showDetailInfoBtn('dept5_1')">디자인 1팀</button></li>
                              <li><button id="designTeam2" class="depth2" onclick="showDetailInfoBtn('dept5_2')">디자인 2팀</button></li>
                           </ul>
                        </li>
                        <li>
                           <button class="depth1" onclick="openDeptBtn('dept6')">테스트부</button>
                           <ul id="dept6-subbuttons" class="hidden">
                              <li><button id="testTeam1" class="depth2" onclick="showDetailInfoBtn('dept6_1')">테스트 1팀</button></li>
                              <li><button id="testTeam2" class="depth2" onclick="showDetailInfoBtn('dept6_1')">테스트 2팀</button></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </div>
               <!--  side 종료 -->

               <!--  동적 HTML 저장할 div container  -->
               <div id="list_area" class="list_area">
                  <div id="divLeader" class="divLeader"></div>
               </div>
               <!--  동적 HTML 저장할 div container 종료  -->
				<span ></span>
            </div>
            <!-- main_container 종료 -->
         </main>

				<!-- main_container 시작 -->
				<div class="main_container">
		</div>
      </div>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>
</body>
</html>