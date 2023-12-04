<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<c:set var='root' value='${pageContext.request.contextPath }/' />
<%String ctxPath = request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link href="${root }css/calendar.css" rel="stylesheet" />

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.9/index.global.min.js'></script>

<style>
body {
   margin: 5px 5px;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 14px;
}

#calendar {
   max-width: 1100px;
   margin: 0 auto;
}

/* modal style */
/*
.modal {
display: none;
position: fixed;
z-index: 1;
overflow: hidden;
background-color: rgba(0,0,0,0.4);

}

.modal-content{
background-color: #fefefe;
margin: 15%;
padding: 20px;
border:1px solid #888;

}

.close {
color: #aaa;
float: right;
font-size: 28px;
font-weight: bold;
width: 30px;
top: 0;
}

.close:hover,
.close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

.modal-content p {
margin-top: 30px;
}

div.modal-content{
width: 600px;
height: 90%;
transform: translate(70%, -30%);
}

div#myModal.modal{
width: 100%;
height: 100%;
padding: 0;

}
*/



</style>

<script>
   document.addEventListener('DOMContentLoaded',function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {

            height : 900,

         headerToolbar : {
            start : 'dayGridMonth,timeGridWeek,timeGridDay today',
            center : 'title',
            end : 'prevYear,prev,next,nextYear'
         },
         footerToolbar : {
            start : '',
            center : '',
            end : 'prev,next'
         },

         googleCalendarApiKey : 'AIzaSyCznPneMB5rfwZDwhFLstuTbxI1ZuqfQsg',

         // KO Holidays
         eventSources : [ 
            {
               googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
               className : 'holiday',
               color : 'white',
               textColor : 'red'
            } 
         ],

         eventClick : function(arg) {

            // prevents current tab from navigating
            arg.jsEvent.preventDefault();

         },

         dateClick : function(info) {
            //alert('clicked ' + info.dateStr);
            document.getElementById('modalContent').innerText = 'Clicked '+info.dateStr;
            document.getElementById('scheduleModal').style.display = 'block';
            $('#scheduleModal').modal('show');
            //$("span#startdate").text(info.dateStr)
            //$("span#enddate").text(info.dateStr)
            $("input[name='cal_start_date']").val(info.dateStr+" 09:00")
            $("input[name='cal_end_date']").val(info.dateStr+" 18:00")
            
            $('input#daterange').daterangepicker({
               timePicker: true,
               timePicker24Hour: true,
               startDate: info.dateStr+"09:00",
               endDate: info.dateStr+"18:00",
               local: {
                  "format": 'YYYY-MM-DD HH:mm',
                  "separator": " ~ ",
                  "applyLabel": "확인",
                  "cancelLabel": "취소",
                  "fromLabel": "From",
                  "toLabel": "To",
                  "customRangeLabel": "Custom",
                  "weekLabel": "W",
                  "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                  "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                  
               }
            },function(start, end, lael) {
               $("input[name='cal_start_date']").val(start.format('YYYY-MM-DD HH:mm'))
               $("input[name='cal_end_date']").val(end.format('YYYY-MM-DD HH:mm'))
            });
            
         },
         select: function(info) {
            $('#scheduleModal').modal('show');
            //$("span#startdate").text(info.dateStr)
            //$("span#enddate").text(info.dateStr)
            $("input[name='cal_start_date']").val(info.startStr+" 09:00")
            $("input[name='cal_end_date']").val(info.endStr+" 18:00")
            $('input#daterange').daterangepicker({
               timePicker: true,
               timePicker24Hour: true,
               starDate: info.startStr+"09:00",
               endDate: info.endStr+"18:00",
               local: {
                  "format": 'YYYY-MM-DD HH:mm',
                  "separator": " ~ ",
                  "applyLabel": "확인",
                  "cancelLabel": "취소",
                  "fromLabel": "From",
                  "toLabel": "To",
                  "customRangeLabel": "Custom",
                  "weekLabel": "W",
                  "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                  "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
               },
            },function(start, end, label) {
               $("input[name='cal_start_date']").val(start.format('YYYY-MM-DD HH:mm'))
               $("input[name='cal_end_date']").val(end.format('YYYY-MM-DD HH:mm'))
            });
            
            alert('selected ' + info.startStr + ' to ' + info.endStr);
            
         },
         /* initialDate: new Date(),
         events:function(info, successaCallback, failureCallback) {
            
            //$.ajax({
               //url:
               //dateType:
               //success:
            //})
         } */
         
         navLinks : true,
         dayMaxEvent : true

      });
      calendar.render();
      
      function closeModal() {
         document.getElementById('scheduleModal').style.display = 'none';
         $('.modal').modal('hide');
      }
      
      document.querySelector('.modal .close').addEventListener('click',closeModal);

   });
   

</script>

<title>Calendar</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">

         <main>
            <div id='calendar'></div>

            <!-- register Modal -->
            <div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
               <div class="modal-dialog modal-dialog-centered" role="document">
            
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="modalTitle">일정등록</h5>
                     <!-- <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button> -->
                     <span class="close" onclick="closeModal()">&times;</span>
                  </div>
                  
                  <form name="schedule_register" id="schedule_register">
                     <div class="modal-body">
                        <div class="form-group" id="daterange-group">
                           <label for="email">기간<span style="color: red;">*</span></label><br />
                           <input type="text" id="daterange" class="form-control text-center"/>
                           <input type="hidden" name="cal_start_date" class="form-control text-center" />
                           <input type="hidden" name="cal_end_date" class="form-control text-center" />
                        </div>
                        
                        <div class="form-group">
                           <label for="category">분류<span style="color: red;">*</span></label>
                           <select name="category" id="category" name="category" class="custom-select">
                              <option>출장</option>
                              <option>회의</option>
                              <option>미팅</option>
                           </select>
                        </div>
                        
                        <div class="form-group">
                           <label for="category">공유자:</label>
                           <input type="text" class="form-control" id="joinuser" placeholder="일정을 공유할 회원명을 입력하세요" />
                           <div class="displayUserList mt-1"></div>
                           <input type="hidden" name="joinuser" />
                           <input type="hidden" name="joinuser_empno" />
                        </div>
                        
                        <div class="form-group">
                           <label for="category">장소<span style="color : red;">*</span></label>
                           <input type="text" name="place" class="form-control" />
                        </div>
                        
                        <div class="form-group">
                           <label for="content">내용<span style="color: red;">*</span></label>
                           <textarea name="content" class="form-control" rows="5"></textarea>
                        </div>
                        
                        <div class="form-group">
                           <input type="hidden" name="employee_id" value="${sessionScope.loginuser.employee_id }"/><!-- 여기에 작성자 아이디 -->
                           <input type="hidden" name="writer_dept_num" value="${sessionScope.loginuser.writer_dept_num }"/><!-- 여기에 작성자 부서번호 -->
                        </div>
                     </div>
                  </form>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                     <button type="button" class="btn btn-primary" id="schedule_register">등록</button>
                  </div>

                  <p id="modalContent"></p>
               </div>
            </div>
         </div>
         <!-- Modify,Delete Modal -->
            <div class="modal fade" id="modify_scheduleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
               <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">일정</h5>
                        <button type="button" class="close" date-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <form name="schedule_modify_delete" id="schedule_modify_delete">
                        <div class="modal-body">
                           <div class="form-group" id="daterange-group">
                              <label for="daterange">기간<span style="color: red;">*</span></label><br />
                              <input type="text" id="daterange" class="form-control text-center"/>
                              <input type="hidden" name="cal_start_date" class="form-control text-center"/>
                              <input type="hidden" name="cal_end_date" class="form-control text-center"/>
                           </div>
                           
                           <div class="form-group" id="daterange-group">
                              <label for="subject">제목<span style="color: red;">*</span></label><br />
                              <input type="text" name="subject" class="form-control" id="modify_subject"/>
                           </div>
                           
                           <div class="form-group">
                              <label for="category">분류<span style="color: red;">*</span></label>
                              <select name="category"  name="category" class="custom-select" id="modify_category">
                                 <option>출장</option>
                                 <option>회의</option>
                                 <option>미팅</option>
                              </select>
                           </div>
                           
                           <div class="form-group">
                              <label for="category">공유자:</label>
                              <input type="text" class="form-control" id="joinuser" placeholder="일정을 공유할 회원명을 입력하세요"/>
                              <div class="displayUserList mt-1"></div>
                              <input type="hidden" name="joinuser" />
                              <input type="hidden" name="joinuser_empno"/>
                           </div>
                           
                           <div class="form-group">
                              <label for="category">장소<span style="color: red;">*</span></label>
                              <input type="text" name="place" class="form-control" id="modify_place"/>
                           </div>
                           
                           <div class="form-group">
                              <label for="content">내용<span style="color: red;">*</span></label>
                              <textarea name="content" id="modify_content" class="form-control" rows="5"></textarea>
                           </div>
                           
                           <div class="form-group">
                              <input type="hidden" name="schedule_no" id="modify_schedule_no"/> <!-- 여기에 작성자 유저아디디 -->
                           </div>
                        </div>
                     </form>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary" id="schedule_modify">수정</button>
                        <button type="button" class="btn btn-danger" id="schedule_delete">삭제</button>
                     </div>
                     
                  </div>
               </div>
            </div>

         </main>
      </div>
   </div>

   <script src="script.js"></script>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="${root }assets/demo/chart-area-demo.js"></script>
   <script src="${root }assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
   <script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>