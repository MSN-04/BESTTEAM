<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Shop ─ Cafe Tinkervell</title>
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
	#favor td {
		text-align: left;
	}
	#favor select {
 		margin-top: 30px; 
 		margin: 0 10px;
 		width: 85px; 
 		text-align-last: center;
	}
/* 	#tbl1 #favor td { */
/* 		display: inline-block; */
/* 		margin-top: 30px; */
/* 		margin: 0 10px; */
/* 	} */
/* 	#tbl1 #favor tr { */
/* 		display: inline-block; */
/* 	} */
/* 	#tbl1 #favor select { */
/* 		width: 85px; */
/* 		text-align-last: center;  */
/* 	} */

</style>
</head>
<body>
	<header>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->


	<section class="ftco-section" style="margin-top: 100px; margin-bottom: 100px;">
		<div class="container">
			<form id="frm" action="itemRegisterPro.em" method="post" enctype="multipart/form-data">
				<h2 style="margin: 30px 100px;">상품 등록</h2>
				<table style="width: 100%; text-align: center;" id="tbl1">
					<tr>
						<td>상품명 : </td>
						<td><input type="text" id="item_name" name="item_name" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>가격 : </td>
						<td><input type="text" id="item_price" name="item_price" class="frmTitle" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
					</tr>
					<tr>
						<td>상품 이미지 : </td>
						<td><input type="file" id="item_img" name="item_img" class="frmTitle" /></td>
					</tr>
					<tr>
						<td>간단 설명 : </td>
						<td><textarea rows="10" cols="30" name="item_info" 
								style="width: 100%; height: 200px;" ></textarea></td>
					</tr>
					<tr>
						<td>재고 : </td>
						<td><input type="text" id="item_amount" name="item_amount" class="frmTitle" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
					</tr>
					<tr>
						<td>상세설명 이미지 : </td>
						<td><input type="file" id="item_content" name="item_content" class="frmTitle"  /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr id="favor" style="margin-top: 30px;">
						<td style="text-align: center; ">상세 선택 : </td>
						<td>Aroma
							<select id="item_favor_aroma" name="item_favor_aroma" >
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
							Acidity 
							<select id="item_favor_acidity" name="item_favor_acidity" >
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
							Sweetness 
							<select id="item_favor_sweetness" name="item_favor_sweetness" >
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
							Bitterness 
							<select id="item_favor_bitterness" name="item_favor_bitterness"  >
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
							Body 
							<select id="item_favor_body" name="item_favor_body"  >
								<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
							</select>
						</td>
					</tr>
					
				</table>
					<div style="display: inline-block; float: right; padding: 20px;">
						<input type="submit" class="btn btn-primary py-3 px-4" style="color: black;" value="저장" /> 
						<input type="reset" class="btn btn-primary py-3 px-4" style="color: black;" value="다시쓰기" />
					</div>
					
			</form>
		</div>
	</section>
	<!-- .section -->
	
	
	<footer>
		<jsp:include page="/inc/footer.jsp" />
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