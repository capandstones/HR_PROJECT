<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<c:set var='root' value='${pageContext.request.contextPath }/' />

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

      $.ajax({
         url:'/HR_Project/main/events',
         type: 'POST',
         success: function(result) {
            console.log(result);
            
            var events = result.map(function(event){
               return {
                  id: event.cal_idx,
                  line: event.line_name,
                  title: event.cal_title,
                  start: event.cal_start_date,
                  end: event.cal_end_date,
                  content: event.cal_content,
                  category: event.cal_category,
                  /* color:"#FF0000" */
                  extendedProps: {
                     cal_idx: event.cal_idx,
                     line_name: event.line_name,
                  }
               };
            });
            

      
                
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {

      
         height : 900,
         //contentHeight: 'auto',

         headerToolbar : {
            start : 'dayGridMonth,timeGridWeek,timeGridDay today addEventButton',
            center : 'title',
            end : 'prevYear,prev,next,nextYear'
         }, customButtons: {
            addEventButton: {
               text : "일정추가",
               click : function(){
                  $('#scheduleModal').modal('show');
               }
            }
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
         
         events: events,
         
         
         
         dateClick : function(info) {
            //alert('clicked ' + info.dateStr);
            document.getElementById('modalContent').innerText = 'Clicked '+info.dateStr;
            //document.getElementById('scheduleModal').style.display = 'block';
  
            $('#scheduleModal').modal('show');
            
         },
         
         eventClick : function(info) {
            
             var event = info.event;
             var startDate = event.startStr; 
             var endDate = event.endStr ? event.endStr : '';

             console.log(event);
             
             var cal_idx = event.extendedProps.cal_idx;
             var line_name = event.extendedProps.line_name;
             
             document.getElementById('eventIdx').innerText = cal_idx;
             document.getElementById('eventLineName').innerText = line_name;
             document.getElementById('eventDate').innerText = startDate + (endDate ? ' - ' + endDate : '');
             document.getElementById('eventTitle').innerText = event.title;
             document.getElementById('eventCategory').innerText = event.extendedProps.category;
             /* document.getElementById('eventLineName').innerText = event.extendedProps.line_name; */
             document.getElementById('eventContent').innerText = event.extendedProps.content;
             
            $('#view_schedule_modal').modal('show');
            
            //수정
            $('#view_modify').on('click', function() {
        
                $('#view_schedule_modal').modal('hide');
                
                $('#modify_scheduleModal').find('#cal_title').val(event.title);
                $('#modify_scheduleModal').find('#cal_category').val(event.extendedProps.category);
                /* $('#modify_scheduleModal').find('#line_name').val(event.extendedProps.line); */
                $('#modify_scheduleModal').find('#cal_content').val(event.extendedProps.content);
                
                $('#modify_scheduleModal').find('#eventIdx').text(event.extendedProps.cal_idx);
                $('#modify_scheduleModal').find('#eventLineName').text(event.extendedProps.line_name);
                $('#modify_scheduleModal').find('#eventDate').text(event.startStr + (event.endStr ? ' - ' + event.endStr : ''));
                $('#modify_scheduleModal').find('#cal_idx').val(cal_idx);
                
                $('#modify_scheduleModal').modal('show');

               });
            
            $('#schedule_modify').on('click', function() {
               var eventIdx = $('#eventIdx').text();
               
               /* $.ajax({
                  type: 'POST',
                  url: ,
                  data: ,
                  success: function(response) {
                     console.log('수정 성공', response);
                     
                     
                     calendar.getEventById(eventIdx).setTitle(event.title);
                     $('#modify_scheduleModal').modal('hide');
                  },
                  error: function(error) {
                    console.error('오류 발생', error);
                }
                  
               }); */
            });
            
            //취소버튼
            $('#schedule_cancel').on('click', function() {
               
               $('#modify_scheduleModal').modal('hide');
               
               $('#view_schedule_modal').modal('show');
            });

                //삭제
                $('#view_delete').on('click', function() {
               var eventIdx = $('#eventIdx').text(); // 이벤트 인덱스를 숨겨진 필드나 다른 저장 공간에서 가져옵니다.

                $.ajax({
                    type: 'GET',
                    url: '${root}deleteEvent/'+eventIdx, // 실제 이벤트 삭제를 위한 URL로 교체
                    dataType: "text",
                    success: function(response) {
                     console.log('삭제 성공', response);
                     // 옵션으로 이곳에서 캘린더에서 이벤트를 제거할 수 있습니다.
                     calendar.getEventById(eventIdx).remove();
                     $('#view_schedule_modal').modal('hide');
                    },
                    error: function(error) {
                        console.error('오류 발생', error);
                    }
                });
            });
                
            //일정 등록 닫기 버튼
            $('#schedule_close').on('click', function() {
               $('#scheduleModal').modal('hide');
            });
            
            //일정 상세 정보 닫기 버튼
            $('#view_close').on('click', function() {
               $('#view_schedule_modal').modal('hide');
            });
            
            //일정 수정 닫기 버튼
            $('#modify_close').on('click', function() {
               $('#modify_scheduleModal').modal('hide');
            });
 
         },
         
         navLinks : true,
         selectable: true,
         droppable: true,
         editable: false,
         dayMaxEvents : true,
         
      });
      calendar.render();
      
         },
         erro: function(error) {
            console.error('Error:', error);
         }
         
         
      });

      //일정등록 x버튼
      function closeModalSchedule() {
         /* document.getElementById('scheduleModal').style.display = 'none'; */
         $('#scheduleModal').modal('hide');
      }
      
      document.querySelector('#scheduleModal .close').addEventListener('click',closeModalSchedule);
      
      function closeModalModify() {
          /* document.getElementById('scheduleModal').style.display = 'none'; */
          $('#modify_scheduleModal').modal('hide');
       }
       
       document.querySelector('#modify_scheduleModal .close').addEventListener('click',closeModalModify);

       function closeModalView() {
          
          $('#view_schedule_modal').modal('hide');
       }
       
       document.querySelector('#view_schedule_modal .close').addEventListener('click',closeModalView);
       
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
                 
                     <span class="close" onclick="closeModalSchedule()">&times;</span>
                  </div>
                  
                  <%-- <form name="schedule_register" id="schedule_register">============================= --%>
                  <form action="${root }calendar/submit_pro" id="register_Modal" method="post" enctype="multipart/form-data">
                     <div class="modal-body">
                        <div class="form-group" id="daterange-group">
           
                           
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
                           
                   
                        </div>
                        
       
                        
                        <div class="form-group">
                           <label for="content">내용<span style="color: red;">*</span></label>
                           <textarea name="cal_content" id="cal_content" class="form-control" rows="5"></textarea>
                        </div>
                        
                        <div class="form-group">
                           <%-- <input type="hidden" name="employee_id" value="${sessionScope.loginuser.employee_id }"/><!-- 여기에 작성자 아이디 --> --%>
                           <input type="hidden" name="line_name" value="${sessionScope.loginuser.line_name }"/><!-- 여기에 작성자 부서이름 -->
                        </div>
                        
                    
                        
                     </div>
                     
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="schedule_close" >닫기</button>
                        <button type="submit" class="btn btn-primary" id="schedule_register" >등록</button>
                     </div>
                  </form>
                  

                  <p id="modalContent"></p>
               </div>
            </div>
         </div>
         
         
         
         <!-- Modify Modal -->
         
            <div class="modal fade" id="modify_scheduleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
               <div class="modal-dialog modal-dialog-centered" role="document">
               
                  <div class="modal-content">
                  
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">일정</h5>
                   
                        <span class="close" onclick="closeModalModify()">&times;</span>
                     </div>
                     
                     <form action="${root }calendar/modify_pro" id="Modify_Modal" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                           <div class="form-group" id="daterange-group">
 
                              
                              <label for="scheduleDate">기간<span style="color: red;">*</span></label>
                                    <input type="date" id="cal_start_date" name="cal_start_date" class="form-control" required>
                                    <input type="date" id="cal_end_date" name="cal_end_date" class="form-control" required>
                           </div>
                           
                           <div class="form-group" id="daterange-group">
                              <label for="subject">제목<span style="color: red;">*</span></label><br />
                              <input type="text" name="cal_title" class="form-control" id="cal_title"/>
                           </div>
                           
                           <div class="form-group">
                              <label for="category">분류<span style="color: red;">*</span></label>
                              <select name="cal_category"  name="cal_category" class="custom-select" id="cal_category">
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
                
                           </div>
                           
         
                           
                           <div class="form-group">
                              <label for="content">내용<span style="color: red;">*</span></label>
                              <textarea name="cal_content" id="cal_content" class="form-control" rows="5"></textarea>
                           </div>
                           
                           <input type="hidden" id="cal_idx" name="cal_idx" value="">
                           
                       
                        </div>
                        
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" id="modify_close" >닫기</button>
                           <button type="submit" class="btn btn-primary" id="schedule_modify">수정완료</button>
                           <button type="button" class="btn btn-danger" id="schedule_cancel">취소</button>
                        </div>
                     </form>
                     
                  </div>
               </div>
            </div>
            
            <!-- view Modal -->
            <div class="modal fade" id="view_schedule_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
               <div class="modal-dialog modal-dialog-centered" role="document">
                  
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">일정 상세 정보</h5>
                        <span class="close" onclick="closeModalView()">&times;</span>
                     </div>
                     
                     <%-- <form action=""></form> --%>
                     
                     <div class="modal-body">
                        <div id="eventInfo">
                           <p><strong>기간: </strong><span id="eventDate"></span></p>
                           <p><strong>제목: </strong><span id="eventTitle"></span></p>
                           <p><strong>분류: </strong><span id="eventCategory"></span></p>
                           <p><strong>공개 범위: </strong><span id="eventLineName"></span></p>
                           <p><strong>내용: </strong><span id="eventContent"></span></p>
                           <p><strong>IDX: </strong><span id="eventIdx"></span></p>
                        </div>
                     </div>
                     
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="view_close" >닫기</button>
                        <button type="button" class="btn btn-primary" id="view_modify">수정</button>
                        <button type="button" class="btn btn-danger" id="view_delete">삭제</button>
                        <%-- <a href="${root }calendar/delete?cal_idx=${cal_idx}" class="btn btn-danger">삭제</a> --%>
                     </div>
                     
                  </div>
               </div>
            </div>
            
            

         </main>
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