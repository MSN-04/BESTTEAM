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
    <link rel="stylesheet" href="../css/cart.css">
    <style type="text/css">
    #deleteBtn{position:relative;
		float: right;
/*           right:550px; */
    }
    #buyAllBtn{
    position:relative;
    float: right;
/*     left:250px; */
    }
    #total{
    position:relative;
/*     top:50px; */
    }
    
  
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){

        var quantitiy=0;
           $('.quantity-right-plus').click(function(e){
                
                var quantity = parseInt($(this).siblings('.quantity').val());

                if (quantity>=1) {
                	quantity = quantity + 1;
                	$(this).siblings('.quantity').val(quantity);
                }
                
            });

             $('.quantity-left-minus').click(function(e){

            	 var quantity = parseInt($(this).siblings('.quantity').val());

                 if (quantity>1) {
                 	quantity = quantity - 1;
                 	$(this).siblings('.quantity').val(quantity);
                 }
                 
            });
             
             
            
     });
    </script>
  </head>
  <body>
    <header>
    <jsp:include page="../inc/header.jsp"/>
    </header>
    <!-- END nav -->

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(../images/bg_3.jpg);" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
              <h1 class="mb-3 mt-5 bread">Cart</h1>
              <p class="breadcrumbs"><span class="mr-2"><a href="./index/index.jsp">Home</a></span> <span><a href="cart.jsp">Cart</a></span></p>
            </div>
            </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section ftco-cart">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="cart-list">
              <table class="table">
                <thead class="thead-primary">
                  <tr class="text-center">
                    <th>Select</th>
                    <th>No</th>
                    <th>&nbsp;</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>배송비</th>
                  </tr>
                </thead>
                <tbody>
                
                <!-- 상품시작 -->
                  <tr class="text-center">
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                 <td class="product-remove"><input type="checkbox" value="cart_list_num"></td>
                     <td class="product-num"><a href="#">1</a></td>
                    <td class="image-prod"><div class="img" style="background-image:url(../images/menu-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>Creamy Latte Coffee</h3>
                      <p>Far far away, behind the word mountains, far from the countries</p>
                    </td>
                    
                    <td class="price">$4.90</td>
                    
                    <td class="quantity">
                      <div class="input-group mb-3">
<!--             <span class="input-group-btn mr-2"> -->
<!--                   </span> -->
                  
                    
<!--               <span class="input-group-btn ml-2"> -->
                    <button type="button" class="quantity-left-minus btn input-group-btn" >
                     	<i class="icon-minus"></i>
                    </button>&nbsp;
                   <input type="text" name="quantity"  class="quantity form-control input-number" value="1" min="1" max="100"/>&nbsp;
                    <button type="button" class="quantity-right-plus btn input-group-btn" >
                       <i class="icon-plus"></i>
                   </button>
<!--                  </span> -->
                      </div>
                    </td>
                    
                    <td class="total">$4.90</td>
                    <td>2,500원</td>
                  </tr>
                  <!-- END TR-->
                  <!-- 상품 끝 -->
                  
                  
                  <!-- 상품시작 -->
                  <tr class="text-center">
                  <td class="product-remove"><input type="checkbox" value="cart_list_num"></td>
                     <td class="product-num"><a href="#">2</a></td>
                    
                    <td class="image-prod"><div class="img" style="background-image:url(../images/dish-2.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>Grilled Ribs Beef</h3>
                      <p>Far far away, behind the word mountains, far from the countries</p>
                    </td>
                    
                    <td class="price">$15.70</td>
                    
                    <td class="quantity">
                      <div class="input-group mb-3">
<!--             <span class="input-group-btn mr-2"> -->
<!--                   </span> -->
                  
                    
<!--               <span class="input-group-btn ml-2"> -->
                    <button type="button" class="quantity-left-minus btn input-group-btn" >
                    	<i class="icon-minus"></i>
                    </button>&nbsp;
                   	<input type="text" name="quantity"  class="quantity form-control input-number" value="1" min="1" max="100"/>&nbsp;
                    <button type="button" class="quantity-right-plus btn input-group-btn" >
                       <i class="icon-plus"></i>
                   	</button>
<!--                  </span> -->
                      </div>
                    </td>
                    
                    <td class="total">$15.70</td>
                    <td><p>무료</p></td>
                  </tr><!-- END TR-->
                  <!-- 상품 끝 -->
                  
                </tbody>
              </table>
        <a href="checkout.jsp" class="btn btn-primary btn-outline-primary" id="buyAllBtn">전체 주문하기</a>
        <a href="checkout.jsp" class="btn btn-primary btn-outline-primary" id="deleteBtn">선택상품 삭제하기</a>
            </div>
          </div>
        </div>
        <div class="row justify-content-end" >
        <div>
        </div>
        <div class="col mt-5 cart-wrap ftco-animate">
        <ul>
        <li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
      <li>무신사는 기본적으로 전 상품 무료 배송입니다.</li>
      <li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
      <li>2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</li>
      <li>장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
      <li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>
      <li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</li>
        </ul>
        </div>
        
        
          <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate" id="total">
            <div class="cart-total mb-3" >
              <h3>Cart Totals</h3>
              <p class="d-flex">
                <span>Subtotal</span>
                <span>$20.60</span>
              </p>
              <p class="d-flex">
                <span>Delivery</span>
                <span>$0.00</span>
              </p>
              <p class="d-flex">
                <span>Discount</span>
                <span>$3.00</span>
              </p>
              <hr>
              <p class="d-flex total-price">
                <span>Total</span>
                <span>$17.60</span>
              </p>
            
            
            <span><a href="checkout.jsp" class="btn btn-primary py-3 px-4">선택한상품 주문하기</a></span>
            
            
          </div>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <span class="subheading">Discover</span>
            <h2 class="mb-4">Related products</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3">
            <div class="menu-entry">
              <a href="#" class="img" style="background-image: url(../images/menu-1.jpg);"></a>
              <div class="text text-center pt-4">
                <h3><a href="#">Coffee Capuccino</a></h3>
                <p>A small river named Duden flows by their place and supplies</p>
                <p class="price"><span>$5.90</span></p>
                <p><a href="#" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="menu-entry">
              <a href="#" class="img" style="background-image: url(../images/menu-2.jpg);"></a>
              <div class="text text-center pt-4">
                <h3><a href="#">Coffee Capuccino</a></h3>
                <p>A small river named Duden flows by their place and supplies</p>
                <p class="price"><span>$5.90</span></p>
                <p><a href="#" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="menu-entry">
              <a href="#" class="img" style="background-image: url(../images/menu-3.jpg);"></a>
              <div class="text text-center pt-4">
                <h3><a href="#">Coffee Capuccino</a></h3>
                <p>A small river named Duden flows by their place and supplies</p>
                <p class="price"><span>$5.90</span></p>
                <p><a href="#" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="menu-entry">
              <a href="#" class="img" style="background-image: url(../images/menu-4.jpg);"></a>
              <div class="text text-center pt-4">
                <h3><a href="#">Coffee Capuccino</a></h3>
                <p>A small river named Duden flows by their place and supplies</p>
                <p class="price"><span>$5.90</span></p>
                <p><a href="#" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-section img">
   <jsp:include page="../inc/footer.jsp"></jsp:include>
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