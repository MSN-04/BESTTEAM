<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
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
    <link rel="stylesheet" href="./css/shop.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <style type="text/css">
    .btn btn-primary py-3 px-4{text-align: right}
    .billing-form{padding: 10px !important;
    				width:500px !important;
    				margin-right: 0 !important;
    				text-aglin:center;}
    .col-xl-8{width:500px !important; }
/*     .row{display: grid !important; grid-template-columns: 1fr 1fr;} */
/*     #div0517{ display: grid !important; grid-template-rows: auto; */
/*   } */
/*      #div0522{ display: grid !important;grid-template-rows: auto; */
/*   } */
/*     .btn0517{width: 100px;} */
#div0517,#div0522{margin:20px;}
#div0517{border-right: 5px solid white;
		padding-right:10px;}
		#span0522{border-right: 5px solid gray;
					padding-right:0px;}
    </style>
  </head>
  <body>
  <header>
<jsp:include page="../inc/header.jsp"/>
  </header>
  

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(./images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">아이디/비밀번호 찾기</h1>
	            <p class="breadcrumbs">
	            <span class="mr-2">
	            <div class="container">
	<div id="content">    
<!-- 		<div class="post">    	 -->
<!--         	<div class="btn-sign">				 -->
<!-- 				<a href="#login-box" class="login-window"><img src="./images/login_bt.gif" alt="로그인 버튼"></a> -->
<!--         	</div> -->
<!-- 		</div> -->
        
        <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="./images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <form method="post" class="signin" action="#">
                <fieldset class="textbox">
	            	<label class="username">
		                <span>이메일로 찾기</span>
		                <input type="text" id="email" name="email" autocomplete="on" placeholder="회원가입시 입력한 이메일">
	                </label>	                
	                <label class="password">
		                <span>핸드폰번호로 찾기</span>
		                <input type="text" id="phone" name="phone" placeholder="'-'을 제외한 숫자만 입력 ">
	                </label>                
                <button class="submit" type="button">확인</button>                
                </fieldset>
          </form>
		</div>    
    
    </div>
    
</div>
</span> 
<!-- <span><a href="./member/join.jsp">회원가입</a></span></p> -->
            </div>

          </div>
        </div>
      </div>
    </section>

   <section class="ftco-section" id="login">
		<div class="container">
			<div class="row">
			<span id="span0522">
				<div class="col-xl-8 ftco-animate " id="div0517">
					<form action="ForgotAccountProAction.us" class="billing-form ftco-bg-dark p-3 p-md-5" method="post">
						<h3 class="mb-4 billing-heading">아이디 찾기</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">이메일주소로 찾기</label> <input type="email"
										class="form-control" placeholder="이메일주소를 입력해주세요." name="email">
								</div>
							
								
								</div>
								<div class="col-md-6 btn0517">
								<div class="form-group ">
										 <input type="submit" class="btn btn-primary py-3 px-4 " value="확인">
									</div>
                </div>
	            </div>
	            </form>
	            <form action="ForgotAccountProAction.us" class="billing-form ftco-bg-dark p-3 p-md-5" method="post">
						<div class="row align-items-end">
							<div class="col-md-6">
								
								<div class="form-group">
									<label for="phone">핸드폰 번호로 찾기</label> <input type="text"
										class="form-control" placeholder="핸드폰 번호를 입력해주세요." name="phone">
								</div>
								</div>
								<div class="col-md-6 btn0517">
								<div class="form-group ">
										 <input type="submit" class="btn btn-primary py-3 px-4 " value="확인">
									</div>
                </div>
	            </div>
	            </form>
	            </div>
	            </span>
	            <span>
	            <div class="col-xl-8 ftco-animate " id="div0522">
					<form action="../mailSend" class="billing-form ftco-bg-dark p-3 p-md-5" method="post">
						<h3 class="mb-4 billing-heading">비밀번호 찾기</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">이메일 인증</label> 
									<input type="email" class="form-control" placeholder="이메일주소를 입력해주세요." name="email">
								</div>
							
								 
								 
								</div>
								<div class="col-md-6 btn0517">
								<div class="form-group ">
										 <input type="submit" class="btn btn-primary py-3 px-4 " value="확인" >
									</div>
                </div>
	            </div>
	            </form>
	            
	            </div>
	            </span>
	          
	          
								
						
							
							
                <div class="w-100"></div>
<!--                 <div class="col-md-12"> -->
<!--                 	<div class="form-group mt-4"> -->
<!-- 										 <p class="btn btn-primary py-3 px-4"> <input type="submit" class="btn btn-primary py-3 px-4" value="로그인"></p> -->
<!-- 									</div> -->
	            </div>
                </div>
<!-- 	             <a href="./member/join.jsp" class="btn btn-primary py-3 px-5" style="margin-right: 20px; margin-left: 15px; margin-top: 80px;">회원가입</a> -->
						
<!-- 	            </div> -->
	          <!-- END -->
</section>

    <footer class="ftco-footer ftco-section img">
    	<jsp:include page="../inc/footer.jsp"/>
    </footer>
    
  

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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="./js/google-map.js"></script>
  <script src="./js/main.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('a.login-window').click(function() {
		
		// Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup and add close button
		$(loginBox).fadeIn(300);
		
		//Set the center alignment padding + border
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});
</script>

  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>

    
  </body>
</html>