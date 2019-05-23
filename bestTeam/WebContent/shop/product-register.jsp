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
<!---------------------- 스마트 에디터 가져오는 영역 시작 ---------------------->
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>

<style type="text/css">
	.frmTitle {
		border: 0.1px solid #ccc;
		padding: 5px;
		color: white;
		background: rgba(0,0,0,0);
		width: 100%;
	}
</style>
</head>
<body>
	<header>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">product-register</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.in">Home</a></span> <a href="shop.in"><span>Shop</span></a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<form id="frm" action="itemRegisterPro.em" method="post" enctype="multipart/form-data">
				<table style="width: 100%; text-align: center;">
					<tr>
						<td>상품명 : </td>
						<td><input type="text" id="item_name" name="item_name" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>가격 : </td>
						<td><input type="text" id="item_price" name="item_price" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>상품 이미지 : </td>
						<td><input type="file" id="item_img" name="item_img" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>간단 설명 : </td>
						<td><textarea rows="10" cols="30" name="item_info" 
								style="width: 700px; height: 200px;" ></textarea></td>
					</tr>
					<tr>
						<td>재고 : </td>
						<td><input type="text" id="item_amount" name="item_amount" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>상세설명 이미지 : </td>
						<td><input type="file" id="item_content" name="item_content" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>Aroma : </td>
						<td><input type="text" id="item_favor_aroma" name="item_favor_aroma" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>Acidity : </td>
						<td><input type="text" id="item_favor_acidity" name="item_favor_acidity" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>Sweetness : </td>
						<td><input type="text" id="item_favor_sweetness" name="item_favor_sweetness" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>Bitterness : </td>
						<td><input type="text" id="item_favor_bitterness" name="item_favor_bitterness" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>Body : </td>
						<td><input type="text" id="item_favor_body" name="item_favor_body" class="frmTitle" /></td>
					</tr>
					<tr style="display:inline-block; ">
						<td colspan="2" >
							<input type="submit" class="btn btn-primary py-3 px-4" style="color: black;" value="저장" /> 
							<input type="reset" class="btn btn-primary py-3 px-4" style="color: black;" value="다시쓰기" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- .section -->
	
<jsp:include page="../inc/footer.jsp"></jsp:include>


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