<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contact ─ Cafe Tinkervell</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

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
    <link href="./css/agency.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/kakaoTalkChat.css">
    
    <style type="text/css">
    
    .btn-best { 
	    	background-color: #C49B63 !important;
	    	color: black !important; }
	    	
	    .btn-best:hover { 
	    	background-color: black !important;
	    	border: 1px solid #C49B63 !important;
	    	color: #C49B63 !important; }
	    	
	    .btn-best:active { 
	    	background-color: #C49B63 !important;
	    	color: black !important; }
	    .team-member{
	    	margin:0 0 50px 50px;}
	    	
	    .col-md-12 mb-3 .p{
	    font-color:#fed136;
	    }
	    
	    #mail{
	    backgound:#3e3e2422;
	    border-top:1.5px solid #C49B63 !important; 
	    }
	    
	   section h2.section-heading{
	   border-bottom:1px solid #c49b63;
	   }
	   h1{
	   font-weight:400 !important;
	   }
	    	
    </style>
    

  </head>
  <body>
   <header>
<jsp:include page="../inc/header.jsp"/>
  </header>
  	
    
    <section class="home-slider owl-carousel" id="teammember">


      <div class="slider-item" style="background-image: url(./images/coffeecup.jpg);">

      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Contact Us</h1>
<!-- 	            <p class="breadcrumbs"><span class="mr-2"><a href="#crew">Crew</a></span> <span><a href="#mail">Contact</a></span></p> -->
            </div>

          </div>
        </div>
      </div>
    </section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

	<section id="crew">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <br><br>
                <h2 class="section-heading text-uppercase">Best Team Ever</h2>
                <h3 class="section-subheading text-muted">Café TinkerVell 을 만든 사람들</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4 text-center">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/moon.jpg" alt="">
                    <h4>문세웅</h4>
                    <p class="text-muted">문세웅</p>
                    <p class="text-muted">WEB,JSP,MYSQL</p>
                    <p class="text-muted">sewoong0409@naver.com</p>
                    
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/choi.jpg" alt="">
                    <h4>최영비</h4>
                    <p class="text-muted">최영비</p>
                    <p class="text-muted">WEB,JSP,MYSQL</p>
                    <p class="text-muted">cyeongb@gmail.com</p>
                    
                </div>
            </div>
             <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/ji.jpg" alt="">
                    <h4>지이듬</h4>
                    <p class="text-muted">지이듬</p>
                    <p class="text-muted">WEB,JSP,MYSQL</p>
                    <p class="text-muted">game9um@gmail.com</p>
                    
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/shin.jpg" alt="">
                    <h4>신미송</h4>
                    <p class="text-muted">신미송</p>
                    <p class="text-muted">WEB,JSP,MYSQL</p>
                    <p class="text-muted">fhdgofhdgo@naver.com</p>
                    
                </div>
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/kwon.jpg" alt="">
                    <h4>권경민</h4>
                    <p class="text-muted">권경민</p>
                    <p class="text-muted">Advisor</p>
                    <p class="text-muted">kkmkwon@naver.com</p>
                  
                </div>
            </div>
             <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/song.jpg" alt="">
                    <h4>송주영</h4>
                    <p class="text-muted">송주영</p>
                    <p class="text-muted">WEB,JSP,MYSQL</p>
                    <p class="text-muted">saruru1@naver.com</p>
                    
                </div>
       
            </div>
            <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/han.jpg" alt="">
                    <h4>한성민</h4>
                    <p class="text-muted">한성민</p>
                    <p class="text-muted">Advisor</p>
                    <p class="text-muted">gkstyd1313@naver.com</p>
                  
                </div>
            </div>
             <div class="col-sm-4">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="./images/lee.jpg" alt="">
                    <h4>이기홍</h4>
                    <p class="text-muted">이기홍</p>
                    <p class="text-muted">Advisor</p>
                    <p class="text-muted">ghlee@imsolutions.co.kr</p>
                  
                </div>
            </div>
          
        </div> 

        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="large text-muted"></p>
            </div>
        </div>
    </div>
    
</section>
    <section class="ftco-section contact-section" >
      <div class="container mt-5">
        <div class="row block-9">
					
					
          <div class="col-md-6 ftco-animate">
   <div id="map" style="width:600px;height:350px; text-align:center;"></div>
					<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=ad86d5356285065db2653bab5c5d0e4c&libraries=services,clusterer,drawing"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng(35.1585012,129.0598359),
							level: 3
						};
				
						var map = new daum.maps.Map(container, options);
						
						var geocoder = new daum.maps.services.Geocoder();
				
						geocoder.addressSearch('부산 부산진구 부전동 112-3', function(result, status) {
				
						     if (status === daum.maps.services.Status.OK) {
				
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
						        var marker = new daum.maps.Marker({
						            map: map,
						            position: coords
						        });
				
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">Best Team Ever</div>'
						        });
						        infowindow.open(map, marker);
				
						        map.setCenter(coords);
						    } 
						});   
						
					</script>
          </div>
          
          <div class="col-md-1"></div>
          <div class="col-md-1"></div>
					
					<div class="col-md-4 contact-info ftco-animate">
						<div class="row">
							<div class="col-md-12 mb-4">
	              <h2 class="h4">Contact Information</h2>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>주소:</span> 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층</p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>전화번호:</span> +82 051-803-0909</p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>이메일:</span> class@itwillbs.co.kr</p>
	            </div>
	            <div class="col-md-12 mb-3">
	              <p><span>홈페이지:</span> https://itwillbs.co.kr/</p>
	            </div>
						</div>
					</div>
        </div>
      </div>
    </section>
    
    <br><br>
    <div class="col-md-6 " id="mail">
 		<form action="mailsend" method="post"class="contact-form">
            <div class="col-lg-12 text-center"> 
               	<h2 class="section-heading text-uppercase" style="margin: 20px;">Contact Us</h2>
            </div>
            
            <div class="row">
                <div class="col-md-6">
	                <div class="form-group">
	                  <input type="email" style="font-size: 16px;" class="form-control" placeholder="보내는 사람" name="sender" required="required">
	                </div>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" style="font-size: 16px;" class="form-control" placeholder="받는 사람" name="receiver" value="tinkervell0624@gmail.com" readonly="readonly">
	                </div>
                </div>
             </div>
             <div class="form-group">
                <input type="text" style="font-size: 16px;" class="form-control" placeholder="제목" name="subject" required="required">
             </div>
             <div class="form-group">
                <textarea name="content" style="font-size: 16px;" id="" cols="30" rows="7" class="form-control" placeholder="남기실 말을 적어주세요" required="required"></textarea>
             </div>
             <div class="form-group">
                <input type="submit" style="font-size: 16px;" value="이메일 보내기" class="btn py-3 px-5 btn-best">
             </div>
         </form>
     </div>

<br><br>


    <jsp:include page="../inc/footer.jsp"/>
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="./js/main.js"></script>
    
  </body>
</html>
