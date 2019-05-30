<%@page import="vo.UserBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script language="javascript">
	function delconfirm(num) {
		var message = confirm("이 게시글을 삭제하시겠습니까?");
		if (message == true) {
			location.href = "./QnaDeletePro.qna?num=" + num;
		} else
			alert("취소되었습니다");
		return false;
	}
</script>
<%
	// String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우
	// ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
	QnaBean qnabean = new QnaBean();
// 	UserBean userbean = new UserBean();
	int qnaNum = qnabean.getQna_num();
	String qnaSubject = qnabean.getQna_subject();
	String qnaWriter = qnabean.getQna_writer();
	
	

	ArrayList<QnaBean> articleList = (ArrayList<QnaBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	System.out.println("jsp에서 article.size: " + articleList.size());
	int listCount = pageInfo.getListCount();
	int nowwPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
<style type="text/css">
b {
	font-size: 25px;
	font-color: gold;
}

.nav-link {
	backgound-color: #c49B63;
}

.nav-link active {
	backgound-color: #c49B63;
}

.ftco-menu {
	padding-top: 12em !important;
}

.pb-5, .py-5 {
	padding-bottom: 0 !important;
}

.mb-5, .my-5 {
	margin-bottom: 0 !important;
}

.table tbody tr td {
	text-align: left !important;
}

.div0525 {
	float: right !important;
}
</style>

<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(index) {
		$('#ac1').show();
		$('#ac2').hide();
		$('#ac3').hide();
	});

	$(document).ready(function(index) {
		$('#btn1').click(function() {

			$('#ac1').show();
			$('#ac2').hide();
			$('#ac3').hide();
			var offset = $('#btn1').offset();

		});
	});

	$(document).ready(function(index) {
		$('#btn2').click(function() {
			$('#ac1').hide();
			$('#ac2').show();
			$('#ac3').hide();
			var offset = $('#btn2').offset();

		});
	});

	$(document).ready(function(index) {
		$('#btn3').click(function() {
			$('#ac1').hide();
			$('#ac2').hide();
			$('#ac3').show();
			var offset = $('#btn3').offset();

		});
	});
</script>
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
</head>
<body>
	<header>
		<jsp:include page="/inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Qna</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="notice.jsp">Notice</a></span> <span><a
								href="qna.jsp">Q&A</a></span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco=section">
		<div class="container">
			<div class="row d-flex">
				<div class="blog-entry align-self-stretch">

					<!--     <p class="breadcrumbs">  -->
					<!-- 					<span class="mr-2"><a href="faq.jsp"><b>배송 관련</b> </a></span>| <span><a  -->
					<!-- 							href="faq2.jsp"> 결제 관련 </a></span>|<span><a href="faq3.jsp"> 교환/환불 관련 </a></span>  -->
					<!--  					</p> -->
					<section class="ftco-menu mb-5 pb-5">
						<div class="nav ftco-animate nav-pills justify-content-left"
							id="v-pills-tab" role="tablist" aria-orientation="vertical"
							style="margin-top: -100px;">

							<a class="nav-link active" data-toggle="pill" href="#v-pills-0"
								role="tab" aria-controls="v-pills-0" id="btn1_1"
								aria-selected="true" style="width: 200px; text-align: center;">배송관련</a>
							<a class="nav-link" data-toggle="pill" href="#v-pills-1"
								id="btn2_1" role="tab" aria-controls="v-pills-1"
								aria-selected="false" style="width: 200px; text-align: center;">결제/환불
								관련</a> <a class="nav-link" data-toggle="pill" href="#v-pills-2"
								role="tab" aria-controls="v-pills-2" id="btn3_1"
								aria-selected="false" style="width: 200px; text-align: center;">교환/반품
								관련</a>

						</div>
					</section>


					<section class="ftco=section" id="ac1">
						<%
							request.setCharacterEncoding("utf-8");
						%>
						<div class="container">
							<table class="table thead-light" id="ac1">
							<tr>
								<td><a data-toggle="collapse"
										href="#collapse1">번호</a></td>
									<td><a data-toggle="collapse"
										href="#collapse1">제목 </a>
										<div id="collapse1" class="panel-collapse collapse in">
											<div class="panel-body">
												<br> <b>A</b> &nbsp;&nbsp;
												<%-- 												<%=articleList.get(i).getQna_content()%> --%>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="QnaModifyForm.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;">수정</a> <a
																href="QnaDeletePro.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;"
																onclick="delconfirm('<%=qnaNum%>')">삭제</a>
														</div>
													</div>
												</section>
											</div></td>
											<td><a data-toggle="collapse" 
										href="#collapse1">작성자</a></td>
											<td><a data-toggle="collapse"
										href="#collapse1">작성일</a></td>
								</tr>
								<%
									if (articleList != null && listCount > 0) {
										for (int i = 0; i < 3; i++) {
											// articleList.size() ?
								%>
								
								<tr>
								<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">24</a></td>
									<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1"><%=qnaSubject %> </a>
										<div id="collapse1" class="panel-collapse collapse in">
											<div class="panel-body">
												<br> <b>A</b> &nbsp;&nbsp;
												<%-- 												<%=articleList.get(i).getQna_content()%> --%>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="QnaModifyForm.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;">수정</a> <a
																href="QnaDeletePro.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;"
																onclick="delconfirm('<%=qnaNum%>')">삭제</a>
														</div>
													</div>
												</section>
											</div></td>
											<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1"><%=qnaWriter %></a></td>
											<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">2019-05-31</a></td>
								</tr>
								<%
									}
									}
								%>
							</table>
						</div>
					</section>



					<!-- 					<section class="ftco=section" id="ac2"> -->
					<!-- 						<div class="container"> -->
					<!-- 							<table class="table thead-light" id="ac2"> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse8">Q -->
					<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송중에 결제취소가 가능한가요? </a> -->
					<!-- 										<div id="collapse8" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->
					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse9">Q -->
					<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제취소 내역은 어디에서 확인하나요 </a> -->
					<!-- 										<div id="collapse9" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->

					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse10">Q -->
					<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문 한 상품을 취소하고싶어요 </a> -->
					<!-- 										<div id="collapse10" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->

					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse11">Q -->
					<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환불을 받지않고 그 금액으로 다른 상품을 -->
					<!-- 											구매할 수 있나요 </a> -->
					<!-- 										<div id="collapse11" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->
					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse12">Q -->
					<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환불받을 계좌를 변경하고싶어요</a> -->
					<!-- 										<div id="collapse12" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->

					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->

					<!-- 							</table> -->
					<!-- 						</div> -->
					<!-- 					</section> -->
					<!-- 					<section class="ftco=section" id="ac3"> -->
					<!-- 						<div class="container"> -->
					<!-- 							<table class="table thead-light" id="ac3"> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse14">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반품신청을 -->
					<!-- 											했는데 반품 안하고 상품을 다시 사용하고 싶어요 </a> -->
					<!-- 										<div id="collapse14" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->
					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse15">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품을 -->
					<!-- 											교환하고 싶어요 </a> -->
					<!-- 										<div id="collapse15" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->
					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->
					<!-- 								<tr> -->
					<!-- 									<td><a data-toggle="collapse" data-parent="#accordian" -->
					<!-- 										href="#collapse17">Q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반품/교환이 -->
					<!-- 											불가한 경우가 있나요 </a> -->
					<!-- 										<div id="collapse17" class="panel-collapse collapse in"> -->
					<!-- 											<div class="panel-body"> -->
					<!-- 												<br> <b>A</b> &nbsp;&nbsp; A small river named Duden -->
					<!-- 												flows by their place<br> and supplies it with the -->
					<!-- 												necessary regelialia. -->

					<!-- 											</div> -->
					<!-- 										</div></td> -->
					<!-- 								</tr> -->

					<!-- 							</table> -->
					<!-- 						</div> -->
					<!-- 					</section> -->

					<!-- 				</div> -->
					<!-- 	</section> -->

					<!--     <section class="ftco-section"> -->
					<!--       <div class="container"> -->
					<!--         <div class="row d-flex"> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_1.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_2.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_3.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_4.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_5.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--           <div class="col-md-4 d-flex ftco-animate"> -->
					<!--           	<div class="blog-entry align-self-stretch"> -->
					<!--               <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_6.jpg');"> -->
					<!--               </a> -->
					<!--               <div class="text py-4 d-block"> -->
					<!--               	<div class="meta"> -->
					<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
					<!--                   <div><a href="#">Admin</a></div> -->
					<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
					<!--                 </div> -->
					<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
					<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
					<!--               </div> -->
					<!--             </div> -->
					<!--           </div> -->
					<!--         </div> -->


					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
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