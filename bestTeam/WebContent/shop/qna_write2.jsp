<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserBean userbean = (UserBean) request.getAttribute("userBean");
String userEmail = userbean.getUser_email();
String userPhone = userbean.getUser_phone();

int item_num = Integer.parseInt(request.getParameter("item_num").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!---------------------- 스마트 에디터 가져오는 영역 끝 ---------------------->
<style type="text/css">
.frmTitle {
	border: 0.1px solid #ccc;
	padding: 5px;
	color: white;
	background: rgba(0, 0, 0, 0);
	width: 100%;
}

.td0525 {
	width: 20% !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">QnA Write</h1>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section">
		<div class="col-md-9" id="mail">
			<form id="frm" action="qnaWritePro.qna?item_num=<%=item_num %>" method="post" class="contact-form">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">QNA</h2>
				</div>
			
				<table style="width: 100%; text-align: left;">
					<div class="row">
					<tr>
												
						<div class="form-group">
							<input type="text" class="form-control" placeholder="작성자"
								name="qna_name" readonly="readonly" value="<%=userbean.getUser_name() %>">
						</div>
												

					</tr>

					
				</table>
				<table style="width: 100%; text-align: center;">
					<tr>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Subject" maxlength="50" required="required"
								name="qna_subject" id="subject">
						</div>
					</tr>
					<tr>
						<td><textarea rows="10" cols="30" placeholder="상품문의 작성 전 확인해 주세요!

- 답변은 영업일 기준 2~3일 소요됩니다.
- 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 < 카카오톡/로그인 >에 남겨주세요.

제품
- 입고일: 품절 상품 입고 일이 확정된 경우, 썸네일에 기재되어 있습니다.
- 제품 상세정보: 용량, 보관 및 취급 방법 등 제품 정보는 상세 이미지 또는 상세정보에서 확인 가능합니다.

주문취소
- 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.

배송
- 주문 및 배송시간
택배배송: 밤 8시까지 주문하면, 다음날 12시 이전 도착 (배송 휴무: 일요일)" name="qna_content" maxlength="1000" required="required"
								style="width: 100%; height: 650px;" required="required"
								class="frmTitle" ></textarea></td>
					</tr>
					<tr style="display: inline-block;">
						<td colspan="2">
						<input type="submit" class="btn btn-primary py-3 px-4" style="color: black;" id="save" value="등록" />
						<input type="reset" class="btn btn-primary py-3 px-4" style="color: black;" id="reset" value="취소" /> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>


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