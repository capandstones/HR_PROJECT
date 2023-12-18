<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>조직도</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="${root}css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="${root}css/chart.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script
      src="https://kit.fontawesome.com/f07bfb696a.js"
      crossorigin="anonymous"
    ></script>
    <c:import url="/WEB-INF/views/member/memberInfoModal.jsp" />

    <script>
      // render함수 실행
      $(document).ready(() => {
        renderDepartmentButton();
        renderEmployeeList();
        //         empCardSort();
      });

      const empCardSort = () => {
        const employeeItems = document.querySelectorAll('.employee-li');

        employeeItems.forEach((item) => {
          if (item.dataset.lineName === '개발부') {
            item.style.display = ''; // Show the item if it has the same lineName
          } else {
            item.style.display = 'none'; // Hide others
          }
        });
      };

      // list의 id값을 토대로 모달에 넣을 사원 정보 받아오기
      const getEmployeeInfo = (employeeInfoKey) => {
        let empInfoDetail = [];

        $.ajax({
          type: 'POST',
          url: '/HR_Project/getEmpInfoDetail/',
          data: employeeInfoKey,
          contentType: 'application/json',
          async: false,
          success: function (result) {
            empInfoDetail = result;
          },
        });

        return empInfoDetail;
      };

      // 모든 사원 정보를 받아옴
      const getEmployeeList = () => {
        let employeeList = [];

        $.ajax({
          type: 'GET',
          url: '/HR_Project/getEmpInfo',
          async: false,
          success: function (empList) {
            employeeList = empList;
          },
        });

        return employeeList;
      };

      // 부서의 line_name 받아옴 (--부)
      const getDeptLineName = () => {
        let deptLineNameList = [];

        $.ajax({
          type: 'GET',
          url: '/HR_Project/getDeptLineNameList/',
          async: false,
          success: function (result) {
            deptLineNameList = result;
          },
        });

        return deptLineNameList;
      };

      // 부서의 dept_name 받아옴 (--팀)
      const getDeptNameList = (deptLineName) => {
        let deptNameList = [];

        $.ajax({
          type: 'GET',
          url: '/HR_Project/getDeptNameList/' + deptLineName,
          async: false,
          success: function (result) {
            deptNameList = result;
          },
        });

        return deptNameList;
      };

      // 모든 부서 정보를 받아와 부서 버튼 동적 html 생성
      const renderDepartmentButton = () => {
        const btnArea = document.querySelector('.btn_area');
        const deptLineNameList = getDeptLineName();

        let html = '';

        deptLineNameList.forEach((lineName) => {
          html += '<li class="department-container">';
          html +=
            '  <button class="depth1 department-line-name" onclick="filterShowEmployeeCard(\'' +
            lineName +
            '\')"><i class="fa-solid fa-user-group"></i> ' +
            lineName +
            '</button>';
          html += '  <ul class="department-name-container">';

          const deptNameList = getDeptNameList(lineName);

          deptNameList.forEach((deptName) => {
            html +=
              '<li class="department-name-li depth2 department-name"> - ' +
              deptName +
              '</li>';
          });

          html += '  </ul>';
          html += '</li>';
        });

        btnArea.innerHTML = html;
      };

      const filterShowEmployeeCard = (lineName) => {
        const employeeItems = document.querySelectorAll('.employee-li');

        employeeItems.forEach((item) => {
          if (item.dataset.lineName === lineName) {
            item.style.display = ''; // Show the item if it has the same lineName
          } else {
            item.style.display = 'none'; // Hide others
          }
        });
      };

      // 받아온 모든 사원정보를 통해 card 형식으로 동적 html 생성
      const renderEmployeeList = () => {
        const list_area = document.querySelector('.list_area');
        const employeeList = getEmployeeList(); // 함수 호출 후 return 값 저장

        let isSame = '';
        let html = '';

        employeeList.forEach((item, index) => {
          if (isSame !== item.line_name) {
            // 만약 첫 태그 생성이 아니거나 이전에 생성한 부서와 다음 생성할 부서가 다를 경우 다음 부서 ul tag 닫음
            if (isSame !== '' || isSame !== item.line_name) html += '</ul>';

            html += '<ul class="employee-ul">';
            html += createEmployeeListItem(item);

            isSame = item.line_name;
          } else {
            html += createEmployeeListItem(item);
          }
        });

        list_area.innerHTML = html;

        // list_area에 리스너를 달았지만 closest를 통해 이벤트 위임
        list_area.addEventListener('click', (event) => {
          // onclick 사용시 함수 값의 직접적인 노출을 피하기 위해 closest 함수 사용함, dataset으로 li에 넣은 값을 갖고 다님
          const employeeInfoKey =
            event.target.closest('.employee-li').dataset.employeeKey;

          // employeeInfoKey가 값을 가지고 있을 때 함수 실행 (null이 아니라면)
          if (employeeInfoKey) {
            const empInfoDetail = showEmployeeInfoModal(employeeInfoKey);
          } else return;
        });
      };

      // html 동적 생성하는 코드
      const createEmployeeListItem = (item) => {
        let html = '';

        html +=
          '<li class="employee-li" data-employee-key=' +
          item.employee_id +
          ' data-line-name=' +
          item.line_name +
          ' data-department-name=' +
          item.department_name +
          '>';
        html += '   <div class="employee-profile-wrap">';
        html += '      <div class="employee-profile-inner-img">';
        html +=
          '         <img class="employee-list-profile" src=${root}upload/' +
          item.employee_profile_picture +
          '/>';
        html += '      </div>';
        html += '      <div class="employee-info-wrap">';
        html +=
          '         <p class="employee-name">' +
          item.employee_name +
          '  (' +
          item.employee_first_name +
          ' ' +
          item.employee_last_name +
          ')</p>';
        html +=
          '         <div class="departmentName"><i class="fa-solid fa-user-group"></i> 부서 : ' +
          item.department_name +
          '</div>';
        html +=
          '         <div class="employeePosition"><i class="fa-solid fa-building-user"></i> 직책 : ' +
          item.employee_position +
          '</div>';
        html += '         <div class="employee-wrap-btn">';
        html +=
          '            <div class="employee-inner-status-wrap"><i class="fa-solid fa-briefcase"></i>&nbsp&nbsp ';
        html +=
          '               <span class="data-employee-status">' +
          item.employee_status +
          '&nbsp;</span>';
        if (item.employee_status === '재직중') {
          html +=
            '         <div id="divCircle" class="employee-inner-status-icon status-active"></div>';
        } else {
          html +=
            '         <div id="divCircle" class="employee-inner-status-icon status-inactive"></div>';
        }
        html += '            </div>';
        html += '         </div>';
        html += '      </div>';
        html += '   </div>';
        html += '</li>';

        return html;
      };

      // 모달 띄우기
      const showEmployeeInfoModal = (employeeInfoKey) => {
        const employeeInfo = getEmployeeInfo(employeeInfoKey);

        if (employeeInfo.length !== 0) {
          const modalContainer = document.querySelector('.modalWindow');
          modalContainer.style.display = 'block';

          document.querySelector('#modalWindow').classList.toggle('hidden');

          const employeeName = document.querySelector('.employee-span-name');
          const employeeDepartment = document.querySelector(
            '.employee-span-department'
          );
          const employeePosition = document.querySelector(
            '.employee-span-position'
          );
          const employeeStatus = document.querySelector(
            '.employee-span-status'
          );
          const employeeEmail = document.querySelector('.employee-span-email');
          const employeeProfile = document.querySelector(
            '.employee-info-profile-img'
          );

          employeeName.innerText =
            employeeInfo.employee_name +
            ' (' +
            employeeInfo.employee_first_name +
            ' ' +
            employeeInfo.employee_last_name +
            ')';
          employeeDepartment.innerText = employeeInfo.department_name;
          employeePosition.innerText = employeeInfo.employee_position;
          employeeStatus.innerText = employeeInfo.employee_status;
          employeeEmail.innerText = employeeInfo.employee_email;
          employeeProfile.setAttribute(
            'src',
            '${root}upload/' + employeeInfo.employee_profile_picture
          );

          const employeePDepartment = document.querySelector(
            '.employee-p-department'
          );
          const employeePPhone = document.querySelector('.employee-p-phone');
          const employeePStartDate = document.querySelector(
            '.employee-p-start-date'
          );
          const employeePStatus = document.querySelector('.employee-p-status');

          if (employeeInfo.line_name !== employeeInfo.department_name) {
            employeePDepartment.innerText =
              employeeInfo.line_name + ' > ' + employeeInfo.department_name;
          } else {
            employeePDepartment.innerText = employeeInfo.department_name;
          }
          employeePPhone.innerText = employeeInfo.employee_phone;
          employeePStartDate.innerText = employeeInfo.employee_start_date;
          employeeStatus.innerText = employeeInfo.employee_status;

          if (employeeInfo.employee_status === '휴직중') {
            document
              .querySelector('.employee-inner-status-icon')
              .classList.add('status-inactive');
            document
              .querySelector('.employee-inner-status-icon')
              .classList.remove('status-active');
          } else {
            document
              .querySelector('.employee-inner-status-icon')
              .classList.add('status-active');
            document
              .querySelector('.employee-inner-status-icon')
              .classList.remove('status-inactive');
          }
        }
      };
    </script>
  </head>

  <c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />
  <body class="sb-nav-fixed">
    <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/admin_side_menu.jsp" />
      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">
         <main>
            <div>
               <h2 class="head">구성원</h2>
            </div>
            <!--  card_area Container  -->
            <div id="right" class="right">
              <div id="list_area" class="list_area"></div>
            </div>
          </div>
        </main>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root }js/scripts.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root }assets/demo/chart-area-demo.js"></script>
    <script src="${root }assets/demo/chart-bar-demo.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${root }js/datatables-simple-demo.js"></script>
  </body>
</html>
