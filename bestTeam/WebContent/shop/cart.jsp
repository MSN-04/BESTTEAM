<%@page import="java.text.NumberFormat"%>
<%@page import="vo.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <%
  	ArrayList<CartBean> cartList = (ArrayList<CartBean>)request.getAttribute("cartList");
  	String id = (String)session.getAttribute("id"); 
  %>
    <title>Cart ─ Café TinkerVell</title>
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
    <link rel="stylesheet" href="./css/cart.css">
    <link rel="stylesheet" href="./css/kakaoTalkChat.css">

    
    <style type="text/css">
    .money { text-align: right; }
    
    #checkAll {
    	color: white;
    }
    
    #deleteBtn1st, #deleteBtn2nd {position:relative;
		float: right;
    }
    
    #buyAllBtn{
    position:relative;
    float: right;
    }
    #total{
    position:relative;
    }
    

	.btn-best { 
	   	background-color: #C49B63 !important;
	   	border: 1px solid #C49B63 !important;
	   	color: black !important; }
	    	
	.btn-best:hover { 
	   	background-color: black !important;
	   	border: 1px solid #C49B63 !important;
	   	color: #C49B63 !important; }
	    	
	.btn-best:active { 
	   	background-color: #C49B63 !important;
	   	color: black !important; }  
    </style>
    
    
<!-- 상품 삭제 버튼 Start -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#deleteBtn2nd").hide(); //숨기기
    	$(".checkDelete").hide();
    	
    	
    	$('#deleteBtn1st').on('click' , function(){
    		$("#deleteBtn1st").hide(); //숨기기
    		$("#deleteBtn2nd").show(); //보이기
    		$(".checkDelete").show();
    		
    	});
    	
    	$(function(){
    	    //전체선택 체크박스 클릭
    		$("#checkAll").click(function(){
    			//만약 전체 선택 체크박스가 체크된상태일경우
    			if($("#checkAll").prop("checked")) {
    				//해당화면에 전체 checkbox들을 체크해준다
    				$("input[type=checkbox]").prop("checked",true);
    			// 전체선택 체크박스가 해제된 경우
    			} else {
    				//해당화면에 모든 checkbox들의 체크를해제시킨다.
    				$("input[type=checkbox]").prop("checked",false);
    			}
    		})
    	})
    	$('#deleteBtn2nd').on('click',function(){
    		
    		var a = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
    		
    		if(a) {
	   			var list = new Array();
	    		for (var i = 0 ; i < <%=cartList.size() %> ; i++) {
	    			if ($('.cb'+i).is(":checked") == true) {
		    			list.push($('.cb'+i).val());
	    			}
	    		}
	    		
	    		list = list + ""; // Object를 String으로 변환
	    		if (list != "") {
					$.ajax({
						url : 'cartDelete.sh',
						type : 'get',
						data : { // 값 넘길 때 String으로 넘겨야 함.. getParameter로 받기 때문!
							"list" : list
						},
						success : function(data) {
							if (data == 0){
								alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
								location.href="cart.sh";
							} else if (data == 1) {
								alert('삭제 실패!');
							}
						},
						error :function(request, status, error) {
							alert('error');
						}
					});
	    		} else {
	    			alert('선택된 상품이 없습니다.');
	    		}
    		}
    	});
    	
    	
    });

    </script>
<!-- 상품 삭제 버튼 End -->
    
  </head>
  <body>
    <header>
    <jsp:include page="/inc/header.jsp"/>
    </header>
    <!-- END nav -->

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(./images/bg_3.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
              <h1 class="mb-3 mt-5 bread">Cart</h1>
<!--               <p class="breadcrumbs"><span class="mr-2"><a href="./index/index.jsp">Home</a></span> <span><a href="cart.jsp">Cart</a></span></p> -->
            </div>
            </div>
        </div>
      </div>
    </section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->
    
    <section class="ftco-section ftco-cart">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ftco-animate">
            <div class="cart-list">
              <table class="table">
                <thead class="thead-primary">
                  <tr class="text-center">
                    <th><input class="checkDelete" type="checkbox" id="checkAll" ></th>
                    <th>번호</th>
                    <th>사진</th>
                    <th>상품명</th>
                    <th>상품 가격</th>
                    <th>수량</th>
<!--                     <th>Total</th> -->
<!--                     <th>배송비</th> -->
                  </tr>
                </thead>
                <tbody>
                
                <!-- 상품 시작 -->
                <% 
                	int total = 0;
                	if (cartList != null) {
                		if (cartList.size() != 0) {
	                		for (int i = 0 ; i < cartList.size() ; i++) { 
	                			total += cartList.get(i).getCart_price();
	                		%>
			                  <tr class="text-center">
			                 	<td class="product-remove">
			                 		<input type="checkbox" value="<%=cartList.get(i).getCart_item_num() %>" class="checkDelete cb<%=i %>" name="checkOne">
			                 	</td>
			                    <td class="product-num">
			                    	<a><%=i+1 %></a>
			                    </td>
			                    <td class="image-prod">
			                    	<a href="itemSingle.em?item_num=<%=cartList.get(i).getCart_item_num() %>" >
			                    		<div class="img" style="background-image:url(./itemUpload/<%=cartList.get(i).getCart_img() %>);"></div>
			                    	</a>
			                    </td>
			                    <td class="product-name">
			                      <a href="itemSingle.em?item_num=<%=cartList.get(i).getCart_item_num() %>" ><h3><%=cartList.get(i).getCart_item_name() %></h3></a>
			                    </td>
			                    
			                    <td class="price"><%=NumberFormat.getInstance().format(cartList.get(i).getCart_price()) %> 원</td>
			                    
			                    <td>
			                    	<div class="input-group mb-3">
										 <input type="text" name="quantity"  class="form-control input-number" value="<%=cartList.get(i).getCart_count() %> 개" style="border: 0px !important" readonly/>
			                     	</div>
			                    </td>
			                    
			                  </tr>
		                  <% }	
                		} else { %>
	                		<tr class="text-center" >
	                			<td class="product-name" colspan="6">
                		
	                		<%	if(id != null) { %>
				                	<p>장바구니가 비어 있습니다.</p>
	                		<%  } else {  %>
	                				<p>로그인 후 장바구니를 이용할 수 있습니다.</p>
	                		<%	}
	                		} %>
			                    	</td>
	                			</tr><!-- END TR-->
                <% }%>
                  <!-- 상품 끝 -->
                </tbody>
              </table>

		<% if (cartList.size() != 0) { %>
				<span style="font-size: 17px; padding-left: 20px;"> [ 상품 수량 변경 ]&nbsp; 상품을 클릭하시면 상세보기페이지에서 수량을 변경할 수 있습니다.</span>
				<a class="btn btn-primary btn-outline-primary" id="deleteBtn1st" style="font-size: 17px;" >삭제할 상품 선택하기</a>
		        <a class="btn btn-best btn-outline-primary" id="deleteBtn2nd" style="font-size: 17px;">선택한 상품 삭제</a>
        <% } %>
        
        
            </div>
          </div>
        </div>
        <div class="row justify-content-end" >
        <div>
        </div>
        <div class="col mt-5 ftco-animate" style="padding: 10px 0px !important; font-size: 16px;">
	        <ul style="line-height: 2em;">
		        <li>기본 배송료는 2,500원입니다.</li>
		        <li>해외배송시 배송료가 추가로 발생될 수 있습니다.</li>
		        <li>장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
		        <li>궁금하신 점이 있으시면 Notice - 공지사항 / FAQ 를 참고해주세요.</li>
		        <li>상품에 관한 문의는 상품상세페이지 - 상품Q&A에서 가능합니다.</li>
		        <li>그 외의 문의는 카카오톡 1:1상담으로 문의가능합니다.</li>
	        </ul>
        </div>

        
        <% if (cartList.size() != 0) { %>
        
	          <div class="col mt-5 ftco-animate" id="total">
	            <div class="cart-total" style="padding: 40px !important;" >
	              <h3>주문 확인</h3>
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
	                <span>결제예정 금액</span>
	                <span class="money"><%=NumberFormat.getInstance().format(total + 2500) %> 원</span>
	              </p>
	            
	          	  <p style="text-align: right;" ><a href="checkout.sh" class="btn btn-primary" style="font-size: 17px;" >전체 상품 주문</a></p>
	            
	          	</div>
	          </div>
          
         <% } %> 
        </div>
      </div>
    </section>


    <footer class="ftco-footer ftco-section img">
   <jsp:include page="/inc/footer.jsp"></jsp:include>
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