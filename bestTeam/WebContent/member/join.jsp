<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

<style type="text/css">
.money {
	text-align: right;
}

.btn-best {
	background-color: #C49B63 !important;
	color: black !important;
}

.btn-best:hover {
	background-color: black !important;
	border: 1px solid #C49B63 !important;
	color: #C49B63 !important;
}

.btn-best:active {
	background-color: #C49B63 !important;
	color: black !important;
}

.p-best {
	padding: 50px !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp" />
		<!-- END nav -->
	</header>
	<!--   	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar"> -->
	<!-- 	    <div class="container"> -->
	<!-- 	      <a class="navbar-brand" href="index.html">Coffee<small>Blend</small></a> -->
	<!-- 	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"> -->
	<!-- 	        <span class="oi oi-menu"></span> Menu -->
	<!-- 	      </button> -->
	<!-- 	      <div class="collapse navbar-collapse" id="ftco-nav"> -->
	<!-- 	        <ul class="navbar-nav ml-auto"> -->
	<!-- 	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li> -->
	<!-- 	          <li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li> -->
	<!-- 	          <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li> -->
	<!-- 	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li> -->
	<!-- 	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li> -->
	<!-- 	          <li class="nav-item dropdown"> -->
	<!--               <a class="nav-link dropdown-toggle" href="room.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a> -->
	<!--               <div class="dropdown-menu" aria-labelledby="dropdown04"> -->
	<!--               	<a class="dropdown-item" href="shop.html">Shop</a> -->
	<!--                 <a class="dropdown-item" href="product-single.html">Single Product</a> -->
	<!--                 <a class="dropdown-item" href="cart.html">Cart</a> -->
	<!--                 <a class="dropdown-item" href="checkout.html">Checkout</a> -->
	<!--               </div> -->
	<!--             </li> -->
	<!-- 	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li> -->
	<!-- 	          <li class="nav-item cart"><a href="cart.html" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li> -->
	<!-- 	        </ul> -->
	<!-- 	      </div> -->
	<!-- 		  </div> -->
	<!-- 	  </nav> -->
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
						<h1 class="mb-3 mt-5 bread">Sign Up</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="../index/index.jsp">Home</a></span> <span>SignUp</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 ftco-animate" style="margin: auto;">
					<form action="#" class="billing-form ftco-bg-dark p-3 p-md-5">
						<h3 class="mb-4 billing-heading">회원 가입</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">아이디</label> <input type="text"
										class="form-control" placeholder="아이디를 입력해주세요.">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">비밀번호</label> <input type="text"
										class="form-control" placeholder="비밀번호를 입력해주세요.">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">비밀번호 확인</label> <input type="text"
										class="form-control" placeholder="비밀번호를 입력해주세요.">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">이 름</label> <input type="text"
										class="form-control" placeholder="이름을 입력해주세요.">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">나 이</label> <input type="text"
										class="form-control" placeholder="나이를 입력해주세요.">
								</div>
							</div>
							<div class="w-100"></div>
							<!-- 							<div class="col-md-12"> -->
							<!-- 								<div class="form-group"> -->
							<!-- 									<label for="country">State / Country</label> -->
							<!-- 									<div class="select-wrap"> -->
							<!-- 										<div class="icon"> -->
							<!-- 											<span class="ion-ios-arrow-down"></span> -->
							<!-- 										</div> -->
							<!-- 										<select name="" id="" class="form-control"> -->
							<!-- 											<option value="">France</option> -->
							<!-- 											<option value="">Italy</option> -->
							<!-- 											<option value="">Philippines</option> -->
							<!-- 											<option value="">South Korea</option> -->
							<!-- 											<option value="">Hongkong</option> -->
							<!-- 											<option value="">Japan</option> -->
							<!-- 										</select> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="postcodezip">우편번호</label> <input type="text"
										class="form-control" id="postcode" placeholder="우편번호"
										required="required">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="towncity"></label>
									<p onclick="execDaumPostcode()">
										<a class="btn btn-best py-3 px-4">우편번호 검색</a>
									</p>
								</div>
							</div>
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>

					function execDaumPostcode() {
				    	
						var width = 500;
						var height = 480;
						
				        new daum.Postcode({
				        	
				            oncomplete: function(data) {
					        	
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                        addr = addr + extraAddr;
				                    }
				                
				                } 
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('postcode').value = data.zonecode;
				                document.getElementById("address").value = addr;
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById("detailAddress").focus();
				            },
				            
					    	
					    	theme: {
					    		   bgColor: "#120F0F", //바탕 배경색
				    			   searchBgColor: "#120F0F", //검색창 배경색
				    			   contentBgColor: "#030202", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
				    			   pageBgColor: "#030202", //페이지 배경색
				    			   textColor: "#F4F4F4", //기본 글자색
				    			   queryTextColor: "#FFFFFF", //검색창 글자색
				    			   postcodeTextColor: "#FA4256", //우편번호 글자색
				    			   emphTextColor: "#C87919", //강조 글자색
				    			   outlineColor: "#444444" //테두리
					    	},
				            
				            width: width,
				            height: height,
				            
				        }).open({
				            left: window.screen.width/2 - width/2,
				            top: window.screen.height/2 - height/2 - 100
				        });
				    }
				</script>
							<div class="w-100"></div>
							<!-- 							<div class="col-md-6"> -->
							<!-- 								<div class="form-group"> -->
							<!-- 									<label for="towncity">Town / City</label> <input type="text" -->
							<!-- 										class="form-control" placeholder=""> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">주소 *</label> <input type="text"
										class="form-control" id="address" placeholder="주소">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" id="detailAddress"
										placeholder="상세주소" required="required">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">연락처</label> <input type="text"
										class="form-control" placeholder="폰번호를 입력해주세요.">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="emailaddress">Email</label> <input type="text"
										class="form-control" placeholder="이메일을 입력해주세요.">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group mt-4">
									<a href="login.jsp"
										class="btn btn-primary p-3 px-xl-4 py-xl-3">가입하기</a> <a
										href="../index/index.html"
										class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">취소하기</a>
										</div>
									<!-- 							<div class="col-md-12"> -->
									<!-- 								<div class="form-group mt-4"> -->
									<!-- 									<div class="radio"> -->
									<!-- 										<label class="mr-3"><input type="radio" -->
									<!-- 											name="optradio"> Create an Account? </label> <label><input -->
									<!-- 											type="radio" name="optradio"> Ship to different -->
									<!-- 											address</label> -->
									<!-- 									</div> -->
									<!-- 								</div> -->
									<!-- 							</div> -->
								</div>
					</form>
				</div>
			</div>
		</div>

		<!-- END -->



		<!-- 					<div class="row mt-5 pt-3 d-flex"> -->
		<!-- 						<div class="col-md-6 d-flex"> -->
		<!-- 							<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4"> -->
		<!-- 								<h3 class="billing-heading mb-4">Cart Total</h3> -->
		<!-- 								<p class="d-flex"> -->
		<!-- 									<span>Subtotal</span> <span>$20.60</span> -->
		<!-- 								</p> -->
		<!-- 								<p class="d-flex"> -->
		<!-- 									<span>Delivery</span> <span>$0.00</span> -->
		<!-- 								</p> -->
		<!-- 								<p class="d-flex"> -->
		<!-- 									<span>Discount</span> <span>$3.00</span> -->
		<!-- 								</p> -->
		<!-- 								<hr> -->
		<!-- 								<p class="d-flex total-price"> -->
		<!-- 									<span>Total</span> <span>$17.60</span> -->
		<!-- 								</p> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="col-md-6"> -->
		<!-- 							<div class="cart-detail ftco-bg-dark p-3 p-md-4"> -->
		<!-- 								<h3 class="billing-heading mb-4">Payment Method</h3> -->
		<!-- 								<div class="form-group"> -->
		<!-- 									<div class="col-md-12"> -->
		<!-- 										<div class="radio"> -->
		<!-- 											<label><input type="radio" name="optradio" -->
		<!-- 												class="mr-2"> Direct Bank Tranfer</label> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="form-group"> -->
		<!-- 									<div class="col-md-12"> -->
		<!-- 										<div class="radio"> -->
		<!-- 											<label><input type="radio" name="optradio" -->
		<!-- 												class="mr-2"> Check Payment</label> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="form-group"> -->
		<!-- 									<div class="col-md-12"> -->
		<!-- 										<div class="radio"> -->
		<!-- 											<label><input type="radio" name="optradio" -->
		<!-- 												class="mr-2"> Paypal</label> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<div class="form-group"> -->
		<!-- 									<div class="col-md-12"> -->
		<!-- 										<div class="checkbox"> -->
		<!-- 											<label><input type="checkbox" value="" class="mr-2"> -->
		<!-- 												I have read and accept the terms and conditions</label> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 								<p> -->
		<!-- 									<a href="#" class="btn btn-primary py-3 px-4">Place an -->
		<!-- 										order</a> -->
		<!-- 								</p> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 				.col-md-8 -->




		<!-- 				<div class="col-xl-4 sidebar ftco-animate"> -->
		<!-- 					<div class="sidebar-box"> -->
		<!-- 						<form action="#" class="search-form"> -->
		<!-- 							<div class="form-group"> -->
		<!-- 								<div class="icon"> -->
		<!-- 									<span class="icon-search"></span> -->
		<!-- 								</div> -->
		<!-- 								<input type="text" class="form-control" placeholder="Search..."> -->
		<!-- 							</div> -->
		<!-- 						</form> -->
		<!-- 					</div> -->
		<!-- 					<div class="sidebar-box ftco-animate"> -->
		<!-- 						<div class="categories"> -->
		<!-- 							<h3>Categories</h3> -->
		<!-- 							<li><a href="#">Tour <span>(12)</span></a></li> -->
		<!-- 							<li><a href="#">Hotel <span>(22)</span></a></li> -->
		<!-- 							<li><a href="#">Coffee <span>(37)</span></a></li> -->
		<!-- 							<li><a href="#">Drinks <span>(42)</span></a></li> -->
		<!-- 							<li><a href="#">Foods <span>(14)</span></a></li> -->
		<!-- 							<li><a href="#">Travel <span>(140)</span></a></li> -->
		<!-- 						</div> -->
		<!-- 					</div> -->

		<!-- 					<div class="sidebar-box ftco-animate"> -->
		<!-- 						<h3>Recent Blog</h3> -->
		<!-- 						<div class="block-21 mb-4 d-flex"> -->
		<!-- 							<a class="blog-img mr-4" -->
		<!-- 								style="background-image: url(images/image_1.jpg);"></a> -->
		<!-- 							<div class="text"> -->
		<!-- 								<h3 class="heading"> -->
		<!-- 									<a href="#">Even the all-powerful Pointing has no control -->
		<!-- 										about the blind texts</a> -->
		<!-- 								</h3> -->
		<!-- 								<div class="meta"> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-calendar"></span> July 12, -->
		<!-- 											2018</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-person"></span> Admin</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-chat"></span> 19</a> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="block-21 mb-4 d-flex"> -->
		<!-- 							<a class="blog-img mr-4" -->
		<!-- 								style="background-image: url(images/image_2.jpg);"></a> -->
		<!-- 							<div class="text"> -->
		<!-- 								<h3 class="heading"> -->
		<!-- 									<a href="#">Even the all-powerful Pointing has no control -->
		<!-- 										about the blind texts</a> -->
		<!-- 								</h3> -->
		<!-- 								<div class="meta"> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-calendar"></span> July 12, -->
		<!-- 											2018</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-person"></span> Admin</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-chat"></span> 19</a> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="block-21 mb-4 d-flex"> -->
		<!-- 							<a class="blog-img mr-4" -->
		<!-- 								style="background-image: url(images/image_3.jpg);"></a> -->
		<!-- 							<div class="text"> -->
		<!-- 								<h3 class="heading"> -->
		<!-- 									<a href="#">Even the all-powerful Pointing has no control -->
		<!-- 										about the blind texts</a> -->
		<!-- 								</h3> -->
		<!-- 								<div class="meta"> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-calendar"></span> July 12, -->
		<!-- 											2018</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-person"></span> Admin</a> -->
		<!-- 									</div> -->
		<!-- 									<div> -->
		<!-- 										<a href="#"><span class="icon-chat"></span> 19</a> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->

		<!-- 					<div class="sidebar-box ftco-animate"> -->
		<!-- 						<h3>Tag Cloud</h3> -->
		<!-- 						<div class="tagcloud"> -->
		<!-- 							<a href="#" class="tag-cloud-link">dish</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">menu</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">food</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">sweet</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">tasty</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">delicious</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">desserts</a> <a href="#" -->
		<!-- 								class="tag-cloud-link">drinks</a> -->
		<!-- 						</div> -->
		<!-- 					</div> -->


		<!-- 					<div class="sidebar-box ftco-animate"> -->
		<!-- 						<h3>Paragraph</h3> -->
		<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. -->
		<!-- 							Ducimus itaque, autem necessitatibus voluptate quod mollitia -->
		<!-- 							delectus aut, sunt placeat nam vero culpa sapiente consectetur -->
		<!-- 							similique, inventore eos fugit cupiditate numquam!</p> -->
		<!-- 					</div> -->
		<!-- 				</div> -->

		<!-- 			</div> -->
		<!-- 		</div> -->
	</section>
	<!-- .section -->

	<footer class="ftco-footer ftco-section img">
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

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});

		});
	</script>


</body>
</html>