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

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.js"></script>


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
         
         events: function(info, successCallback, failureCallback) {
            
            $.ajax({
               type: "POST",
               url: "",
               dataType: "json",
               data: {
                  cal_start_date: $("#cal_start_date").val(), // 시작일
                    cal_end_date: $("#cal_end_date").val(),     // 종료일
                    cal_title: $("#cal_title").val(),           // 제목
                    cal_category: $("#cal_category").val(),     // 분류
                    line_name: $("#line_name").val(),           // 공개범위
                    cal_content: $("#cal_content").val(),       // 내용
               },
               success: function(data) {
                  
                  var events=[];   
                  data.forEach(function(event) {
                     events.push({
                        title: event.cal_title,
                        start: event.cal_start_date,
                        end: event.cal_end_date
                     });
                  });
                  
                  successCallback(events);
               },
               error: function() {
                  failureCallback();
               }
            });
         },
         
         dateClick : function(info) {
            //alert('clicked ' + info.dateStr);
            document.getElementById('modalContent').innerText = 'Clicked '+info.dateStr;
            //document.getElementById('scheduleModal').style.display = 'block';
            /* var eventTitle = document.getElementById('eventTitle');
            eventTitle.innerText = '이벤트 제목:' + info.dateStr; */   
            $('#scheduleModal').modal('show');
            
         },
         
         navLinks : true,
         selectable: true,
         droppable: true,
         //editable: true,
         dayMaxEvent : true,
         
         /* events: [
            {
               url: '/calendar/events',
               method: 'GET'
               failure: function() {
                  alert('오류')
               }
            }
            
         ], */
         
         events: [
            {
               title: 'Meeting',
                 start: '2023-12-20T14:30:00'
            },
            {
                   title: 'Conference',
                   start: '2023-12-11T10:30:00',
                   end: '2023-12-12T12:30:00'
              },
      
         ],
         
         /* $('#schedule_register').on('click', function(e){
            e.preventDefault();
            
            var formData=$('#schedule_register_form').serialize();
            $.ajax({
               type: 'POST',
               url: '${root}calendar/submit_pro',
               data: formData,
               success: function(){
                  
                  $('#scheduleModal').modal('hide');
               },
               error: function() {
                  alert('일정 등록에 실패했습니다');
               }
            });
         }); */
         
         
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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Datepicker -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<body class="sb-nav-fixed">
   <div id="layoutSidenav">

      <c:import url="/WEB-INF/views/include/side_menu.jsp" />

      <div id="layoutSidenav_content" style="padding-top: 20px; height: auto; background-color: #fff;">

         <main>
         
         <div style="width: 80%; margin : 0 15% 0 15%;">
               <nav class="top-nav border-bottom mb-1" style="width: 70%">
                  <span class="text-muted h4 font-weight-bold">캘린더</span>
               </nav>
               
               <div class="mb-4 d-flex" style="width: 70%;">
                  <select id="kind-calendar" class="custom-select custom-select-sm" style="width: 125px;">
                     <option value="0">전체 조직</option>
                     <option value="1">내가 속한 조직</option>
                  </select>
                  <div style="margin-left: auto; margin-top: 1px">
                     <div class="d-flex">
                        <div class="kind-color mr-1" style="background: #ffd699;"></div>
                        <span class="kind-name mr-3">미팅</span>
                        <div class="kind-color mr-1" style="background: #bfbfbf;"></div>
                        <span class="kind-name mr-3">출장</span>
                        <div class="kind-color mr-1" style="background: #6666ff;"></div>
                        <span class="kind-name mr-3">회의</span>
                        <div class="kind-color mr-1" style="background: #b380ff;"></div>
                        <span class="kind-name">휴가</span>
                     </div>
                  </div>
               </div>
               
               
            </div>
         
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
                  
                  <%-- <form name="schedule_register" id="schedule_register"> --%>
                  <form action="${root }calendar/submit_pro" id="schedule_register" method="post" enctype="multipart/form-data">
                     <div class="modal-body">
                        <div class="form-group" id="daterange-group">
                           <!-- <label for="email">기간<span style="color: red;">*</span></label><br />
                           <input type="text" id="daterange" class="form-control text-center"/>
                           <input type="hidden" name="cal_start_date" class="form-control text-center" />
                           <input type="hidden" name="cal_end_date" class="form-control text-center" /> -->
                           
                              <label for="scheduleDate">기간<span style="color: red;">*</span></label>
                              <input type="date" id="cal_start_date" name="cal_start_date" class="form-control" required>
                              <input type="date" id="cal_end_date" name="cal_end_date" class="form-control" required>
                        </div>
                        
                        <div class="form-group" id="daterange-group">
                           <label for="subject">제목<span style="color: red;">*</span></label><br />
                           <input type="text" id="cal_title" name="cal_title" class="form-control btn-custom" required/>
                        </div>
                        
                        <div class="form-group">
                           <label for="category">분류<span style="color: red;">*</span></label>
                           <select name="cal_category" id="cal_category" name="cal_category" class="custom-select">
                              <option>출장</option>
                              <option>회의</option>
                              <option>미팅</option>
                           </select>
                        </div>
                        
                        <div class="form-group">
                           <label for="category">공개범위<span style="color: red;">*</span></label>
                           <select name="line_name" id="line_name" name="line_name" class="custom-select">
                              <option>전체</option>
                              <option>내팀</option>
                           </select>
                           
                           <!-- <input type="text" class="form-control" id="joinuser" placeholder="일정을 공유할 회원명을 입력하세요" />
                           <div class="displayUserList mt-1"></div>
                           <input type="hidden" name="joinuser" />
                           <input type="hidden" name="joinuser_empno" /> -->
                        </div>
                        
                        <!-- <div class="form-group">
                           <label for="category">장소<span style="color : red;">*</span></label>
                           <input type="text" name="place" class="form-control" />
                        </div> -->
                        
                        <div class="form-group">
                           <label for="content">내용<span style="color: red;">*</span></label>
                           <textarea name="cal_content" id="cal_content" class="form-control" rows="5"></textarea>
                        </div>
                        
                        <div class="form-group">
                           <%-- <input type="hidden" name="employee_id" value="${sessionScope.loginuser.employee_id }"/><!-- 여기에 작성자 아이디 --> --%>
                           <input type="hidden" name="line_name" value="${sessionScope.loginuser.line_name }"/><!-- 여기에 작성자 부서이름 -->
                        </div>
                        
                        <!-- <div id="eventInfo">
                           <p id="eventTitle"></p>
                        </div> -->
                        
                     </div>
                     
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='${root}calendar/main'">닫기</button>
                        <button type="submit" class="btn btn-primary" id="schedule_register" >등록</button>
                     </div>
                  </form>
                  

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
                              <input type="text" name="cal_start_date" class="form-control text-center"/>
                              <input type="text" name="cal_end_date" class="form-control text-center"/>
                           </div>
                           
                           <div class="form-group" id="daterange-group">
                              <label for="subject">제목<span style="color: red;">*</span></label><br />
                              <input type="text" name="title" class="form-control" id="modify_title"/>
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
                              <label for="category">공유부서<span style="color: red;">*</span></label>
                              <select name="share" id="share" name="share" class="custom-select">
                                 <option>전체</option>
                                 <option>내팀</option>
                              </select>
                              
                              <!-- <input type="text" class="form-control" id="joinuser" placeholder="일정을 공유할 회원명을 입력하세요"/>
                              <div class="displayUserList mt-1"></div>
                              <input type="hidden" name="joinuser" />
                              <input type="hidden" name="joinuser_empno"/> -->
                           </div>
                           
                           <!-- <div class="form-group">
                              <label for="category">장소<span style="color: red;">*</span></label>
                              <input type="text" name="place" class="form-control" id="modify_place"/>
                           </div> -->
                           
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