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
    <title>HR</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="${root}css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <style>
      .employee-main-li {
        display: flex;
        height: 160px;
        width: 400px;
        border: 1px solid lightgray;
        border: none;
      }
      .employee-list-profile {
        height: 140px;
        width: 120px;
        margin-left: 10px;
        border-radius: 3%;
      }
      .employee-profile-wrap {
        display: flex;
        margin-bottom: 10px;
      }
      .status-active {
        border: 3px solid #64cd3c;
      }
      .status-inactive {
        border: 3px solid red;
      }
      .employee-info-wrap {
        width: 300px;
        margin-left: 20px;
        margin-top: 5px;
      }
      .employee-name1 {
        font-size: 16px;
        font-weight: 600;
        margin-top: 10px;
        margin-bottom: 5px;
      }
      .employee-email {
        display: flex;
        align-items: center;
      }
      .employee-info-wrap div {
        margin-top: 2px;
      }

      /* 정우존 */
      .commute-table {
        border-collapse: collapse;
      }

      .commute-table,
      .commute-table th,
      .commute-table td {
        border: none;
      }

      .table-centered th,
      .table-centered td {
        text-align: center;
      }

      .table-no-border,
      .table-no-border th,
      .table-no-border td,
      .table-no-border thead tr,
      .table-no-border tbody tr {
        border: none;
      }

      .table-spacing {
        margin-top: 30px;
      }

      .employee-row {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
      }

      .employee-card {
        display: flex;
        align-items: center;
        text-align: left;
        margin-bottom: 10px;
      }

      .employee-card img {
        width: 80px;
        height: 80px;
        margin-right: 10px;
        border-radius: 50%;
      }

      .employee-position {
        font-size: 13px;
        margin-right: 10px;
      }

      .employee-name {
        font-size: 16px;
        margin-right: 10px;
      }

      .employee-status {
        font-size: 14px;
        color: green;
        margin-right: 10px;
      }

      .department-info {
        display: flex;
        align-items: stretch; /* 수직으로 채우기 */
      }

      .employee-rows-container {
        margin-top: 10px;
        display: flex;
        flex-direction: column;
        flex-grow: 1; /* 유연한 크기 조정 */
      }

      .vacation-info-container {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
      }

      .department-image-container {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        flex-grow: 0; /* 고정된 크기 유지 */
      }

      .department-image {
        max-width: 200px; /* 최대 너비 설정 */
        height: auto; /* 높이 자동 조정 */
      }
    </style>
  </head>
  <c:import url="/WEB-INF/views/include/top_menu.jsp" />
  <body class="sb-nav-fixed">
    <div id="layoutSidenav">
      <c:import url="/WEB-INF/views/include/side_menu.jsp" />
      <div
        id="layoutSidenav_content"
        style="
          padding-top: 20px;
          height: auto;
          background-color: rgb(224, 224, 224);
        "
      >
        <main>
          <div class="container-fluid px-4">
            <div class="row">
              <div class="col-xl-4 col-md-4">
                <div
                  class="card text-black mb-4"
                  style="height: 220px; color: #fff"
                >
                  <div class="card-header">
                    나의 정보
                    <button
                      type="button"
                      class="btn btn-outline-dark"
                      style="
                        float: right;
                        font-size: 10px;
                        font-weight: normal;
                        text-align: center;
                        line-height: 1.1em;
                        border-style: solid;
                        border-color: rgb(190, 190, 190);
                      "
                    >
                      관리
                    </button>
                  </div>
                  <div class="card-body">
                    <ul style="padding: 0px">
                      <li class="employee-main-li">
                        <div class="employee-profile-wrap">
                          <div class="employee-profile-inner-img">
                            <img
                              class="employee-list-profile"
                              src="${root}upload/${employeeInfo.employee_profile_picture}"
                            />
                          </div>
                          <div class="employee-info-wrap">
                            <div class="employee-name1">
                              ${employeeInfo.employee_name}
                              (${employeeInfo.employee_first_name}
                              ${employeeInfo.employee_last_name})
                            </div>
                            <div class="departmentName">
                              <i class="fa-solid fa-user-group"></i> 부서 :
                              ${employeeInfo.department_name}
                            </div>
                            <div class="employee-position1">
                              <i class="fa-solid fa-building-user"></i> 직책 :
                              ${employeeInfo.employee_position}
                            </div>
                            <div class="employee-email">
                              <i class="fa-solid fa-envelope"></i>&nbsp; 이메일
                              : ${employeeInfo.employee_email}
                            </div>
                            <div class="employee-phone">
                              <i class="fa-solid fa-phone"></i>&nbsp; 전화번호 :
                              ${employeeInfo.employee_phone}
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-4">
                <div
                  class="card text-black mb-4"
                  style="height: 220px; color: #fff"
                >
                  <div class="card-header">공지사항</div>
                  <div class="card-body">
                    <table
                      class="table table-hover table-sm text-center align-middle"
                      id="board_list"
                      style="margin-top: -9px"
                    >
                      <tbody>
                        <c:forEach var="obj" items="${list1 }">
                          <tr>
                            <th width="60%">
                              <a
                                href="${root }notice/all_read/read?board_info_idx=1&content_idx=${obj.content_idx}&page1"
                                >${obj.content_subject }</a
                              >
                            </th>
                            <td class="text-right d-none d-xl-table-cell">
                              ${obj.content_date }
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-4">
                <div
                  class="card text-black mb-4"
                  style="height: 220px; color: #fff"
                >
                  <div class="card-header">부서 공지사항</div>
                  <div class="card-body">
                    <table
                      class="table table-hover table-sm text-center align-middle"
                      id="board_list"
                      style="margin-top: -9px"
                    >
                      <tbody>
                        <c:forEach var="obj" items="${list2 }">
                          <tr>
                            <th width="60%">
                              <a
                                href="${root }notice/sub_read/read?board_info_idx=${obj.content_board_idx}&content_idx=${obj.content_idx}&page1"
                                >${obj.content_subject }</a
                              >
                            </th>
                            <td class="text-center d-none d-xl-table-cell">
                              ${obj.content_date }
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-xl-9 col-md-9">
                <div
                  class="card text-black mb-4"
                  style="position: relative; height: 260px; color: #fff"
                >
                  <div class="card-header">근로시간</div>
                  <div class="card-body">
                    <% java.util.Date currentDate = new java.util.Date();
                    java.text.SimpleDateFormat dateFormat = new
                    java.text.SimpleDateFormat("MM월dd일(E)"); String
                    formattedDate = dateFormat.format(currentDate); %>

                    <div style="font-size: 13pt; margin-bottom: 0px">
                      <%=formattedDate%> 기준
                    </div>

                    <div
                      style="color: black; font-size: 17pt; margin-top: 25px"
                    >
                      <p>50시간 34분 <strong>( 5시간 26분 부족 )</strong></p>
                      <p>근무했습니다</p>
                      <p style="font-size: 10pt; color: grey">
                        잔여 기본 근로시간: 100시간 26분 (잔여일수 12일)
                      </p>
                    </div>
                    <div
                      class="card text-black mb-4"
                      style="
                        position: absolute;
                        top: 40px;
                        right: 20px;
                        height: 170px;
                        width: 50%;
                        color: #fff;
                        margin-top: 25px;
                      "
                    >
                      <div class="card-header">출퇴근 시간</div>
                      <div class="card-body">
                        <div
                          id="attendanceTime"
                          style="
                            color: black;
                            font-weight: bold;
                            text-align: center;
                          "
                        >
                          <table
                            id="attendanceTable"
                            style="
                              border-color: transparent;
                              background-color: #e6e6e6;
                              text-align: center;
                              width: 90%;
                              margin: 0 auto;
                              height: 40px;
                            "
                          >
                            <tr>
                              <td style="width: 80px">출근 시간 :</td>
                              <td id="startTimeCell" style="width: 80px"></td>
                              <td style="width: 80px">퇴근 시간 :</td>
                              <td id="endTimeCell" style="width: 80px"></td>
                            </tr>
                          </table>
                        </div>

                        <table
                          style="border-color: transparent; margin-left: 30px"
                        >
                          <tr>
                            <td style="width: 350px; margin-left: 50px">
                              점심시간
                            </td>
                            <td style="text-align: right">12:30~14:00</td>
                          </tr>
                          <tr>
                            <td style="width: 350px">전일 근로 시간</td>
                            <td style="text-align: right">7h 0m 0s</td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 col-md-3">
                <div
                  class="card text-black mb-4"
                  style="height: 260px; color: #fff"
                >
                  <div class="card-header">일일 나의 근태</div>
                  <div class="card-body">
                    <%-- <% java.util.Date currentDate = new java.util.Date();
                    java.text.SimpleDateFormat dateFormat = new
                    java.text.SimpleDateFormat("MM.dd(E)"); String formattedDate
                    = dateFormat.format(currentDate); %> --%>

                    <table class="commute-table">
                      <tr>
                        <td style="width: 80px">
                          12.17(일)<%-- <%=formattedDate%> --%>
                        </td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.18(월)</td>
                        <td>출근(09:00) 퇴근(17:30)</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.19(화)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.20(수)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.21(목)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.22(금)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td style="width: 80px">12.23(토)</td>
                        <td>-</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 col-md-3">
                <div
                  class="card text-black mb-4"
                  style="height: 280px; color: #fff"
                >
                  <div class="card-header">휴가 정보</div>
                  <div class="card-body">
                    <div class="vacation-info-container">
                      <img
                        src="${root}image/vacation.png"
                        alt="휴가 이미지"
                        style="width: 80px; height: 80px; margin-right: 10px"
                      />
                      <div>
                        <span style="font-size: 19px"
                          >올해 사용 가능한 휴가는 <strong>7</strong>일
                          입니다.</span
                        >
                      </div>
                    </div>
                    <table
                      class="table table-bordered table-no-border table-spacing table-centered"
                    >
                      <tr>
                        <th>발생일 수</th>
                        <th>사용일 수</th>
                        <th>잔여일 수</th>
                      </tr>
                      <tr>
                        <td style="font-size: 15pt"><strong>20</strong>일</td>
                        <td style="font-size: 15pt"><strong>13</strong>일</td>
                        <td style="font-size: 15pt"><strong>7</strong>일</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-xl-9 col-md-9">
                <div
                  class="card text-black mb-4"
                  style="height: 280px; color: #fff"
                >
                  <div class="card-header">부서원 근태</div>
                  <div class="card-body">
                    <div class="department-info">
                      <div class="employee-rows-container">
                        <div class="employee-row">
                          <div class="employee-card">
                            <img src="${root}image/userImage1.png" />
                            <div>
                              <div class="employee-position">팀장</div>
                              <div class="employee-name">카리나</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage2.png" />
                            <div>
                              <div class="employee-position">과장</div>
                              <div class="employee-name">윈터</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage3.png" />
                            <div>
                              <div class="employee-position">과장</div>
                              <div class="employee-name">지젤</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage4.png" />
                            <div>
                              <div class="employee-position">대리</div>
                              <div class="employee-name">닝닝</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                        </div>
                        <div class="employee-row">
                          <div class="employee-card">
                            <img src="${root}image/userImage1.png" />
                            <div>
                              <div class="employee-position">대리</div>
                              <div class="employee-name">예지</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage2.png" />
                            <div>
                              <div class="employee-position">사원</div>
                              <div class="employee-name">류진</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage3.png" />
                            <div>
                              <div class="employee-position">사원</div>
                              <div class="employee-name">유나</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                          <div class="employee-card">
                            <img src="${root}image/userImage4.png" />
                            <div>
                              <div class="employee-position">사원</div>
                              <div class="employee-name">채령</div>
                              <div class="employee-status">출근</div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="department-image-container">
                        <img
                          src="${root}image/출퇴근현황.png"
                          class="department-image"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
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
