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
<!-- 					<span class="mr-2"><a href="faq.jsp">배송 관련 </a></span>| <span><a  -->
<!-- 							href="faq2.jsp"> <b>결제 관련</b> </a></span>|<span><a href="faq3.jsp"> 교환/환불 관련 </a></span>  -->
<!--  					</p> -->
<div class="col-md-12 nav-link-wrap mb-5">
					<div class="nav ftco-animate nav-pills justify-content-center fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">

					<a href="faq.jsp" class="nav-link">배송관련</a>
					<a href="faq2.jsp" class="nav-link active" >결제/환불관련</a>
					<a href="faq3.jsp" class="nav-link">교환/반품 관련</a>

					</div>
				</div>
   <table class="table thead-light">
   <tr><td>1</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">Q &nbsp;배송중에 결제취소가 가능한가요? </a><div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 취소신청은 입금 대기중/결제 완료/ 배송 준비중(발송 전)에만 가능하며
									배송이 준비중이지 않고 결제만 확인 가능할 시에는 주문서가 판매자에게 넘어가기 전 단계이므로 취소신청 시 즉시취소가 처리됩니다.
									배송중인 상품의 구매를 원하지 않다면 수령 후 반품신청으로 가능합니다.
									  주문하신 상품이 이미 배송중이라면 주문을 취소하는것은 불가합니다
								</div>
							</div></td></tr>
    <tr><td>2</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse2">Q &nbsp;결제취소 내역은 어디에서 확인하나요 </a><div id="collapse2" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 마이페이지 > 주문목록에서 취소한 날짜와 물품, 금액 확인이 가능하고, 
										환불받으신 해당 카드사에 연락하시면 더 자세한 사항이 확인 가능합니다.

								</div>
							</div></td></tr>
							<tr><td>3</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse3">Q &nbsp;주문 한 상품을 취소하고싶어요 </a><div id="collapse3" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 주문 완료 후 배송  입금 대기중 또는 결제완료 상태에서 q&a 게시판에서 주문취소 신청 가능합니다.
										**배송 준비중 상태일 떄 취소하는 경우 판매자에게 발송여부 확인 후 진행하시기 바랍니다.
									    **환불은 취소완료 후에 진행되며 결제수단별로 환불 소요기간이 상이합니다.

								</div>
							</div></td></tr>
							<tr><td>4</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse4">Q &nbsp;환불을 받지않고 그 금액으로 다른 상품을 구매할 수 있나요 </a><div id="collapse4" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 환불을 받지않고 그 금액으로 다른 상품을 구매하는것은 불가합니다.
								</div>
							</div></td></tr>
							<tr><td>5</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse5">Q &nbsp;환불받을 계좌를 변경하고싶어요</a><div id="collapse5" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp;  기본적으로 환불은 주문하신 결제수단으로 환불되며,
										실시간계좌이체 혹은 무통장 입금으로 결제를 하셨다면, 환불 QNA 글에 환불받고자 하는 계좌번호를 적어주시면 됩니다.
										추후에 계좌번호에 대해 변경사항이 있으면 1588-8000으로 연락바랍니다.

								</div>
							</div></td></tr>
							<tr><td>6</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse6">Q &nbsp;상품을 취소했는데 환불 금액은 언제 받을 수 있나요?</a><div id="collapse6" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 상품을 취소할 경우 환불은 판매자가 승인 후 이루어집니다. 즉, 취소 완료가 되면 처리가 됩니다.
								또한 환불 소요기간은 평일기준 7~10일정도 소요되며, 카드사 사정에 따라 상이합니다. 무통장입금,편의점결제, 실시간 계좌이체의 환불은 해당일 오후6시 이후부터 입금 확인이 가능합니다.

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