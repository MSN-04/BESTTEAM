<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
<!---------------------- 스마트 에디터 가져오는 영역 시작 ---------------------->
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="<%=ctx%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<%
String id=(String)session.getAttribute("id");
%>
<style type="text/css">
	.frmTitle {
		border: 0.1px solid #ccc;
		padding: 5px;
		color: white;
		background: rgba(0,0,0,0);
		width: 100%;
	}
body{text-align: center !important;}
</style>
<%
	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
%>

</head>
<body>
	<header>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread" style="font-style: normal;">Review</h1>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section">
<!-- 		<h2 class="section-heading text-uppercase" style="margin-left: 90px;">REVIEW</h2> -->
		<div class="container" style="left: 100px !important;">

			<form id="frm" action="reviewWritePro.re" method="post"
				enctype="multipart/form-data">

				<table style="width: 100%; text-align: center;">
					<tr>
						<td></td>
						<td style="padding-bottom: 5px;"><img
							src="./itemUpload/<%=itemBean.getItem_img()%>"
							style="width: 150px; height: 150px;"><br> <a href=""
							class="tag-cloud-link"><%=itemBean.getItem_name()%></a>
						<td>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr>
						<input type="hidden" value="<%=itemBean.getItem_num()%>"
							name="review_item_num">
						<input type="hidden" value="<%=id%>" name="review_user_id">
						<td style="padding-right: 30px;">제목</td>
						<td><input type="text" id="review_subject" required="required"
							name="review_subject" class="frmTitle" maxlength="30" /></td>
					</tr>
					<br>
					<tr>
						<td style="width: 100px !important;">후기작성</td>
						<td><textarea rows="10" cols="30" name="review_content" 
								maxlength="1000" style="width: 100%; height: 200px; color: #A9A9A9; font-size: 15px;"
								required="required" class="frmTitle" onclick="this.value=''">자세한 후기는 다른 고객의 구매에 많은 도움이 되며,   
일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다.
반품/환불 문의는 카카오톡 문의로 가능합니다.

								</textarea></td>
					</tr>

					<tr>
						<td style="width: 100px !important;">사진등록</td>
						<td><input type="file" id="review_img" name="review_img"
							class="form-control" /></td>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr style="text-align: center;" colspan="2">
						<td colspan="2"><input type="submit"
							class="btn btn-primary py-3 px-4" style="color: black;" id="save"
							value="등록" /> <input type="button"
							class="btn btn-primary py-3 px-4" style="color: black;"
							id="reset" value="취소" /	></td>
					</tr>

				</table>
			</form>
		</div>
	</section>






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