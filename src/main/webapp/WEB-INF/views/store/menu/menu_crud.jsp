<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>워킹오더 매장관리자 페이지</title>

<!-- Favicons -->
<link href="resources/assets/images/admin/logo/logo_only.svg" rel="icon">
<link href="resources/assets/images/admin/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="resources/assets/js/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--external css-->
<link href="resources/assets/js/admin/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="resources/assets/css/admin/style.css" rel="stylesheet">
<link href="resources/assets/css/admin/style-responsive.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/*메뉴그룹추가버튼*/
/*옵션그룹추가버튼*/
.menu_addMenuGroup {
	width: auto;
	font-size: 15px;
	background-color: #a3d1f14f;
	border: 1px solid #0a5c96a9;
	padding: 10px;
	color: rgba(0, 0, 0, 0.562);
	border-radius: 5px;
	cursor: pointer;
	font-weight: bolder;
}

.menu_addMenuGroup:hover {
	background-color: #0a5c96;
	color: aliceblue;
}

/*메뉴그룹 리스트 css*/
nav {
	width: 100%;
	margin-top: 20px;
}
ul {
	padding: 0;
}
li {
	list-style: none;
	line-height: 50px;
}
.snd_menu {
	background: #efefef;
}
.trd_menu {
	background: #ddd;
}
.sub_menu {
	display: none;
} 
.selec {
	background: rgba(226, 77, 94, 0.733);
	color: #efefef;
}


/*메뉴편집 - 메뉴그룹*/
/*옵션편집 - 옵션그룹*/
.menuGroup {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
}

/*메뉴편집 - 메뉴그룹 - 메뉴한개 */
.menu_one {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
	border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/* 메뉴편집 - 메뉴추가 버튼 */
.menu_addOne {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
}

.menu_addOne h4:hover {
  font-weight: bolder;
}

/* 메뉴편집 - 옵션수정- 옵션그룹 추가 버튼 */
.menu_addOptionGroup {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
}

.menu_addOptionGroup h4:hover{
	font-weight: bolder;
}

/*옵션편집 - + 옵션그룹 추가버튼 클릭시*/
.option_addOptionGroup {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
}

.option_addOptionGroup h4:hover{
	font-weight: bolder;
}

/*옵션편집 - 옵션추가버튼 */
.option_addOne {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
}

.option_addOne h4:hover {
  font-weight: bolder;
}

/*메뉴편집 - 메뉴정보수정 */
.menu_oneInfoUpdate {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*메뉴편집 - 옵션설정 */
.menu_oneOptionUpdate {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*메뉴편집 - 이미지변경 */
.menu_oneImgUpdate {
	display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*메뉴편집 - 메뉴삭제 */
.menu_oneDelete {
	display: block; /* 중요 */
	text-decoration: none;
	color: #fd0000;
	text-align: center;
  font-weight: bolder;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*메뉴편집 - 옵션설정 - 해제버튼 */
.menu_option_undo {
	margin-top: 5px; 
	border: 1px solid red;
	font-weight: bolder;
	color: red;
	background-color: white;
	border-radius: 5px;
	width: 80px;
}

.menu_option_undo:hover {
	background-color: #f56c4d25;
}

/*옵션편집 - 옵션명 및 가격변경 */
.option_oneUpdate {
  display: block; /* 중요 */
	text-decoration: none;
	color: #616161;
	text-align: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*옵션편집 - 옵션삭제 */
.option_oneDelete{
	display: block; /* 중요 */
	text-decoration: none;
	color: #fd0000;
	text-align: center;
  font-weight: bolder;
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/* 메뉴편집 - 메뉴 추가 버튼 */
.menu_addOne {
  border-bottom: 1px solid rgba(0, 0, 0, 0.288);
}

/*옵션편집 - 옵션그룹1개 - 연결메뉴랑 필수여부있는 list 쪽 배경만 바꾼거임그냥*/
.menu_one_plus {
  background-color: rgba(226, 77, 94, 0.233);
}


/*모달*/
.modal-title {
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}

.modal_table {
	width: 100%;
}

#modal_userImg {
	width: 50px;
	height: 50px;
	border-radius: 75%;
}

#modal_userId {
	width: 200px;
}

#modal_userFollow {
	margin: 10px;
	text-align: right;
}

.menu_priceOption {
	border: 0;
	text-align: center;
	width: relative;
	background-color: white;
  font-size: 20px;
}


.menu_priceOption:hover {
	font-weight: bolder;
	color: rgb(218, 60, 12);
}


.add_Option {
	border: 0;
	text-align: center;
	width: relative;
	background-color: white;
  font-size: 20px;
}


.add_Option:hover {
	font-weight: bolder;
	color: rgb(218, 60, 12);
}

.groupAdd_Option {
	border: 0;
	text-align: center;
	width: relative;
	background-color: white;
  font-size: 20px;
}

.groupAdd_Option:hover {
	font-weight: bolder;
	color: rgb(218, 60, 12);
}

.save_Btn {
	width: 100%;
	font-size: 18px;
	color: black;
	background-color: rgba(250, 235, 215, 0.884);
	border: 1px solid #616161dc;
	border-radius: 2px;
}

.save_Btn:hover {
	background-color: rgba(218, 60, 12, 0.637);
	font-weight: bolder;
}

.nextBtn {
	width: 100%;
	font-size: 18px;
	color: black;
	background-color: rgba(250, 235, 215, 0.884);
	border: 1px solid #616161dc;
	border-radius: 2px;
}

.nextBtn:hover {
	background-color: rgba(218, 60, 12, 0.637);
	font-weight: bolder;
}

.beforeBtn {
	width: 100%;
	font-size: 18px;
	color: black;
	background-color: rgba(250, 235, 215, 0.884);
	border: 1px solid #616161dc;
	border-radius: 2px;
}

.beforeBtn:hover {
	background-color: rgba(218, 60, 12, 0.637);
	font-weight: bolder;
}

.img_upload a:hover {
	font-weight: bolder;
}

/*이미지 수정 파일업로드*/
#input-image {
	visibility: hidden;
}
</style>


<script>
 


//메뉴그룹리스트 js
  $(document).ready(function(){
	  
	// input file에 change 이벤트 부여
	   const inputImage = document.getElementById("input-image")
	   inputImage.addEventListener("change", e => {
	       readImage(e.target)
	   })

  $("#main_menu > li > a").click(function(){
	
    $(this).next($('.snd_menu')).slideToggle('fast');
  })
  $(".snd_menu > li > a").click(function(e){
	
    e.stopPropagation();
    $(this).next($('.trd_menu')).slideToggle('fast');
  })
  
  // 버튼 클릭 시 색 변경
  $('li > a').focus(function(){
    $(this).addClass('selec');
  })
  $("li > a").blur(function(){
    $(this).removeClass('selec');
  })
  
 //메뉴편집-메뉴정보수정 클릭시
  $('.menu_oneInfoUpdate').click(function(){
      $('#menu_updateMenuInfo').modal();   
      
  });
  
  //메뉴편집-옵션설정 클릭시
  $('.menu_oneOptionUpdate').click(function(){
      $('#menu_updateOption').modal();  
  });
  
  //메뉴편집-이미지변경 클릭시
  $('.menu_oneImgUpdate').click(function(){
      $('#menu_updateImg').modal();  
  });
  
  //메뉴편집 - 메뉴추가 클릭시
  $('.menu_addOne').click(function(){
      $('#menu_addOne').modal();
  });
  
  //메뉴편집 - 옵션설정 - 옵션그룹추가 클릭시
  $('.menu_addOptionGroup').click(function(){
	$('#menu_addOptionGroup').modal();
  })

    //옵션편집 - + 옵션그룹 추가버튼 클릭시
	$('.option_addOptionGroup').click(function(){
	$('#option_addOptionGroup').modal();
  })

  //메뉴 가격 추가버튼클릭시.
  $('.menu_priceOption').click(function(){
	$('.price_list').append("<div class='row' style='margin-left:5px;' >" 
      		+"<div class='col-lg-5' style='padding:5px;'>" 
      		+"<input class='form-control' style='width:relative; font-size:15px;' type='text' placeholder='가격명'>"
      	    +"</div>"
      	    +"<div class='col-lg-5' style='padding:5px;'>"
      		+"<input class='form-control' style='width:relative; font-size:15px;' type='text' placeholder='가격'>"
      	    +"</div>"
      	    +"<div class='col-lg-2' style='padding:5px;'>"
      		+"<button type='button' onclick='javascript:deleteAlert();' class='btn btn-danger btn-xs' style='float: left; margin-top:7px;'><i class='fa fa-trash-o '></i></button>"
            +  "</div>"                    
      	    +"</div>");  
  })


  //옵션그룹- 옵션 추가버튼클릭시.
  $('.groupAdd_Option').click(function(){
	$('.groupAdd_OptionList').append("	<div class='row' style='margin-left: 5px;'>	<div class='col-lg-5' style='padding: 5px;'>"
                        + "<input class='form-control' style='width: relative; font-size: 15px;' type='text' placeholder='예) 1샷 추가'>"
												+"</div> <div class='col-lg-5' style='padding: 5px;'>	<input class='form-control'"
												+"style='width: relative; font-size: 15px;'	type='text' placeholder='500'></div>"
												+"<div class='col-lg-2' style='padding: 5px;'> <button type='button' onclick='javascript:deleteAlert();'"
												+"class='btn btn-danger btn-xs'	style='float: left; margin-top: 7px;'><i class='fa fa-trash-o '></i>"
												+"</button>	</div></div>");  
  })

  //옵션 - 옵션추가버튼 클릭시
  $('.add_Option').click(function(){
	$('.option_list').append("	<div class='row' style='margin-left: 5px;'>	<div class='col-lg-5' style='padding: 5px;'>"
                        + "<input class='form-control' style='width: relative; font-size: 15px;' type='text' placeholder='예) 1샷 추가'>"
												+"</div> <div class='col-lg-5' style='padding: 5px;'>	<input class='form-control'"
												+"style='width: relative; font-size: 15px;'	type='text' placeholder='500'></div>"
												+"<div class='col-lg-2' style='padding: 5px;'> <button type='button' onclick='javascript:deleteAlert();'"
												+"class='btn btn-danger btn-xs'	style='float: left; margin-top: 7px;'><i class='fa fa-trash-o '></i>"
												+"</button>	</div></div>");  
  })

  //옵션편집 - 옵션명 및 가격변경 클릭시
$('#option_oneUpdate').click(function(){
 $('#option_oneUpdate_modal').modal();
})

  //옵션편집 - 옵션추가버튼 클릭시
  $('.option_addOne').click(function(){
      $('#option_addOne').modal();  
  });

  //메뉴추가 - 1화면에서 다음버튼 클릭시 
  $('#nextBtn').click(function(){
	  var md111 =  document.getElementById("modal111");	 
	  var md222 = document.getElementById("modal222");
	  var md333 = document.getElementById("modal333");

	  console.log("1꺼2켜");
		  md111.style.display="none";
		  md222.style.display="block";
		  document.getElementById("1of3").style.display="none";
		  document.getElementById("2of3").style.display="block";

  });

   //메뉴추가 - 2화면에서 다음버튼 클릭시 
   $('#nextBtn2').click(function(){
	  
	var md111 =  document.getElementById("modal111");	 
	  var md222 = document.getElementById("modal222");
	  var md333 = document.getElementById("modal333");
	  
		console.log("2꺼3켜");
		  md222.style.display="none";
		  md333.style.display="block";
		  document.getElementById("2of3").style.display="none";
		  document.getElementById("3of3").style.display="block";
	  
  });


    //메뉴추가 - 2화면에서 이전버튼 클릭시 
	$('#beforeBtn').click(function(){
	  var md111 =  document.getElementById("modal111");	 
	  var md222 = document.getElementById("modal222");
	  var md333 = document.getElementById("modal333");
	  var beforeBtn = document.getElementById("beforeBtn");
	  console.log("2꺼1켜");
		  md111.style.display="block";
		  md222.style.display="none";
		  document.getElementById("1of3").style.display="block";
		  document.getElementById("2of3").style.display="none";

	  
  });

      //메뉴추가 - 3화면에서 이전버튼 클릭시 
	$('#beforeBtn2').click(function(){
	  var md111 =  document.getElementById("modal111");	 
	  var md222 = document.getElementById("modal222");
	  var md333 = document.getElementById("modal333");
	  var beforeBtn = document.getElementById("beforeBtn");
	
		console.log("3꺼2켜");
		  md222.style.display="block";
		  md333.style.display="none";
		  document.getElementById("2of3").style.display="block";
		  document.getElementById("3of3").style.display="none";
	  
  });

  
})

//메뉴편집 - 메뉴그룹추가버튼 클릭시 모달
function menu_addMenuGroup() {
	$('#addMenuGroup').modal();   
	console.log("fsfs"); 
}

//옵션편집 - 옵션그룹추가버튼 클릭시 모달 
  function option_addOptionGroup() {
  	$('#addOptionGroup').modal();    
  }

function update_ros_modal() {
	$('#update_ros_modal').modal();
}


//메뉴정보수정- 가격 삭제버튼 클릭시 이벤트
/* function deleteRow${"#de"}(){
        Swal.fire({
             title: "정말 삭제하시겠습니까?",
             text: "삭제시 복구할 수 없습니다.",
             icon: "warning",
             showCancelButton: true,
             confirmButtonColor: "#3085d6",
             cancelButtonColor: "#d33",
             confirmButtonText: "네",
             cancelButtonText: "아니오"
        }).then((result) => {
          if (result.isConfirmed) {
             //DB에서 삭제
             let sf_seq= document.getElementById("sf_seq${vs.index}").innerText; 
             $.ajax({
                   type: "POST",
                   url: "/deletePending.admin",
                   data: JSON.stringify({"sf_seq":sf_seq}),
                   dataType: "json",
                   contentType: "application/json",
                success:function(data){
                 //화면에서 삭제
                   document.getElementById("inqRow${vs.index}").style.display = "none"
                },
                error:function(data){
                   console.log("확인");
                }
             }); //ajax 끝 
            Swal.fire(
              "삭제완료",
              "삭제되었습니다.",
              "success"
            );
          }
        });
   } */

   
   
//이미지수정 이미지파일 추가
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
    	console.log("gggg");
        // FileReader 인스턴스 생성
      
        
        var reader = new FileReader();
        // 이미지가 로드가 된 경우
        reader.onload=function(e) {   
        	  console.log("dd");
            var previewImage = document.getElementById("preview-image");
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
          var label = document.getElementById("addImgLabel");
            label.style.display = "none";
            var label2 = document.getElementById("fixImgLabel");
            label2.style.display = "block";
            
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0]);
    }

   
}





</script>


</head>

<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
		<!--header start-->
		<%@ include file="../inc/store_header.jsp"%>
		<!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">
					<p class="centered">
						<a><img src="resources/assets/images/admin/doggy.jpg"
							class="img-circle" width="80"></a>
					</p>
					<h5 class="centered">더리터 위례점</h5>
					<p class="sidebar-title">주문 확인</p>
					<li class="sub-menu"><a href="index.store"> <i
							class="fa fa-h-square"></i> <span>HOME</span>
					</a></li>
					<li class="sub-menu"><a id="store-manage" href="javascript:;">
							<i class="fa fa-group" style="font-size: 12px;"></i> <span>지난
								주문</span>
					</a>
						<ul class="sub">
							<li><a id="store-mng" href="Ooneday.store">당일주문</a></li>
							<li><a id="store-menu" href="Operiod.store">기간주문</a></li>
						</ul></li>

					<p class="sidebar-title">Self Service</p>
					<li class="sub-menu"><a id="user-manage" href="reviews.store">
							<i class="fa fa-user" style="font-size: 15px;"></i> <span>&nbsp;리뷰관리</span>
					</a></li>
					<li class="sub-menu"><a id="store-manage"
						class="active dcjq-parent" href="javascript:;"> <i
							class="fa fa-group" style="font-size: 12px;"></i> <span>메뉴
								관리</span>
					</a>
						<ul class="sub">
							<li><a class="active" id="store-mng" href="CRUD.store">메뉴관리
									(추가 / 수정)</a></li>
							<li><a id="store-menu" href="pumjeol.store">품절 관리</a></li>
						</ul></li>
					<li class="sub-menu"><a id="order-manage" href="javascript:;">
							<i class="fa fa-shopping-cart"></i> <span>매장 정보 관리</span>
					</a>
						<ul class="sub">
							<li><a id="total-order" href="basic.store">기본정보 변경</a></li>
							<li><a id="store-order" href="manage.store">운영 정보 변경</a></li>
						</ul></li>



					<p class="sidebar-title">정산</p>
					<li class="sub-menu"><a id="settlement" href="javascript:;">
							<i class=" fa fa-krw"></i> <span>정산</span>
					</a>
						<ul class="sub">
							<li><a id="pg-comm" href="SOneday.store">오늘 매출</a></li>
							<li><a id="pg-stlmt" href="SPeriod.store">기간 매출 정산</a></li>

						</ul></li>


				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->



		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section id="main-content">

			<section class="wrapper" style="height: 1500px;">
				<div class="col-lg-11" style="min-width: 500px;">
					<div class="card-header" style="font-size: 16px; margin-top: 40px;">
						<div class="calculate_title" style="margin-bottom: 20px;">
							<i class="fa fa-plus-circle" style="font-size: 14px;"></i>
							메뉴관리(추가/삭제)
						</div>

					</div>

					<div class="form-panel"
						style="margin-top: 0; border-radius: 0 0 10px 10px;">
						<form class="form-horizontal style-form" method="get">
							<div class="row content-panel"
								style="border: none; box-shadow: none; padding: 0; margin: 0 5px">


								<div class="panel-body col-lg-12"
									style="padding: 0 11px 11px 11px;">
									<div class="tab-content">

										<div id="menu" class="tab-pane active no-padding">
											<div class="row content-panel"
												style="border: none; box-shadow: none; padding: 0; margin: 0 5px">

												<div
													class="panel-heading col-lg-12 col-md-12 col-sm-12 no-padding"
													style="margin-bottom: 5px;">
													<ul class="nav nav-tabs nav-justified">
														<li class="active"><a data-toggle="tab"
															href="#faq__111">메뉴편집</a></li>
														<li><a data-toggle="tab" href="#faq__222">옵션편집</a></li>
														<li><a data-toggle="tab" href="#faq__333">주문안내/원산지</a>
														</li>


													</ul>
												</div>


												<div class="panel-body col-lg-12">
													<div class="tab-content">

														<!--메뉴편집 start-->
														<div id="faq__111" class="tab-pane active">
															<div class="row" style="text-align: right;">
																<a class="menu_addMenuGroup" onclick="menu_addMenuGroup()"> + 메뉴그룹추가</a>
															</div>
															
															<!--메뉴그룹 추가 modal start-->
															<div class="modal fade" id="addMenuGroup" role="dialog">

																<div class="modal-dialog">

																	<!-- Modal content-->
																	<div class="modal-content">
																		<div class="modal-header">
																			<!-- header -->
																			<h4 class="modal-title">메뉴그룹 추가</h4>
																			<button type="button" class="close"
																				data-dismiss="modal"
																				style="font-size: 20px; color: black;">취소</button>

																		</div>
																		<div class="modal-body">
																			<!-- body -->


																			<table class="modal_table">
																				<ul>
																					<li style="margin: 15px; padding-bottom: 10px;">
																						<h5
																							style="font-size: 15px; font-weight: bolder; color: black;">메뉴그룹명</h5>
																						<div class="row">
																							<div class="col-lg-12">
																								<input class="form-control"
																									style="width: relative; font-size: 15px;"
																									type="text" placeholder="예)스무디">
																							</div>
																						</div>
																					</li>



																					<li>
																						<div class="row">
																							<div class="col-lg-12">
																								<button class="save_Btn"
																									style="margin-top: 50px;">추가하기</button>
																							</div>
																						</div>
																					</li>
																				</ul>

																			</table>
																		</div>
																		<div id="count" value="1"></div>
																	</div>
																</div>
															</div>
															<!--메뉴그룹추가 modal end-->

															<!--메뉴그룹 리스트 start-->
															<nav>
																<ul id="main_menu">
																<c:forEach var="mg" items="${storeMgList}" varStatus="vs">
																	<li><a class="menuGroup" href="javascript:">${mg.mg_name } 
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a> <!--서브메뉴시작-->
																		<ul class="snd_menu sub_menu">
																		
																	
																		<c:forEach var="menu" items="${storeMenuList}" varStatus="vs">
																		<c:if test="${menu.mg_name eq mg.mg_name }">
																			<li><a class="menu_one" href="#">
																					<div class="row">
																						<div class="col-lg-2"
																							style="text-align: left; margin-left: 20px;">
																							<img src="resources/assets/images/cart-1.jpg"
																								style="width: 100px; height: 100px; border: 1px solid rgba(0, 0, 0, 0.692); border-radius: 5px; padding: 10px; margin: 10px;">
																						</div>
																						<div class="col-lg-8"
																							style="text-align: left; margin-top: 5px;">

																							<h4 style="font-weight: bolder; margin-left: 0;">
																							
																							
																								${menu.m_name }
																								
																								
																								</h4>
																							<div class="menu_oneOption">
																								<h6 style="margin-top: 0; font-weight: bolder;">ICE
																									: 2000 원</h6>
																								<h6 style="font-weight: bolder;">HOT : 1500
																									원</h6>
																							</div>

																						</div>

																					</div>

																			</a>
																				<ul class="trd_menu sub_menu">
																					<li><a class="menu_oneInfoUpdate" href="#">메뉴정보수정</a></li>
																					<li><a class="menu_oneOptionUpdate" href="#">옵션설정</a></li>
																					<li><a class="menu_oneImgUpdate" href="#">이미지변경</a></li>
                                          <li><a class="menu_oneDelete" href="#">메뉴삭제</a></li>
																				</ul></li>
																				</c:if>
																				</c:forEach>
																				
																				
																				
																			

                                        <li><a class="menu_addOne" href="#">
																					
                                              <h4 style="color:blue; padding: 10px; margin-right:65px;">+ 메뉴추가</h4>
																					

																			  </a>
																				</li>
																		</ul> <!--서브메뉴끝-->
																		</li>
																		</c:forEach>
																		
																		
																		<!--메뉴추가 모달창-->

																				<div class="modal fade" id="menu_addOne"
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content" style="width: auto;">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">메뉴추가</h4>
																							<h3 style="color: black; font-weight: bolder; text-align: center;">그룹명 : [Coffee]</h3>
																							<h3 style="font-size: 20px;color: black; font-weight: bolder; display: block; text-align: center;" id="1of3">1/3</h3>
																							<h3 style="font-size: 20px;color: black; font-weight: bolder; display: none; text-align: center;" id="2of3">2/3</h3>
																							<h3 style="font-size: 20px;color: black; font-weight: bolder; display: none; text-align: center;" id="3of3">3/3</h3>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body" style=" max-height: 700px; overflow-y: scroll;" >
																							<!-- body -->
																							<div id="modal111" style="display:block;">
																								<table class="modal_table">
																								<ul>
																									<li
																									style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																									<h5
																										style="font-size: 15px; font-weight: bolder; color: black;">메뉴명</h5>
																									<div class="row">
																										<div class="col-lg-12">
																											<input class="form-control"
																												style="width: relative; font-size: 15px;"
																												type="text" value="아메리카노">
																										</div>
																									</div>
																								</li>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px">가격</h5>

																										<div class="price_list">
																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="가격명">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="가격">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>
																										</div>

																										<div class="row" style="margin-left: 5px;">
																											<button class="menu_priceOption">+
																												가격옵션 추가하기</button>
																										</div>
																									</li>
																									<li>

																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn" id="nextBtn">다음</button>
																											</div>
																										</div>
																									</li>

																								</ul>

																							</table>
																								
																								
																							</div>
																							<div id="modal222" style="display: none;">
																								<table class="modal_table">
																									<ul>
																										<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										
																												<div class="option_1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>

																												
																												<div class="option_2" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>

																												
																												<div class="option_3" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>	

																												<div class="row">
																													<a class="option_addOptionGroup" href="#">
																														<h4 style="color:blue; padding: 10px; margin-right:65px;">+ 옵션그룹 추가</h4></a>
																												</div>


																									</li>

																									<li>
																										<div class="row">
																											<div class="col-lg-6">
																												<button class="save_Btn" id="beforeBtn">이전</button>
																											</div>
																											<div class="col-lg-6">
																												<button class="save_Btn" id="nextBtn2">다음</button>
																											</div>
																										</div>

																									</li>

																									</ul>
	
																								</table>
																							</div>



																							
																							<div id="modal333" style="display: none;">
																								

																								<table class="modal_table"  >
																									<ul>
																										<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										
																										<div class="option_2" style="background-color: #6161613d; border-radius: 7px; padding: 10px; height: auto;">
																													<h3 style="font-weight: bolder; color: black;">메뉴 확인</h3>
																													<h5 style="color: black;">입력한 메뉴 정보를 확인하신 후, 적용하시려면 '메뉴 추가' 버튼을 클릭해 주세요</h5>
																												
																											</div>
																											</li>
																											
																											<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																													<div class="row">
																														
																															<h4 style="font-weight: bolder; color: black;">메뉴명</h4>
																															<h4 style="margin-left:10px;">바닐라라떼</h4>
																													</div>	


																													</li>

																													<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																													<div class="row">
																														
																															<h4 style="font-weight: bolder; color: black;">가격</h4>
																															<h4 style="margin-left:10px;">ICE(L) : 2500원</h4>
																															<h4 style="margin-left:10px;">ICE(ML) : 2000원</h4>
																															<h4 style="margin-left:10px;">HOT(ML) : 2000원</h4>
																													</div>	


																													</li>
																													<li
																													style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																																<div class="row">
																																	
																																		<h4 style="font-weight: bolder; color: black; ">옵션</h4>
																																		
																																		
																																	
																																			<ul style=" margin-bottom: 20px;">
																																				<h4 style="margin-left:10px; color: black;">샷추가</h4>
																																				<li style="line-height: 20px; margin-left:10px;"><h4 >+1샷추가 : 500원 </h4> </li>
																																				<li style="line-height: 20px; margin-left:10px;"><h4 >+2샷추가 : 1000원 </h4> </li>
																																				<li style="line-height: 20px; margin-left:10px;"><h4 >+3샷추가 : 1500원 </h4> </li>
																																			</ul>

																																			<ul style=" margin-bottom: 20px;">
																																				<h4 style="margin-left:10px; color: black;">휘핑추가</h4>
																																				<li style="line-height: 20px; margin-left:10px;"><h4>휘핑추가 : 500원</h4> </li>
																																			</ul>
																																		
																																		
																																		
																																</div>	
			
			
																																</li>

																																<li style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																																<div class="addMenu_info" style="padding: 25px; border: 1px solid rgba(0, 0, 0, 0.26); ">
																																	<ul>
																																<li style="list-style-type: disc; line-height: 20px;"> 사장님이 직접 수정하신 사항에 대한책임은 사장님 본인에게 있습니다.</li>
																																<li style="list-style-type: disc; line-height: 20px;"> 잘못 추가한 메뉴로 인한 손해에 대해서 워킹오더는 어떠한 책임도 부담하지 않습니다.</li>
																																<li style="list-style-type: disc; line-height: 20px;"> 추가한 메뉴의 원산지 정보는 "메뉴관리-주문안내/원산지"에서 반드시 업데이트 해주세요.</li>
																																<li style="list-style-type: disc; line-height: 20px;"> 등록한 메뉴 및 그 정보 등이 허위/불법정보에 해당하거나, 상표권을 침해할 경우 워킹오더는 그에 따른 조치를 이행할 수 있습니다.</li>
																																		</ul>
																															</div>
																													</li>

																												
																									</li>

																									<li>
																										<div class="row">
																											<div class="col-lg-6">
																												<button class="save_Btn" id="beforeBtn2">이전</button>
																											</div>
																											<div class="col-lg-6">
																												<button class="save_Btn" id="completeAddMenuBtn">메뉴 추가하기 </button>
																											</div>
																										</div>
																									</li>
																									</ul>
	
																								</table>
																							</div>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																				</div>
																				
																				
																		<!------------- 메뉴편집_메뉴정보수정 Modal start-------------->
																			<div class="modal fade" id="menu_updateMenuInfo"
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">메뉴정보수정</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->


																							<table class="modal_table">
																								<ul>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black;">메뉴명</h5>
																										<div class="row">
																											<div class="col-lg-12">
																												<input class="form-control"
																													style="width: relative; font-size: 15px;"
																													type="text" value="아메리카노">
																											</div>
																										</div>
																									</li>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px">가격</h5>

																										<div class="price_list">
																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="ICE 리터">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="2000">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>


																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="ICE 리터">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="2000">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>


																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="ICE 리터">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="2000">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>
																										</div>

																										<div class="row" style="margin-left: 5px;">
																											<button class="menu_priceOption">+
																												가격옵션 추가하기</button>
																										</div>
																									</li>

																									<li></li>

																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">적용하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																			</div>

																			<!-------------메뉴편집_메뉴정보수정 Modal end--------------->

																			<!-------------메뉴편집_메뉴옵션수정 Modal start-------------->
																			<div class="modal fade" id="menu_updateOption"
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">메뉴옵션수정</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->


																							<table class="modal_table">
																								<ul>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										
																												<div class="option_1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>

																												
																												<div class="option_2" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>

																												
																												<div class="option_3" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; ">
																													<div class="row">
																														<div class="col-lg-8">
																															<h4 style="font-weight: bolder; color: black;">샷추가(선택)</h4>
																															<h5 style="margin-left:10px;">+1샷,+2샷,+3샷</h5>
																														</div>
																														<div class="col-lg-4">
																															<input type="button" class="menu_option_undo" value="해제">
																														</div>
																													</div>
																												</div>	

																												<div class="row">
																													<a class="menu_addOptionGroup" href="#">
																														<h4 style="color:blue; padding: 10px; margin-right:65px;">+ 옵션그룹 추가</h4></a>
																												</div>


																									</li>
																									
																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">적용하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																			</div>

																			<!-------------메뉴편집_메뉴옵션수정 Modal end--------------->

																			<!-------------메뉴편집_메뉴옵션수정_옵션추가 Modal start--------------->
																			<div class="modal fade" id="menu_addOptionGroup"
																			role="dialog" style="max-height: 850px; overflow-y:initial;">

																			<div class="modal-dialog">

																				<!-- Modal content-->
																				<div class="modal-content">
																					<div class="modal-header" >
																						<!-- header -->
																						<h4 class="modal-title">옵션그룹추가</h4>
																						<button type="button" class="close"
																							data-dismiss="modal"
																							style="font-size: 20px; color: black;">취소</button>

																					</div>
																					<div class="modal-body" style="height: 800px; overflow-y: scroll;">
																						<!-- body -->
																						
																						<div class="row">
																							<h5 style="background-color: #61616128; padding: 15px; margin: 10px; border-radius: 4px;">새로운 옵션 그룹이 필요하신 경우 <span style="color: blue; font-weight:bolder;">옵션편집-옵션추가</span>를 이용해주세요.</h5>
																						</div>

																						<label for="chbox1" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																							<div class="row">
																							<div class="col-lg-1"><input id="chbox1" type="checkbox" style="width: 30px; height:30px;" checked></div>
																							<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																								<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																							</div>
																						</div>
																							<div class="row">
																							<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																								<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																								<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																							</div>
																						</div>
																						</label>

																						<label for="chbox2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																							<div class="row">
																							<div class="col-lg-1"><input id="chbox2" type="checkbox" style="width: 30px; height:30px;"></div>
																							<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																								<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																							</div>
																						</div>
																							<div class="row">
																							<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																								<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																								<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																							</div>
																						</div>
																						</label>

																						<label for="chbox3" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																							<div class="row">
																							<div class="col-lg-1"><input id="chbox3" type="checkbox" style="width: 30px; height:30px;"></div>
																							<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																								<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																							</div>
																						</div>
																							<div class="row">
																							<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																								<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																								<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																							</div>
																						</div>
																						</label>

																						<label for="chbox4" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																							<div class="row">
																							<div class="col-lg-1"><input id="chbox4" type="checkbox" style="width: 30px; height:30px;"></div>
																							<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																								<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																							</div>
																						</div>
																							<div class="row">
																							<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																								<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																								<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																							</div>
																						</div>
																						</label>

																						<label for="chbox5" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																							<div class="row">
																							<div class="col-lg-1"><input id="chbox5" type="checkbox" style="width: 30px; height:30px;"></div>
																							<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																								<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																							</div>
																						</div>
																							<div class="row">
																							<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																								<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																								<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																							</div>
																						</div>
																						</label>

																						<div class="row" style="overflow-y: auto;">
																							<div class="col-lg-12">
																								<button class="save_Btn">옵션그룹 수정하기</button>
																							</div>
																						</div>


																						
																					</div>
																					<div id="count" value="1"></div>
																				</div>
																			</div>
																		</div>							
																		<!-------------메뉴편집_메뉴옵션수정_옵션추가 Modal end--------------->
																		
																		<!------------- 메뉴편집_이미지변경 Modal start-------------->
																			<div class="modal fade" id="menu_updateImg"
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">이미지변경</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->


																							<table class="modal_table">
																								<ul>

																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 20px; font-weight: bolder; color: black; margin-top: 20px">
																											멋진 메뉴 이미지로<br>메뉴판을 돋보이게 해주세요!
																										</h5>
																										<h6 style="font-size: 13px;">
																											-이미지를 올리지 않으면 메뉴의 이미지는 자동으로 보여지지 않습니다. <br>
																											-직접 업로드한 이미지는 승인되어야 앱에 보여요.
																										</h6>

																										<div class="image-show" id="image-show"></div>


																										<div class="img_upload">
																											<div class="image-container">
																												<div
																													style="border: 1px solid #6161618c; height: 300px;">

																													<a class="img_uploadFile" href="#"
																														style="text-align: center; width: auto; height: 300px;">
																														<img
																														style="width: 100%; height: 100%; display: none;"
																														id="preview-image" src=""> <label
																														for="input-image" id="addImgLabel"
																														style="font-size: 15px; margin-top: 140px; line-height: 20px; margin-left: 220px; cursor: pointer;">+<br>이미지추가
																													</label>
																													</a> <input type="file" id="input-image"
																														name="chooseFile" accept="image/*">
																												</div>

																											</div>
																											<h6
																												style="font-size: 13px; margin-bottom: 40px;">
																												-접수 건이 폭증할 경우, 처리일이 다소 지연될 수 있습니다. <label
																													for="input-image" id="fixImgLabel"
																													style="float: right; color: blue; cursor: pointer; font-size: 15px; display: none;">이미지
																													다시업로드</label>
																											</h6>

																											<div class="img_info"
																												style="background-color: #6161613d; border-radius: 7px; padding: 10px; height: auto;">
																												<h5
																													style="font-weight: bolder; font-size: 15px; color: black;">직접
																													업로드한 이미지가 바로 승인되는 방법</h5>
																												<ul style="color: black; margin-left: 20px;">
																													<li
																														style="list-style-type: disc; line-height: 20px;">메뉴
																														식별이 가능한 이미지여야 해요.</li>
																													<li
																														style="list-style-type: disc; line-height: 20px;">촬영된
																														이미지를 재촬영한 이미지는 등록할 수 없어요.</li>
																													<li
																														style="list-style-type: disc; line-height: 20px;">임의로
																														어색하게 합성된 이미지는 등록이 어려워요.</li>
																												</ul>
																												<a href="#"
																													style="text-decoration: underline; color: blue;">자세히
																													알아보기</a>
																											</div>


																										</div>


																									</li>

																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">승인 신청하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																			</div>
									
																		<!--옵션설정-옵션그룹추가 눌렀을때 modal-->
																		<div class="modal fade" id="option_addOptionGroup"
																		role="dialog" style="max-height: 850px; overflow-y:initial; width: auto;">

																		<div class="modal-dialog">

																			<!-- Modal content-->
																			<div class="modal-content">
																				<div class="modal-header" >
																					<!-- header -->
																					<h4 class="modal-title">옵션그룹추가</h4>
																					<button type="button" class="close"
																						data-dismiss="modal"
																						style="font-size: 20px; color: black;">취소</button>

																				</div>
																				<div class="modal-body" style="height: 800px; overflow-y: scroll;">
																					<!-- body -->
																					
																					<div class="row">
																						<h5 style="background-color: #61616128; padding: 15px; margin: 10px; border-radius: 4px;">새로운 옵션 그룹이 필요하신 경우 <span style="color: blue; font-weight:bolder;">옵션편집-옵션추가</span>를 이용해주세요.</h5>
																					</div>

																					<label for="chbox1-2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																						<div class="row">
																						<div class="col-lg-1"><input id="chbox1-2" type="checkbox" style="width: 30px; height:30px;" checked></div>
																						<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																							<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																						</div>
																					</div>
																						<div class="row">
																						<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																							<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																							<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																						</div>
																					</div>
																					</label>

																					<label for="chbox2-2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																						<div class="row">
																						<div class="col-lg-1"><input id="chbox2-2" type="checkbox" style="width: 30px; height:30px;"></div>
																						<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																							<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																						</div>
																					</div>
																						<div class="row">
																						<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																							<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																							<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																						</div>
																					</div>
																					</label>

																					<label for="chbox3-2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																						<div class="row">
																						<div class="col-lg-1"><input id="chbox3-2" type="checkbox" style="width: 30px; height:30px;"></div>
																						<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																							<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																						</div>
																					</div>
																						<div class="row">
																						<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																							<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																							<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																						</div>
																					</div>
																					</label>

																					<label for="chbox4-2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																						<div class="row">
																						<div class="col-lg-1"><input id="chbox4-2" type="checkbox" style="width: 30px; height:30px;"></div>
																						<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																							<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																						</div>
																					</div>
																						<div class="row">
																						<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																							<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																							<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																						</div>
																					</div>
																					</label>

																					<label for="chbox5-2" class="menu_addOptionGroup1" style="border:1px solid rgba(0, 0, 0, 0.164); border-radius: 3px; padding: 10px; margin-top: 10px; width: 580px; ">
																						<div class="row">
																						<div class="col-lg-1"><input id="chbox5-2" type="checkbox" style="width: 30px; height:30px;"></div>
																						<div class="col-lg-11"><h3 style="font-size: 20px; color: black; margin: 0; font-weight: bolder;">샷추가</h3>
																							<h6 style="line-height: 10px; padding-bottom: 20;">+1샷, +2샷, +3샷</h6>
																						</div>
																					</div>
																						<div class="row">
																						<div class="option_linkMenu" style="background-color: #2e279627; padding: 10px; margin: 15px;">
																							<h5 style="color: black;"><span style="background-color: #2e27963d; font-weight: bolder;">연결메뉴</span>연결된 메뉴를 확인하세요.</h5>
																							<h6>아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h6>
																						</div>
																					</div>
																					</label>

																					<div class="row" style="overflow-y: auto;">
																						<div class="col-lg-12">
																							<button class="save_Btn">옵션그룹 수정하기</button>
																						</div>
																					</div>
																				</div>
																				<div id="count" value="1"></div>
																			</div>
																		</div>
																	</div>	
																	<!--옵션설정-옵션그룹추가 눌렀을때 modal end-->	
																		
																</ul>
															</nav>
															<!--메뉴그룹 리스트 end-->
														</div>
														<!--메뉴편집 end-->

														<!--옵션편집 start-->
														<div id="faq__222" class="tab-pane">
															
															<div class="row" style="text-align: right;">
																<a class="menu_addMenuGroup" onclick="option_addOptionGroup()"> + 옵션그룹추가</a>
															</div>
															
															<!--------옵션그룹 추가 modal start-------->
															<div class="modal fade" id="addOptionGroup" role="dialog">

																<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">옵션그룹 추가</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->


																							<table class="modal_table">
																								<ul>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black;">옵션그룹명</h5>
																										<div class="row">
																											<div class="col-lg-12">
																												<input class="form-control"
																													style="width: relative; font-size: 15px;"
																													type="text" placeholder="예)샷추가">
																											</div>
																										</div>
																									</li>
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px">옵션</h5>

																										<div class="groupAdd_OptionList">
																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="예) 1샷 추가">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="500">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>
																										</div>
																										<div class="row" style="margin-left: 5px;">
																											<button class="groupAdd_Option">+
																												가격옵션 추가하기</button>
																										</div>
																									</li>



                                                  <li style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										 <h5 style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px;">
                                                        필수여부
                                                    </h5>
                                                    <div class="row" style="line-height:20px; margin-left: 10px;">
                                                    <input type="radio" name="radio1" id="radio1" value="1"  checked>
                                                    <label for="radio1" style="font-size: 15px;"> [필수] 옵션을 반드시 선택해야 주문이 가능해요</label>
                                                  </div>
                                                  <div class="row" style="line-height:20px;  margin-left: 10px;">
                                                    <input type="radio" name="radio1" id="radio2" value="2" >
                                                    <label for="radio2" style="font-size: 15px;"> [선택] 옵션을 선택하지 않아도 주문이 가능해요</label>
                                                  </div>
																									</li>
																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">추가하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
															</div>
															<!--------옵션그룹 추가 modal end-------->

															<!--옵션그룹 리스트 start-->
															<nav>
																<ul id="main_menu">
																	<li><a class="menuGroup" href="javascript:">샷추가
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a> <!--서브메뉴시작-->
																		<ul class="snd_menu sub_menu">

                                      <li class="menu_one_plus"><a href="#">
                                        <div class="row" style="padding: 10px;">
                                            <div class="col-lg-8" style="text-align:left; line-height: 20px;">
                                            <div class="menu_oneOption">
                                              <h4 style="color:black;"><span style="background-color: rgba(226, 77, 94, 0.267); border-radius: 5px; padding: 3px; font-size: smaller;">연결메뉴</span> 수정사항이 다음 메뉴에 동시에 적용됩니다. </h4>
                                              <h5 style="margin-left: 15px; color:rgba(0, 0, 0, 0.801)">아메리카노, 카페라떼, 바닐라라떼, 카푸치노, 카라멜 마끼야또, 카페모카, 커피쉐이크</h5>
                                              
                                              <h4 style="color:black;"><span style="background-color: rgba(226, 77, 94, 0.267); border-radius: 5px; padding: 3px; font-size: smaller;">필수여부</span> [선택] 
                                              <span>
                                                <button class="btn btn-primary btn-xs" id="update_ros" onclick="update_ros_modal()"
																				style="margin-left: 10px; margin-top: 5px;">
																				<i class="fa fa-pencil"></i>
																			</button>
                                              </span> </h4>
                                      
                                            </div>
                                          </div>

                                        </div>

                                    </a>
                                      
                                    
                                    </li>

									<!--------필수여부 수정 모달 start--------->
									<div class="modal fade" id="update_ros_modal" 
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">옵션 필수여부 설정</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->

																							<li style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5 style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px;">
                                                        필수여부
                                                    </h5>
                                                    <div class="row" style="line-height:20px; margin-left: 10px;">
                                                    <input type="radio" name="radio2" id="radio3" value="1"  checked>
                                                    <label for="radio3" style="font-size: 15px;"> [필수] 옵션을 반드시 선택해야 주문이 가능해요</label>
                                                  </div>
                                                  <div class="row" style="line-height:20px;  margin-left: 10px;">
                                                    <input type="radio" name="radio2" id="radio4" value="2" >
                                                    <label for="radio4" style="font-size: 15px;"> [선택] 옵션을 선택하지 않아도 주문이 가능해요</label>
                                                  </div>
																									</li>

																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">적용하기</button>
																											</div>
																										</div>
																									</li>
																							
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																			</div>



									<!--------필수여부 수정 모달 end--------->



                                    

                                             


																			<li><a class="menu_one" href="#">
																					<div class="row" style="padding: 10px;">
                                              <div class="col-lg-8" style="text-align:left; line-height: 20px;">
																							<div class="menu_oneOption">
                                                <h4 style="color:black;">1샷추가</h4>
                                                <ul>
                                                  <li style="list-style-type: disc; line-height: 10px; margin-left: 25px;">
                                                <h5 >500원</h5>
                                                </li>
                                              </ul>
																							</div>
																						</div>

																					</div>

																			</a>
																				<ul class="trd_menu sub_menu">
																					<li><a class="option_oneUpdate" id="option_oneUpdate" href="#">옵션명 및 가격 변경</a></li>
                                          <li><a class="option_oneDelete" href="#">옵션삭제</a></li>
																				</ul>
                                      
                                      </li>



									  <!------------옵션명 및 가격변경 modal start-------------->


									  <div class="modal fade" id="option_oneUpdate_modal" 
																				role="dialog">

																				<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">옵션명 및 가격 수정</h4>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->

																							<table class="modal_table">
																								<ul>
																									
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px">옵션</h5>

																										<div class="option_list">
																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="1샷 추가">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" value="500">
																												</div>
																												
																											</div>
																										</div>
																										
																									</li>
																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">수정하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>

																									
																							
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
																			</div>



									   <!------------옵션명 및 가격변경 modal end-------------->

                                      <li><a class="menu_one" href="#">
                                        <div class="row" style="padding: 10px;">
                                            <div class="col-lg-8" style="text-align:left; line-height: 20px;">
                                            <div class="menu_oneOption">
                                              <h4 style="color:black;">2샷추가</h4>
                                              <ul>
                                                <li style="list-style-type: disc; line-height: 10px; margin-left: 25px;">
                                              <h5 >500원</h5>
                                              </li>
                                            </ul>
                                            </div>
                                          </div>

                                        </div>

                                    </a>
                                      <ul class="trd_menu sub_menu">
                                        <li><a class="option_oneUpdate" href="#">옵션명 및 가격 변경</a></li>
                                        <li><a class="option_oneDelete" href="#">옵션삭제</a></li>
                                      </ul>
                                    
                                    </li>

                                    <li><a class="menu_one" href="#">
                                        <div class="row" style="padding: 10px;">
                                            <div class="col-lg-8" style="text-align:left; line-height: 20px;">
                                            <div class="menu_oneOption">
                                              <h4 style="color:black;">3샷추가</h4>
                                              <ul>
                                                <li style="list-style-type: disc; line-height: 10px; margin-left: 25px;">
                                              <h5 >500원</h5>
                                              </li>
                                            </ul>
                                            </div>
                                          </div>

                                        </div>

                                    </a>
                                      <ul class="trd_menu sub_menu">
                                        <li><a class="option_oneUpdate" href="#">옵션명 및 가격 변경</a></li>
                                        <li><a class="option_oneDelete" href="#">옵션삭제</a></li>
                                      </ul>
                                    
                                    </li>

									<li><a class="option_addOne" href="#">
																					
										<h4 style="color:blue; padding: 10px; margin-right:65px;">+ 옵션추가</h4>
																			  

																		</a>
																		  </li>

																		</ul> <!--서브메뉴끝--></li>


																		<!--------+옵션 추가버튼 클릭시 modal start-------->
															<div class="modal fade" id="option_addOne" role="dialog">

																<div class="modal-dialog">

																					<!-- Modal content-->
																					<div class="modal-content">
																						<div class="modal-header">
																							<!-- header -->
																							<h4 class="modal-title">옵션그룹 추가</h4>
																							<h3 style="color: black; font-weight: bolder; text-align: center;"> 옵션명 : [샷추가]</h3>
																							<button type="button" class="close"
																								data-dismiss="modal"
																								style="font-size: 20px; color: black;">취소</button>

																						</div>
																						<div class="modal-body">
																							<!-- body -->


																							<table class="modal_table">
																								<ul>
																									
																									<li
																										style="border-bottom: 1px solid black; margin: 15px; padding-bottom: 10px;">
																										<h5
																											style="font-size: 15px; font-weight: bolder; color: black; margin-top: 20px">옵션</h5>

																										<div class="groupAdd_OptionList">
																											<div class="row" style="margin-left: 5px;">
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="예) 1샷 추가">
																												</div>
																												<div class="col-lg-5" style="padding: 5px;">
																													<input class="form-control"
																														style="width: relative; font-size: 15px;"
																														type="text" placeholder="500">
																												</div>
																												<div class="col-lg-2" style="padding: 5px;">
																													<button type="button"
																														onclick="javascript:deleteAlert();"
																														class="btn btn-danger btn-xs"
																														style="float: left; margin-top: 7px;">
																														<i class="fa fa-trash-o "></i>
																													</button>
																												</div>
																											</div>
																										</div>
																										<div class="row" style="margin-left: 5px;">
																											<button class="groupAdd_Option">+
																												가격옵션 추가하기</button>
																										</div>
																									</li>



                                                  
																									<li>
																										<div class="row">
																											<div class="col-lg-12">
																												<button class="save_Btn">옵션 추가하기</button>
																											</div>
																										</div>
																									</li>
																								</ul>

																							</table>
																						</div>
																						<div id="count" value="1"></div>
																					</div>
																				</div>
															</div>
															<!--------+옵션 추가 버튼 클릭시 modal end-------->



																	<li><a class="menuGroup" href="#">휘핑추가
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="float: right; margin-right: 10px; margin-top: 5px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a>

																		<ul class="snd_menu sub_menu">
																			<li><a class="menu_one" href="#">
																					<div class="row">
																						<div class="col-lg-2"
																							style="text-align: left; margin-left: 20px;">
																							<img src="resources/assets/images/cart-1.jpg"
																								style="width: 100px; height: 100px; border: 1px solid rgba(0, 0, 0, 0.692); border-radius: 5px; padding: 10px; margin: 10px;">
																						</div>
																						<div class="col-lg-8"
																							style="text-align: left; margin-top: 5px;">

																							<h4 style="font-weight: bolder; margin-left: 0;">고구마라떼</h4>
																							<div class="menu_oneOption">
																								<h6 style="margin-top: 0; font-weight: bolder;">ICE
																									: 2000 원</h6>
																								<h6 style="font-weight: bolder;">HOT : 1500
																									원</h6>
																							</div>

																						</div>

																					</div>

																			</a>
																				<ul class="trd_menu sub_menu">
																					<li><a class="menu_oneUpdate" href="#">메뉴정보수정</a></li>
																					<li><a class="menu_oneUpdate" href="#">옵션설정</a></li>
																					<li><a class="menu_oneUpdate" href="#">이미지변경</a></li>
																				</ul></li>
																			<li><a class="menu_one" href="#">
																					<div class="row">
																						<div class="col-lg-2"
																							style="text-align: left; margin-left: 20px">
																							<img src="resources/assets/images/cart-1.jpg"
																								style="width: 100px; height: 100px; border: 1px solid rgba(0, 0, 0, 0.692); border-radius: 5px; padding: 10px; margin: 10px;">
																						</div>
																						<div class="col-lg-8"
																							style="text-align: left; margin-top: 8px;">

																							<h4 style="font-weight: bolder; margin-left: 0;">민트초코라떼</h4>
																							<div class="menu_oneOption">
																								<h6 style="margin-top: 0; font-weight: bolder;">ICE
																									: 2000 원</h6>
																								<h6 style="font-weight: bolder;">HOT : 1500
																									원</h6>
																							</div>

																						</div>

																					</div>

																			</a>
																				<ul class="trd_menu sub_menu">
																					<li><a class="menu_oneUpdate" href="#">메뉴정보수정</a></li>
																					<li><a class="menu_oneUpdate" href="#">옵션설정</a></li>
																					<li><a class="menu_oneUpdate" href="#">이미지변경</a></li>
																				</ul></li>
																		</ul></li>






																	<li><a class="menuGroup" href="#">연하게 or 진하게 추가요청
 																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a></li>
																	<li><a class="menuGroup" href="#">시럽추가(설탕시럽-무료)
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a></li>
																	<li><a class="menuGroup" href="#">시럽추가(유료)
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a></li>
																	<li><a class="menuGroup" href="#">맛선택(주스)
																			<button type="button"
																				onclick="javascript:deleteAlert();"
																				class="btn btn-danger btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-trash-o "></i>
																			</button>
																			<button class="btn btn-primary btn-xs"
																				style="margin-top: 5px; float: right; margin-right: 10px;">
																				<i class="fa fa-pencil"></i>
																			</button>
																	</a></li>
                                  <li><a class="menuGroup" href="#">맛선택(티)
                                    <button type="button"
                                      onclick="javascript:deleteAlert();"
                                      class="btn btn-danger btn-xs"
                                      style="margin-top: 5px; float: right; margin-right: 10px;">
                                      <i class="fa fa-trash-o "></i>
                                    </button>
                                    <button class="btn btn-primary btn-xs"
                                      style="margin-top: 5px; float: right; margin-right: 10px;">
                                      <i class="fa fa-pencil"></i>
                                    </button>
                                </a></li>
                                <li><a class="menuGroup" href="#">맛선택(마카롱)
                                  <button type="button"
                                    onclick="javascript:deleteAlert();"
                                    class="btn btn-danger btn-xs"
                                    style="margin-top: 5px; float: right; margin-right: 10px;">
                                    <i class="fa fa-trash-o "></i>
                                  </button>
                                  <button class="btn btn-primary btn-xs"
                                    style="margin-top: 5px; float: right; margin-right: 10px;">
                                    <i class="fa fa-pencil"></i>
                                  </button>
                              </a></li>
																</ul>
															</nav>
															<!--메뉴그룹 리스트 end-->
														
														
														
														
														</div>
														<!--옵션편집 end-->

														<!--주문안내/원산지 편집 start-->
														<div id="faq__333" class="tab-pane">
															<div class="info_order" style="border:1px solid rgba(0, 0, 0, 0.281);  padding: 20px; margin:10px ;">
																<h3 style="font-weight: bolder; color: black;">주문안내</h3>
																<h4>
																해야하나모르겠지만그냥하는걸로생각해볼까 모르겠다 흠 어쩌지 
																여기는 대충 그냥 뭐랄까 우리카페는 뭐가유명해요 머가 맛있어요 많이찾아주세요 
																뭐이런내용들어가는건데 해야하나말아야하나 모르겠다~
															</h4>
															</div>

															<div class="onesanji" style="border:1px solid rgba(0, 0, 0, 0.281);  padding: 20px; margin:10px ;">
																<h3 style="font-weight: bolder; color: black;">원산지</h3>
																<h4>이거는 필수긴한데 해야하나 모르겠다 뭐일단은 예를들면...<br>
																	아메리카노 원두(브라질, 콜롬비아, 과테말라 외 2종) 카페라떼 원두(브라질, 콜롬비아, 과테말라), 
																	멸균우유(국산원유100%) 카푸치노 원두(브라질, 콜롬비아, 과테말라 외 2종), 멸균우유(국산원유100%), 
																	시나몬파우더[갈색설탕,계피분말(베트남산),코코아버터(싱가포르산)] 바닐라라떼 원두(브라질, 콜롬비아, 과테말라 외 2종), 
																	멸균우유(국산원유100%), 설탕시럽(국산),바닐라시럽(이탈리아산) 헤이즐넛라떼 원두(브라질, 콜롬비아, 과테말라 외 2종), 멸균우유(국산원유100%), 
																	설탕시럽(국산),헤이즐넛시럽(이탈리아산) 카라멜마끼아또 원두(브라질, 콜롬비아, 과테말라 외 2종), 멸균우유(국산원유100%), 설탕시럽(국산),
																	카라멜소스(탈지분유(국산),기타과당,가공버터(호주산),정제소금(국산) 카페모카 원두(브라질, 콜롬비아, 과테말라 외 2종), 멸균우유(국산원유100%),
																	설탕시럽(국산),초코소스[코코아분말(네덜란드산),코코아매스(싱가포르산)] 연유라떼 원두(브라질, 콜롬비아, 과테말라 외 2종), 멸균우유(국산원유100%),
																	설탕시럽(국산),연유[혼합탈지분유(탈지분유,탈염유청퍼미에이트/네덜란드산,유크림(이탈리아산)유당(미국산) 티라미수라떼 원두(브라질, 콜롬비아, 과테말라 외 2종), 
																	멸균우유(국산원유100%),설탕시럽(국산),체다치즈분말(가공치즈,산도조철제)/덴마크산, 유크림(국산),가당연유(국산),
																	마스카포네치즈분말(호주산)커피농축액(콜롬비아산),코코아분말(싱가포르산),정제소금(국산) 콜드브루 콜드브루원액(콜롬비아, 탄자니아, 브라질) 
																	콜드브루라떼 콜드브루원액(콜롬비아, 탄자니아, 브라질),멸균우유(국산원유100%) 딥초코라떼 멸균우유(국산원유100%),
																	설탕시럽(국산),코코아분말(네덜란드산,브라질,싱가포르산) 녹차라떼 멸균우유(국산원유100%),가루녹차(국산),식물성크림(국산),
																	식물성유지(인도네시아,필리핀,말레이시아),유청분말(국산),혼합탈지분유(네덜란드산),정제소금(국산) 자색고구마라떼 멸균우유(국산원유100%), 
																	자색고구마분말(중국산),식물성크림(국산),식물성유지(인도네시아,필리핀,말레이시아),유청분말(국산) 밀크티 멸균우유(국산원유100%),
																	홍차분말(인도산), 민트초코라떼 멸균우유(국산원유100%),다크컴파운드칩스(싱가포르산),식물성크림(국산),
																	식물성유지(인도네시아,필리핀,말레이시아,유청분말(국산),혼합탈지분유(네덜란드산)분말유크림(호주산),유당(미국산),
																	정제소금(국산),가루녹차(국산),인스턴트커피(베트남산),페퍼민트추출분말(독일)민트시럽(이탈리아산),모히또민트시럽(이탈리아산) 
																	얼그레이 홍차엽(스리랑카산) 캐모마일 캐모마일꽃(크로아티아산) 페퍼민트 서양박하잎(외국산:독일산,이집트산,폴란드산 등) 
																	히비스커스 히비스커스꽃잎(나이지리아산) 유자티 유자당절임(국산),사양벌꿀(국산)정제염(국산),라임(베트남) 자몽티 설탕시럽(국산),
																	자몽시럽(프랑스),자몽농축액(미국산) 레몬티 레몬당절임(미국산),사양벌꿀(국산),정제소금(국산),레몬시럽(이탈리아) 딸기주스 설탕시럽(국산),
																	딸기(국산) 사과주스 설탕시럽(국산),사과농축액(칠레산) 망고주스 설탕시럽(국산),망고베이스(인도산),망고(베트남산) 자몽주스 설탕시럽(국산),
																	자몽농축액(미국산),자몽주스(미국산) 레몬에이드 레몬농축액(아르헨티나산),레몬시럽(이탈리아),설탕시럽(국산),라임(베트남),
																	사이다(국산) 모히또에이드 설탕시럽(국산),라임청(베트남산),정제소금(국산),레몬농축과즙액(아르헨티나산),라임(프랑스),모히또민트(이탈리아),
																	사이다(국산),라임슬라이스(베트남) 유자에이드 유자당절임(국산),사양벌꿀(국산)정제염(국산),설탕시럽(국산),사이다(국산),라임슬라이스(베트남) 
																	청포도에이드 설탕시럽(국산),백포도농축액(아르헨티나산),청포도퓨레(칠레산),포도(국산),청포도(스페인산),청포도농축액(이탈리아산),탄산수(국산) 
																	자몽에이드 설탕시럽(국산),자몽과즙농축액(미국산)자몽펄프셀(미국산),자몽시럽(프랑스),탄산수(국산) 복숭아숭숭 홍차추출분말(칠레),복숭아과즙분날
																	......</h4>
															</div>


														</div>
														<!--주문안내/원산지 편집 end-->





													</div>

												</div>
											</div>


										</div>


									</div>

								</div>
							</div>


						</form>
					</div>
				</div>
			</section>
			<!-- /wrapper -->
		</section>
		<!-- /MAIN CONTENT -->
		<!--main content end-->



		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				<p>
					&copy; Copyrights <strong>WalkingOrder</strong>. All Rights
					Reserved
				</p>
				<a href="../index.html#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>
	<!-- js placed at the end of the document so the pages load faster -->

	<script src="resources/assets/js/admin/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/admin/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="resources/assets/js/admin/jquery.ui.touch-punch.min.js"></script>
	<script class="include" type="text/javascript"
		src="resources/assets/js/admin/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/assets/js/admin/jquery.scrollTo.min.js"></script>
	<script src="resources/assets/js/admin/jquery.nicescroll.js"
		type="text/javascript"></script>
	<!--common script for all pages-->
	<script src="resources/assets/js/admin/common-scripts.js"></script>
	<!--script for this page-->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>



