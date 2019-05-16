<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- 결제 API 연동 1 -->
	<!-- iamport.payment.js : https://docs.iamport.kr/implementation/payment#add-library -->
	<!-- https://todakandco.tistory.com/10 -->
	
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- /결제 API 연동 1 -->

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
    
	    .money { text-align: right; }
	    	
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
	    	
	    .p-best { padding: 50px !important; }
    	
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
		<div class="overlay" style="background-image: url(../images/receipt.jpg); background-position: 50% 0%; background-repeat: no-repeat; background-size: cover;"></div>        
		<div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Checkout</h1>
	            <p class="breadcrumbs"> <span class="mr-2"><a href="../index.jsp">Home</a></span> 
	            					    <span class="mr-2"><a href="cart.jsp">Cart</a></span>   </p>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container" >
        <div class="row"  >
          <div class="container" style="margin: auto;">
<!--      <div class="col-xl-8 ftco-animate"> -->


<!--   ------------------------------------------------------------------------------------------------------------------------ -->

<!--   ------------------------------------------------------------------------------------------------------------------------ -->


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
		



		<form action="#" class="billing-form ftco-bg-dark p-3 p-md-5">
			<h3 class="mb-4 billing-heading">주문자 정보</h3>
	          	<div class="row align-items-end" >
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">주문하시는 분 *</label>
	                  <input type="text" class="form-control" placeholder="성함" required="required">
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname"></label>
	                  
	                </div>
                </div>	   
                

<!--                 나라선택       -->
<!--                 <div class="w-100"></div> -->
<!-- 		            <div class="col-md-12"> -->
<!-- 		            	<div class="form-group"> -->
<!-- 		            		<label for="country">State / Country</label> -->
<!-- 		            		<div class="select-wrap"> -->
<!-- 		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
<!-- 		                  <select name="" id="" class="form-control"> -->
<!-- 		                  	<option value="">France</option> -->
<!-- 		                    <option value="">Italy</option> -->
<!-- 		                    <option value="">Philippines</option> -->
<!-- 		                    <option value="">South Korea</option> -->
<!-- 		                    <option value="">Hongkong</option> -->
<!-- 		                    <option value="">Japan</option> -->
<!-- 		                  </select> -->
<!-- 		                </div> -->
<!-- 		            	</div> -->
<!-- 		            </div> -->

		        
		            
		            
	            <div class="w-100"></div>
		            
	            <div class="col-md-6">
                	<div class="form-group">
                		<label for="phone">연락처 1 *</label>
                  		<input type="text" class="form-control" placeholder="연락처" required="required">
                	</div>
              	</div>
              
              	<div class="col-md-6">
              		<div class="form-group">
                		<label for="emailaddress">연락처 2</label>
                  		<input type="text" class="form-control" placeholder="(선택사항)">
                	</div>
               	</div>
               	
               	    
		            
		        <div class="w-100"></div>
		            
		        <div class="col-md-6">
		        	<div class="form-group">
		           		<label for="postcodezip">우편번호 *</label>
	               		<input type="text" class="form-control" id="postcode" placeholder="우편번호를 검색해주세요"  required="required">
	              	</div>
	           	</div>

		        <div class="col-md-6">
		        	<div class="form-group">
	                	<label for="towncity"></label>
	                	<p onclick="execDaumPostcode()"><a class="btn btn-best py-3 px-4" >우편번호 검색</a></p>
	                </div>
		        </div>
		        
		        
			<!-- 우편번호 검색 API -->
				
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
 
			<!-- /우편번호 검색 API -->
		       

		        <div class="w-100"></div>
		           
				<div class="col-md-6" >
		          	<div class="form-group">
	              		<label for="streetaddress">주소 *</label>
	               		<input type="text" class="form-control" id="address" placeholder="주소">
                	</div>
	            </div>

	            <div class="col-md-6">
	            	<div class="form-group">
                  		<input type="text" class="form-control" id="detailAddress" placeholder="상세주소를 입력해주세요"  required="required">
                	</div>
	            </div>

               
               
                <div class="w-100"></div>

                <div class="col-md-12">
          		<div class="form-group">
                		<label for="emailaddress">Email</label>
                  		<input type="text" class="form-control" placeholder="Email을 입력해주세요">
                	</div>
                </div>
                
                
                <div class="col-md-12">
                	<div class="form-group mt-4">
						<div class="radio" style="text-align: right;">
							<label class="mr-3"><input type="checkbox" name="optradio"> <span> 회원정보 자동입력</span> </label>
						</div>

					</div>
                </div>
	          
	          </div>
	          </form><!-- END -->




<!--   ------------------------------------------------------------------------------------------------------------------------ -->
		

	          <div class="row mt-5 pt-3 d-flex" >
	          
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-best">
	          			<h3 class="billing-heading mb-4">주문 확인</h3>
	          					<p class="d-flex">
		    						<span>상품 합계</span>
		    						<span class="money">41,000원</span>
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
		    						<span>총 결제예정 금액</span>
		    						<span class="money">43,500원</span>
		    					</p>
					</div>
	          	</div>

	          	
<!-- 	          	<div class="col-md-6"> -->
<!-- 	          		<div class="cart-detail ftco-bg-dark p-3 p-md-4"> -->
	          	<div class="col-md-6 d-flex" >
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-best">
	          			<h3 class="billing-heading mb-4">결제 방법</h3>
	          			
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="optradio" class="mr-2"> <span>카드 결제</span></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="optradio" class="mr-2"> <span>휴대폰 결제</span></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="optradio" class="mr-2"> <span>무통장 입금</span></label>
								</div>
							</div>
						</div>
						
						<hr>
									
						<div class="form-group">
							<div class="col-md-12">
								<div class="checkbox">
								   <label><input type="checkbox" value="" class="mr-2"> 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
								</div>
							</div>
						</div>
						<p style="text-align: right;" onclick="checkout()"><a class="btn btn-best py-3 px-4">결제하기</a></p>
						
						<script type="text/javascript">
							function checkout() {
								
								var a = confirm("결제하시겠습니까?");    // confirm의 결과 값(true or false)를 a에 저장
								
								if(a){
									
									// 결제 API 연동 2
									var IMP = window.IMP; // 생략해도 괜찮습니다.
									IMP.init("imp29951450");  //발급받은 "가맹점 식별코드"를 삽입하고 웹사이트의 결제 페이지에서 호출합니다.
									
									// 결제 API 연동 3
									// IMP.request_pay(param, callback) 호출
									// IMP.request_pay(param, callback)을 호출하면 PC 환경에서는 지정한 pg사의 결제모듈 창이 나타남 
									IMP.request_pay({ // (1) param : 결제요청에 필요한 정보를 담는 객체
									    pg: "html5_inicis",		// 결제방식
									    pay_method: "card",		// 결제수단
									    merchant_uid: "20190430-A02",	// * 주문번호, (필수항목) 결제가 된 적이 있는 merchant_uid로는 재결제 불가
									    name: "원두",	// 주문명
									    amount: 100,	// 결제 금액
									    buyer_email: "gildong@gmail.com",	// 구매자 email
									    buyer_name: "홍길동",	// 구매자 이름
									    buyer_tel: "010-1111-2222",	// 구매자 전화번호
									    buyer_addr: "부산 부산진구 동천로 109 삼한골든게이트 7층",	// 구매자 주소
									    buyer_postcode: "47246"	// 구매자 우편번호
									/*
									    * 주문번호(merchant_uid) 생성하기 
										IMP.request_pay를 호출하기 전에 여러분의 서버에 주문 정보를 전달(데이터베이스에 주문정보 INSERT)하고 
										서버가 생성한 주문 번호를 param의 merchant_uid속성에 지정하기를 권장드립니다. 
										결제 완료 후 결제 위변조 여부를 검증하는 단계에서 신뢰도있는 검증을 위해 
										여러분의 서버에서 주문정보를 조회해야 하기 때문입니다.
									*/
									}, function (rsp) { // (2) callback : 고객이 결제를 완료한 후 결제 성공/정보/에러 등의 결제정보를 담음
										    if (rsp.success) { 
										    	// 결제 성공 시
										    	alert("결제 성공");
										    	// jQuery로 HTTP 요청
										        jQuery.ajax({
										            url: " http://kbinsurebs.co.kr/bestTeam", // 가맹점 서버
										            method: "POST",
										            headers: { "Content-Type": "application/json" },
										            data: {
										                imp_uid: rsp.imp_uid,  // * imp_uid : 거래 고유 번호
										                merchant_uid: rsp.merchant_uid
										            }
										        }).done(function (data) {
										        	location.href="confirm_checkout.jsp";
										       	})
										    } else { 
										    	// 결제 실패 시
										    	alert("결제 실패 : " +  rsp.error_msg);
										    	history.back();
									    }
									/*
										*
										가맹점 서버에 imp_uid(거래 고유 번호)를 전달하면 아임포트 서버에서 imp_uid로 결제 정보를 조회할 수 있습니다.
										또, 가맹점에서 관리하는 주문번호인 merchant_uid로 가맹점의 데이터베이스에서 주문 정보를 조회합니다.
										조회한 정보들을 통해 결제 위변조 여부를 검증하고, 서비스의 데이터베이스에 저장할 수 있습니다.
									*/
									});
									
// 									IMP.request_pay();
									
								}else{
									history.back();
								}
							}
						</script>
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