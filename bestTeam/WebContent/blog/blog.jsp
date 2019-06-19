<%@page import="vo.PageInfo"%>
<%@page import="vo.BlogBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 조회된 게시물 정보를 담은 ArrayList 객체(articleList)와 페이지 정보를 담은 PageInfo 객체(pageInfo)를
	// request.getAttribute() 메서드로 가져오기
	ArrayList<BlogBean> articleList = (ArrayList<BlogBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog ─ Cafe Tinkervell</title>
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
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-700 col-sm-52 text-center ftco-animate">
						<h1 class="mb-8 mt-7 bread">Blog</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

	<section class="ftco-section">
		<div class="container">
		<%
							String id = (String) session.getAttribute("id");
							if (id != null && id.equals("admin")) {
						%>
						<a href="blogWriteForm.bl"
							class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>
						<%
							}
						%>
			<div class="row d-flex">
			
				<div class="col-md-700 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<%
							if (articleList != null && listCount > 0) {
								for (int i = 0; i < articleList.size(); i++) {
						%>

						<a
							href="blog-single.bl?blog_num=<%=articleList.get(i).getBlog_num()%>&page=<%=nowPage%>"
							class="block-20"
							style="width: 900px; margin-left: 100px; text-align: center; background-image: url('./itemUpload/<%=articleList.get(i).getBlog_file()%>')">
						</a>
						<h2 class="heading mt-2" style="margin-left: 100px;">
							<a
								href="blog-single.bl?blog_num=<%=articleList.get(i).getBlog_num()%>&page=<%=nowPage%>"><%=articleList.get(i).getBlog_subject()%></a>
						</h2>
						<div class="text py-4 d-block" style="margin-left: 100px;">
							<div class="meta" style="width: 900px;">
								<div>
									<a><%=articleList.get(i).getBlog_content1()%></a>
								</div>
								<br>

								<div>
									<a><%=articleList.get(i).getBlog_writer()%></a>
								</div>
								<div>
									<a><%=articleList.get(i).getBlog_date()%></a>
								</div>
								
							</div>

						</div>
						<%
							}
							}
						%>
					</div>
				</div>
			</div>
			
			
			<div class="row mt-5">
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
							<li><a href="blog.bl?page=<%=nowPage - 1%>">&lt;</a></li>
							<%
								}
								for (int a = startPage; a <= endPage; a++) {
									if (a == nowPage) {
							%><li class="active"><span><%=a%></span></li>
							<%
								} else {
							%><li><a href="blog.bl?page=<%=a%>"><%=a%></a></li>
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
							<li><a href="blog.bl?page=<%=nowPage + 1%>">&gt;</a></li>
							<%
								}
							%>

						</ul>

						
					</div>
					
					
					
					
				</div>
			</div>
			<form action="BlogListSearch.bl" method="post" class="search-form" id="hhh">
                <div class="form-group"style="margin-left: 90px;">
                <select name = "option" class="category-select">
  					<option class="sop-01" value="blog_subject">제목</option>
  					<option class="sop-01" value="blog_content1">내용</option>
  					<option class="sop-01" value="blog_content">상세내용</option>
  					<option class="sop-01" value="blog_writer">작성자</option>
				</select>
                	<div class="icon" >
	                  <a href="#" class="icon-search" onclick="document.getElementById('hhh').submit()"><input type="submit" value="" onFocus="idclear();"  style="margin-right: 540px; margin-top: 30px; border: none; background: transparent;" /></a> 
					
                  </div>
                  <input type="text" name="keyword" placeholder="검색어를 입력해주세요." class="form-control" style="width:40%;">
                </div>
              </form>
		</div>
	</section>
	
	<footer>
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