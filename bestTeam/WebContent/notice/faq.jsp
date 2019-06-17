<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>FAQ ─ Cafe Tinkervell</title>
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
.ftco-menu {
    padding-top: 12em !important;
}
.pb-5, .py-5 {
     padding-bottom: 0 !important; 
}
.mb-5, .my-5 {
    margin-bottom: 0 !important;
}
.table tbody tr td {
    text-align: left !important;
    
}
</style>

<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
 	$(document).ready(function(index){
 		$('#ac1').show();
 		$('#ac2').hide();
 		$('#ac3').hide();
 	});
 	
 	$(document).ready(function(index){
 		$('#btn1').click(function(){
 			
 			$('#ac1').show();
 			$('#ac2').hide();
 			$('#ac3').hide();
 			var offset = $('#btn1').offset();
			
 			
 		});
 	});
 	
 	$(document).ready(function(index){
 		$('#btn2').click(function(){
	 		$('#ac1').hide();
 			$('#ac2').show();
 			$('#ac3').hide();
 			var offset = $('#btn2').offset();
 			
 		});
 	});
 	
 	$(document).ready(function(index){
 		$('#btn3').click(function(){
	 		$('#ac1').hide();
 			$('#ac2').hide();
 			$('#ac3').show();
 			var offset = $('#btn3').offset();
			
 		});
 	});
</script>

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

<link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="./css/animate.css">

<link rel="stylesheet" href="./css/owl.carousel.min.css">
<link rel="stylesheet" href="./css/owl.theme.default.min.css">
<link rel="stylesheet" href="./css/magnific-popup.css">

<link rel="stylesheet" href="./css/aos.css">

<link rel="stylesheet" href="./css/ionicons.min.css">

<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
<link rel="stylesheet" href="./css/jquery.timepicker.css">


<link rel="stylesheet" href="./css/flaticon.css">
<link rel="stylesheet" href="./css/icomoon.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/kakaoTalkChat.css">



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
			style="background-image: url(images/bg_3.jpg);">
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
	
<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

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
				<section class="ftco-menu mb-5 pb-5" >								
							<div class="nav ftco-animate nav-pills justify-content-left"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-top: -100px;">

								<a class="nav-link active"  data-toggle="pill"
									href="#v-pills-0" role="tab" aria-controls="v-pills-0" id="btn1"
									aria-selected="true" style="width: 200px; text-align: center;">배송관련</a> 
								<a class="nav-link"  data-toggle="pill" href="#v-pills-1" id="btn2"
									role="tab" aria-controls="v-pills-1" aria-selected="false" style="width: 200px; text-align: center;">결제/환불 관련</a>
								<a class="nav-link"  data-toggle="pill"
									href="#v-pills-2" role="tab" aria-controls="v-pills-2" id="btn3"
									aria-selected="false" style="width: 200px; text-align: center;">교환/반품 관련</a> 
															
						</div>												
						</section>
 	<section class="ftco=section" id="ac1">	
 	<div class="container">			
   <table class="table thead-light" id="ac1">
   <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문한 상품이 언제 도착하는지 알고싶어요  </a><div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 로그인하셔서 주문조회를 하시면 송장번호로  배송추적이 가능합니다.
											보통 일반택배사 기준 주말제외 3~5일정도 소요됩니다.

								</div>
							</div></td></tr>
    <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse2">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송준비중 상태에서 취소했는데 취소가 되지않고 배송중입니다. </a><div id="collapse2" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 원활한 업무를 위해 판매자가 상품을 일괄적으로 발송 및 송장 등록할 수 있으므로,
										배송준비중 상태에서 발송 여부에 대한 확인이 필요합니다.
										운송장 확인이 안 되어 취소 요청하였으나 요청 전에 출고되었다면 취소거부 처리가 됩니다.
										이와 같은 경우 반품으로 진행 가능한 점 참고 부탁 드립니다
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse3">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매확정은 어디에서 하나요? </a><div id="collapse3" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 구매하고 주문한 상품을 수령한 후,  반품/교환을 하지 않는다면 자동으로 구매확정이 됩니다.
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse4">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;군부대도 상품을 보낼 수 있나요? </a><div id="collapse4" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 군부대는 일반인의 출입이 통제됩니다. 
									우체국 택배의 경우 군부대 근처에 위치한 우체국에
									택배물이 모여지게 되고 문서수발병이 해당 택배물을 일괄 수거합니다.
									만약 문서수발병이나 해당 군부대, 택배사의 사정으로	
									수거하지 못하게 된다면 배송이 지연될 수 있습니다.
									상품 주문 전 판매자에게 문의하여 확인하여 주시기 바랍니다.
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse5">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송지에 물품을 받을 사람이 없는데 어떻게 하나요</a><div id="collapse5" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 택배로 배송되는 상품은 수령하는 날짜 및 시간을 지정하기 어렵습니다.
									배송지에 사람이 없을경우, 배송업체 또는 담당 배송기사에게 연락하여 대리 수령이 가능한 곳으로 배송지 설정 부탁드립니다.
									배송업체 및 배송기사의 연락처는 마이페이지 > 주문조회 에서 송장번호를 클릭하면 확인 가능합니다.
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse6">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송이 지연되는 이유를 알고 싶어요</a><div id="collapse6" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp;  
●  구매자 입금오류
  - 현금결제로 주문 시 결제금액보다 입금금액이 부족한 경우,
     주문/배송 상태가 "입금대기중"로 표시되며 배송이 진행되지 않습니다.<br>
     이런 경우 먼저 입금하신 금액을 확인하신 후, 추가입금을 하시기 바랍니다.<br>
 
 ●  판매자 발송지연
  - 구매자가 주문상품의 선택정보(색상, 사이즈 등)를 기재하지 않으신 경우,
      또는 판매자가 주문폭주, 재고확보 등의 이유로 상품의 발송을 지연하는 경우
      주문/배송 상태가 "배송준비중"으로 표시되며 배송이 지연됩니다.<br>
      이런 경우 판매자에게 연락하여 선택정보 및 예상 발송일 등을 문의하시기 바랍니다.<br>
 
 ●  배송업체 배송지연
  - 판매자로부터 상품은 발송되었으나 기상악화 및 물량폭주에 의해 배송업체의 배송이
      원활하게 이루어 지지 않는 경우, <br>주문/배송 상태가 "배송중"으로 표시되며 배송이 지연됩니다.
      이런 경우 배송업체에 연락하여 물품위치 및 예상 도착시간 등을 문의하시기 바랍니다.<br>
 
 ●  수취지 불명 (수취인 부재)
  - 주문할 때, 주문상품의 배송지 정보를 잘못 기재한 경우,
     또는 배송메시지를 작성하지 않고 수취인이 부재중이었을 경우<br>
     주문/배송 상태가 "배송완료"로 표시되며 상품이 반송될 수 있습니다.
     이런 경우 신속하게 배송업체에 연락하여 반송여부를 확인 후, 재 배송을 요청하시기 바랍니다.
     상품이 이미 판매자에게 반송이 되었다면, 판매자에게 연락하여 재배송여부를 협의 바랍니다.
     이때 반송 사유에 따라 배송비가 추가로 발생할 수 있습니다.<br>
 
 ●  해외 상품
  - 일반적으로 온라인에서 해외 상품을 주문하신 경우,
      약 10~15 영업일 기간 내에 상품수령이 가능합니다.<br>
      다만 판매자 측의 사정이나 통관 지연으로 인하여 배송기간이 다소 길어질 수 있습니다.
 

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse7">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 배송지 변경은 어떻게 하나요 </a><div id="collapse7" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 마이페이지에 정보수정란에 비밀번호 확인 후, 배송지 변경이 가능합니다.
								</div>
							</div></td></tr>
    
    </table> 
    </div>
    </section>
    <section class="ftco=section" id="ac2">
    <div class="container">
    <table class="table thead-light" id="ac2">
   <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse8">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송중에 결제취소가 가능한가요? </a><div id="collapse8" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 취소신청은 입금 대기중/결제 완료/ 배송 준비중(발송 전)에만 가능하며
									배송이 준비중이지 않고 결제만 확인 가능할 시에는 주문서가 판매자에게 넘어가기 전 단계이므로 취소신청 시 즉시취소가 처리됩니다.
									배송중인 상품의 구매를 원하지 않다면 수령 후 반품신청으로 가능합니다.
									  주문하신 상품이 이미 배송중이라면 주문을 취소하는것은 불가합니다
								</div>
							</div></td></tr>
    <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse9">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제취소 내역은 어디에서 확인하나요 </a><div id="collapse9" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 마이페이지 > 주문목록에서 취소한 날짜와 물품, 금액 확인이 가능하고, 
										환불받으신 해당 카드사에 연락하시면 더 자세한 사항이 확인 가능합니다.

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse10">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문 한 상품을 취소하고싶어요 </a><div id="collapse10" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 주문 완료 후 배송  입금 대기중 또는 결제완료 상태에서 q&a 게시판에서 주문취소 신청 가능합니다.
										**배송 준비중 상태일 떄 취소하는 경우 판매자에게 발송여부 확인 후 진행하시기 바랍니다.
									    **환불은 취소완료 후에 진행되며 결제수단별로 환불 소요기간이 상이합니다.

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse11">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환불을 받지않고 그 금액으로 다른 상품을 구매할 수 있나요 </a><div id="collapse11" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 환불을 받지않고 그 금액으로 다른 상품을 구매하는것은 불가합니다.
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse12">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환불받을 계좌를 변경하고싶어요</a><div id="collapse12" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp;  기본적으로 환불은 주문하신 결제수단으로 환불되며,
										실시간계좌이체 혹은 무통장 입금으로 결제를 하셨다면, 환불 QNA 글에 환불받고자 하는 계좌번호를 적어주시면 됩니다.
										추후에 계좌번호에 대해 변경사항이 있으면 1588-8000으로 연락바랍니다.

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse13">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품을 취소했는데 환불 금액은 언제 받을 수 있나요?</a><div id="collapse13" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 상품을 취소할 경우 환불은 판매자가 승인 후 이루어집니다. 즉, 취소 완료가 되면 처리가 됩니다.
								또한 환불 소요기간은 평일기준 7~10일정도 소요되며, 카드사 사정에 따라 상이합니다. 무통장입금,편의점결제, 실시간 계좌이체의 환불은 해당일 오후6시 이후부터 입금 확인이 가능합니다.

								</div>
							</div></td></tr>
    
    </table>
    </div>
    </section>
    <section class="ftco=section" id="ac3">
    <div class="container">
    <table class="table thead-light" id="ac3">
   <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse14">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반품신청을 했는데 반품 안하고 상품을 다시 사용하고 싶어요 </a><div id="collapse14" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 고객님께서 반품 신청을 하시고, 아직 반품상품을 발송하지 않았다면 반품신청 취소가 가능합니다.

								</div>
							</div></td></tr>
    <tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse15">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품을 교환하고 싶어요 </a><div id="collapse15" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 교환은 배송완료 후 3일이내 가능하며 , qna게시판에 교환 사유와 교환받고싶은 상품을 적어주시면 됩니다.<br>
										단, 자사 제품이 공기에 변질되기 쉬우므로, 개봉 후 단순 변심으로 인한 교환은 어렵습니다.
								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse16">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품의 포장이 훼손되었는데 반품/교환할 수 있나요 </a><div id="collapse16" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 품의 내용을 확인하기 위해, 상품 외 겉 포장지를 훼손한 경우에는 반품/교환이 가능합니다. <br>
										하지만 자사제품이 식품이라는 특성상,  식품이 담겨있는 포장지를 훼손하였거나,식품이 훼손된 경우에는 어려우니 양해 부탁드립니다.
										</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse17">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반품/교환이 불가한 경우가 있나요 </a><div id="collapse17" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 전자상거래 등에서 소비자보호에 관한 법률에따라 반품이 제한되는 경우는 아래와 같습니다<br>
● 반품 불가 사유 내용: 
반품 요청 기간 경과
상품 수령 후 7일 이후 요청 한 경우.<br>

● 실제 상품과 상품 상세정보가 표시·광고의 내용과 불일치하거나,
수령 후 3개월 이후 요청한 경우<br>

● 계약 내용과 다르게 이행된 사실을 안 날로부터 30일 이후에 요청한 경우<br>

● 구매자에게 책임이 있는 사유로 상품이 멸실, 훼손된 경우
(상품 내용 확인을 위해 포장 등을 훼손한 경우 제외)<br>
● 구매자가 사용 또는 소비에 의한 상품 가치 감소<br>

● 시간 경과로 재판매가 곤란할 정도의 상품 가치 감소한 경우<br>

● 그 밖의 안전 거래를 위해 기타 법령에 의해 반품이 제한된 경우<br>
**정당한 사유임에도 반품을 신청할 수 없는 경우 1588-8000으로 문의주시기 바랍니다.

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse18">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;같은상품 두개 중 하나만 교환/환불할 수 있나요 </a><div id="collapse18" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 교환/환불 신청 시에 수량을 선택해주시면 됩니다.<br>
										만약 qna게시판에 수량을 따로 선택하시지 않은경우에는 동일 상품 전체에 적용됩니다.

								</div>
							</div></td></tr>
							<tr><td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse19">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반품 신청 기간이 어떻게되나요 </a><div id="collapse19" class="panel-collapse collapse in">
								<div class="panel-body"><br>
									<b>A</b> &nbsp;&nbsp; 반품신청은 배송완료 후 7일이내에 가능합니다.<br>
									1588-8000으로 문의주시거나, qna게시판에  반품할 상품, 사유, 연락처를 남겨주시면 검토 후 연락 드립니다.

								</div>
							</div></td></tr>
    
    </table> 
    </div>
    </section>
    
    </div>
    </div>
    </div>   
     
    </section>

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


	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.1.3.js"></script>
	<script src="./js/jquery.waypoints.min.js"></script>
	<script src="./js/jquery.stellar.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/jquery.animateNumber.min.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script src="./js/jquery.timepicker.min.js"></script>
	<script src="./js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>

</body>
</html>
