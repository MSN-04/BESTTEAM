<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/shop.css">

</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(../images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Order Online</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="../index.jsp">Home</a></span> <span>Shop</span>
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
		<a href="javascript:void(0)" class="tablink" onclick="openPage('Home', this)" id="defaultOpen"><img alt="recent" src="../images/g_con_1_2.png"></a>
		<a href="javascript:void(0)" class="tablink" onclick="openPage('News', this)"><img alt="pick" src="../images/g_con_2_1.png"></a>
		<a href="../shop/cart.jsp" class="tablink"><img alt="cart" src="../images/g_con_3_1.png"></a>

			<div id="Home" class="tabcontent">
				<h6>RECENTLY</h6>
			  <a href="../shop/product-single.jsp"><img alt="" src="../images/menu-1.jpg"></a>
			</div>
			
			<div id="News" class="tabcontent">
			  <h6>Pick</h6>
			  <a href="../shop/product-single.jsp"><img alt="" src="../images/menu-2.jpg"></a>
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
			</script>
			
			<div class="quick_mid"> 
				<ul class="sec_m">
					<li><img alt="prev" src="../images/g_con_prev.png"></li>
					<li>1 / 1</li>
					<li><img alt="next" src="../images/g_con_next.png"></li>
				</ul>
			</div> 
		<div class="quick_bottom">
			<ul>
				<li><a href="javascript:void(0)" onclick="history.go(-1)"><img alt="back" src="../images/back.png"></a></li>
				<li><a href="#go_top"><img alt="top" src="../images/up_btn.png"></a></li>
				<li><a href="#go_bottom"><img alt="bottom" src="../images/down_btn.png"></a></li>
			</ul>
		</div>
	</div>
			<!-- 우측 퀵메뉴 끝 -->
			
				<div class="col-lg-12 ftco-animate p-md-5">
					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical">

								<a class="nav-link active" id="v-pills-0-tab" data-toggle="pill"
									href="#v-pills-0" role="tab" aria-controls="v-pills-0"
									aria-selected="true">ALL</a> 
								<a class="nav-link" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1"
									role="tab" aria-controls="v-pills-1" aria-selected="false">Taste</a>
								<a class="nav-link" id="v-pills-2-tab" data-toggle="pill"
									href="#v-pills-2" role="tab" aria-controls="v-pills-2"
									aria-selected="false">Company</a> 
								<a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3"
									role="tab" aria-controls="v-pills-3" aria-selected="false">Country</a>

							</div>
						</div>


						<div class="col-md-12 d-flex align-items-center">

							<div class="tab-content ftco-animate" id="v-pills-tabContent">

								<div class="tab-pane fade show active" id="v-pills-0"
									role="tabpanel" aria-labelledby="v-pills-0-tab">

									<div class="shop-select">
										<select class="shop-name-select mb-5">
											<option class="sop-01">신상품순</option>
											<option class="sop-01">인기상품순</option>
											<option class="sop-01">낮은가격순</option>
											<option class="sop-01">높은가격순</option>
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
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="product-single.jsp" class="img"
													style="background-image: url(../images/menu-1.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="product-single.jsp" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-3.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-4.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-1.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-3.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-4.jpg);"></a>
												<div class="text text-center pt-4">
													<h3>
														<a href="product-single.html">Coffee Capuccino</a>
													</h3>
													<p>A small river named Duden flows by their place and
														supplies</p>
													<p class="price">
														<span>$5.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															Cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>


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


								<div class="tab-pane fade" id="v-pills-1" role="tabpanel"
									aria-labelledby="v-pills-1-tab">

									<div class="shop-select">
										<select class="shop-name-select">
											<option class="sop-01">신상품순</option>
											<option class="sop-01">인기상품순</option>
											<option class="sop-01">낮은가격순</option>
											<option class="sop-01">높은가격순</option>
										</select>
									</div>

									<div class="shop-subcategory text text-center mb-5">
										<a href="#" class="ss-1"> 원두 전체 </a> / <a href="#"
											class="ss-1"> 싱글오리진 </a> / <a href="#" class="ss-1"> 신맛높은
											원두 </a> / <a href="#" class="ss-1"> 신맛중간 원두 </a> / <a href="#"
											class="ss-1"> 신맛없는 원두 </a>
									</div>

									<div class="row">
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>

										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/menu-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>

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


								<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
									aria-labelledby="v-pills-2-tab">

									<div class="shop-select">
										<select class="shop-name-select">
											<option class="sop-01">신상품순</option>
											<option class="sop-01">인기상품순</option>
											<option class="sop-01">낮은가격순</option>
											<option class="sop-01">높은가격순</option>
										</select>
									</div>

									<div class="shop-subcategory text text-center mb-5">
										<a href="#" class="ss-1"> 회사1 </a> / <a href="#" class="ss-1">
											회사2 </a> / <a href="#" class="ss-1"> 회사3 </a> / <a href="#"
											class="ss-1"> 회사4 </a> / <a href="#" class="ss-1"> 회사5 </a>
									</div>



									<div class="row">
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>

										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/dish-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Grilled Beef</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>
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


								<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
									aria-labelledby="v-pills-3-tab">

									<div class="shop-select">
										<select class="shop-name-select">
											<option class="sop-01">신상품순</option>
											<option class="sop-01">판매량순</option>
											<option class="sop-01">낮은가격순</option>
											<option class="sop-01">높은가격순</option>
										</select>
									</div>

									<div class="shop-subcategory text text-center mb-5">
										<a href="#" class="ss-1"> 에티오피아 </a> / <a href="#"
											class="ss-1"> 콜롬비아 </a> / <a href="#" class="ss-1"> 브라질 </a>
										/ <a href="#" class="ss-1"> 코스타리카 </a> / <a href="#"
											class="ss-1"> 과테말라 </a>
									</div>

									<div class="row">
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-1.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-2.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3 text-center">
											<div class="menu-entry">
												<a href="#" class="img"
													style="background-image: url(../images/drink-3.jpg);"></a>
												<div class="text">
													<h3>
														<a href="product-single.html">Lemonade Juice</a>
													</h3>
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia.</p>
													<p class="price">
														<span>$2.90</span>
													</p>
													<p>
														<a href="cart.html"
															class="btn btn-primary btn-outline-primary">Add to
															cart</a>
													</p>
												</div>
											</div>
										</div>
									</div>

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


	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>
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