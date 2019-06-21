<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	ArrayList<ItemBean> itemList = (ArrayList<ItemBean>)request.getAttribute("itemList");
	String id = (String) session.getAttribute("id");
	int isIdNull = 0;	

	if(id == null) {
		isIdNull = 1;
	} else {
		isIdNull = 0;
	}
%>

<head>
<title>Café TinkerVell</title>
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
<style>
 .h1{
color: #c49b63 !important;
}

 .menu-entry .img{
 width:200px; 
 margin:0  20px  0 20px;
}

.pick{
font-size:30px;
color:#C49B63;
}
.col-md-7 heading-section ftco-animate text-center .mb-4{
color:#C49B63;
}

.menu-entry .text h3{
text-transform:none !important;
}


</style>
	<header>
		<jsp:include page="../inc/header.jsp" />
		<!-- END nav -->
	</header>

	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate" style="margin-top: 70px !important;">
						<span class="subheading">Café TinkerVell</span>
						<h1 style="line-height: 1.3em;">Explore<br>New Flavor</h1>
						<h4 >새로운 맛을 탐험하세요</h4>
						<p>
							<a href="shopMain.em"
								class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3"  style="margin: 10px 0 50px 0 !important;">Order Now</a>
						</p>
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item"
			style="background-image: url(./images/coffeeway.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate" style="margin-top: 70px !important;">
						<span class="subheading">Café TinkerVell</span>
						<h1 style="line-height: 1.3em;">Which Coffee is Attractive</h1>
						<h4 >어떤 원두에 끌리세요?</h4>
						<p>
							<a onclick="startNow(<%=isIdNull %>)"
								class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3" style="margin: 10px 0 50px 0 !important;">Start Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
	function startNow(isIdNull) {
		if (isIdNull == 1) {
			location.href = "login.us";
		} else if (isIdNull == 0) {
			location.href = "taste.us";
		}
	}
	</script>	

	<br>
	<!-- 카카오톡 상담 -->
	<jsp:include page="../inc/kakaoChat.jsp" />
	<!-- 카카오톡 상담 End -->

	<br><br><br><br>
	<div class="row justify-content-center mb-5 pb-3">
		<div class="col-md-7 heading-section ftco-animate text-center">
			<h2 class="mb-4" style="color:#C49B63;">We Think Coffee's Value</h2>
			<p> <h4>커피의 가치를 생각하는 Café TinkerVell</h4>
<!-- 			TinkerVell은 국내 커피시장을 선도하는 시장점유율 상위권 브랜드로 확고한 시장 위치를 차지하고 있습니다. <br> -->
			TinkerVell은 세계적인 기술력, 커피 전문가의 노하우로 고품질의 본연의 맛과 향을 즐길 수 있는 좋은 커피를 유통합니다. <br>
			TinkerVell은 일상 속 작은 휴식과 여유이며, 새로운 기운을 불어 넣어줍니다. <br>
			마음과 마음이 이어지는 순간 TinkerVell은 행복을 전해주는 좋은 커피로 다가갑니다. <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Café TinkerVell - </p>
		</div>
	</div><br><br><br><br><br><br>

	<section class="ftco-about d-md-flex">
		<div class="one-half0 img0">
			<img class="img_main" src="./images/coffeeperson.jpg">
		</div>
		<div class="one-half ftco-animate">
			<div class="overlap">
				<div class="heading-section ftco-animate">				
					<span class="subheading"><i>Experience Beyond The Coffee</i></span><br>
					<h4 class="mb-4"><i>커피 이상의 특별한 경험을 소개합니다 </i></h4>
					
				</div>
				<div>
					<p>세계인들의 생활 속에 스며들어 전 세계의 커피 문화를 선도하고 있는 Café TinkerVell이<br>
					일상을 풍요롭게 하는 제3의 공간으로서,<br> 어디에서도 고객과 함께하며 새로운 커피문화를 정착시키려 노력하고 있습니다.</p>
				</div>
			</div>
		</div>
	</section>
	<br><br><br><br><br><br>

	<section class="ftco-about d-md-flex">

		<div class="one-half0 img0 ftco-animate">
			<div class="overlap">
				<div class="heading-section ftco-animate ">
					
					<span class="subheading"><i>Slow-Roasting</i></span><br>
					<h4 class="mb-4"><i>고유의 향을 살리는 로스팅 </i></h4>
				</div>
				<div>
					<p>블랜딩을 할 때에는 균일하게 로스팅을 하는 것이 중요하기 때문에 특유의 노하우가 필요합니다.<br>
					Café TinkerVell은 잘 배합된 블렌딩 원두만을 선별하여 슬로우로스팅(Slow Roasting)된 원두만을 판매합니다.<br>
					슬로우 로스팅은 보통의 로스팅보다 천천히 로스팅하여, 원두 안의 좋은 맛과 향미의 성분을 끌어내는 방식입니다.<br>
					그래서 Café TinkerVell의 원두는 탄맛이 적고 생두 고유의 향이 살아있습니다.<br>
					</p>
				</div>
			</div>
		</div>

		<div class="one-half img"
			style="background-image: url(./images/coffee2.jpg);"></div>
	</section>
<br><br><br><br><br><br>
	<section class="ftco-about d-md-flex">
		<div class="one-half img"
			style="background-image: url(./images/coffee3.jpg);"></div>
		<div class="one-half ftco-animate">
			<div class="overlap">
				<div class="heading-section ftco-animate ">
				<span class="subheading"><i>Meet Elegant Flavor</i></span><br>
					<h4 class="mb-4"><i>우아한 맛을 만나보세요 </i></h4>
				</div>
				<div>
					<p>Café TinkerVell은 최고의 기후조건을 갖춘 각국의 재배지에서 재배된 원두를 가진 점포만을 선별하여<br>
					Café TinkerVell만의 독자적인 배합비율로 블렌딩 과정을 거칩니다.<br>
					[현재 판매점포: /Cafe1945 / ILDIO / Fior Di Caffee / Golden Bean / 모모스커피 ] 
					</p>
				</div>
			</div>
		</div>
	</section><br><br><br><br><br><br>

	<section class="ftco-about d-md-flex">

		<div class="one-half0 img0 ftco-animate">
			<div class="overlap">
				<div class="heading-section ftco-animate ">
					<span class="subheading"><i>Pick Your Taste!</i></span><br>
					<h4 class="mb-4"><i>당신의 취향을 <b class="pick">pick</b> 하세요</i></h4>
					
				</div>
				<div>
					<p>Café TinkerVell은 한 분, 한 분 취향에 맞는 원두를 추천해 줍니다.<br>
					지금 당신의 취향에 맞는 원두를 골라보세요!<br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a onclick="startNow(<%=isIdNull %>)" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Pick Now</a>
					</p>
				</div>
			</div>
		</div>
<hr>
		<div class="one-half img"
			style="background-image: url(./images/coffeeman.jpg);"></div>
	</section>

<br><br><br><br><hr>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">Best Quality!</span>
					<h2 class="mb-4"><i>Best Seller</i></h2>
					<p>Café TinkerVell이 보장하는 퀄리티의 추천상품입니다</p>
					
				</div>
			</div>
			<hr>
			
			<div class="row">
		<%
			if (itemList != null) {
				for (int i = 0 ; i < itemList.size() ; i++) {
					%>
		<div class="col-md-3">
			<div class="menu-entry">
				<a href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>" class="img"
					style="background-image: url(./itemUpload/<%=itemList.get(i).getItem_img() %>);"></a>
				<div class="text text-center pt-4">
					<h3><%=itemList.get(i).getItem_name() %></h3>

					<p class="price">
						<span><%=NumberFormat.getInstance().format(itemList.get(i).getItem_price()) %>원</span>
					</p>
					<p>
						<a href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>"
							class="btn btn-primary btn-outline-primary">GO </a>
					</p>
				</div>
			</div>
		</div>

		<%
				}
			}
		%>
	</div>
			
		</div>
	</section>
	

	<jsp:include page="../inc/footer.jsp" />


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
