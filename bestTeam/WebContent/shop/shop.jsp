<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ItemBean> itemList = (ArrayList<ItemBean>)request.getAttribute("itemList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
// 	System.out.println("listCount : " + listCount);
// 	System.out.println("nowPage : " + nowPage);
// 	System.out.println("maxPage : " + maxPage);
// 	System.out.println("startPage : " + startPage);
// 	System.out.println("endPage : " + endPage);
// 	System.out.println("itemList.size() : " + itemList.size());
%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="./css/shop.css">

<style type="text/css">
	.display_none { display: none; }
	
/* 	#v-pills-1-tab:hover { */
/* 		border: 1px solid red; */
		
/* 	} */
/* 	#v-pills-2-tab { */
/* 		border: 1px solid blue; */
/* 	} */
/* 	#v-pills-3-tab { */
/* 		border: 1px solid green; */
/* 	} */
/* 	#v-pills-4-tab { */
/* 		border: 1px solid blue; */
/* 	} */
/* 	#v-pills-5-tab { */
/* 		border: 1px solid white; */
/* 	} */
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var params = location.search.substr(location.search.indexOf("?") + 1);
		var param = "";
		var paramTaste = "";
		var paramFilter = "";
		var paramDegree = "";
		
		params = params.split("&");
		if(params[0] != "") { // 파라미터 있음
			for (var i = 0 ; i < params.length ; i++) {
				param = params[i].split("=");
				if (param[0] == 'taste') {
					paramTaste = param;
				} else if (param[0] == 'filter') {
					paramFilter = param;
				} else if (param[0] == 'degree') {
					paramDegree = param;
				}
			}
			
			if(paramTaste[1] == 'item_favor_aroma') {
				$("#v-pills-1-tab").addClass("active"); 
			} else if (paramTaste[1] == 'item_favor_acidity') {
				$("#v-pills-2-tab").addClass("active");
			} else if (paramTaste[1] == 'item_favor_sweetness') {
				$("#v-pills-3-tab").addClass("active");
			} else if (paramTaste[1] == 'item_favor_bitterness') {
				$("#v-pills-4-tab").addClass("active");
			} else if (paramTaste[1] == 'item_favor_body') {
				$("#v-pills-5-tab").addClass("active");
			} else if (paramTaste[1] == 'all' || paramTaste[1] == null) {
				$("#v-pills-0-tab").addClass("active");
				$("#v-degree-tab").addClass("display_none");
				$("#v-degree-tab").css("display", "none");
			}
			
			if(paramFilter[1] == 'newest' || paramFilter[1] == "" ) {
				$("#select_id").val("newest").prop("selected", true);
			} else if(paramFilter[1] == 'popular' ) {
				$("#select_id").val("popular").prop("selected", true);
			} else if(paramFilter[1] == 'lowPrice' ) {
				$("#select_id").val("lowPrice").prop("selected", true);
			} else if(paramFilter[1] == 'highPrice' ) {
				$("#select_id").val("highPrice").prop("selected", true);
			}
			
			if(paramDegree[1] == '1') {
				$("#v-degree-1-tab").addClass("active");
			} else if(paramDegree[1] == '2') {
				$("#v-degree-2-tab").addClass("active");
			} else if(paramDegree[1] == '3') {
				$("#v-degree-3-tab").addClass("active");
			} else if(paramDegree[1] == '4') {
				$("#v-degree-4-tab").addClass("active");
			} else if(paramDegree[1] == '5') {
				$("#v-degree-5-tab").addClass("active");
			}
			
		} else { // 파라미터 없음
			$("#v-pills-0-tab").addClass("active");
// 			$("#v-degree-tab").addClass("display_none");
			$("#v-degree-tab").css("display", "none");
		}
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
			style="background-image: url(./images/bg_3.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Order Online</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="./index.jsp">Home</a></span> <span>Shop</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-menu mb-5 pb-5"  id="go_top">
		<div class="container">
			<div class="row d-md-flex">
			
			<!-- 우측 퀵메뉴 -->
	<div class="quick">
		<a href="javascript:void(0)" class="tablink" onclick="openPage('Home', this)" id="defaultOpen"><img alt="recent" src="./images/g_con_1_2.png"></a>
		<a href="javascript:void(0)" class="tablink" onclick="openPage('News', this)"><img alt="pick" src="./images/g_con_2_1.png"></a>
		<a href="./shop/cart.jsp" class="tablink"><img alt="cart" src="./images/g_con_3_1.png"></a>

			<div id="Home" class="tabcontent">
				<h6>RECENTLY</h6>
			  <a href="./shop/product-single.jsp"><img alt="" src="./images/menu-1.jpg"></a>
			</div>
			
			<div id="News" class="tabcontent">
			  <h6>Pick</h6>
			  <a href="./shop/product-single.jsp"><img alt="" src="./images/menu-2.jpg"></a>
			</div>
			
			<script>
			function openPage(pageName,elmnt,color) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablink");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].style.backgroundColor = "";
			  }
			  document.getElementById(pageName).style.display = "block";
			  elmnt.style.backgroundColor = color;
			}
			
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			
			function getParams (kind, val) {
				
				var params = location.search.substr(location.search.indexOf("?") + 1);
				var QuestionIndex = location.href.indexOf("?");
				var url = "";
				
				if (QuestionIndex == -1 ) {
					url = location.href.substring();
				} else {
					url = location.href.substring(0, QuestionIndex);
				} 
				
				var param = "";
				var paramUrl = "?";
				
				params = params.split("&");
				for (var i = 0 ; i < params.length ; i++) {
					param = params[i].split("=");
					if (param[0] != kind && param[0] != "") {
						paramUrl = paramUrl + param[0] + '=' + param[1] + '&';
					} else {
						continue;
					}
				}
				
				paramUrl = paramUrl + kind + '=' + val;
				location.href = url + paramUrl;
				
			}
			
			</script>
			
			<div class="quick_mid"> 
				<ul class="sec_m">
					<li><img alt="prev" src="./images/g_con_prev.png"></li>
					<li>1 / 1</li>
					<li><img alt="next" src="./images/g_con_next.png"></li>
				</ul>
			</div> 
		<div class="quick_bottom">
			<ul>
				<li><a href="javascript:void(0)" onclick="history.go(-1)"><img alt="back" src="./images/back.png"></a></li>
				<li><a href="#go_top"><img alt="top" src="./images/up_btn.png"></a></li>
				<li><a href="#go_bottom"><img alt="bottom" src="./images/down_btn.png"></a></li>
			</ul>
		</div>
	</div>
			<!-- 우측 퀵메뉴 끝 -->
			
				<div class="col-lg-12 ftco-animate p-md-5">

					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-bottom: 1rem;">

								<a class="nav-link" id="v-pills-0-tab" 
									href="shopMain.em?taste=all" role="tab" aria-controls="v-pills-0" onmouseover="$('#v-degree-tab').hide()" onmouseout="if(!$('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')"
									aria-selected="true">ALL</a> 
								<a class="nav-link" id="v-pills-1-tab" href="shopMain.em?taste=item_favor_aroma" onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()"                 
									aria-controls="v-pills-1" aria-selected="false" >Aroma</a>
								<a class="nav-link" id="v-pills-2-tab" onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" 
									href="shopMain.em?taste=item_favor_acidity" role="tab" aria-controls="v-pills-2"
									aria-selected="false">Acidity</a> 
								<a class="nav-link" id="v-pills-3-tab" href="shopMain.em?taste=item_favor_sweetness" onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" 
									role="tab" aria-controls="v-pills-3" aria-selected="false">Sweetness</a>
								<a class="nav-link" id="v-pills-4-tab" href="shopMain.em?taste=item_favor_bitterness" onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" 
									role="tab" aria-controls="v-pills-3" aria-selected="false">Bitterness</a>
								<a class="nav-link" id="v-pills-5-tab" href="shopMain.em?taste=item_favor_body" onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()"
									role="tab" aria-controls="v-pills-3" aria-selected="false">Body</a>
							</div>

							<div class="nav ftco-animate nav-pills justify-content-center" 
								id="v-degree-tab" role="tablist" aria-orientation="vertical">
								<a class="nav-link" id="v-degree-0-tab" role="tab" 
									aria-controls="v-pills-0" aria-selected="true">진하기</a> 
								<a class="nav-link" id="v-degree-1-tab" href="javascript:getParams ('degree', 1);"
									aria-controls="v-pills-1" aria-selected="false">1</a>
								<a class="nav-link" id="v-degree-2-tab" href="javascript:getParams ('degree', 2);"
									role="tab" aria-controls="v-pills-2" aria-selected="false">2</a> 
								<a class="nav-link" id="v-degree-3-tab" href="javascript:getParams ('degree', 3);"
									role="tab" aria-controls="v-pills-3" aria-selected="false">3</a>
								<a class="nav-link" id="v-degree-4-tab" href="javascript:getParams ('degree', 4);"
									role="tab" aria-controls="v-pills-3" aria-selected="false">4</a>
								<a class="nav-link" id="v-degree-5-tab" href="javascript:getParams ('degree', 5);"
									role="tab" aria-controls="v-pills-3" aria-selected="false">5</a>
							</div>
						</div>
		
		

						<div class="col-md-12 d-flex align-items-center">

							<div class="tab-content ftco-animate" id="v-pills-tabContent" style="width: 100%;">

								<div class="tab-pane fade show active" id="v-pills-0"
									role="tabpanel" aria-labelledby="v-pills-0-tab">

									<div class="shop-select">
										<select id="select_id" class="shop-name-select mb-5" onchange="getParams ('filter', this.value)">
											<option class="sop-01" value="newest">신상품순</option>
											<option class="sop-01" value="popular">인기상품순</option>
											<option class="sop-01" value="lowPrice">낮은가격순</option>
											<option class="sop-01" value="highPrice">높은가격순</option>
										</select>
									</div>
									<div class="shop-subcategory text text-center mb-5">
									 	<a>여기에 추천상품...</a>
<!-- 										<a href="#" class="ss-1"> 뭐를 </a> /  -->
<!-- 										<a href="#" class="ss-1">넣으면 </a> /  -->
<!-- 										<a href="#" class="ss-1"> 좋을까 </a> /  -->
<!-- 										<a href="#" class="ss-1"> 생각중 </a> /  -->
<!-- 										<a href="#" class="ss-1"> 입니다 </a> -->
									</div>



									<div class="row">
									
										<%
											if (itemList != null && listCount > 0) {
												for (int i = 0 ; i < itemList.size() ; i++) {
										%>
											<div class="col-md-3">
												<div class="menu-entry">
													<a href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>" class="img"
														style="background-image: url(./itemUpload/<%=itemList.get(i).getItem_img() %>);"></a>
													<div class="text text-center pt-4">
														<h3>
															<a href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>"><%=itemList.get(i).getItem_name() %></a>
														</h3>
														<p> 
															<table>
																<tr>
																	<td>Acidity : </td>
																	<td><%=itemList.get(i).getItem_favor_acidity() %></td>
																	<td>Aroma : </td>
																	<td><%=itemList.get(i).getItem_favor_aroma() %></td>
																</tr>
																<tr>
																	<td>Bitterness : </td>
																	<td><%=itemList.get(i).getItem_favor_bitterness() %>&nbsp;</td>
																	<td>Sweetness : </td>
																	<td><%=itemList.get(i).getItem_favor_sweetness() %></td>
																</tr>
																<tr>
																	<td>Body : </td>
																	<td><%=itemList.get(i).getItem_favor_body() %></td>
																</tr>
															</table>
														</p>
														<p class="price">
															<span><%=itemList.get(i).getItem_price() %>원</span>
														</p>
														<p>
															<a href="cart.html"
																class="btn btn-primary btn-outline-primary">Add to
																Cart</a>
														</p>
													</div>
												</div>
											</div>
										<% 		
												} 
											}
										%>
										
									</div>


									<div class="row mt-5">
										<div class="col text-center">
											<div class="block-27">
												<ul>
													<% if(nowPage <= 1) { %>
													<li><a>&lt;</a></li>
													<% } else { %>
													<li><a href= "javascript:getParams ('page', <%=nowPage-1 %>);">&lt;</a></li>
													<% } 
													for (int a = startPage ; a <= endPage; a++) {
														if(a == nowPage) {
															%><li class="active"><span><%=a %></span></li><%
														} else {
															%><li><a href="javascript:getParams ('page', <%=a %>);"><%=a %></a></li><%
														}
													}
													%>
													<% if(nowPage >= maxPage) { %>
													<li><a>&gt;</a></li>
													<% } else { %>
													<li><a href="javascript:getParams ('page', <%=nowPage+1 %>);">&gt;</a></li>
													<% } %>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	
	
	<footer class="ftco-footer ftco-section img" id="go_bottom">
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
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       if( num >= 350 ){  // 스크롤을 36이상 했을 때
					$('.quick').removeClass('fadeOut').addClass('fadeIn');
		       }else{
		    	   $('.quick').removeClass('fadeIn').addClass('fadeOut');
		       }
		 	 });
			$(window).resize(function(){
				if ($(window).width() < 1210 ) {
					$('.quick').addClass('hide-menu');
				} else {
					$('.quick').removeClass('hide-menu');
				}
			});
			
		});
	</script>

</body>
</html>