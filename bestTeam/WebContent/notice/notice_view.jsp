<%@page import="vo.PageInfo"%>
<%@page import="vo.QnaBean"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeBean article = (NoticeBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우

	int notice_num = Integer.parseInt(request.getParameter("notice_num"));
%>
<script language="javascript">
	function delconfirm(num, notice_num) {
		
		var message = confirm("이 게시글을 삭제하시겠습니까?");
		if (message == true) {
			location.href = "noticeDeletePro.no?num=" + num + "&notice_num=" + notice_num;
		} else {
			alert("취소되었습니다");
			return false;
		}
	}
</script>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Notice ─ Café TinkerVell</title>
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


<style type="text/css">
/*      	.col-md-8 { border: 1px solid aqua; }  */
.not1 {
	flex: auto;
	margin: auto;
	max-width: 80%;
}

/*     	.col-md-8 { background-color: #000; } */
.not1 img {
	width: 100%;
} /* 폼에 들어가는 사진 크기 조정(반드시 필요) */
.not1 p { /* 자동 개행 */
	word-wrap: break-word;
	white-space: pre-wrap;
	word-break: break-all;
}

.row {
	flex-wrap: nowrap;
}
</style>

</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<!-- END nav -->

<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread" >Notice</h1>
						<p class="breadcrumbs">
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->
<br>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ftco-animate not1">
					<%
						request.setCharacterEncoding("utf-8");
					%>
					<div
						style="border-bottom: 1px solid grey; margin-bottom: 30px; font-size: 32px; font-weight: 400; color: white;
						font-family: Josefin Sans, Arial, sans-serif;"><%=article.getNotice_subject()%></div>
					<div style="margin: auto;"><%=article.getNotice_content()%></div>
				</div>

			</div>
		</div>
	</section>


	<!-- 이전글버튼 ----------------------------->
<!-- 		<div class="row" style="margin-left: 430px; margin-bottom: 0px;"> -->
<!-- 			<div style="solidwhite; margin-left: 400px;" > -->
<%-- 				<% --%>
<!-- // 					int rre = article.getNotice_num() - 1; -->
<%-- 				%> --%>
<!-- 				<button type="button" -->
<!-- 					class="quantity-left-minus btn input-group-btn" -->
<!-- 					style="text-align: center;"> -->
<!-- 					<i class="icon-minus"></i> &nbsp;&nbsp;이전글 &nbsp; -->
<%-- 				</button><a href="noticeDetail.no?notice_num=<%=rre%> "> <%=article.getNotice_subject()%></a> --%>
<!-- 			</div> -->
<!-- 		</div> -->

	<div class="row mt-5">
		<div class="col text-center">
			<div class="block-27" style="margin-bottom: 50px;">
	<%
		String id = (String) session.getAttribute("id");
		if (id != null && id.equals("admin")) {
	%>
				<div style="margin-left: 725px;">
				<a
					href="./noticeModifyForm.no?notice_num=<%=article.getNotice_num()%>"
					class="btn btn-primary btn-outline-primary">수정</a> <a
					class="btn btn-primary btn-outline-primary"
					onclick="delconfirm('<%=article.getNotice_num()%>','<%=notice_num%>')">삭제</a> <a
					href="./noticeList.no" class="btn btn-primary btn-outline-primary">글목록</a>
					</div>
				<%
					} else {
				%>
					<a href="./noticeList.no" style="margin-left: 849px;"
						class="btn btn-primary btn-outline-primary">글목록</a>
				<%
					}
				%>
			</div>
		</div>
	</div>

	<br>
	<br>

	<footer>
		<jsp:include page="../inc/footer.jsp" />
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