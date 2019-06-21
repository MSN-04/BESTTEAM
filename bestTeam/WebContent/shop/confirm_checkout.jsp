<%@page import="java.text.NumberFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BuyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BuyItemBean"%>
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
  
  <%
	  ArrayList<BuyItemBean> orderInfoList = (ArrayList<BuyItemBean>) request.getAttribute("orderInfoList");
	  ArrayList<BuyBean> orderPersonList = (ArrayList<BuyBean>) request.getAttribute("orderPersonList");

	//  PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

   // int listCount = pageInfo.getListCount();
	int buy_num = Integer.parseInt(request.getParameter("buy_num")); 
	//out.println("buy_num:"+buy_num);
//	out.print("orderPersonList.get(0)-->"+orderPersonList.get(0).getBuy_address());
	  PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

  %>
  
  <header>
	<jsp:include page="/inc/header.jsp"/>
    <!-- END nav -->
  </header>
  
  
  	
    <section class="home-slider owl-carousel">

<!--       <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">  -->
       <div class="slider-item" data-stellar-background-ratio="0.5"> 
      	<div class="overlay"  style="background-image: url(./images/receipt.jpg); background-position: 50% 0%; background-repeat: no-repeat; background-size: cover;"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">order detail</h1>
<!-- 	            <p class="breadcrumbs"> <span class="mr-2"><a href="./index.jsp">Home</a></span>  -->
<!-- 	            					    <span class="mr-2"><a href="cart.jsp">Cart</a></span>   </p> -->
            </div>

          </div>
        </div>
       </div>
    </section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

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
                    <th>번호</th>
                    <th>사진</th>
                    <th>상품명</th>
                    <th>상품 가격</th>
                    <th>수량</th>
                    <th>상품</th>
                  </tr>
                </thead>
                <tbody>
                <%
							if (orderInfoList != null) {
								for (int i = 0; i < orderInfoList.size(); i++) {
						%>
                

                  <tr class="text-center">

                     <td class="product-num"><%=i +1%></td>
                    <td class="image-prod"><div class="img" style="background-image:url('./itemUpload/<%=orderInfoList.get(i).getItem_img() %>')"></div></td>

                    
                    <td class="product-name">
                      <h3><%=orderInfoList.get(i).getItem_name() %></h3></td>
                    
                    <td class="price"><%=NumberFormat.getInstance().format(orderInfoList.get(i).getItem_price()) %> 원</td> 
                    
                    <td class="price"><%=NumberFormat.getInstance().format(orderInfoList.get(i).getItem_count()) %> 개</td>
                    
                    <td class="total"><%=NumberFormat.getInstance().format(orderInfoList.get(i).getItem_price()*orderInfoList.get(i).getItem_count()) %> 원</td>
                  </tr>

                   <%
                   	}
								}
								
								%>
                  
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

		            			 <td><label><span><%=request.getParameter("buy_ordernum") %></span></label></td> </tr>


		            	</table>
		            </div>
                </div>	  
                 
		            
		      	<!-- 2nd line -->
		      	<div class="col-md-6">
		            <div class="form-group">
		              	<table>
		            		<tr> <td width="100px"><label for="firstname">주문자</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_user_id() %></span></label></td> </tr>
		            	</table>
		            </div>
                </div>	   
	          
	          	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">주문일자</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_buydate() %></span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	
	           	<!-- 3rd line -->
	          	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">연락처 1</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_phone() %></span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	<div class="col-md-6">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">연락처 2</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_phone2() %></span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	
	           	<!-- 4th line -->
	           	<div class="col-md-12">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">우편번호</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_post() %></span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>
	           	
	           	<!-- 5th line -->
	           	<div class="col-md-12">
		            <div class="form-group">
		            	<table>
		            		<tr> <td width="100px"><label for="firstname">배송지</label></td>
		            			 <td><label><span><%=orderPersonList.get(0).getBuy_address() %> </span></label></td> </tr>
		            	</table>
		            </div>
	           	</div>

			
	          
	          </div>
	          </form><!-- END -->
<br><br>

<!--   ------------------------------------------------------------------------------------------------------------------------ -->
	
  <form class="billing-form ftco-bg-dark p-3 p-md-5" >
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-3" >
	          			<h3 class="billing-heading mb-4">결제 정보</h3>
	          			
	<%
 		if (orderInfoList != null) {
 			int total = 0;
			for (int i = 0; i < orderInfoList.size(); i++) {
				total += orderInfoList.get(i).getItem_price()*orderInfoList.get(i).getItem_count();
		   }
			
		%>
	          				<div class="col-md-12 confirmCheckout2" style="padding-top: 40px;">
		            		<div class="form-group">
	          					<p class="d-flex">
		    						<span>상품 합계</span>
		    						<span class="money"><%=NumberFormat.getInstance().format(total) %> 원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>배송비 합계</span>
		    						<span class="money">2,500 원</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>총 결제금액</span>
		    						<span class="money"><%=NumberFormat.getInstance().format(total+2500) %> 원</span>
		    					</p>
		    				</div>
		    				</div>
	          	<%
 		}
 	          	%> 
					</div>

	          </form>
          </div> <!-- .col-md-8 -->

<!--   ------------------------------------------------------------------------------------------------------------------------ -->


        </div>
      </div>
    </section> <!-- .section -->
    
<!--   ------------------------------------------------------------------------------------------------------------------------ -->
	<footer>
		<jsp:include page="/inc/footer.jsp"/>
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
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		});
	</script>

    
  </body>
</html>
