<%@page import="java.text.NumberFormat"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.util.calendar.CalendarDate"%>
<%@page import="sun.util.calendar.LocalGregorianCalendar.Date"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserBean"%>

<%@page import="vo.BuyItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// 장바구니 상품 가져옴
	ArrayList<BuyItemBean> cartItems = (ArrayList<BuyItemBean>) request.getAttribute("cartItems");

	// 회원정보 가져옴
	UserBean userBean =  (UserBean) request.getAttribute("userBean");
	
	// 주소 가져와서 주소와 상세주소로 나누기
	System.out.println("주소에 : 없으면 StringTokenizer 에러나서 페이지 안넘어감\n");
	StringTokenizer st = new StringTokenizer(userBean.getUser_address(), ":");
	String address1 = st.nextToken();
	String address2 = st.nextToken();
%>

<!DOCTYPE html>
<html lang="en">

<!-- ===== 결제 API 연동 1 ===== -->
	<!-- iamport.payment.js : https://docs.iamport.kr/implementation/payment#add-library -->
	<!-- https://todakandco.tistory.com/10 -->
	
<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- ===== 결제 API 연동 1 끝 ===== -->

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
	<jsp:include page="/inc/header.jsp"/>
    <!-- END nav -->
  </header>
  
  
  	
    <section class="home-slider owl-carousel">

      <div class="slider-item"  data-stellar-background-ratio="0.5">
		<div class="overlay" style="background-image: url(./images/receipt.jpg); background-position: 50% 0%; background-repeat: no-repeat; background-size: cover;"></div>        
		<div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Checkout</h1>
	            <p class="breadcrumbs"> <span class="mr-2"><a href="./index.jsp">Home</a></span> 
	            					    <span class="mr-2"><a href="cart.jsp">Cart</a></span>   </p>
            </div>

          </div>
        </div>
      </div>
    </section>

<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->

    <section class="ftco-section">
      <div class="container" >
        <div class="row"  >
          <div class="container" style="margin: auto;">
<!--      <div class="col-xl-8 ftco-animate"> -->


<!--   ------------------------------------------------------------------------------------------------------------------------ -->



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
                    <th>상품 합계</th>
                  </tr><!-- END TR-->
                </thead>
                <tbody>


		<%
			int thisItemTotalPrice = 0;
			int totalPrice = 0;

			if(cartItems.size() != 0) {
				
				for(int i=0; i<cartItems.size(); i++) {
					
					thisItemTotalPrice = cartItems.get(i).getItem_price() * cartItems.get(i).getItem_count();
					totalPrice += thisItemTotalPrice;
					
		%>
	                  <tr class="text-center">
	                    
	                     <td class="product-num"><a><%=i +1 %></a> </td>
	                    
	                     <td class="image-prod"><a href="itemSingle.em?item_num=<%=cartItems.get(i).getItem_num() %>" class="img"
														style="background-image: url(./itemUpload/<%=cartItems.get(i).getItem_img() %>);"></a> </td>
	                    						  
	                     <td class="product-name">
	                         <a href="itemSingle.em?item_num=<%=cartItems.get(i).getItem_num() %>" > <h3><%=cartItems.get(i).getItem_name() %></h3> </a> </td>
	                    
	                     <td class="price"><%=NumberFormat.getInstance().format(cartItems.get(i).getItem_price()) %> 원</td>
	                    
	                     <td class="price"><%=cartItems.get(i).getItem_count() %> 개</td>
	                    
	                     <td class="total"><%=NumberFormat.getInstance().format(thisItemTotalPrice) %> 원</td>
	                  
	                  </tr><!-- END TR-->
		<%			
		
				}
			} else { %>
				<script>
					alert("결제할 상품이 없습니다.");
				</script>
		<%	}
		%>
                </tbody>
              </table>
            </div>
            
		</form>
		<br><br>
		
<!--   ------------------------------------------------------------------------------------------------------------------------ -->

		<form id="frm" action="/checkoutPro.sh">
		<div class="billing-form ftco-bg-dark p-3 p-md-5">
		   <h3 class="mb-4 billing-heading">주문자 정보</h3>
	         <div class="row align-items-end" >
	          	
	         <!-- 1st line -->
	            <div class="col-md-6">
	              	<div class="form-group">
		              	<label for="firstname">주문하시는 분 *</label>
		              	<input type="text" class="form-control" name="1" id="name" value="<%=userBean.getUser_name() %>" placeholder="이름" required="required">
		              	<div>&nbsp;</div>
	              	</div>
	            </div>
	            
	            <div class="col-md-6">
	              <div class="form-group">
	              	<label for="lastname"></label>
	              </div>
                </div>	  
                
              <div class="w-100"></div>
		            
		      <!-- 2nd line -->    
	            <div class="col-md-6">
                	<div class="form-group">
                		<label for="phone">연락처 1 *</label>
                  		<input type="text" class="form-control" name="2" id="phone" value="<%=userBean.getUser_phone() %>" placeholder="배송시 연락받을 번호" onkeyup="verifyPhone()" required="required">
                  		<div id="checkPhone" style="padding-left: 15px; font-size: 14px;">&nbsp;</div>
                	</div>
              	</div>
              
              	<div class="col-md-6">
              		<div class="form-group">
                		<label for="emailaddress">연락처 2</label>
                		<input type="text" class="form-control" id="phone2" placeholder="(선택항목)" onkeyup="verifyPhone2()">
                  		<div id="checkPhone2" style="padding-left: 15px; font-size: 14px;">&nbsp;</div>
                	</div>
                </div>	
                
		        <div class="w-100"></div>
		         
		      <!-- 3rd line -->      
		        <div class="col-md-6">
		        	<div class="form-group">
		           		<label for="postcodezip">우편번호 *</label>
	               		<input type="text" class="form-control" name="3" id="postcode" value="<%=userBean.getUser_post()%>" placeholder="우편번호를 검색해주세요" required="required" readonly="readonly">
	              	</div>
	           	</div>

		        <div class="col-md-6">
		        	<div class="form-group">
	                	<label for="towncity"></label>
	                	<p onclick="execDaumPostcode()"><a class="btn btn-best py-3 px-4" >우편번호 검색</a></p>
	                </div>
		        </div>
		        
		        <div class="w-100"></div>
		         
		      <!-- 4th line -->     
				<div class="col-md-6" >
		          	<div class="form-group">
	              		<label for="streetaddress">주소 *</label>
	              		<input type="text" class="form-control" name="4" id="address" value="<%=address1 %>" placeholder="우편번호 검색시 주소를 선택할 수 있습니다" readonly="readonly">
                	</div>
	            </div>

	            <div class="col-md-6">
	            	<div class="form-group">
                  		<input type="text" class="form-control" name="5" id="detailAddress" value="<%=address2 %>" placeholder="상세주소" required="required">
                	</div>
	            </div>
               
                <div class="w-100"></div>
                <div>&nbsp;</div>

			  <!-- 5th line -->
                <div class="col-md-12">
          		<div class="form-group">
                		<label for="emailaddress">Email</label>
                  		<input type="text" class="form-control" id="Email" value="<%=userBean.getUser_email()%>" placeholder="(선택항목)" onkeyup="verifyEmail()">
                  		<div id="checkEmail" style="padding-left: 15px; font-size: 14px;">&nbsp;</div>
                	</div>
                </div>
                
              <!-- 6th line -->  
                <div class="col-md-12">
                	<div class="form-group mt-4">
						<div class="radio" style="text-align: right; padding-bottom: 20px;">
						    <a class="btn btn-best py-3 px-4" id="resetInfo" onclick="resetInfo()">직접 입력</a> &nbsp;
						    <a class="btn btn-best py-3 px-4" id="enterInfo" onclick="enterInfo()">회원정보 입력</a>
						</div>
					</div>
                </div>
                
                
	          </div>
	        </div><!-- END -->
	          

		<!-- 우편번호 검색 -->
				
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
				                document.getElementById("detailAddress").value = "";
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
 
		<!-- 우편번호 검색 End -->
	          
	          
	          <script type="text/javascript">
			    <!-- 배송 정보 '직접 입력' 클릭 -->  
		          function resetInfo() {
		        	  $('#name').val("");
		        	  $('#name').focus();
		        	  $('#phone').val("");
		        	  $('#phone2').val("");
		        	  $('#postcode').val("");
		        	  $('#address').val("");
		        	  $('#detailAddress').val("");
		        	  $('#Email').val("");
		        	  document.getElementById('checkPhone').style.color = "#B70000";
					  document.getElementById('checkPhone').innerHTML =  "숫자만 입력해주세요";
					  document.getElementById('checkPhone2').innerHTML =  "&nbsp;";
					  document.getElementById('checkEmail').innerHTML =  "&nbsp;";
				  }
	     		<!-- 배송 정보 '직접 입력' 클릭 End --> 
	      
	     		<!-- 배송 정보 '회원정보 입력' 클릭 -->
			      function enterInfo() {
			    	  $('#name').val("<%=userBean.getUser_name() %>");
		        	  $('#phone').val("<%=userBean.getUser_phone() %>");
		        	  $('#phone2').val("");
		        	  $('#postcode').val("<%=userBean.getUser_post()%>");
		        	  $('#address').val("<%=address1 %>");
		        	  $('#detailAddress').val("<%=address2 %>");
		        	  $('#Email').val("<%=userBean.getUser_email()%>");
		        	  document.getElementById('checkPhone').innerHTML = "&nbsp;";
		        	  document.getElementById('checkPhone2').innerHTML = "&nbsp;";
		        	  document.getElementById('checkEmail').innerHTML = "&nbsp;";
			      }
	    	 	<!-- 배송 정보 '회원정보 입력' 클릭 End --> 
			 </script>
	     
	     
	     <!-- 전화번호, 이메일 형식 제어 --> 
                
            <script type='text/javaScript'>
		    		
                
              	//검사수행 함수
                function check(reg, what) {
                     if(reg.test(what)) {
                         return true;
                     } else {
                     	return false;
                     }
              	}
                
				// --- 연락처1 제어
                function verifyPhone() {
				    var phone = frm.phone.value;
					var regPhone = /^[0-9]{8,11}$/;
						
					if(phone == ''){
						document.getElementById('checkPhone').style.color = "#B70000";
						document.getElementById('checkPhone').innerHTML =  "숫자만 입력해주세요";
						
					} else if (phone != ''){
						if(check(regPhone, phone)) {
							document.getElementById('checkPhone').style.color = "#c49b63";
				    	    document.getElementById('checkPhone').innerHTML = "올바른 형식입니다";
				    	    
						} else {
							document.getElementById('checkPhone').style.color = "#B70000";
							document.getElementById('checkPhone').innerHTML =  "올바른 형식이 아닙니다";
						}
                	} 
                }
                
				// --- 연락처2 제어
                function verifyPhone2() {
				    var phone = frm.phone2.value;
					var regPhone = /^[0-9]{8,11}$/;
						
					if(phone == ''){
						document.getElementById('checkPhone2').innerHTML = "&nbsp;" ;
					} else if (phone != ''){
						if(check(regPhone, phone)) {
							document.getElementById('checkPhone2').style.color = "#c49b63";
				    	    document.getElementById('checkPhone2').innerHTML = "올바른 형식입니다";
				    	    
						} else {
							document.getElementById('checkPhone2').style.color = "#B70000";
							document.getElementById('checkPhone2').innerHTML =  "올바른 형식이 아닙니다";
						}
                	} 
                }
                
				// --- 이메일 제어
                function verifyEmail() {
                	var Email = frm.Email.value;
					var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						
					if(Email == ''){
						document.getElementById('checkEmail').innerHTML =  "&nbsp;";
						
					} else if (Email != ''){
						if(check(regEmail, Email)) {
							document.getElementById('checkEmail').style.color = "#c49b63";
				    	    document.getElementById('checkEmail').innerHTML = "올바른 형식입니다";
				    	    
						} else {
							document.getElementById('checkEmail').style.color = "#B70000";
							document.getElementById('checkEmail').innerHTML =  "올바른 형식이 아닙니다";
						}
                	}
                }
                
			</script>     
		 <!-- 전화번호, 이메일 형식 제어 End -->

<!--   ------------------------------------------------------------------------------------------------------------------------ -->
		

	          <div class="row mt-5 pt-3 d-flex" >
	          
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-best">
	          			<h3 class="billing-heading mb-4">주문 확인</h3>
	          					<p class="d-flex">
		    						<span>상품 합계</span>
		    						<span class="money"><%=NumberFormat.getInstance().format(totalPrice) %> 원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>배송비 합계</span>
		    						<span class="money">2,500 원</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>결제예정 금액</span>
		    						<span class="money"><%=NumberFormat.getInstance().format(totalPrice + 2500) %> 원</span>
		    					</p>
					</div>
	          	</div>

	          	
	          	<div class="col-md-6 d-flex" >
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-best">
	          			<h3 class="billing-heading mb-4">결제 방법</h3>
	          			
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="ckoutRadio" value="카드 결제" class="mr-2"> <span>카드 결제</span></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="ckoutRadio" value="휴대폰 결제" class="mr-2"> <span>휴대폰 결제</span></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio">
								   <label><input type="radio" name="ckoutRadio" value="실시간 계좌이체" class="mr-2"> <span>실시간 계좌이체</span></label>
								</div>
							</div>
						</div>
						
						<hr>
						
									
						<div class="form-group">
							<div class="col-md-12">
								<div class="checkbox">
								   <label><input type="checkbox" name="checkBuy" class="mr-2"> 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
								</div>
							</div>
						</div>
						<p style="text-align: right;" onclick="checkout()"><a class="btn btn-best py-3 px-4">결제하기</a></p>
						
						
						<!-- 결제 완료시 submit 할 정보들 -->
						<input type="hidden" id="impUid" name="impUid" value="null">
						<input type="hidden" id="paidAmount" name="paidAmount" value="null">
						<input type="hidden" id="status" name="status" value="null">
						<input type="hidden" id="orderName" name="orderName" value="null">
						<input type="hidden" id="buyerPostcode" name="buyerPostcode" value="null">
					
						</div>
		          	</div>
		          	
		          	
		          </div>	
			</form>		


				<%
				
				// 주문번호 생성 : yyyymmdd-HHmmss
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");

				Calendar cal = Calendar.getInstance();

				String orderNum = dateFormat.format(cal.getTime());
				System.out.println("주문번호 : "+ orderNum);
				
				// 주문명 생성 : A상품 외 n개
				String subCount = Integer.toString(cartItems.size() - 1);
				String orderName = "";
				if(cartItems.size() == 1) {
					orderName = cartItems.get(0).getItem_name();
					System.out.println("주문명 : "+ orderName);
					
				} else if (cartItems.size() > 1) {
					orderName = "'"+ cartItems.get(0).getItem_name()+"'" +" 상품 외 "+ subCount + "개";
					System.out.println("주문명 : "+ orderName);
				}
				
				// 결제금액 생성 : 총 상품금액 + 배송비
				int orderPrice = totalPrice + 2500;
				System.out.println("결제금액 : "+ orderPrice);
				System.out.println();
					
				%>

						<script type='text/javaScript'>
			            
							function checkout() {
								
								// 1. 구매동의 체크 여부 확인
								if(! $("input:checkbox[name='checkBuy']").is(":checked")) {
									var check = confirm("구매진행에 동의해주세요");
									
								} else {

									<% System.out.println("구매진행 동의함"); %>

								    // 2. 결제방법에 체크한 라디오의 value 값 가져오기 
									var ckRadio = $('input:radio[name="ckoutRadio"]:checked').val();

								    var payMethod;
								    
								    if(ckRadio == null) {
								    	var select = confirm("결제방법을 선택해주세요"); 
								    	return;
									} else if(ckRadio == '카드 결제') {
										payMethod = 'card';
									} else if(ckRadio == '휴대폰 결제') {
										payMethod = 'phone';
									} else if(ckRadio == '실시간 계좌이체') {
										payMethod = 'trans';
									}
									
									var a = confirm("결제하시겠습니까?");    // confirm의 결과 값(true or false)를 a에 저장
									
									// 3. 결제 API 진행
									if(a){

										//===== 결제 API 연동 2
										var IMP = window.IMP; // 생략 가능
										IMP.init("imp29951450");  //발급받은 가맹점 식별코드
										
										//===== 결제 API 연동 3
										IMP.request_pay({ // (1) param : 결제요청에 필요한 정보를 담는 객체
										    pg: "html5_inicis",		// 결제방식
										    pay_method: payMethod,		// 결제수단
										    merchant_uid: "<%=orderNum %>",	// * 주문번호, (필수항목) 결제가 된 적이 있는 merchant_uid로는 재결제 불가
										    name: "<%=orderName %>",	// 주문명
										    amount: <%=orderPrice %>,	// 결제 금액
										    buyer_email: $('#Email').val(),	// 구매자 email
										    buyer_name: $('#name').val(),	// 구매자 이름
										    buyer_tel: $('#phone').val(),	// 구매자 전화번호
										    buyer_addr: $('#address').val() + " " + $('#detailAddress').val() ,	// 구매자 주소
										    buyer_postcode: $('#postcode').val()	// 구매자 우편번호

										}, function (rsp) { // (2) callback : 결제완료 후 결제정보를 담음
											    if (rsp.success) { 
													$.ajax({
											        	url: "checkoutPro.sh", // 가맹점 서버
											            method: "get",
											            headers: { "Content-Type": "application/json" },
											            data: {
											                imp_uid: rsp.imp_uid,  // * imp_uid : 거래 고유 번호
											                merchant_uid: rsp.merchant_uid,
											                buyer_name : $('#name').val(),
											                buyer_phone : $('#phone').val(),
											                buyer_phone2 : $('#phone2').val(),
											                buyer_postcode : $('#postcode').val(),
											                buyer_address : $('#address').val(),
											                buyer_detailAddress : $('#detailAddress').val(),
											                buyer_Email : $('#Email').val(),
											                paid_amount : <%=totalPrice %>,
											                status : rsp.status,
											                orderName : rsp.name
											                
											            },
											            success : function(data) {
															alert('결제가 완료되었습니다.');
															location.href = "Mypage.us";
														},
														error :function(request, status, error) {
															alert('결제 실패! ' + error);
														}
											        });
											    } else { 
											    	// 결제 실패 시
											    	alert("결제 실패 : " +  rsp.error_msg);
											    	history.back();
										    	}
										});
									}else{
										history.back();
									}
								}
							}
						</script>
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
