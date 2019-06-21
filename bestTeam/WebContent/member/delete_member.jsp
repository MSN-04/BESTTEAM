<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <title>Member ─ Cafe Tinkervell</title>
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
    <style type="text/css">
    .btn btn-primary py-3 px-4{text-align: right}
    </style>
  </head>
  <body>
  <header>
<jsp:include page="../inc/header.jsp"/>
  </header>
  

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(./images/coffeecup.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">DELETE ACCOUNT</h1>
<!-- 	            <p class="breadcrumbs"><span class="mr-2"><a href="#information">INFORMATION</a></span> <span><a href="./member/delete_member.jsp">DELETE ACCOUNT</a></span></p> -->
            </div>

          </div>
        </div>
      </div>
    </section>

   <section class="ftco-section" id="login">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 ftco-animate" style="margin: auto;">
					<form action="DeleteMemberProAction.us" class="billing-form ftco-bg-dark p-3 p-md-5" id="frm">
						<h3 class="mb-4 billing-heading">회원탈퇴</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">아이디</label> <input type="text"
										class="form-control" placeholder="아이디를 입력해주세요." name="id">
								</div>
							
								<div class="form-group">
									<label for="firstname">비밀번호</label> <input type="password"
										class="form-control" placeholder="비밀번호를 입력해주세요." name="pass">
								</div>
								<div class="form-group">
									<label for="firstname">비밀번호 확인</label> <input type="password"
										class="form-control" placeholder="비밀번호를 입력해주세요." name="pass2">
								</div>
								</div>
								
                
	            </div>
								<div class="col-md-12">
								<div class="form-group mt-4">
									<a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3" onclick="document.getElementById('frm').submit();">탈퇴하기</a>
									</div>
									</div>
									</form>
							</div>
								
						
							
							
                <div class="w-100"></div>
<!--                 <div class="col-md-12"> -->
<!--                 	<div class="form-group mt-4"> -->
<!-- 										 <p class="btn btn-primary py-3 px-4"> <input type="submit" class="btn btn-primary py-3 px-4" value="로그인"></p> -->
<!-- 									</div> -->
                </div>
	            </div>
<!-- 	             <a href="../member/join.jsp" class="btn btn-primary py-3 px-5" style="margin-right: 20px; margin-left: 15px; margin-top: 80px;">회원가입</a> -->
						
<!-- 	            </div> -->
	          </form><!-- END -->
</section>

    <footer class="ftco-footer ftco-section img">
    	<jsp:include page="../inc/footer.jsp"></jsp:include>
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