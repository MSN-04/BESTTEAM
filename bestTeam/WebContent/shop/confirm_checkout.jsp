<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

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
    
    <style type="text/css">
    
	    .confirmCheckout {
	    	border: 1px solid gray;
	    	padding: 15px 0 0 0;
	    	margin: 10px 0;
	    }
	    
	    .confirmCheckout2 {
	    	height: 221px;
	    	border: 1px solid gray;
	    	padding: 10px;
	    	margin: 10px 0;
	    }
	    
	    .money { text-align: right; }
	    
	    .table tbody tr td {
		    padding: 15px 10px !important;
		}
    
    </style>
    
  </head>
  
  <body>
  
  <header>
	<jsp:include page="../inc/header.jsp"/>
    <!-- END nav -->
  </header>
  
  
  	
    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"  style="background-image: url(../images/receipt.jpg); background-position: 50% 0%; background-repeat: no-repeat; background-size: cover;"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Confirm Checkout</h1>
	            <p class="breadcrumbs"> <span class="mr-2"><a href="../index.jsp">Home</a></span> 
	            					    <span class="mr-2"><a href="cart.jsp">Cart</a></span>   </p>
            </div>

          </div>
        </div>
      </div>
    </section>

<!--   ------------------------------------------------------------------------------------------------------------------------ -->



    <section class="ftco-section">
      <div class="container" >
        <div class="row">
          <div class="container" style=" margin: 50px;">
<!--      <div class="col-xl-8 ftco-animate" style=" margin: auto;"> -->

          
<!-- box 1 -->          



		<form class="billing-form ftco-bg-dark p-3 p-md-5" style="overflow: auto;">
			<h3 class="mb-4 billing-heading">주문상품 정보</h3>
<!-- 			<div class="row align-items-end" > -->
			
			  			  <div class="cart-list">

              <table class="table">
                <thead class="thead-primary">
                  <tr class="text-center">
                    <th>No</th>
                    <th>&nbsp;</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                  </tr>
                </thead>
                <tbody>

                  <tr class="text-center">
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                     <td class="product-num"><a href="#">1</a></td>
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>SWEETNESS<br>CoffeeBean</h3>
                    </td>
                    
                    <td class="price">10,000원</td>
                    
                    <td class="price">1개</td>
                    
                    <td class="total">10,000원</td>
                  </tr><!-- END TR-->
                  <tr class="text-center">
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                     <td class="product-num"><a href="#">2</a></td>
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>AROMA<br>CoffeeBean</h3>
                    </td>
                    
                    <td class="price">10,000원</td>
                    
                    <td class="price">1개</td>
                    
                    <td class="total">10,000원</td>
                  </tr><!-- END TR-->
 
                  <tr class="text-center">
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                     <td class="product-num"><a href="#">3</a></td>
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>ACIDITY<br>CoffeeBean</h3>
                    </td>
                    
                    <td class="price">10,000원</td>
                    
                    <td class="price">1개</td>
                    
                    <td class="total">10,000원</td>
                  </tr><!-- END TR-->
                  
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                     <td class="product-num"><a href="#">4</a></td>
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>BITTERNESS<br>CoffeBean</h3>
                    </td>
                    
                    <td class="price">10,000원</td>
                    
                    <td class="price">1개</td>
                    
                    <td class="total">10,000원</td>
                  </tr><!-- END TR-->
                  
                  <tr class="text-center">
                     <td class="product-num"><a href="#">5</a></td>
                    
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>BODY / TEXTURE<br>CoffeBean</h3>
                    </td>
                    
                    <td class="price">10,000원</td>
                    
                    <td class="price">1개</td>
                    
                    <td class="total">10,000원</td>
                  </tr><!-- END TR-->
                </tbody>
              </table>
            </div>
            
		</form>
		<br><br>
		
<!--   ------------------------------------------------------------------------------------------------------------------------ -->


        <form class="billing-form ftco-bg-dark p-3 p-md-5" >
			<h3 class="mb-4 billing-heading">주문자 정보</h3>
			
			
	          <div class="row align-items-end confirmCheckout">

	          	<!-- 1st line -->
	          	<div class="col-md-12">
		            <div class="form-group">
		              	<table>
		            		<tr> <td width="100px"><label for="firstname">주문번호</label></td>
		            			 <td><label><span>20190430-A01</span></label></td> </tr>
		            	</table>
		            </div>
                </div>	  
                 
		            
		      	<!-- 2nd line -->
		      	<div class="col-md-6">
		            <div class="form-group">
		              	<table>
		            		<tr> <td width="100px"><label for="firstname">주문자</label></td>
		            			 <td><label><span>뷰쏭</span></label></td> </tr>
		            	</table>
		            </div>
                </div>	   
	          
	          	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">주문일자</label></td>
		            			 <td><label><span>2019.04.30</span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	
	           	<!-- 3rd line -->
	          	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">연락처 1</label></td>
		            			 <td><label><span>010-1111-2222</span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">연락처 2</label></td>
		            			 <td><label><span>051-333-4444</span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	
	           	<!-- 4th line -->
	           	<div class="col-md-12">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">우편번호</label></td>
		            			 <td><label><span>47246</span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	<!-- 5th line -->
	           	<div class="col-md-12">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">배송지</label></td>
		            			 <td><label><span>부산 부산진구 동천로 109 삼한골든게이트 7층 </span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>

			
	          
	          </div>
	          </form><!-- END -->


<!--   ------------------------------------------------------------------------------------------------------------------------ -->


	          <div class="row mt-5 pt-3 d-flex" >
	          
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 정보</h3>
	          			
	          				<div class="col-md-12 confirmCheckout2">
		            		<div class="form-group">
	          					<p class="d-flex">
		    						<span>상품 합계</span>
		    						<span class="money">41,000 원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>배송비 합계</span>
		    						<span class="money">2,500원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>할인금액 합계</span>
		    						<span class="money">0 원</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>총 결제금액</span>
		    						<span class="money">43,500 원</span>
		    					</p>
		    				</div>
		    				</div>
					</div>
	          	</div>
	          	
<!-- 	          	<div class="col-md-6"> -->
<!-- 	          		<div class="cart-detail ftco-bg-dark p-3 p-md-4"> -->
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 수단</h3>
	          			
	          				<div class="col-md-12 confirmCheckout2">
		            		<div class="form-group">
		            			<p class="d-flex">
		    						<span>(무통장 입금)</span>
		    						<span></span>
		    					</p>
		    					<p class="d-flex">
		    						<span>신한은행</span>
		    						<span>110-1111-11111</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>결제일자</span>
		    						<span>2019.05.01</span>
		    					</p>
		    				</div>
		    				</div>
					</div>
	          	</div>
	          	
	          	
	          </div>
          </div> <!-- .col-md-8 -->

<!--   ------------------------------------------------------------------------------------------------------------------------ -->



<!--           <div class="col-xl-4 sidebar ftco-animate"> -->
          
            
            
            
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>최근 본 상품</h3> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            
            

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <div class="categories"> -->
<!--                 <h3>카테고리<h3> -->
<!--                 <li><a href="#">Tour <span>(12)</span></a></li> -->
<!--                 <li><a href="#">Hotel <span>(22)</span></a></li> -->
<!--                 <li><a href="#">Coffee <span>(37)</span></a></li> -->
<!--                 <li><a href="#">Drinks <span>(42)</span></a></li> -->
<!--                 <li><a href="#">Foods <span>(14)</span></a></li> -->
<!--                 <li><a href="#">Travel <span>(140)</span></a></li> -->
<!--               </div> -->
<!--             </div> -->



          
<!--             <div class="sidebar-box"> -->
<!--               <form action="#" class="search-form"> -->
<!--                 <div class="form-group"> -->
<!--                 	<div class="icon"> -->
<!-- 	                  <span class="icon-search"></span> -->
<!--                   	</div> -->
<!--                   	<input type="text" class="form-control" placeholder="Search..."> -->
<!--                	</div> -->
<!--               </form> -->
<!--             </div> -->



<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>Paragraph</h3> -->
<!--               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
<!--             </div> -->
<!--           </div> -->

        </div>
      </div>
    </section> <!-- .section -->
    
<!--   ------------------------------------------------------------------------------------------------------------------------ -->



	<footer>
		<jsp:include page="../inc/footer.jsp"/>
	</footer>    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>

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