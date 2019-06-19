<%@page import="vo.NoticeBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 조회된 게시물 정보를 담은 ArrayList 객체(articleList)와 페이지 정보를 담은 PageInfo 객체(pageInfo)를
	// request.getAttribute() 메서드로 가져오기
	ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int limit = pageInfo.getLimit();

	int number = 0;
	number = listCount - (nowPage - 1) * (limit);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Notice ─ Cafe Tinkervell</title>
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

<style type="style/css">
    .ftco-section {
	align: center;
	float: center;
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
						<h1 class="mb-3 mt-5 bread">Notice</h1>
					</div>

				</div>
			</div>
		</div>
	</section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->	
	
	<br>
	<br>
	<br>
	<br>



	<section class="ftco=section">
		<div class="container">

			<%
				String id = (String) session.getAttribute("id");
				if (id != null && id.equals("admin")) {
			%>
			<a href="noticeWriteForm.no"
				class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>

			<%
				}
			%>

			<div class="row d-flex">
			<div class="col-md-8 ftco-animate">
					<table class="table thead-light">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<%
							if (articleList != null && listCount > 0) {
								for (int i = 0; i < articleList.size(); i++) {
						%>
						<tr>
							<td align="center"><%=number--%></td>
							<td><a
								href="noticeDetail.no?notice_num=<%=articleList.get(i).getNotice_num()%>&page=<%=nowPage%>">
									<%=articleList.get(i).getNotice_subject()%>
							</a></td>
							<td><%=articleList.get(i).getNotice_date()%></td>
							<td>Tinkervell</td>
							<td><%=articleList.get(i).getNotice_readcount()%></td>
						</tr>
						<%
								}
							}
						%>
					</table>
</div>
			</div>
					<div class="row mt-5" style="margin-bottom: 3rem;">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<%
										if (nowPage <= 1) {
									%>
									<li><a>&lt;</a></li>
									<%
										} else {
									%>
									<li><a href="noticeList.no?page=<%=nowPage - 1%>">&lt;</a></li>
									<%
										}
										for (int a = startPage; a <= endPage; a++) {
											if (a == nowPage) {
									%><li class="active"><span><%=a%></span></li>
									<%
										} else {
									%><li><a href="noticeList.no?page=<%=a%>"><%=a%></a></li>
									<%
										}
										}
									%>
									<%
										if (nowPage >= maxPage) {
									%>
									<li><a>&gt;</a></li>
									<%
										} else {
									%>
									<li><a href="noticeList.no?page=<%=nowPage + 1%>">&gt;</a></li>
									<%
										}
									%>
								</ul>

								
<!-- 								<br> <br> -->

							</div>
						</div>
					</div>
				
		</div>
	</section>

	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
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