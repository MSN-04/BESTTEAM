<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Taste ─ Cafe Tinkervell</title>
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
<link rel="stylesheet" href="./css/agency.min.css">
<link rel="stylesheet" href="./css/kakaoTalkChat.css">


<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/mobile/1.0rc2/jquery.mobile-1.0rc2.min.js"></script>
<style type="text/css">
.taste {
  scroll-behavior: smooth;
}
</style>


</head>
<body>
<%
	if(session.getAttribute("id") == null){
		%>
		<script type="text/javascript">
			alert('로그인 후 이용하실 수 있습니다.');
			history.back();
		</script>
		<%
	}
%>

	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	 <section class="home-slider owl-carousel" id="teammember">

      <div class="slider-item" style="background-image: url(./images/coffeecup.jpg);" >
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">CHOOSE YOUR TASTE</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Taste</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

<section class="taste">
	<section class="taste-01" id="taste-01">
    <div class="container">
	<div id="aroma-1">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br><br><br>
                <h2 class="section-heading text-uppercase taste-h">Aroma</h2>
                <h3 class="section-subheading text-muted">커피추출시 발산되는 가스, 커피향기를 의미합니다</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-02" data-transiton="slideup" onclick="document.frm.COFFEE_AROMA.value = 1;"><img class="mx-auto rounded-circle" src="./images/taste1_1.png" alt=""></a>
                    <h4>향 1</h4>
                 
                    
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-02" data-transiton="slideup" onclick="document.frm.COFFEE_AROMA.value = 2;"><img class="mx-auto rounded-circle" src="./images/taste1_2.png" alt=""></a>
                    <h4>향 2</h4>
                    
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-02" data-transiton="slideup" onclick="document.frm.COFFEE_AROMA.value = 3;"><img class="mx-auto rounded-circle" src="./images/taste1_3.png" alt=""></a>
                    <h4>향 3</h4>
                  
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                  <a href="#taste-02" data-transiton="slideup" onclick="document.frm.COFFEE_AROMA.value = 4;"><img class="mx-auto rounded-circle" src="./images/taste1_4.png" alt=""></a>
                    <h4>향 4</h4>
                  
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-02" data-transiton="slideup" onclick="document.frm.COFFEE_AROMA.value = 5;"><img class="mx-auto rounded-circle" src="./images/taste1_5.png" alt=""></a>
                    <h4>향 5</h4>
                    
                </div>
            </div>
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    </div>
    
    </section>
    
    
	<section class="taste-02" id="taste-02">
    <div class="pt-page pt-page-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br><br><br>
                <h2 class="section-heading text-uppercase taste-h">Acidity</h2>
                <h3 class="section-subheading text-muted">커피추출시 발산되는 가스, 커피향기를 의미합니다</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-03" data-transiton="slideup" onclick="document.frm.COFFEE_ACID.value = 1;"><img class="mx-auto rounded-circle" src="./images/taste2_1.png" alt=""></a>
                    <h4>신맛 없음</h4>
                 
                    
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-03" data-transiton="slideup" onclick="document.frm.COFFEE_ACID.value = 2;"><img class="mx-auto rounded-circle" src="./images/taste2_2.png" alt=""></a>
                    <h4>약한 신맛</h4>
                    
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-03" data-transiton="slideup" onclick="document.frm.COFFEE_ACID.value = 3;"><img class="mx-auto rounded-circle" src="./images/taste2_3.png" alt=""></a>
                    <h4>중간 신맛</h4>
                  
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                  <a href="#taste-03" data-transiton="slideup" onclick="document.frm.COFFEE_ACID.value = 4;"><img class="mx-auto rounded-circle" src="./images/taste2_4.png" alt=""></a>
                    <h4>강한 신맛</h4>
                  
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-03" data-transiton="slideup" onclick="document.frm.COFFEE_ACID.value = 5;"><img class="mx-auto rounded-circle" src="./images/taste2_5.png" alt=""></a>
                    <h4>식초</h4>
                    
                </div>
            </div>
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    </div>
    </section>
    
<section class="taste-03" id="taste-03">
<div class="pt-page pt-page-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br><br><br>
                <h2 class="section-heading text-uppercase taste-h">Sweetness</h2>
                <h3 class="section-subheading text-muted">원두의 달달한 맛을 의미합니다</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-04" data-transiton="slideup" onclick="document.frm.COFFEE_SWEET.value = 1;"><img class="mx-auto rounded-circle" src="./images/taste3_1.png" alt=""></a>
                    <h4>단맛 없음</h4>
                 
                    
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-04" data-transiton="slideup" onclick="document.frm.COFFEE_SWEET.value = 2;"><img class="mx-auto rounded-circle" src="./images/taste3_2.png" alt=""></a>
                    <h4>약한 단맛</h4>
                    
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-04" data-transiton="slideup" onclick="document.frm.COFFEE_SWEET.value = 3;"><img class="mx-auto rounded-circle" src="./images/taste3_3.png" alt=""></a>
                    <h4>중간 단맛</h4>
                  
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                  <a href="#taste-04" data-transiton="slideup" onclick="document.frm.COFFEE_SWEET.value = 4;"><img class="mx-auto rounded-circle" src="./images/taste3_4.png" alt=""></a>
                    <h4>강한 단맛</h4>
                  
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-04" data-transiton="slideup" onclick="document.frm.COFFEE_SWEET.value = 5;"><img class="mx-auto rounded-circle" src="./images/taste3_5.png" alt=""></a>
                    <h4> 설탕 </h4>
                    
                </div>
            </div>
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    </div>
    </section>
    
<section class="taste-04" id="taste-04">
<div class="pt-page pt-page-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br><br><br>
                <h2 class="section-heading text-uppercase taste-h">Bitterness</h2>
                <h3 class="section-subheading text-muted">원두의 약간 쓰거나 불맛나는 향을 의미합니다</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-05" data-transiton="slideup" onclick="document.frm.COFFEE_BITTER.value = 1;"><img class="mx-auto rounded-circle" src="./images/taste4_1.png" alt=""></a>
                    <h4>쓴맛 없음</h4>
                 
                    
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-05" data-transiton="slideup" onclick="document.frm.COFFEE_BITTER.value = 2;"><img class="mx-auto rounded-circle" src="./images/taste4_2.png" alt=""></a>
                    <h4>약한 쓴맛</h4>
                    
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-05" data-transiton="slideup" onclick="document.frm.COFFEE_BITTER.value = 3;"><img class="mx-auto rounded-circle" src="./images/taste4_3.png" alt=""></a>
                    <h4>중간 쓴맛</h4>
                  
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                  <a href="#taste-05" data-transiton="slideup" onclick="document.frm.COFFEE_BITTER.value = 4;"><img class="mx-auto rounded-circle" src="./images/taste4_4.png" alt=""></a>
                    <h4>강한 쓴맛</h4>
                  
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#taste-05" data-transiton="slideup" onclick="document.frm.COFFEE_BITTER.value = 5;"><img class="mx-auto rounded-circle" src="./images/taste4_5.png" alt=""></a>
                    <h4>매우 강한 쓴맛</h4>
                    
                </div>
            </div>
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    </div>
    </section>
    
<section class="taste-05" id="taste-05">
<div class="pt-page pt-page-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br><br><br>
                <h2 class="section-heading text-uppercase taste-h">Body / Texture</h2>
                <h3 class="section-subheading text-muted">커피를 머금었을때 느껴지는 밀도와 무게감을 뜻합니다</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#" onclick="i.goSubmit(1)"><img class="mx-auto rounded-circle" src="./images/taste5_1.png" alt=""></a>
                    <h4>매우 가벼움</h4>
                 
                    
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#" onclick="i.goSubmit(2)"><img class="mx-auto rounded-circle" src="./images/taste5_2.png" alt=""></a>
                    <h4>가벼움 </h4>
                    
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#" onclick="i.goSubmit(3)"><img class="mx-auto rounded-circle" src="./images/taste5_3.png" alt=""></a>
                    <h4>중간</h4>
                  
                </div>
            </div>
            <div class="col-sm-400">
                <div class="team-member0">
                  <a href="#" onclick="i.goSubmit(4)"><img class="mx-auto rounded-circle" src="./images/taste5_4.png" alt=""></a>
                    <h4>무거움</h4>
                  
                </div>
            </div>
             <div class="col-sm-400">
                <div class="team-member0">
                    <a href="#" onclick="i.goSubmit(5)"><img class="mx-auto rounded-circle" src="./images/taste5_5.png" alt=""></a>
                    <h4>매우 무거움</h4>
                    
                </div>
            </div>
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    </div>
    </section>
</section>    


		
		<form action="TasteProAction.us" name="frm" id="frm" method="POST" onsubmit="return false;">
			<input name="COFFEE_AROMA" id="COFFEE_AROMA" type="hidden" />
			<input name="COFFEE_ACID"  id="COFFEE_ACID" type="hidden" />
			<input name="COFFEE_SWEET" id="COFFEE_SWEET" type="hidden" />
			<input name="COFFEE_BITTER" id="COFFEE_BITTER" type="hidden" />
			<input name="COFFEE_BODY" id="COFFEE_BODY" type="hidden" />
		</form>
		

    
    <script type="text/javascript">
			var i = {
					goSubmit : function(body){
						document.frm.COFFEE_BODY.value = body;
						document.frm.submit();
					}
			}
		</script>

	
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	


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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/barba.js/1.0.0/barba.min.js"></script>
	<script src="./js/app.js"></script>
	

</body>
</html>