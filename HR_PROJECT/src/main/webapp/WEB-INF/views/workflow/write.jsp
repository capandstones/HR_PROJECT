<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>계정</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${root}css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>



<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<style type="text/css">

.container {

	/* text-align: center;  */
	
/* 	margin-left: 30%; */
}

.content {

	padding: 10px 0px 0px 70px;

}

.card:hover {
	background-color: #efefef;
	cursor: pointer;
	border-radius: 0.5rem;
}
	
span#fontSubject {
	
	font-size: 25pt;
	font-weight: bold;
	margin-top: 25px;
	margin-left: 5px;
	vertical-align: bottom; 
	
}

div#information {
	
	font-size: 13pt;
	margin-left: 5px;
	margin-top: 10px;

}

img#icon{

	width: 40px;
	height: 40px;
	margin: 5px;
}

div#contents {
	
	font-size: 13pt;
	color: #4d4d4d;
	font-weight: bold;
	margin: 15px 5px;

}

    input.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd;
	width: 650px;
	height: 45px;
	font-weight: bold;
	font-size: 13pt;

}

    textarea.search {
	border-radius: 0.5rem;
	border: 1px solid #dddddd; /* #b3b3b3 */
	width: 650px;
	height : 200px;
	font-weight: bold;
	font-size: 13pt;

}
	
	    span#modalprof{
		width: 45px; 
		height: 45px; 
		border-radius: 40%; 
		/* background-color: #239afe; */
		color: white;
		border: 0px solid #ccced0;
		font-size: 12pt;
		text-align: center;
		padding: 9px 7px;
	}
	
	table#mytable{
    border: 1px solid #ccced0;
   

   /*  border-style: hidden; */

   /*  box-shadow: 1 1 1 1px #ccced0; */
    width: 400px;
   /*  height : 500px;   */
	font-size: 15pt;
	
    
  }
  
  td.td-1 {
  	/* padding :10px 15px; */ /* 이거만 살리기 */
  	/* border : 1px solid; */
  	padding-top: 14.5px;
  	padding-bottom: 14.5px;
  }
  
  td.td-2 {
  	width: 50%;
  }
   
  span#status2{
	width: 60px; 
     height: 30px; 
	background-color: #c1f0c1;
	border-radius: 0.5rem;
	font-weight : bold;
	font-size : 14pt;
	color: #4d4d4d;;
	text-align: center;
	/* border: 1px solid #ccced0; */
	margin: auto;
  }
  
  hr {
    background:#bfbfbf;
    height:1px;
    border:0;
}

input:focus {
	outline : 2px solid #66cc66;
}

textarea:focus {
	outline : 2px solid #66cc66;
}



	
	textarea::placeholder {
    color: #999999;
    font-weight: normal;
	}
	
	
	div#attachArea {
		width: 80%;
		margin: 0 10% 15px 0px;
	}
	
	.filebox .upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid #dddddd;
	    width: 70%;
	    border-radius: 0.4rem;
	    color: #999999;
	}
	
	.filebox .upload-name:focus {
		outline : 2px solid #66cc66;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: 9px 20px;
	    color: #fff;
	    vertical-align: middle;
	    text-align: center;
	    background-color: #496785;
	    cursor: pointer;
	    width : 25%;
	    height: 40px;
	    margin-left: 5px;
	    margin-top: 5px;
	    border-radius: 0.4rem;
	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	

</style>

<script type="text/javascript">

	$(document).ready (function(){
		
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".upload-name").val(fileName);
		});
		

		
 
       
        
	}); // end of $(document).ready (function()
	
			
	//textarea 높이조절 함수		
	function adjustHeight() {
  	  var textEle = $('textarea');
  	  textEle[0].style.height = 'auto';
  	  var textEleHeight = textEle.prop('scrollHeight');
  	  textEle.css('height', textEleHeight);
  	};		
  	

  

            
</script>


<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<c:import url="/WEB-INF/views/include/side_menu.jsp" />

		<div id="layoutSidenav_content"
			style="padding-top: 0x; height: auto; background-color: #fff; justify-content: unset;">
			<c:import url="/WEB-INF/views/workflow/writeheader2.jsp" />
			<main>
				<div class="contai" style="overflow-x: hidden;">
	<form name="wirteFrm" action="${root}workflow/join_pro" method="get" enctype="multipart/form-data">
		<div class="row" style="padding: 0px; justify-content: center; ">
				<div class="col-5 content">
					<img id="icon" src="${root}image/key.svg">
					<span id="fontSubject">계정 신청</span>	
					<div id="contents">
						이름<br>
						<div class="daterange" >
						<input type="text"  class="startdate search" id="daterange" name="employee_name" placeholder="홍길동" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents">
						사번(아이디)<br>
						<div class="daterange" >
						<input type="text"   class="startdate search" id="daterange" name="employee_id" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<input type="hidden" name="department_name" value="${department_name}"/>
					<input type="hidden" name="employee_position" value="대기중"/>
					<div id="contents">
						이메일<br>
						<div class="daterange" >
						<input type="text" class="startdate search" id="daterange" name="employee_email" placeholder="example@example.com" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents">
						주민번호 앞 6자리(초기비밀번호)<br>
						<div class="daterange" >
						<input type="text" maxlength='6' class="startdate search" id="daterange" name="employee_password" placeholder="YYMMDD" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents">
						전화번호<br>
						<div class="daterange" >
						<input type="text" class="startdate search" id="daterange" name="employee_phone"  style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents">
						영문이름(성)<br>
						<div class="daterange" >
						<input type="text" class="startdate search" id="daterange" name="employee_last_name" placeholder="Hong" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents">
						영문이름(이름)<br>
						<div class="daterange" >
						<input type="text" class="startdate search" id="daterange" name="employee_first_name" placeholder="Gildong" style="margin-top:5px; padding-left: 10px; width: 500px; height: 40px; font-size: 13pt;"/>
						</div>
					</div>
					<div id="contents" >
						<button type="submit" class="headerBtn"  style="margin-left:160px; background: #415971; margin-top: 10px; ">
						<div style="text-align: center; padding-bottom: 7px; padding-right: 3px; padding-top: 3px;">
						<i class="bi bi-pencil-fill"></i>
					 	신청하기
					 	</div>
						</button>
					</div>
				</div>		
		</div>
	</form>
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