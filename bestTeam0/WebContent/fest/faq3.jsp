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
<!-- 							href="faq2.jsp"> 결제 관련 </a></span>|<span><a href="faq3.jsp"><b> 교환/환불 관련 </b></a></span>  -->
<!--  					</p> -->
<div class="col-md-12 nav-link-wrap mb-5">
					<div class="nav ftco-animate nav-pills justify-content-center fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">

			    	<a href="faq.jsp" class="nav-link">배송관련</a>
					<a href="faq2.jsp" class="nav-link" >결제/환불관련</a>
					<a href="faq3.jsp" class="nav-link active">교환/반품 관련</a>

					</div>
				</div>
 					
   <table class="table thead-light">
   <tr><td>1</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">Q &nbsp;반품신청을 했는데 반품 안하고 상품을 다시 사용하고 싶어요 </a><div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 고객님께서 반품 신청을 하시고, 아직 반품상품을 발송하지 않았다면 반품신청 취소가 가능합니다.

								</div>
							</div></td></tr>
    <tr><td>2</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse2">Q &nbsp;상품을 교환하고 싶어요 </a><div id="collapse2" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 교환은 배송완료 후 3일이내 가능하며 , qna게시판에 교환 사유와 교환받고싶은 상품을 적어주시면 됩니다.<br>
										단, 자사 제품이 공기에 변질되기 쉬우므로, 개봉 후 단순 변심으로 인한 교환은 어렵습니다.
								</div>
							</div></td></tr>
							<tr><td>3</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse3">Q &nbsp;상품의 포장이 훼손되었는데 반품/교환할 수 있나요 </a><div id="collapse3" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 품의 내용을 확인하기 위해, 상품 외 겉 포장지를 훼손한 경우에는 반품/교환이 가능합니다. <br>
										하지만 자사제품이 식품이라는 특성상,  식품이 담겨있는 포장지를 훼손하였거나,식품이 훼손된 경우에는 어려우니 양해 부탁드립니다.
										</div>
							</div></td></tr>
							<tr><td>4</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse4">Q &nbsp;반품/교환이 불가한 경우가 있나요 </a><div id="collapse4" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 전자상거래 등에서 소비자보호에 관한 법률에따라 반품이 제한되는 경우는 아래와 같습니다<br>
● 반품 불가 사유 내용: 
반품 요청 기간 경과
상품 수령 후 7일 이후 요청 한 경우.<br>

● 실제 상품과 상품 상세정보가 표시·광고의 내용과 불일치하거나,
수령 후 3개월 이후 요청한 경우<br>

● 계약 내용과 다르게 이행된 사실을 안 날로부터 30일 이후에 요청한 경우<br>

● 구매자에게 책임이 있는 사유로 상품이 멸실, 훼손된 경우
(상품 내용 확인을 위해 포장 등을 훼손한 경우 제외)<br>
● 구매자가 사용 또는 소비에 의한 상품 가치 감소<br>

● 시간 경과로 재판매가 곤란할 정도의 상품 가치 감소한 경우<br>

● 그 밖의 안전 거래를 위해 기타 법령에 의해 반품이 제한된 경우<br>
**정당한 사유임에도 반품을 신청할 수 없는 경우 1588-8000으로 문의주시기 바랍니다.

								</div>
							</div></td></tr>
							<tr><td>5</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse5">Q &nbsp;같은상품 두개 중 하나만 교환/환불할 수 있나요 </a><div id="collapse5" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 교환/환불 신청 시에 수량을 선택해주시면 됩니다.<br>
										만약 qna게시판에 수량을 따로 선택하시지 않은경우에는 동일 상품 전체에 적용됩니다.

								</div>
							</div></td></tr>
							<tr><td>6</td><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse6">Q &nbsp;반품 신청 기간이 어떻게되나요 </a><div id="collapse6" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 반품신청은 배송완료 후 7일이내에 가능합니다.<br>
									1588-8000으로 문의주시거나, qna게시판에  반품할 상품, 사유, 연락처를 남겨주시면 검토 후 연락 드립니다.

								</div>
							</div></td></tr>
    
    </table> 

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
    </div>
    </div>
    </div>
    
    
    </section>
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