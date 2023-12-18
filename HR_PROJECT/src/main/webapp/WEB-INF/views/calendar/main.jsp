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

::-webkit-scrollbar {
   width: 10px;
}

::-webkit-scrollbar-thumb {
   background-color: #d9d9d9;
   border-radius: 10px;
}

::-webkit-scrollbar-track {
   background-color: #f2f2f2;
   border-radius: 10px;
}

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
                  title: event.cal_title,
                  start: event.cal_start_date,
                  end: event.cal_end_date,
                  content: event.cal_content,
                  category: event.cal_category,
                  color: getCategoryColor(event.cal_category),
                  extendedProps: {
                     cal_idx: event.cal_idx,
                  }
               };
            });
     
      var employeePosition = "${employee_position}";      
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
                  
                  if(employeePosition === "부장" || employeePosition === "차장" || employeePosition === "사장" || employeePosition === "부사장") {
                      console.log("부장 또는 차장입니다.");
                      $('#scheduleModal').modal('show');
                   }else {
                      alert("권한이 없습니다.");
                   
                   }

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
            //document.getElementById('modalContent').innerText = 'Clicked '+info.dateStr;
            //document.getElementById('scheduleModal').style.display = 'block';
            
            if(employeePosition === "부장" || employeePosition === "차장" || employeePosition === "사장" || employeePosition === "부사장") {
               console.log("부장 또는 차장입니다.");
               $('#scheduleModal').modal('show');
               
               $('#cal_start_date').val(info.dateStr);
               $('#cal_end_date').val(info.dateStr);
               
            }else {
               
            }
  
            
            
         },
         
         eventClick : function(info) {

             var event = info.event;
             var startDate = event.startStr; 
             var endDate = event.endStr ? event.endStr : '';

             var formattedStartDate = new Date(startDate).toLocaleDateString(undefined, { year: 'numeric', month: '2-digit', day: '2-digit' });
             var formattedEndDate = endDate ? new Date(endDate).toLocaleDateString(undefined, { year: 'numeric', month: '2-digit', day: '2-digit' }) : '';
             
             console.log(event);
             
             var cal_idx = event.extendedProps.cal_idx;
             /* var line_name = event.extendedProps.line_name; */
             
             document.getElementById('eventIdx').innerText = cal_idx;
             /* document.getElementById('eventLineName').innerText = line_name; */
             document.getElementById('eventDate').innerText = formattedStartDate + (formattedEndDate ? ' ~ ' + formattedEndDate : '');
             document.getElementById('eventTitle').innerText = event.title;
             document.getElementById('eventCategory').innerText = event.extendedProps.category;
             document.getElementById('eventContent').innerText = event.extendedProps.content;
             
            $('#view_schedule_modal').modal('show');
            
            if (employeePosition === "부장" || employeePosition === "차장" || employeePosition === "사장" || employeePosition === "부사장") {
                $('#view_modify').show();
                $('#view_delete').show();
            } else {
                $('#view_modify').hide();
                $('#view_delete').hide();
            }
            
            //수정
            $('#view_modify').on('click', function() {
               
               if(employeePosition === "부장" || employeePosition === "차장" || employeePosition === "사장" || employeePosition === "부사장") {
                   console.log("부장 또는 차장입니다.");
                   $('#modify_scheduleModal').modal('show');

                    $('#modify_scheduleModal').find('#cal_title').val(event.title);
                    $('#modify_scheduleModal').find('#cal_category').val(event.extendedProps.category);
                    $('#modify_scheduleModal').find('#cal_content').val(event.extendedProps.content);
                    
                    $('#modify_scheduleModal').find('#eventIdx').text(event.extendedProps.cal_idx);
                    /* $('#modify_scheduleModal').find('#eventLineName').text(event.extendedProps.line_name); */
                    $('#modify_scheduleModal').find('#eventDate').text(event.startStr + (event.endStr ? ' - ' + event.endStr : ''));
                    $('#modify_scheduleModal').find('#cal_idx').val(cal_idx);
                    
                    $('#view_schedule_modal').modal('hide');

                }else {
                   alert("권한이 없습니다.");
                }
        
                

               });
            
            
            //취소버튼
            $('#schedule_cancel').on('click', function() {
               
               $('#modify_scheduleModal').modal('hide');
               
               $('#view_schedule_modal').modal('show');
            });

                //삭제
                $('#view_delete').on('click', function(event) {
                   event.preventDefault();
                   
                   if(employeePosition === "부장" || employeePosition === "차장" || employeePosition === "사장" || employeePosition === "부사장") {
                      
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

                       console.log("부장 또는 차장입니다.");
                    }else {
                       alert("권한이 없습니다.");
                    }
                   
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
      
      function getCategoryColor(category) {
          // 선택한 옵션을 가져 오고 데이터 색상 속성에서 색상을 검색합니다.
          var selectedOption = $('#cal_category option:contains(' + category + ')');
          return selectedOption.data('color');
       }

      //일정등록 x버튼
      function closeModalSchedule() {
         /* document.getElementById('scheduleModal').style.display = 'none'; */
         $('#scheduleModal').modal('hide');
      }
      
      document.querySelector('#schedule_close').addEventListener('click', closeModalSchedule);
      document.querySelector('#scheduleModal .close').addEventListener('click',closeModalSchedule);
      
      //수정 x버튼
      function closeModalModify() {
          /* document.getElementById('scheduleModal').style.display = 'none'; */
          $('#modify_scheduleModal').modal('hide');
       }
       
       document.querySelector('#modify_scheduleModal .close').addEventListener('click',closeModalModify);

       //상세정보 x버튼
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
         
         <div style="width: 100%; margin : 0 0 0 auto;">
               <nav class="top-nav border-bottom mb-2" style="width: 100%">
                  <span class="text h2 font-weight-bold" style="margin-left: 180px; ">캘린더</span>
               </nav>
               
               <div class="mb-4 d-flex" style="width: 70%;">
               
               
                  <div style="margin-top: 20px;">
                  <button type="button" class="btn btn-secondary" id="whole" onclick="location.href='${root}calendar/main'"  style="margin-left: 180px;">전체</button>
                  <button type="button" style="color: white; background-color: #415971;" class="btn" id="team" onclick="location.href='${root}calendar/team'">부서</button>
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
                              <option data-color="#CBB2DD">출장</option>
                              <option data-color="#314AD9">회의</option>
                              <option data-color="#F782D6">미팅</option>
                           </select>
                        </div>

                        <div class="form-group">
                           <label for="content">내용<span style="color: red;">*</span></label>
                           <textarea name="cal_content" id="cal_content" class="form-control" rows="5"></textarea>
                        </div>

                  <input type="hidden" id="cal_idx" name="cal_idx" value="">

                     </div>
                     
                     <div class="modal-footer">
                        <button type="button" style="background-color:#415971; color: white; " class="btn btn-secondary" id="schedule_close" >닫기</button>
                        <button type="submit" style="background-color:#46649b; color: white; " class="btn" id="schedule_register" >등록</button>
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
                        <h5 class="modal-title" id="exampleModalLongTitle">일정 수정</h5>
                   
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
                           
                           <!-- <div class="form-group">
                              <label for="category">공개범위<span style="color: red;">*</span></label>
                              <select name="line_name" id="line_name" name="line_name" class="custom-select">
                                 <option>전체</option>
                                 <option>내팀</option>
                              </select>
                
                           </div> -->

                           <div class="form-group">
                              <label for="content">내용<span style="color: red;">*</span></label>
                              <textarea name="cal_content" id="cal_content" class="form-control" rows="5"></textarea>
                           </div>
                           
                           <input type="hidden" id="cal_idx" name="cal_idx" value="">
                           
                       
                        </div>
                        
                        <div class="modal-footer">
                           <button type="button"  style="background-color:#415971; color: white; "  class="btn" id="modify_close" >닫기</button>
                           <button type="submit"  style="background-color:#46649b; color: white; "  class="btn" id="schedule_modify">수정완료</button>
                           <button type="button" style="background-color:#cd426b; color: white; "  class="btn" id="schedule_cancel">취소</button>
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
                           <!-- <p><strong>공개 범위: </strong><span id="eventLineName"></span></p> -->
                           <p><strong>내용: </strong><span id="eventContent"></span></p>
                           <input type="hidden" id="eventIdx"/>
                        </div>
                     </div>
                     
                     <div class="modal-footer">
                        <button type="button" style="background-color:#415971; color: white; " class="btn" id="view_close" >닫기</button>
                        <button type="button" style="background-color:#46649b; color: white; " class="btn" id="view_modify">수정</button>
                        <button type="button" style="background-color:#cd426b; color: white; " class="btn" id="view_delete">삭제</button>
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