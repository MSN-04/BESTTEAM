<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
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
<link rel="stylesheet" href="./css/shop.css">

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
	function setIFrameHeight(obj){
	    if(obj.contentDocument){
	        obj.height = obj.contentDocument.body.offsetHeight + 10;
	    } else {
	        obj.height = obj.contentWindow.document.body.scrollHeight;
	    }
	}
</script>
<%
	String id = (String)session.getAttribute("id");
	if (id == null || !id.equals("admin")) {
		%>
		<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href="index.in";
		</script>
		<%
	}
%>
</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">관리자 페이지</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="./index.jsp">Home</a></span> 
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-menu mb-5 pb-5"  id="go_top">
		<div class="container">
			<div class="row d-md-flex">
				<div class="col-lg-12 ftco-animate p-md-5">

					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-bottom: 1rem;">

								<a class="nav-link" id="v-pills-0-tab" href="adminPage.us" 
								role="tab" aria-controls="v-pills-0" onmouseover="$('#v-degree-tab').hide()" 
								onmouseout="if(!$('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" aria-selected="true">
								전체 회원 정보</a> 
								<a class="nav-link" id="v-pills-1-tab" href="adminPageShop.us" 
								onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" 
								onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" aria-controls="v-pills-1" aria-selected="false">
								전체 상품 정보</a>
							</div>

						</div>
						
						<div class="col-md-12 d-flex align-items-center">

							<div class="tab-content ftco-animate" id="v-pills-tabContent" style="width: 100%;">

								<div class="tab-pane fade show active" id="v-pills-0"
									role="tabpanel" aria-labelledby="v-pills-0-tab">

		<!-- 리스트 -->
		<form class="billing-form ftco-bg-dark p-3 p-md-5" >
			<h3 class="mb-4 billing-heading">매출 현황</h3>
			
			 <div class="cart-list" style="text-align: center;">
				<nav style="font-size: 22px; text-align: center; margin-bottom: 10px;">
					<a href="adminPageShopDay.us?month=<%=Calendar.getInstance().get(Calendar.MONTH)+1 %>" target="ifbox01" 
						style="width:461px; margin: 0 !important; " class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" >일별</a>&nbsp;
					<a href="adminPageShopMonth.us?year=<%=Calendar.getInstance().get(Calendar.YEAR) %>" target="ifbox01" 
						style="width:461px; margin: 0 !important;" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" >월별</a>
				</nav>
				<iframe id="if01" name="ifbox01" width="950px" src="adminPageShopDay.us?month=<%=Calendar.getInstance().get(Calendar.MONTH)+1 %>" height="500px" style="margin: auto; border: 0px;">
				</iframe>
				<a class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart"  href="itemRegister.em" style="font-weight: bold; width:952px;"
					role="tab" aria-controls="v-pills-3" aria-selected="false">상품 등록</a>
    		</div>
    		
    		<h3 class="mb-4 billing-heading" style="padding-top: 3rem;">상품 목록</h3>
    		<div class="cart-list" style="text-align: center;">
    			<iframe id="if02" name="ifbox02" width="950px" src="adminPageItemList.us" height="500px" onLoad="setIFrameHeight(this)" style="margin: auto; border: 0px;">
				</iframe>
            </div>
		</form>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
					
					</div>
				</div>
			</div>
		<!-- 리스트 끝 -->
		<br><br>

	          	
	     


								</div>
							</div>
						</div>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>



</body>
</html>
