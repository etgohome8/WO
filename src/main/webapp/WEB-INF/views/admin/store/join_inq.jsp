<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">


<title>워킹오더 관리자 페이지</title>

<!-- Favicons -->
<link href="resources/assets/images/admin/logo/logo_only.svg" rel="icon">
<!-- 테이블용 css -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />

</head>

<body>
	<section id="container">
		<!-- 헤더 import -->
		<%@ include file="../inc/admin_header.jsp"%>
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
					<h5 class="centered">${adminSession.a_name}</h5>
					<p class="sidebar-title">설정</p>
					<li class="sub-menu"><a href="../index.admin"> <i
							class="fa fa-h-square"></i> <span>Home</span>
					</a></li>
					<li class="sub-menu"><a id="testid"
						class="dcjq-parent testjirong" href="javacript:;"> <i
							class="fa fa-navicon"></i> <span>All Menu</span>
					</a></li>
					<p class="sidebar-title">마이 메뉴</p>
					<li class="sub-menu"><a id="user-manage"
						href="javascript:void(0);"> <i class="fa fa-user"
							style="font-size: 15px;""></i> <span>&nbsp;회원 관리</span>
					</a>
						<ul class="sub">
							<li><a id="user-mng" href="user_mng.admin">회원 관리</a></li>
							<li><a id="coupon-mng" href="coupon_mng.admin">쿠폰 관리</a></li>
							<li><a id="point-mng" href="point_mng.admin">포인트 관리</a></li>
							<li><a id="connect-hist" href="connect_hist.admin">접속 이력</a></li>
						</ul></li>
					<li class="sub-menu dcjq-parent-li"><a id="store-manage"
						class="active dcjq-parent" href="javascript:;"> <i
							class="fa fa-group" style="font-size: 12px;"></i> <span>매장
								관리</span>
					</a>
						<ul class="sub">
							<li><a id="store-mng" href="store_mng.admin">매장 관리</a></li>
							<li><a id="store-menu" href="pending_menuimg.admin">매장 메뉴 관리</a></li>
							<li><a id="store-pending" href="store_pending.admin">승인
									대기</a></li>
							<li class="active"><a id="join-inq" href="join_inq.admin">입점
									문의</a></li>
						</ul></li>
					<li class="sub-menu"><a id="order-manage" href="javascript:;">
							<i class="fa fa-shopping-cart"></i> <span>주문 관리</span>
					</a>
						<ul class="sub">
							<li><a id="total-order" href="total_order.admin">전체 주문
									관리</a></li>
							<li><a id="store-order" href="store_order.admin">매장별 주문
									관리</a></li>
							<li><a id="cancel-order" href="cancel_order.admin">취소 주문
									관리</a></li>
							
						</ul></li>
					<li class="sub-menu"><a id="board-manage" href="javascript:;">
							<i class="fa fa-pencil-square-o" style="font-size: 13px;"></i> <span>보드
								관리</span>
					</a>
						<ul class="sub">
							<li><a id="notices" href="notices.admin">공지사항</a></li>
							<li><a id="faq-mng" href="faq_mng.admin">FAQ 관리</a></li>

							<li><a id="review-mng" href="review_mng.admin">리뷰 관리</a></li>
							<li><a id="inquiry" href="inquiry.admin">1:1 문의</a></li>
						</ul></li>
					<li class="sub-menu"><a id="page-manage" href="javascript:;">
							<i class="fa fa-sticky-note"></i> <span>페이지 관리</span>
					</a>
						<ul class="sub">
							<li><a id="banner-mng" href="banner_mng.admin">배너 관리</a></li>
							<li><a id="banner-mng" href="drink_recom.admin">오늘의 음료</a></li>
							<li><a id="banner-mng" href="searchbar_mng.admin">검색어 관리</a></li>
							<li><a id="terms-mng" href="terms_mng.admin">약관 관리</a></li>
							<li><a id="policy-mng" href="policy_mng.admin">정책 관리</a></li>
							<li><a id="doc-form" href="doc_form.admin">증빙서류</a></li>
						</ul></li>
					<li class="sub-menu"><a id="mess" href="javascript:;"> <i
							class="fa fa-envelope-open-o" style="font-size: 13px;"></i> <span>메세지
								관리</span>
					</a>
						<ul class="sub">
							
							
							<li><a id="mess-send" href="mess_send.admin">문자 전송</a></li>
							<li><a id="mess-send-group" href="mess_send_group.admin">단체
									문자 전송</a></li>
							<li><a id="mess-hist" href="mess_hist.admin">문자 전송 이력</a></li>
						</ul></li>
					
					<li class="sub-menu"><a id="statistics" href="javascript:;">
							<i class=" fa fa-bar-chart-o"></i> <span>통계</span>
					</a>
						<ul class="sub">
							
							<li><a id="store-sales" href="store_sales.admin">매장별 매출
									통계</a></li>
							
							<li><a id="by-chart" href="by_chart.admin">표로 확인</a></li>
							<li><a id="by-graph" href="by_graph.admin">그래프로 확인</a></li>
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
		<section id="main-content" style="min-height: 700px">
			<!-- allmenu import -->
			
			<section class="wrapper">
				<h3>
					<i class="fa fa-angle-right"></i> 입점 문의
				</h3>

				<!-- 테이블 -->
				<div class="row mt">
					<div class="col-lg-12 cardd mb-4" style="height: fit-content;">
						<div class="card-header">
							<i class="fa fa-table"></i> 문의 목록
						</div>
						<div class="card-body">

							<table id="datatablesSimple">
								<thead>
									<tr>
										<th data-sortable="" style="width: 5%;"><a href="#"
											class="dataTable-sorter">번호</a></th>
										<th data-sortable="" style="width: 10%;"><a href="#"
											class="dataTable-sorter">매장명</a></th>
										<th data-sortable="" style="width: 10%;"><a href="#"
											class="dataTable-sorter">전화번호</a></th>
										<th data-sortable="" style="width: 10%;"><a href="#"
											class="dataTable-sorter">담당자</a></th>
										<th data-sortable="" style="width: 10%;"><a href="#"
											class="dataTable-sorter">이메일</a></th>
										<th data-sortable="" style="width: 15%;"><a href="#"
											class="dataTable-sorter">내용</a></th>
										<th data-sortable="" style="width: 15%;"><a href="#"
											class="dataTable-sorter">문의 등록일</a></th>
										<th data-sortable="" style="width: 10%;"><a href="#"
											class="dataTable-sorter">상태</a></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="storeInquiryList" items="${storeInquiryList}"
										varStatus="vs">
										<span id="f_seq${vs.index}" style="display: none;">${storeInquiryList.f_seq}</span>
										<tr id="inqRow${vs.index}">
											<td>${vs.index +1 }</td>
											<td>${storeInquiryList.f_code}</td>
											<td id="f_tel${vs.index}">${storeInquiryList.f_tel}</td>
											<td>${storeInquiryList.f_name}</td>
											<td>${storeInquiryList.f_email}</td>
											<td>${storeInquiryList.f_title}</td>
											<td>${storeInquiryList.f_regdate.substring(0,16)}</td>
											<td><c:choose>
													<c:when test="${storeInquiryList.f_status eq 'true'}">
														<button class="btn btn-success btn-xs cut" disabled>
															<i class="fa fa-times"></i>
														</button>
													</c:when>
													<c:otherwise>
														<button id="xButton${vs.index}"
															class="btn btn-success btn-xs"
															onclick="changeStatus${vs.index}()">
															<i id="fa-check${vs.index}" class="fa fa-check"></i>
														</button>
													</c:otherwise>
												</c:choose>

												<button onclick="deleteRow${vs.index}()"
													class="btn btn-danger btn-xs">
													<i class="fa fa-trash-o "></i>
												</button></td>
										</tr>
										<script>
										function changeStatus${vs.index}(){
											//연락을 주겠냐고 확인.
											Swal.fire({
												title: "담당자와 연락하셨습니까?",
											    text: "등록 Form을 전송합니다",
											    showCancelButton: true,
											    confirmButtonColor: "#3085d6",
									  		    cancelButtonColor: "#d33",
											    cancelButtonText: "아니오",
											    confirmButtonText: "네"
											}).then((result) => {
											    if (result.isConfirmed) {
											    	//버튼 변화
											        $("#fa-check${vs.index}").addClass("fa-times");
											        $("#fa-check${vs.index}").removeClass("fa-check");
											        $("#xButton${vs.index}").addClass("cut");
											        $("#xButton${vs.index}").attr("disabled",true);
													
													let f_seq= document.getElementById("f_seq${vs.index}").innerText; 
													let f_tel= document.getElementById("f_tel${vs.index}").innerText; 
													 $.ajax({
											             type: "POST",
											             url: "/storeInqAccept.admin",
											             data: JSON.stringify({"f_seq":f_seq,"f_tel":f_tel}),
											             dataType: "json",
											             contentType: "application/json",
											          success:function(data){
											        	  Swal.fire({
											 	    		  icon: "success",
											 	    		  title: "문자 완료",
											 	    		  showConfirmButton: false,
											 	    		  timer: 1500
											 				});
											          },
											          error:function(data){
											             console.log("확인");
											          }
											       }); //ajax 끝 
											    }
											}); //alert 끝
										}//status 바꾸기 끝
										
										function deleteRow${vs.index}(){
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
											    	let f_seq= document.getElementById("f_seq${vs.index}").innerText; 
											    	$.ajax({
											             type: "POST",
											             url: "/deleteJoinInq.admin",
											             data: JSON.stringify({"f_seq":f_seq}),
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
										}
										
										</script>
									</c:forEach>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
				</div>
				<!-- /row -->
				<!-- /row -->
				<!-- INPUT MESSAGES -->

				<!-- /row -->
			</section>
			<!-- /wrapper -->
		</section>
		<!-- /MAIN CONTENT -->
		<!--main content end-->



		<!-- 푸더 import -->
		<%@ include file="../inc/admin_footer.jsp"%>
		<!--footer end-->
	</section>

	<!--script for this page-->


	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@3.2.0/dist/umd/simple-datatables.js"></script>
	<script
		src="resources/assets/js/admin/datatable/datatables-simple-demo.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
