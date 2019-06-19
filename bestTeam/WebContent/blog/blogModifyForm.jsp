<%@page import="vo.BlogBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	BlogBean article = (BlogBean)request.getAttribute("article");
	int blog_num = Integer.parseInt(request.getParameter("blog_num"));
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
<!---------------------- 스마트 에디터 가져오는 영역 시작 ---------------------->
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="<%=ctx%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
	
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
	var oEditors = [];
	
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
		    elPlaceHolder: "ir1",// textarea id로 변경해야 함 [id = ir1(155번째줄)]
		    sSkinURI: "<%=ctx%>/se2/SmartEditor2Skin.html",
		    fCreator: "createSEditor2",
// 		    fOnAppLoad : function(){
// 				oEditors.getById["ir1"].exec("PASTE_HTML", ['<span style="color: #999;" id="placeholder">이미지 퀵 에디터는 Microsoft Edge 또는 Window Explorer에서만 지원됩니다.</span>']);
// 		    }
		});
	
		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // textarea id 변경해야 함 [id = ir1(155번째줄)]
			$("#frm").submit(); // form id로 변경해야 함 [id = frm(146)]
		});
		
        
		
	});
	 
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
		var sHTML = '<img src="<%=ctx%>/itemUpload/'+filepath+'" style="max-width: 100%; height: auto; margin: 10px;">';
	    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]); // textarea id 변경해야 함 [id = ir1(155번째줄)]
	}
	
// 	oEditors.getById["ir1"].exec("PASTE_HTML", ['기본텍스트입니다.']); // placeholder
	
</script>
<!---------------------- 스마트 에디터 가져오는 영역 끝 ---------------------->
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Coffee<small>Blend</small></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
					<li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
					<li class="nav-item active"><a href="blog.html"
						class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="room.html" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="shop.html">Shop</a> <a
								class="dropdown-item" href="product-single.html">Single
								Product</a> <a class="dropdown-item" href="cart.html">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
					<li class="nav-item cart"><a href="cart.html" class="nav-link"><span
							class="icon icon-shopping_cart"></span><span
							class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Blog Details</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">Home</a></span> <span
								class="mr-2"><a href="blog.html">Blog</a></span> <span>Blog
								Single</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container" s>
			<form id="frm" action="blogModifyPro.bl?blog_num=<%=blog_num %>" method="post" enctype="multipart/form-data">
				<table width="100%">
					<tr>
						<td>제목</td>
						<td><input type="text" id="title" name="blog_subject" value="<%=article.getBlog_subject() %>"
							style="width: 100%;" /></td>
					</tr>
					<tr>
						<td>요약</td>
						<td colspan="3"><input type="text" id="blog_content1" name="blog_content1" value="<%=article.getBlog_content1() %>"
							style="width: 100%;"/></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><input type="text" id="blog_writer" name="blog_writer" value="<%=article.getBlog_writer() %>"
							style="width: 100%;" /></td>
							<td style="width: 86px;"><input type="file" id="blog_file" name="blog_file" 
							style="width: 100%;"required="required" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" id="ir1" name="blog_content" 
								style="width: 100%; height: 650px;"><%=article.getBlog_content() %></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="position: absolute; left: 50%;">	
						
							<input type="submit" id="save" value="저장" /> 
							<input type="reset" value="취소" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- .section -->
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