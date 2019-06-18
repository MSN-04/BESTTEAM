<%@page import="java.util.SimpleTimeZone"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserBean"%>
<%@page import="vo.BlogCommentBean"%>
<%@page import="vo.BlogBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BlogBean article = (BlogBean) request.getAttribute("article");
	ArrayList<BlogCommentBean> articleList = (ArrayList<BlogCommentBean>) request.getAttribute("articleList");
	
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	String nowPage = (String) request.getAttribute("page"); 

// 	UserBean userbean = (UserBean)request.getAttribute("userBean");
// 	String userName = userbean.getUser_name();
// 	String userId = userbean.getUser_id();
// 	String id = session.getAttribute("id").toString();
	
	int blog_num = Integer.parseInt(request.getParameter("blog_num"));
	String comment_writer = request.getParameter("comment_writer");
	String comment_content = request.getParameter("comment_content");

	// 댓글에 있는 날짜 포맷 변환
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("MMMM dd, yyyy");
	SimpleDateFormat time = new SimpleDateFormat("k:mm");
// 	June 27, 2018 at 2:21pm 형식

	System.out.println("오늘 날짜는 " + sdf.format(today));
	System.out.println("현재 시간은 " + time.format(today));
%>

	<script language="javascript">
	function delconfirm(num) {
		var message = confirm("이 게시글을 삭제하시겠습니까?");
		if (message == true) {
			location.href = "./BlogCommentDeletePro.bl?num=" + num;
		} else
			alert("취소되었습니다.");
		return false;
	}

	// 댓글창 숨기기
	function SirenFunction(idMyDiv){
	     var objDiv = document.getElementById(idMyDiv);
	     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
	      else{ objDiv.style.display = "block"; }
	}
	
	// 댓글 삭제
	function delCmt(comment_num) {
		var message = confirm("이 댓글을 삭제하시겠습니까?");
		if (message == true) {
			location.href = "./BlogCommentDeletePro.bl?comment_num="
					+ comment_num;
		} else
			alert("취소되었습니다.");
		return false;
	}
</script>
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



<style type="text/css">
.col-md-8 {
	flex: auto;
	margin: auto;
	max-width: 80%;
}

.sir_singo_msg {
	color: #934545;
	margin-bottom: 30px
}

.sir_singo_msg button {
	cursor: pointer;
	font-family: Arial, '돋움', Dotum;
	border: none;
	padding: 0;
	background: #fff;
	outline: 0
}

.sir_singo_msg .blind_view {
	font-size: 1.14em;
	font-weight: bold;
	color: #ffffff;
	margin-top: -3px;
	text-decoration: underline
}

.singo_view {
	display: none;
}

.col-md-8 img {
	width: 100%;
} /* 폼에 들어가는 사진 크기 조정(반드시 필요) */
.col-md-8 p { /* 자동 개행 */
	word-wrap: break-word;
	white-space: pre-wrap;
	word-break: break-all;
}

.row {
	flex-wrap: nowrap;
}

/*     	@media screen and (max-width: 991px) */
.hide-menu {
	display: none;
}

.side-small-menu {
	position: fixed;
}

.side-small-menu path {
	border: 1px solid white;
	fill: rgb(190, 190, 190);
}

.side-small-menu {
	padding: 0;
	list-style: none;
	list-style-image: none;
	top: 155px;
	transform: translateY(-35px) translateX(-20px);
}

.side-small-menu>li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.side-small-menu button {
	-webkit-tap-highlight-color: transparent;
	background: rgba(0, 0, 0, 0);
	cursor: pointer;
	box-sizing: border-box;
	border-style: outset;
	border-width: 0;
}

.fadeIn {
	visibility: visible;
	opacity: 1;
	transition: visibility 0s 0s, opacity .3s 0s;
}

.fadeOut {
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s .3s, opacity .3s 0s;
}

.up-button {
	position: fixed;
	right: 16px;
	bottom: 16px;
	z-index: 50;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #242424;
	background-image:
		url("https://assets.website-files.com/5c330a4a121342bde4045c5d/5c35885e1c5d6080565a921c_chevrons-up-white.svg");
	background-position: 50% 46%;
	background-size: 20px;
	background-repeat: no-repeat;
	transition: all 400ms cubic-bezier(.215, .61, .355, 1);
}

.w-inline-block {
	max-width: 100%;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(window)
								.scroll(
										function() { //스크롤하면 아래 코드 실행
											var num = $(this).scrollTop(); // 스크롤값
											if (num >= 700) { // 스크롤을 36이상 했을 때
												$('.side-small-menu')
														.removeClass('fadeOut')
														.addClass('fadeIn');
												$('#goTop')
														.css(
																{
																	'transform' : 'translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg)',
																	'opacity' : '1'
																});
											} else {
												$('.side-small-menu')
														.removeClass('fadeIn')
														.addClass('fadeOut');
												$('#goTop')
														.css(
																{
																	'transform' : 'translate3d(0px, 0px, 0px) scale3d(0, 0, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg)',
																	'opacity' : '0'
																});
											}
										});

						$(window).resize(function() {
							if ($(window).width() < 1210) {
								$('.side-small-menu').addClass('hide-menu');
							} else {
								$('.side-small-menu').removeClass('hide-menu');
							}
						});

						$('#goTop').click(function() {
							$('html, body').animate({
								scrollTop : 750
							}, 400, "swing");
							return false;
						});

					});
</script>
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
			<!-- 			<div class="row"> -->
			<!-- 왼쪽 작은 메뉴 시작 -->
			<ul class="side-small-menu">
				<li>
					<!--     				<div  style="background-size: cover; background-repeat: no-repeat; background-image: url(../images/moon.jpg); width: 80px; height: 80px; margin-bottom: 10px; "></div> -->
					<div
						style="font-size: 23px; font-style: italic; font-family: -webkit-pictograph; margin-bottom: 3px;">Tinkervell</div>
					<div>
						<p
							style="font-weight: bold; margin-bottom: 1px; line-height: 10px; font-size: 23px;">to get more</p>
						<p>Follow Us</p>
					</div>
				</li>
				<li style="border: 1px inset #343a40; margin: 10px 0 20px 0;"></li>
<!-- 				<li style="margin-bottom: 6px;"> -->
					<!-- 박수 -->
<!-- 					<button> -->
<!-- 						<span> <svg -->
<!-- 								style="width: 29px; height: 29px; vertical-align: bottom;"> -->
<!-- 								<g> -->
<!-- 									<path d="M13.739 1l.761 2.966L15.261 1z"></path> -->
<!-- 									<path d="M16.815 4.776l1.84-2.551-1.43-.471z"></path> -->
<!-- 									<path d="M10.378 2.224l1.84 2.551-.408-3.022z"></path> -->
<!-- 									<path -->
<!-- 									d="M22.382 22.622c-1.04 1.04-2.115 1.507-3.166 1.608.168-.14.332-.29.492-.45 2.885-2.886 3.456-5.982 1.69-9.211l-1.101-1.937-.955-2.02c-.315-.676-.235-1.185.245-1.556a.836.836 0 0 1 .66-.16c.342.056.66.28.879.605l2.856 5.023c1.179 1.962 1.379 5.119-1.6 8.098m-13.29-.528l-5.02-5.02a1 1 0 0 1 .707-1.701c.255 0 .512.098.707.292l2.607 2.607a.442.442 0 0 0 .624-.624L6.11 15.04l-1.75-1.75a.998.998 0 1 1 1.41-1.413l4.154 4.156a.44.44 0 0 0 .624 0 .44.44 0 0 0 0-.624l-4.152-4.153-1.172-1.171a.998.998 0 0 1 0-1.41 1.018 1.018 0 0 1 1.41 0l1.172 1.17 4.153 4.152a.437.437 0 0 0 .624 0 .442.442 0 0 0 0-.624L8.43 9.222a.988.988 0 0 1-.291-.705.99.99 0 0 1 .29-.706 1 1 0 0 1 1.412 0l6.992 6.993a.443.443 0 0 0 .71-.501l-1.35-2.856c-.315-.676-.235-1.185.246-1.557a.85.85 0 0 1 .66-.16c.342.056.659.28.879.606L20.628 15c1.573 2.876 1.067 5.545-1.544 8.156-1.396 1.397-3.144 1.966-5.063 1.652-1.713-.286-3.463-1.248-4.928-2.714zM12.99 6.976l2.562 2.562c-.497.607-.563 1.414-.155 2.284l.265.562-4.257-4.257a.98.98 0 0 1-.117-.445c0-.267.104-.517.292-.706a1.023 1.023 0 0 1 1.41 0zm8.887 2.06c-.375-.557-.902-.916-1.486-1.011a1.738 1.738 0 0 0-1.342.332c-.376.29-.61.656-.712 1.065a2.1 2.1 0 0 0-1.095-.562 1.776 1.776 0 0 0-.992.128l-2.636-2.636a1.883 1.883 0 0 0-2.658 0 1.862 1.862 0 0 0-.478.847 1.886 1.886 0 0 0-2.671-.012 1.867 1.867 0 0 0-.503.909c-.754-.754-1.992-.754-2.703-.044a1.881 1.881 0 0 0 0 2.658c-.288.12-.605.288-.864.547a1.884 1.884 0 0 0 0 2.659l.624.622a1.879 1.879 0 0 0-.91 3.16l5.019 5.02c1.595 1.594 3.515 2.645 5.408 2.959a7.16 7.16 0 0 0 1.173.098c1.026 0 1.997-.24 2.892-.7.279.04.555.065.828.065 1.53 0 2.969-.628 4.236-1.894 3.338-3.338 3.083-6.928 1.738-9.166l-2.868-5.043z"></path> -->
<!-- 								</g> -->
<!-- 							</svg> <span style="vertical-align: bottom; margin-left: 8px;"> -->
<!-- 								1 </span> -->
<!-- 						</span> -->
<!-- 					</button> -->
<!-- 				</li> -->
				<li>
					<!-- 트위터 -->
					<button>
					<script type="text/javascript">
						function shareUrl (e) {
							// 현재 페이지의 url
						    var url = decodeURIComponent(location.href);
						    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
						    url = decodeURIComponent(url);
						 
						    var params;
						    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
						    params = url.substring( url.indexOf('?')+1, url.length );
							
						    urlShare = location.protocol + '//' + window.location.host + window.location.pathname + '?' + params;
						    
						    if (e.getAttribute('id') == 'twit') {
								url = 'http://twitter.com/share?url=' + urlShare +'&text=Cafe%20ThinkerBell%20에서의%20포스팅을%20확인해보세요';
								window.open(url, '_blank'); 
						    } else if (e.getAttribute('id') == 'fb') {
						    	url = 'http://www.facebook.com/share.php?u=' + urlShare;
								window.open(url, '_blank'); 
						    }
						}
					</script>
						<span> <a onclick="shareUrl(this);" target="_blank" id="twit"> <svg width="29" height="29">
									<g>
										<path
										d="M22.053 7.54a4.474 4.474 0 0 0-3.31-1.455 4.526 4.526 0 0 0-4.526 4.524c0 .35.04.7.082 1.05a12.9 12.9 0 0 1-9.3-4.77c-.39.69-.61 1.46-.65 2.26.03 1.6.83 2.99 2.02 3.79-.72-.02-1.41-.22-2.02-.57-.01.02-.01.04 0 .08-.01 2.17 1.55 4 3.63 4.44-.39.08-.79.13-1.21.16-.28-.03-.57-.05-.81-.08.54 1.77 2.21 3.08 4.2 3.15a9.564 9.564 0 0 1-5.66 1.94c-.34-.03-.7-.06-1.05-.08 2 1.27 4.38 2.02 6.94 2.02 8.31 0 12.86-6.9 12.84-12.85.02-.24.01-.43 0-.65.89-.62 1.65-1.42 2.26-2.34-.82.38-1.69.62-2.59.72a4.37 4.37 0 0 0 1.94-2.51c-.84.53-1.81.9-2.83 1.13z"></path>
									</g>
								</svg>
							</a>
						</span>
					</button>
				</li>
				<li>
					<!-- 페이스북 -->
					<button>
						<span> <a onclick="shareUrl(this);" target="_blank" id="fb"> <svg width="29" height="29">
									<g>
										<path
										d="M23.209 5H5.792A.792.792 0 0 0 5 5.791V23.21c0 .437.354.791.792.791h9.303v-7.125H12.72v-2.968h2.375v-2.375c0-2.455 1.553-3.662 3.741-3.662 1.049 0 1.95.078 2.213.112v2.565h-1.517c-1.192 0-1.469.567-1.469 1.397v1.963h2.969l-.594 2.968h-2.375L18.11 24h5.099a.791.791 0 0 0 .791-.791V5.79a.791.791 0 0 0-.791-.79"></path>
									</g>
								</svg>
						</a>
						</span>
					</button>
				</li>
			</ul>
			<!-- 왼쪽 작은 메뉴 끝 -->

			<div class="col-md-8 ftco-animate">
				<h2 class="mb-3"><%=article.getBlog_subject()%></h2>
				<p><%=article.getBlog_content()%></p>

				<%
					String id = (String) session.getAttribute("id");
					if (id != null && id.equals("admin")) {
				%>
				<a href="./blog.bl" class="btn btn-primary btn-outline-primary"
					style="float: right;">글목록</a>
				<a href="blogModifyForm.bl?blog_num=<%=blog_num%>"
					class="btn btn-primary btn-outline-primary" style="float: right;">수정</a>
				<a href="BlogDeletePro.bl?blog_num=<%=blog_num%>"
					class="btn btn-primary btn-outline-primary" style="float: right;">삭제</a>
				
				<%
					} else {
				%><a href="./blog.bl" class="btn btn-primary btn-outline-primary"
					style="float: right;">글목록</a>
				<%
					}
				%>
				<!-- <---------------- 태그클라우드 --------------->
<!-- 				<div class="tag-widget post-tag-container mb-5 mt-5"> -->
<!-- 					<div class="tagcloud"> -->
<!-- 						<a href="#" class="tag-cloud-link">로스팅</a> <a href="#" -->
<!-- 							class="tag-cloud-link">핸드드립</a> <a href="#" -->
<!-- 							class="tag-cloud-link">융드립</a> <a href="#" class="tag-cloud-link">에스프레소</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- <---------------- 태그클라우드 끝 --------------->


				<div class="pt-5 mt-5">
					<!-- 코멘트 i개 -->
					<h3 class="mb-5">코멘트 1개</h3>
					<%
						// if (articleList != null && listCount > 0) { 
						for (int i = 0; i < articleList.size(); i++) {
					%>
					<ul class="comment-list">
						<li class="comment">
							<div class="vcard bio">
								<img src="./images/person_2.png" alt="Image placeholder">
							</div>

							<div class="comment-body">
								<input type="hidden" name="comment_blog_num"
									value="<%=articleList.get(i).getComment_num()%>"
									id="comment_blog_num">

								<h3><%=articleList.get(i).getComment_writer() %></h3>

								<div class="meta"><%=sdf.format(articleList.get(i).getComment_date())%>&nbsp;<%=time.format(articleList.get(i).getComment_date()) %></div>
								<!-- June 27, 2018 at 2:21pm 형식으로 출력 -->
								<p><%=articleList.get(i).getComment_content()%></p>
								<div
									style='display: text-decoration; float: right; width: 1000px'>
									<%
											if (id != null && id.equals("admin")) {

// 												System.out.println(articleList.get(i).getComment_blog_num());
// 												System.out.println(articleList.get(i).getComment_content());
									%>

			<!-- ------------------------------------ Start Comment-List  ------------------------------------------>
									
										<div class="sir_singo_msg">
											<a href="#" style="margin-left: 220px; font-size: 12px;"
												onclick="SirenFunction('SirenDiv<%=i%>'); return false;"
												class="blind_view">수정</a>
										</div>
										<div class="singo_view" id="SirenDiv<%=i%>">
											<form action="BlogCommentModifyPro.bl" method="post" style="display: inline;">
												<!-- text -->
												<textarea name="comment_modify" id="comment_modify" cols="30" maxlength="200" 
													rows="4" class="form-control" style="width: 78%; margin-left: 221px; padding: 5px; font-size: 15px;
													border: 1px solid !important; background: white !important; color: black !important;"><%=articleList.get(i).getComment_content() %></textarea>
													
												<input type="hidden" name="comment_num"
													value="<%=articleList.get(i).getComment_num()%>"> <input
													type="hidden" name="comment_blog_num"
													value="<%=articleList.get(i).getComment_blog_num()%>">
												<input type="submit" class="reply" value="수정" style="float: right; margin-top: 5px;">

											</form>
											<form action="BlogCommentDeletePro.bl" method="post" style="display: inline;">
												<input type="hidden" name="comment_num"
													value="<%=articleList.get(i).getComment_num()%>"> <input
													type="hidden" name="comment_blog_num"
													value="<%=articleList.get(i).getComment_blog_num()%>">
												<input type="submit" class="reply" value="삭제" onclick="delCmt(<%=articleList.get(i).getComment_num()%>)" style="float: right; margin-top: 5px;">
											</form>
										</div>
									

									<%
										} else if (id != null && id.equals(articleList.get(i).getComment_writer())) {
									%>
											<div class="sir_singo_msg">
												<a href="#" style="margin-left: 220px; font-size: 12px;"
													onclick="SirenFunction('SirenDiv<%=i%>'); return false;"
													class="blind_view">수정</a>
											</div>
											<div class="singo_view" id="SirenDiv<%=i%>">
												<form action="BlogCommentModifyPro.bl" method="post" style="display: inline;">
													<!-- text -->
													<textarea name="comment_modify" id="comment_modify" cols="30" maxlength="200" 
													rows="4" class="form-control" style="width: 78%; margin-left: 221px; padding: 5px; font-size: 15px;
													border: 1px solid !important; background: white !important; color: black !important;"><%=articleList.get(i).getComment_content() %></textarea>
														
													<input type="hidden" name="comment_num"
														value="<%=articleList.get(i).getComment_num()%>"> <input
														type="hidden" name="comment_blog_num"
														value="<%=articleList.get(i).getComment_blog_num()%>">
													<input type="submit" class="reply" value="수정" style="float: right; margin-top: 5px;">
	
												</form>
												<form action="BlogCommentDeletePro.bl" method="post" style="display: inline;">
													<input type="hidden" name="comment_num"
														value="<%=articleList.get(i).getComment_num()%>"> <input
														type="hidden" name="comment_blog_num"
														value="<%=articleList.get(i).getComment_blog_num()%>">
													<input type="submit" class="reply" value="삭제" onclick="delCmt(<%=articleList.get(i).getComment_num()%>)" style="float: right; margin-top: 5px;">
												</form>
											</div>
									<%
										}
									%>

								</div>
							</div>
						</li>
					</ul>
					<%
						}
					%>
					<!-------------------------------- END comment-list ----------------------------------->
					<!-- ----------------------------- Comment Write ----------------------------------- -->
					<%
						if (id != null) {
					%>
					<script type="text/javascript">

					</script>
					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">
							코멘트 남기기</h3>
						<form id="frm_comment" action="BlogCommentWritePro.bl"
							method="post">
							<input type="hidden" name="blog_num"
								value="<%=article.getBlog_num()%>" id="blog_num">
											
							<!-- 블로그 게시글 번호   -->
							<div class="form-group">
								<label for="name">아이디</label> <input type="text"
									class="form-control" id="name" name="name" value="<%=id %>" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="message">내용</label>
								<textarea name="comment_content" id="comment_content" cols="30" maxlength="200"
									rows="4" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="작성 완료"
									class="btn py-3 px-4 btn-primary">
							</div>
						</form>
					</div>
					<%
						} else if (id == null) {
					%><br>로그인 후 댓글 작성이 가능합니다.
					<%
						}
						// 							}
					%>
				</div>
			</div>
		</div>
	</section>
	<!-------------------------------- END comment-Write ----------------------------------->
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