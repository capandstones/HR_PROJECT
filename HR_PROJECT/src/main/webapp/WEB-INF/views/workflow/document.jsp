<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전자결재</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>



<style type="text/css">
div.row {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

div.v-line {
	border-left: thin solid #cccccc;
	height: 80% px;
	padding: 0px;
}

span#number {
	color: #00cc00;
	font-weight: bold;
	font-size: 11pt;
}

span#subject {
	font-weight: bold;
	font-size: 13pt;
}

a.link:link {
	color: #cccccc;
}

a:visited {
	text-decoration: none;
	color: #cccccc;
}

a.link:hover {
	text-decoration: none;
	color: gray;
}

a.mylink:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
	color: #cccccc;
}

/* div#leftFirst { overflow: scroll; }	
	div#rightFirst { overflow: scroll; }	 */
div#leftFirst {
	height: 780px;
	padding: 0px;
}

input[type="checkbox"] {
	-webkit-appearance: none;
	position: relative;
	width: 20px;
	height: 20px;
	cursor: pointer;
	outline: none !important;
	border: 2px solid #cccccc;
	border-radius: 2px;
	background: #fbfbfb;
}

input[type="checkbox"]::before {
	content: "\2713";
	position: absolute;
	top: 50%;
	left: 50%;
	overflow: hidden;
	transform: scale(0) translate(-50%, -50%);
	line-height: 1;
}

input[type="checkbox"]:hover {
	border-color: rgba(170, 170, 170, 0.5);
}

input[type="checkbox"]:checked {
	background-color: #2eb82e;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}

input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

label#sub {
	font-size: 13pt;
	padding-top: 0px;
	margin-top: 0px;
	font-weight: bold;
	margin-left: 0px;
}

span#status {
	width: 53px;
	height: 25px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

span#needstatus {
	width: 58px;
	height: 25px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

div#contents:hover {
	background-color: #efefef;
	cursor: pointer;
}

span#profile {
	width: 35px;
	height: 35px;
	border-radius: 40%;
	background-color: #239afe;
	color: white;
	border: 1px solid #ccced0;
	font-size: 9pt;
	text-align: center;
	padding: 7px 5px;
}

span#profile2 { /*테스트용  */
	width: 35px;
	height: 35px;
	border-radius: 40%;
	background-color: purple;
	color: white;
	border: 1px solid #ccced0;
	font-size: 9pt;
	text-align: center;
	padding: 7px 5px;
}

div#modalStatus {
	width: 450px;
	height: 50px;
	background-color: #eafaea;
	border-radius: 15px;
	border: 1px solid #c1f0c1;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: 10px 8px 20px 8px;
	padding-top: 11.5px;
}

div#modalContents {
	margin-top: 40px;
	width: 500px;
	height: 100%;
}

div#modalNumber {
	width: 35px;
	height: 35px;
	border-radius: 50%;
	border: 1px solid #ccced0;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
}

span#modalSubContents {
	width: 500px;
	height: 400%;
	border-radius: 15px;
	border: 1px solid gray;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin-top: 10px;
	margin-left: 10px;
	padding: 20px 10px;
}

/*     span#modalprof{
		width: 40px; 
		height: 40px; 
		border-radius: 40%; 
		background-color: #239afe;
		color: white;
		border: 1px solid #ccced0;
		font-size: 10pt;
		text-align: center;
		padding: 9px 7px;
	} */
span#modalprof {
	width: 45px;
	height: 45px;
	border-radius: 40%;
	background-color: #239afe;
	color: white;
	border: 0px solid #ccced0;
	font-size: 12pt;
	text-align: center;
	padding: 9px 7px;
}

table {
	border: 1px solid #ccced0;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #ccced0;
	width: 380px;
	height: 80px;
}

td {
	
}

td.td-2 {
	width: 50%;
}

td {
	/* padding :10px 15px; */ /* 이거만 살리기 */
	/* border : 1px solid; */
	
}

/*   td.td-2 {
  	width: 50%;
  }	 */

/*   span#status2{
	width: 55px; 
	height: 25px; 
	background-color: #c1f0c1;
	border-radius: 20%; 
	color: black;
	text-align: center;
	 border: 1px solid #ccced0; 
	margin: auto;
  } */
span#status2 {
	width: 60px;
	height: 30px;
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	font-weight: bold;
	font-size: 14pt;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

span#status3 {
	width: 53px;
	height: 25px;
	background-color: #ff9999;
	border-radius: 20%;
	color: black;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
}

div#modal-body {
	height: 100%;
	margin-bottom: 30px;
}

div#startContents {
	height: 638px;
}

span#sizebold {
	font-size: 12pt;
	font-weight: bold;
}

div#parent {
	width: 100%;
	display: flex;
}

div#icon {
	flex: 1
}

div#iconhover:hover {
	width: 63px;
	height: 32px;
	background-color: #efefef;
	cursor: pointer;
	border-radius: 15px;
}

div#child {
	flex: 9
}

button#denial {
	width: 65px;
	height: 35px;
	border: 1px solid #ccced0;
	border-radius: 17.5px;
	background: white;
	margin-top: 30px;
	font-size: 12pt;
	padding: 4px 5px;
	font-weight: bold;
	color: #404040;
}

button#accept {
	width: 75px;
	height: 35px;
	border: 1px solid #415971;
	border-radius: 17.5px;
	background: #415971;
	margin-top: 30px;
	font-size: 12pt;
	padding: 4px 5px;
	font-weight: bold;
	color: white;
}

.bhover:hover {
	background-color: #efefef;
	transition: 0.7s;
}

span.font {
	font-size: 13pt;
	font-weight: bold;
	color: #404040;
}

.p:hover {
	background-color: #efefef;
	transition: 0.7s;
	height: 30px;
	border-radius: 15px;
}

button.bottom-line {
	padding: 0px 0px 10px 0px;
	margin-right: 20px;
	background-color: white;
	border: none;
}

.rightFirst {
	overflow-y: scroll;
	height: 780px;
}

.rightFirst::-webkit-scrollbar {
	width: 10px;
}

.rightFirst::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
	border-radius: 10px;
}

.rightFirst::-webkit-scrollbar-track {
	background-color: #f2f2f2;
	border-radius: 10px;
}

.startContents {
	overflow-y: scroll;
	height: 700px;
}

.startContents::-webkit-scrollbar {
	width: 10px;
}

.startContents::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
	border-radius: 10px;
}

.startContents::-webkit-scrollbar-track {
	background-color: #f2f2f2;
	border-radius: 10px;
}

button#delete {
	float: right;
	margin-right: 45px;
	background-color: white;
	border: 2px solid #bfbfbf;
	border-radius: 5px;
	width: 26px;
	height: 26px;
	padding: 0px;
}

button#delete:hover {
	background-color: #efefef;
}
</style>
<script type="text/javascript">


function goApproval(draft_idx, opinion) {
	
	 var comment = $("#commentInput").val();
    // Ajax 요청을 보내서 서버에서 업데이트를 처리
    $.ajax({
        url: "${root}document/approval/"+draft_idx+"/"+opinion+"/"+comment,
        type: "GET",
        dataType: "text",
        success: function(response) {
        	
        	if(opinion==1){
        		
        		alert("승인되었습니다.");
        		
        		
        	} else if(opinion==2){
        		
        		alert("반려되었습니다.");
        		
        	}
        	
        	location.reload();
        	     
        }
        
    });
};


$(document).ready(function() {
    var draft_info_idx = 0;
    var isCompleteView = false;
    var employee_id =${employee_id};

       
   	
    
    function loadDocumentList() {
        $.ajax({
            url: "${root}document/golist/" + draft_info_idx,
            type: "GET",
            dataType: "json",
            success: function(result) {
                console.log(result);
                var output = '';
                for (var i = 0; i < result.length; i++) {
                    output += "<div style='padding-top: 15px;' id='contents' class='document-item' data-doc-idx='" + result[i].draft_idx + "'>"
                        + "<div style='margin-left: 35px; margin-right: 25px;' class='border-bottom'>"
                        + "<span id='getdocno' >"
                        + "<label for='label-a' id='sub'>" + result[i].draft_subject
                        + "</label>"
                        + "<br>"
                        + "<span style='padding:10px; font-size: 12pt; margin-left:0px; margin-bottom:15px;  display:-webkit-box; -webkit-box-orient: vertical; max-height: 2.0em;  width:330px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;'>"
                        + result[i].draft_text
                        + "</span>"
                        + "<span style='font-size: 11pt; float:right; margin: 5px 8px; color:#737373;'>"
                        + result[i].draft_date.substring(5, 7) + "월 " + result[i].draft_date.substring(8, 10)
                        + "일</span>"
                        + "<br>"
                        + "</span>"
                        + "</div>"
                        + "</div>";
                }
                $('#draftList').html(output);

                // 문서 항목에 대한 클릭 이벤트 핸들러 추가
                $('.document-item').click(function() {
                    var draft_idx = $(this).data('doc-idx');
                    console.log("문서 인덱스가 " + draft_idx + "인 문서를 클릭했습니다.");
                    console.log("아이디 " + employee_id + "입니다.");

                    // Ajax를 사용하여 세부 정보를 가져오기
                    $.ajax({
                        url: "${root}document/getContentInfo/" + draft_idx,
                        type: "GET",
                        dataType: "json",
                        success: function(details) {
                        	
                        	console.log(details);

                        	 var output2 = "<div id='parent'>" +
                             "<div id='child' style='margin: 17px 0px 10px 10px; font-size: 25pt; font-weight: bold;'>"+details.draft_subject+"</div>" +
                             "<div id='icon' style='margin-top: 22px; float: right;'>" +
                             "</div>" +
                             "</div>" +
                             "<div style='padding: 10px; padding-bottom: 20px;' class='border-bottom'>" +
                             "<span id='sizebold'>"+details.draft_writer_name+" ·</span> <span style='font-size: 12pt;'>"+details.department_name+" · </span>" +"<span style='font-size: 12pt;'>"+details.employee_position+"</span>" +
                             "<span style='font-size: 12pt; float: right; color: gray;'>" +
                             "<i class='bi bi-table'></i> &nbsp;&nbsp;" +details.draft_date+
                             "</span>" +
                             "</div>" +
                             "<div style='padding: 10px; padding-bottom: 40px; margin-top: 20px;' class='border-bottom'>" +
                             "<span><i class='bi bi-chat-left-text'></i></span> " +
                             "<span class='font'>&nbsp;&nbsp;요청 내용 </span>" +
                             "<div style='font-size: 12pt; margin-top: 5px; '>" + details.draft_text + "</div>" +
                             "<div style='margin-top: 20px;'>" +
                             "<span><i class='bi bi-calendar4-event'></i></span> " +
                             "<span class='font' style='margin-right: 10px;'>&nbsp;&nbsp;희망기한</span> " +
                             "<span style='font-size: 11pt; color: #262626;'>" + details.draft_hope_date + "</span>" +
                             "</div>"+
                             "</p>" +
                             "<span><i class='bi bi-chat-left-text'></i></span> " +
                             "<span class='font' >&nbsp;&nbsp;히스토리</span>" +
							 "<div style='margin-top:15px;'>";	
                             if(details.looker1_opinion==1){
                            	 output2 += "<div style='display:flex; '>"+
                            	 "<div style='font-weight:bold;'>"+details.looker1_name+"</div><div>님이 승인하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker1_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker1_comment+"</div>"+
                            	 "</div>";   
                            	 }                   	 
                             }
                             if(details.looker1_opinion==2){
                            	 output2 += "<div style='display:flex;'>"+
                            	 "<div style='font-weight:bold;'>"+details.looker1_name+"</div><div>님이 반려하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker1_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker1_comment+"</div>"+
                            	 "</div>";   
                            	 }                      	 
                             }
                             if(details.looker2_opinion==1){
                            	 output2 += "<div style='display:flex; '>"+
                            	 "<div style='font-weight:bold;'>"+details.looker2_name+"</div><div>님이 승인하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker2_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker2_comment+"</div>"+
                            	 "</div>";   
                            	 }                         	 
                             }
                             if(details.looker2_opinion==2){
                            	 output2 += "<div style='display:flex;'>"+
                            	 "<div style='font-weight:bold;'>"+details.looker2_name+"</div><div>님이 반려하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker2_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker2_comment+"</div>"+
                            	 "</div>";   
                            	 }                        	 
                             }
                             if(details.looker3_opinion==1){
                            	 output2 += "<div style='display:flex; '>"+
                            	 "<div style='font-weight:bold;'>"+details.looker3_name+"</div><div>님이 승인하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker3_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker3_comment+"</div>"+
                            	 "</div>";   
                            	 }                         	 
                             }
                             if(details.looker3_opinion==2){
                            	 output2 += "<div style='display:flex;'>"+
                            	 "<div style='font-weight:bold;'>"+details.looker3_name+"</div><div>님이 반려하였습니다.</div>"+
                            	 "</div>";
                            	 if(details.looker3_comment!=null){
                            		 output2 += "<div style='display:flex; margin-bottom:10px;'>"+
                            	 "<div style='font-weight:bold;'>코멘트 : </div><div>"+details.looker3_comment+"</div>"+
                            	 "</div>";   
                            	 }                        	 
                             }
                             output2 += "</div>";
                             if(((employee_id==details.draft_looker_id1)||(employee_id==details.draft_looker_id2)||(employee_id==details.draft_looker_id3))&&(draft_info_idx!=2)){
                            	 output2 += "<div>"+
                            	    "<label for='commentInput' style='font-weight:bold;'>코멘트 :&nbsp;&nbsp</label>"+
                            	   	"<input type='text' id='commentInput' placeholder='코멘트를 입력하세요' style='width:500px; outline:none'>"+
                            		"</div>"+
                            		"<button type='button' id='denial' class='bhover' onclick='goApproval("+details.draft_idx+", 2)'>반려</button>" +
                            	    "&nbsp;" +
                            	    "<button type='button' id='accept' class='bhover' onclick='goApproval("+details.draft_idx+", 1)'>✓승인</button>";
                             }
                             output2 += "</div>";
                             if(details.draft_file!=null){
                            	 output2 += "<div style='padding: 10px; padding-bottom: 40px; margin-top: 20px;' class='border-bottom'>" +
                             "<p class='p' data-bs-toggle='collapse' role='button' aria-expanded='false' aria-controls='collapseExample'>" +
                             "<div><i class='bi bi-paperclip'></i></span>&nbsp; <span class='font'> 첨부파일 </span> <span class='font' style='float: right;'> </div>" +
                             
                             "</p>" +
                             "<img src=\"${root}upload/"+details.draft_file+"\" width=\"60%\"/>	"+
                             "</div>" +
                             "</div>";
                             }
                            
                            $('#rightFirst').html(output2);
                                         	
                                                    
                        }
                    });
                });
                $('.document-item:first').click();
            }
        });
       
    }

    // "진행중", "완료", "반려" 버튼 클릭 이벤트를 처리하는 함수
    function handleButtonClick(buttonId) {
        // 모든 버튼의 스타일 초기화
        $("#mine").css("border-bottom", "none").find("span#subject").css("color", "gray");
        $("#complete").css("border-bottom", "none").find("span#subject").css("color", "gray");
        $("#reject").css("border-bottom", "none").find("span#subject").css("color", "gray");

        // 클릭된 버튼에 대한 스타일 적용
        $("#" + buttonId).css("border-bottom", "4px solid #415971").find("span#subject").css("color", "black");
    }

    // "진행중" 버튼 클릭 이벤트
    $("#mine").click(function() {
        
            draft_info_idx = 0;
            updateButtonStyles();
            loadDocumentList();
            handleButtonClick("mine");
        
    });

    // "완료" 버튼 클릭 이벤트
    $("#complete").click(function() {
        
            draft_info_idx = 1;
            updateButtonStyles();
            loadDocumentList();
            handleButtonClick("complete");
        
    });

    // "반려" 버튼 클릭 이벤트
    $("#reject").click(function() {
        draft_info_idx = 2; // 반려 버튼의 경우 특정 값으로 설정 (원하는 값으로 변경 가능)
        updateButtonStyles();
        loadDocumentList();
        handleButtonClick("reject");
    });

    // 버튼 스타일 업데이트 함수
    function updateButtonStyles() {
        if (isCompleteView) {
            $("#complete").css("border-bottom", "4px solid #415971").find("span#subject").css("color", "black");
            $("#mine").css("border-bottom", "none").find("span#subject").css("color", "gray");
        } else {
            $("#mine").css("border-bottom", "4px solid #415971").find("span#subject").css("color", "black");
            $("#complete").css("border-bottom", "none").find("span#subject").css("color", "gray");
        }
        $("#reject").css("border-bottom", "none").find("span#subject").css("color", "gray");
    }
    
    loadDocumentList();
    updateButtonStyles();
    
    
});
</script>


</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />



<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="height: auto; background-color: #fff;">
			<c:import url="/WEB-INF/views/workflow/header.jsp" />
			<main>
				<div class="">
					<div class="row">


						<div id="leftFirst" class="col-4">

							<div style="padding: 15px 10px 0px 35px;">
								<!--  	<button class="bottom-line" id="wating"
									style="border-bottom: 4px solid #00cc00;"
									onclick="waitingDm(1);">
									<span id=subject class="doc1" style="color: balck;">진행 중
									</span><span id="number" class="num1"> </span>
								</button>-->
								<button class="bottom-line" id="mine" onclick="myDocument(1); " style="border-bottom: 4px solid #415971;">
									<span id=subject class="doc2" style="color: balck;">진행중</span><span
										id="number" class="num2"> </span>
								</button>
								<button class="bottom-line" id="complete"
									onclick="completeDm(1);">
									<span id=subject class="doc3" style="color: gray;">완료</span> <span
										id="number" class="num3"> </span>
								</button>
								<button class="bottom-line" id="reject" onclick="completeDm(2);">
									<span id=subject class="doc3" style="color: gray;">반려</span> <span
										id="number" class="num3"> </span>
								</button>
							</div>
							<div id="documentContent" class="border-top">

								<div id="draftList" class="border-bottom startContents"></div>

							</div>
						</div>


						<!-- read 시작 -->


						<div id="rightFirst" class="col-8 rightFirst border-left"
							style="text-align: left; padding: 20px 20px;">
							<!--
							<div id='parent'>
								<div id='child'
									style='margin: 17px 0px 10px 10px; font-size: 25pt; font-weight: bold;'>제목</div>
								<div id='icon' style='margin-top: 22px; float: right;'>
									<div id='iconhover' onclick='goModify();'>
										<i class='bi bi-pencil-fill' style='font-size: 13pt;'></i>
										&nbsp;<span style='font-size: 13pt;'>수정</span>
									</div>
								</div>
							</div>
							<div style='padding: 10px; padding-bottom: 20px;'
								class='border-bottom'>
								<span id='sizebold'>작성자 ·</span> <span style='font-size: 13pt;'>직위</span>
								<span style='font-size: 12pt; float: right; color: gray;'>
									<i class='bi bi-table'></i> &nbsp;&nbsp; 작성일
								</span>
							</div>
							<div
								style='padding: 10px; padding-bottom: 40px; margin-top: 20px;'
								class='border-bottom'>
								<span><i class='bi bi-chat-left-text'></i></span> 
								<span class='font'>&nbsp;&nbsp;요청 내용 </span>
								<div style='font-size: 12pt; margin-top: 5px;'>dratf_text자리</div>

								<div style='margin-top: 20px;'>
									<span><i class='bi bi-calendar4-event'></i></span> 
									<span class='font' style='margin-right: 10px;'>&nbsp;&nbsp;희망기한</span> 
									<span style='font-size: 11pt; color: #262626;'>희망기한자리</span>
								</div>
								<button type='button' id='denial' class='bhover' onclick='goApproval(2,"+doc_no+","+json.levelno+");'>반려</button>
								&nbsp;
								<button type='button' id='accept' class='bhover' onclick='goApproval(1,"+doc_no+","+json.levelno+");'>✓승인</button>
							</div>

							<div
								style='padding: 10px; padding-bottom: 40px; margin-top: 20px;'
								class='border-bottom'>
								<p class='p' data-bs-toggle='collapse' role='button'
									aria-expanded='false' aria-controls='collapseExample'>
									<span><i class='bi bi-paperclip'></i></span>&nbsp; <span
										class='font'> 첨부파일 </span> <span class='font'
										style='float: right;'> > </span>
								</p>
								<div class='collapse' id='collapseExample'>
									<div class='' style='margin-left: 10px;'>
										<a href=ownload.yolo?doc_no="+json.doc_no+"'>"+json.orgfilename+"</a>
										<br> <img src='/files/workflow/"+json.filename+"'
											style=''>
									</div>
								</div>
							</div>


						</div>
-->
							<!-- read 끝 -->

						</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }assets/demo/chart-area-demo.js"></script>
	<script src="${root }assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }js/datatables-simple-demo.js"></script>

</body>
</html>