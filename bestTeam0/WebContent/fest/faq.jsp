<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
<style type="text/css">
b{
	font-size:25px;
	font-color:gold;
}

.nav-link{
	backgound-color:#c49B63;
}
.nav-link active{
	backgound-color:#c49B63;
}


</style>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes"
	rel="stylesheet">

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<%   
// --------------------- faq.jsp 는 전체 질문 게시판 ,  faqDelivery.jsp 는 배송관련 ,  faq
%>
	<header>
	<jsp:include page="../inc/header.jsp"></jsp:include>
</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(../images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">F A Q</h1>
						<h3 class="mb-3 mt-5 bread">자주 묻는 질문</h3>
						
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco=section">
    <div class="container">
    <div class="row d-flex">
    <div class="blog-entry align-self-stretch">
    <br><br>
  <h1> &nbsp;&nbsp;&nbsp; F A Q </h1>
    <br>
<!--     <p class="breadcrumbs">  -->
<!-- 					<span class="mr-2"><a href="faq.jsp"><b>배송 관련</b> </a></span>| <span><a  -->
<!-- 							href="faq2.jsp"> 결제 관련 </a></span>|<span><a href="faq3.jsp"> 교환/환불 관련 </a></span>  -->
<!--  					</p> -->
				<div class="col-md-12 nav-link-wrap mb-5">
					<div class="nav ftco-animate nav-pills justify-content-center fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">

					<a href="faq.jsp" class="nav-link active">배송관련</a>
					<a href="faq2.jsp" class="nav-link" >결제/환불관련</a>
					<a href="faq3.jsp" class="nav-link">교환/반품 관련</a>

					</div>
				</div>
 					
   <table class="table thead-light">
   <tr><td>1</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">Q &nbsp;주문한 상품이 언제 도착하는지 알고싶어요  </a><div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 로그인하셔서 주문조회를 하시면 송장번호로  배송추적이 가능합니다.
											보통 일반택배사 기준 주말제외 3~5일정도 소요됩니다.

								</div>
							</div></td></tr>
    <tr><td>2</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse2">Q &nbsp;배송준비중 상태에서 취소했는데 취소가 되지않고 배송중입니다. </a><div id="collapse2" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 원활한 업무를 위해 판매자가 상품을 일괄적으로 발송 및 송장 등록할 수 있으므로,
										배송준비중 상태에서 발송 여부에 대한 확인이 필요합니다.
										운송장 확인이 안 되어 취소 요청하였으나 요청 전에 출고되었다면 취소거부 처리가 됩니다.
										이와 같은 경우 반품으로 진행 가능한 점 참고 부탁 드립니다
								</div>
							</div></td></tr>
							<tr><td>3</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse3">Q &nbsp;구매확정은 어디에서 하나요? </a><div id="collapse3" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 구매하고 주문한 상품을 수령한 후,  반품/교환을 하지 않는다면 자동으로 구매확정이 됩니다.
								</div>
							</div></td></tr>
							<tr><td>4</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse4">Q &nbsp;군부대도 상품을 보낼 수 있나요? </a><div id="collapse4" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 군부대는 일반인의 출입이 통제됩니다. 
									우체국 택배의 경우 군부대 근처에 위치한 우체국에
									택배물이 모여지게 되고 문서수발병이 해당 택배물을 일괄 수거합니다.
									만약 문서수발병이나 해당 군부대, 택배사의 사정으로	
									수거하지 못하게 된다면 배송이 지연될 수 있습니다.
									상품 주문 전 판매자에게 문의하여 확인하여 주시기 바랍니다.
								</div>
							</div></td></tr>
							<tr><td>5</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse5">Q &nbsp;배송지에 물품을 받을 사람이 없는데 어떻게 하나요</a><div id="collapse5" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 택배로 배송되는 상품은 수령하는 날짜 및 시간을 지정하기 어렵습니다.
									배송지에 사람이 없을경우, 배송업체 또는 담당 배송기사에게 연락하여 대리 수령이 가능한 곳으로 배송지 설정 부탁드립니다.
									배송업체 및 배송기사의 연락처는 마이페이지 > 주문조회 에서 송장번호를 클릭하면 확인 가능합니다.
								</div>
							</div></td></tr>
							<tr><td>6</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse6">Q &nbsp;배송이 지연되는 이유를 알고 싶어요</a><div id="collapse6" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp;  
●  구매자 입금오류
  - 현금결제로 주문 시 결제금액보다 입금금액이 부족한 경우,
     주문/배송 상태가 "입금대기중"로 표시되며 배송이 진행되지 않습니다.<br>
     이런 경우 먼저 입금하신 금액을 확인하신 후, 추가입금을 하시기 바랍니다.<br>
 
 ●  판매자 발송지연
  - 구매자가 주문상품의 선택정보(색상, 사이즈 등)를 기재하지 않으신 경우,
      또는 판매자가 주문폭주, 재고확보 등의 이유로 상품의 발송을 지연하는 경우
      주문/배송 상태가 "배송준비중"으로 표시되며 배송이 지연됩니다.<br>
      이런 경우 판매자에게 연락하여 선택정보 및 예상 발송일 등을 문의하시기 바랍니다.<br>
 
 ●  배송업체 배송지연
  - 판매자로부터 상품은 발송되었으나 기상악화 및 물량폭주에 의해 배송업체의 배송이
      원활하게 이루어 지지 않는 경우, <br>주문/배송 상태가 "배송중"으로 표시되며 배송이 지연됩니다.
      이런 경우 배송업체에 연락하여 물품위치 및 예상 도착시간 등을 문의하시기 바랍니다.<br>
 
 ●  수취지 불명 (수취인 부재)
  - 주문할 때, 주문상품의 배송지 정보를 잘못 기재한 경우,
     또는 배송메시지를 작성하지 않고 수취인이 부재중이었을 경우<br>
     주문/배송 상태가 "배송완료"로 표시되며 상품이 반송될 수 있습니다.
     이런 경우 신속하게 배송업체에 연락하여 반송여부를 확인 후, 재 배송을 요청하시기 바랍니다.
     상품이 이미 판매자에게 반송이 되었다면, 판매자에게 연락하여 재배송여부를 협의 바랍니다.
     이때 반송 사유에 따라 배송비가 추가로 발생할 수 있습니다.<br>
 
 ●  해외 상품
  - 일반적으로 온라인에서 해외 상품을 주문하신 경우,
      약 10~15 영업일 기간 내에 상품수령이 가능합니다.<br>
      다만 판매자 측의 사정이나 통관 지연으로 인하여 배송기간이 다소 길어질 수 있습니다.
 

								</div>
							</div></td></tr>
							<tr><td>7</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse7">Q &nbsp;기본 배송지 변경은 어떻게 하나요 </a><div id="collapse7" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 마이페이지에 정보수정란에 비밀번호 확인 후, 배송지 변경이 가능합니다.
								</div>
							</div></td></tr>
    
    </table> 
    </div>
    </div>
    </div>    
    </section>

<!--     <div class="row mt-5">  -->
<!--           <div class="col text-center"> -->
<!--             <div class="block-27"> -->
<!--               <ul> -->
<!--                 <li><a href="#">&lt;</a></li> -->
<!--                 <li class="active"><span>1</span></li> -->
<!--                 <li><a href="#">2</a></li> -->
<!--                 <li><a href="#">3</a></li> -->
<!--                 <li><a href="#">4</a></li> -->
<!--                 <li><a href="#">5</a></li> -->
<!--                 <li><a href="#">&gt;</a></li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--    <p class="breadcrumbs"> -->
<!-- 						<span class="mr-2"><a href="#"> 배송 관련 </a></span>| <span><a -->
<!-- 							href="#"> 결제 관련 </a></span>|<span><a href="#"> 교환/환불 관련 </a></span> -->
<!-- 					</p> -->
<!-- 					<div class="panel-group" id="accordian"> -->
<!-- 						<div class="panel panel-default"> -->
<!-- 							<div class="panel-heading"> -->

<!-- 								<h5 class="panel-title"> -->
<!-- 									<a data-toggle="collapse" data-parent="#accordian" -->
<!-- 										href="#collapse1">주문 후 주문 정보를 변경하려고 하는데 -->
<!-- 										어떻게 해야 하나요? </a> -->
<!-- 								</h5> -->
<!-- 							</div> -->
							
<!-- 							<hr><hr><hr> -->
<!-- 							<div class="panel-heading"> -->

<!-- 								<h5 class="panel-title"> -->
<!-- 									<a data-toggle="collapse" data-parent="#accordian" -->
<!-- 										href="#collapse2">Q 2 &nbsp; &nbsp; 주문 후 주문 정보를 변경하려고 하는데 -->
<!-- 										어떻게 해야 하나요? </a> -->
<!-- 								</h5> -->
<!-- 							</div> -->
<!-- 							<div id="collapse2" class="panel-collapse collapse in"> -->
<!-- 								<div class="panel-body"> -->
<!-- 									<b>A</b> &nbsp;&nbsp; 주문 후 배송 정보 변경은 전날 밤 11시 전 1588-8888에 전화 -->
<!-- 									주시거나, <br> 수정 내용을 남겨주세요. <br> 밤 11시 이후에는 배송이 시작되어 수정이 -->
<!-- 									불가합니다.<br> from kurly -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<hr><hr><hr> -->
<!-- 							<div class="panel-heading"> -->

<!-- 								<h5 class="panel-title"> -->
<!-- 									<a data-toggle="collapse" data-parent="#accordian" -->
<!-- 										href="#collapse3">Q 3 &nbsp; &nbsp; 주문 후 주문 정보를 변경하려고 하는데 -->
<!-- 										어떻게 해야 하나요? </a> -->
<!-- 								</h5> -->
<!-- 							</div> -->
<!-- 							<div id="collapse3" class="panel-collapse collapse in"> -->
<!-- 								<div class="panel-body"> -->
<!-- 									<b>A</b> &nbsp;&nbsp; 주문 후 배송 정보 변경은 전날 밤 11시 전 1588-8888에 전화 -->
<!-- 									주시거나, <br> 수정 내용을 남겨주세요. <br> 밤 11시 이후에는 배송이 시작되어 수정이 -->
<!-- 									불가합니다.<br> from kurly -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<hr><hr><hr> -->
<!-- 							<div class="panel-heading"> -->

<!-- 								<h5 class="panel-title"> -->
<!-- 									<a data-toggle="collapse" data-parent="#accordian" -->
<!-- 										href="#collapse4">Q 4 &nbsp; &nbsp; 주문 후 주문 정보를 변경하려고 하는데 -->
<!-- 										어떻게 해야 하나요? </a> -->
<!-- 								</h5> -->
<!-- 							</div> -->
<!-- 							<div id="collapse4" class="panel-collapse collapse in"> -->
<!-- 								<div class="panel-body"> -->
<!-- 									<b>A</b> &nbsp;&nbsp; 주문 후 배송 정보 변경은 전날 밤 11시 전 1588-8888에 전화 -->
<!-- 									주시거나, <br> 수정 내용을 남겨주세요. <br> 밤 11시 이후에는 배송이 시작되어 수정이 -->
<!-- 									불가합니다.<br> from kurly -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<hr><hr><hr> -->
<!-- 							<div class="panel-heading"> -->

<!-- 								<h5 class="panel-title"> -->
<!-- 									<a data-toggle="collapse" data-parent="#accordian" -->
<!-- 										href="#collapse5">Q 5 &nbsp; &nbsp; 주문 후 주문 정보를 변경하려고 하는데 -->
<!-- 										어떻게 해야 하나요? </a> -->
<!-- 								</h5> -->
<!-- 							</div> -->
<!-- 							<div id="collapse5" class="panel-collapse collapse in"> -->
<!-- 								<div class="panel-body"> -->
<!-- 									<b>A</b> &nbsp;&nbsp; 주문 후 배송 정보 변경은 전날 밤 11시 전 1588-8888에 전화 -->
<!-- 									주시거나, <br> 수정 내용을 남겨주세요. <br> 밤 11시 이후에는 배송이 시작되어 수정이 -->
<!-- 									불가합니다.<br> from kurly -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->


	<!--     <section class="ftco-section"> -->
	<!--       <div class="container"> -->
	<!--         <div class="row d-flex"> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_1.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_2.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_3.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_4.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_5.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_6.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--         <div class="row mt-5"> -->
	<!--           <div class="col text-center"> -->
	<!--             <div class="block-27"> -->
	<!--               <ul> -->
	<!--                 <li><a href="#">&lt;</a></li> -->
	<!--                 <li class="active"><span>1</span></li> -->
	<!--                 <li><a href="#">2</a></li> -->
	<!--                 <li><a href="#">3</a></li> -->
	<!--                 <li><a href="#">4</a></li> -->
	<!--                 <li><a href="#">5</a></li> -->
	<!--                 <li><a href="#">&gt;</a></li> -->
	<!--               </ul> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </section> -->

	<footer class="ftco-footer ftco-section img">
    	<jsp:include page="../inc/footer.jsp"></jsp:include>
    </footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>

</body>
</html>