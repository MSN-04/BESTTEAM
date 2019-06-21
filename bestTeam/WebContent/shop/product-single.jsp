<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="vo.CartBean"%>
<%@page import="vo.QnaBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	// 조회된 게시물 정보를 담은 ArrayList 객체(articleList)와 페이지 정보를 담은 PageInfo 객체(pageInfo)를
	// request.getAttribute() 메서드로 가져오기
	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String id=(String)session.getAttribute("id");
	System.out.println(id);
	System.out.println("reviewList: " +reviewList.size());
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	System.out.println("listCount: " +listCount);
	int pageSize = 5;
	int pageBlock =3;
	int pageCount = listCount/pageSize+(listCount%pageSize==0?0:1);
// 	qna
	QnaBean qnabean = new QnaBean();
// 	UserBean userbean = new UserBean();
	int qnaNum = qnabean.getQna_num();
	String qnaSubject = qnabean.getQna_subject();
	String qnaWriter = qnabean.getQna_writer();
	
	
	ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>) request.getAttribute("qnaList");
	PageInfo pageInfo2 = (PageInfo) request.getAttribute("pageInfo2");
	int listCount2 = pageInfo2.getListCount();
	int nowPage2 = pageInfo2.getPage();
	int maxPage2 = pageInfo2.getMaxPage();
	int startPage2 = pageInfo2.getStartPage();
	int endPage2 = pageInfo2.getEndPage();
// 	int pageCount2 = listCount2/pageSize+(listCount2%pageSize==0?0:1);
	System.out.println("스타트: "+startPage2+"엔드: "+endPage2);
	
    ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");
    
	// 쿠키로 상품번호 저장
	Cookie c = new Cookie("item_num"+itemBean.getItem_num(), URLEncoder.encode(itemBean.getItem_num()+"","utf-8"));
	c.setMaxAge(60*60*24); // 24시간
	response.addCookie(c);
%>

	
 
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shop ─ Cafe Tinkervell</title>
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
<link rel="stylesheet" href="./css/product-single.css">

<link rel="stylesheet" href="./css/flaticon.css">
<link rel="stylesheet" href="./css/icomoon.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/kakaoTalkChat.css">

<link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="jquery.bxslider/jquery.bxslider.js"></script>


<script type="text/javascript">
//삭제 확인메세지
function delconfirm(qna_re_ref,item_num) {
	var message = confirm("이 게시글을 삭제하시겠습니까?");
	if (message == true) {
		location.href = "./qnaDeletePro.qna?qan_re_ref=" + re_ref+"&item_num="+item_num;
	} else
		alert("취소되었습니다");
	return false;
}
function delconfirm2(review_re_ref,item_num) {
	var message = confirm("이 게시글을 삭제하시겠습니까?");
	if (message == true) {
		location.href = "./reviewDeletePro.re?review_re_ref=" + re_ref+"&item_num="+item_num;
	} else
		alert("취소되었습니다");
	return false;
}
	 
// $(document).ready(function(){$('.bxslider').bxSlider({  auto: true,speed: 500,pause: 4000,mode:'fade',autoControls: true,pager:true,}); });
var slideIndex = 1;
showSlides(slideIndex);
// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}
// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
		
</script>
<script src="./js/jquery-3.3.1.js"></script>
<script  type="text/javascript" src="./js/httpRequest.js"></script>
<script type="text/javascript">
// qna 안  카테고리 버튼 작동 자바스크립트
 	$(document).ready(function(index) {
 		$('#ac1').show();
 		$('#ac2').hide();
 		$('#ac3').hide();
 	});
 	$(document).ready(function(index) {
 		$('#btn1_1').click(function() {
 			$('#ac1').show();
 			$('#ac2').hide();
 			$('#ac3').hide();
 			var offset = $('#btn1_1').offset();
 		});
 	});
 	$(document).ready(function(index) {
 		$('#btn2_1').click(function() {
 			$('#ac1').hide();
 			$('#ac2').show();
 			$('#ac3').hide();
 			var offset = $('#btn2_1').offset();
 		});
 	});
 	$(document).ready(function(index) {
 		$('#btn3_1').click(function() {
 			$('#ac1').hide();
 			$('#ac2').hide();
 			$('#ac3').show();
 			var offset = $('#btn3_1').offset();
 		});
 	});
</script> 

<script type="text/javascript">
// 상세정보, 리뷰, qna 버튼 작동 자바스크립트
	$(document).ready(function(index) {
		
			 // 파라미터가 담길 배열
		    var param = new Array();
		 
		    // 현재 페이지의 url
		    var url = decodeURIComponent(location.href);
		    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
		    url = decodeURIComponent(url);
		 
		    var params;
		    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
		    params = url.substring( url.indexOf('?')+1, url.length );
		    // 파라미터 구분자("&") 로 분리
		    params = params.split("&");
		 
		    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
		    var size = params.length;
		    var key, value;
		    for(var i=0 ; i < size ; i++) {
		        key = params[i].split("=")[0];
		        value = params[i].split("=")[1];
		 
		        param[key] = value;
		    }
		    
		    //qna페이징처리
		    if(param['pageNum']==null && param['page']==null){
			$('#btn1').css('color', '#212529');
			$('#btn1').css('background-color', '#c29963');
			$('#btn1').css('border-color', '#c29963');
			$('#btn2').css('color', '#c29963');
			$('#btn2').css('background-color', '#101012');
			$('#btn2').css('border-color', '#c29963');
			$('#btn3').css('color', '#c29963');
			$('#btn3').css('background-color', '#101012');
			$('#btn3').css('border-color', '#c29963');
			$('#ft1').show();
			$('#ft2').hide();
			$('#ft3').hide();
			}else if(param['pageNum']!=null && param['page']==null){
				$('#btn3').css('color', '#212529');
				$('#btn3').css('background-color', '#c29963');
				$('#btn3').css('border-color', '#c29963');
				$('#btn1').css('color', '#c29963');
				$('#btn1').css('background-color', '#101012');
				$('#btn1').css('border-color', '#c29963');
				$('#btn2').css('color', '#c29963');
				$('#btn2').css('background-color', '#101012');
				$('#btn2').css('border-color', '#c29963');
				$('#ft3').show();
				$('#ft1').hide();
				$('#ft2').hide();
				var offset = $('#btn3').offset();
				$('body,html').animate({
					scrollTop : offset.top
				}, 300);
			}
		    
		    //review 페이징처리
		    if(param['page']==null && param['pageNum']==null){
		    	$('#btn1').css('color', '#212529');
				$('#btn1').css('background-color', '#c29963');
				$('#btn1').css('border-color', '#c29963');
				$('#btn2').css('color', '#c29963');
				$('#btn2').css('background-color', '#101012');
				$('#btn2').css('border-color', '#c29963');
				$('#btn3').css('color', '#c29963');
				$('#btn3').css('background-color', '#101012');
				$('#btn3').css('border-color', '#c29963');
				$('#ft1').show();
				$('#ft2').hide();
				$('#ft3').hide();
			}else if(param['pageNum']==null && param['page']!=null){
				$('#btn2').css('color', '#212529');
				$('#btn2').css('background-color', '#c29963');
				$('#btn2').css('border-color', '#c29963');
				$('#btn1').css('color', '#c29963');
				$('#btn1').css('background-color', '#101012');
				$('#btn1').css('border-color', '#c29963');
				$('#btn3').css('color', '#c29963');
				$('#btn3').css('background-color', '#101012');
				$('#btn3').css('border-color', '#c29963');
				$('#ft2').show();
				$('#ft1').hide();
				$('#ft3').hide();
				var offset = $('#btn2').offset();
				$('body,html').animate({
					scrollTop : offset.top
				}, 300);
			}
		
	});
	
	$(document).ready(function(index) {
		  $('#btn1').click(function() {
				$('#btn1').css('color', '#212529');
				$('#btn1').css('background-color', '#c29963');
				$('#btn1').css('border-color', '#c29963');
				$('#btn2').css('color', '#c29963');
				$('#btn2').css('background-color', '#101012');
				$('#btn2').css('border-color', '#c29963');
				$('#btn3').css('color', '#c29963');
				$('#btn3').css('background-color', '#101012');
				$('#btn3').css('border-color', '#c29963');
				$('#ft1').show();
				$('#ft2').hide();
				$('#ft3').hide();
				var offset = $('#btn1').offset();
				$('body,html').animate({
					scrollTop : offset.top
				}, 300);
			});
	});
	
	$(document).ready(function(index) {
		$('#btn2').click(function() {
			$('#btn2').css('color', '#212529');
			$('#btn2').css('background-color', '#c29963');
			$('#btn2').css('border-color', '#c29963');
			$('#btn1').css('color', '#c29963');
			$('#btn1').css('background-color', '#101012');
			$('#btn1').css('border-color', '#c29963');
			$('#btn3').css('color', '#c29963');
			$('#btn3').css('background-color', '#101012');
			$('#btn3').css('border-color', '#c29963');
			$('#ft2').show();
			$('#ft1').hide();
			$('#ft3').hide();
			var offset = $('#btn2').offset();
			$('body,html').animate({
				scrollTop : offset.top
			}, 300);
		});
	});
	$(document).ready(function(index) {
		$('#btn3').click(function() {
			$('#btn3').css('color', '#212529');
			$('#btn3').css('background-color', '#c29963');
			$('#btn3').css('border-color', '#c29963');
			$('#btn1').css('color', '#c29963');
			$('#btn1').css('background-color', '#101012');
			$('#btn1').css('border-color', '#c29963');
			$('#btn2').css('color', '#c29963');
			$('#btn2').css('background-color', '#101012');
			$('#btn2').css('border-color', '#c29963');
			$('#ft3').show();
			$('#ft1').hide();
			$('#ft2').hide();
			var offset = $('#btn3').offset();
			$('body,html').animate({
				scrollTop : offset.top
			}, 300);
		});
	});
	
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
	
	// review 조회수
	
	function read() {
		var keyword = reviewhidden.value;
		var params = "review_num="+keyword;
	      sendRequest("reviewRead.re", params, displayResult, 'POST');
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
<script> 
var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
j(document).ready(function(){ 
    var main = j('.bxslider').bxSlider({ 
    mode: 'fade', 
    auto: true,	//자동으로 슬라이드 
    controls : true,	//좌우 화살표	
    autoControls: true,	//stop,play 
    pager:true,	//페이징 
    pause: 3000, 
    autoDelay: 0,	
    slideWidth: 800, 
    speed: 300, 
    stopAutoOnclick:true 
}); 
j(".bx-stop").click(function(){	// 중지버튼 눌렀을때 
    main.stopAuto(); 
    j(".bx-stop").hide(); 
    j(".bx-start").show(); 
    return false; 
}); 
j(".bx-start").click(function(){	//시작버튼 눌렀을때 
    main.startAuto(); 
    j(".bx-start").hide(); 
    j(".bx-stop").show(); 
    return false; 
}); 
j(".bx-start").hide();	//onload시 시작버튼 숨김. 
}); 
$(document).ready(function(){
	$("#rere").hide();
$( '#rere1' ).click(
	    function() {
	        $( '#rere' ).toggle();
	    }
	);
 </script> 
	<style type="text/css">
	
		.roundbox {
		 width: 50px;
		 text-align: center;
		 display: inline-block;
		}
		
		.roundbox a {
		  text-transform: uppercase;
		  display: inline-block;
		  width: 35px;
		  padding: 4px 10px;
		  margin-bottom: 7px;
		  border-radius: 4px;
		  color: #b3b3b3;
		  border: 1px solid #674c27;
		  font-size: 14px; }
		  
	</style>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#cart').on('click',function(){
			if('<%=id%>' != 'null' ) {
				$.ajax({
					url : 'cartInsert.sh',
					type : 'get',
					data : {
						"item_num" : <%=itemBean.getItem_num()%>,
						"quantity" : $('#quantity').val(),
						"item_price" : <%=itemBean.getItem_price()%>,
						"cart_img" : '<%=itemBean.getItem_img()%>',
						"cart_item_name" : '<%=itemBean.getItem_name()%>'
					},
					success : function(data) {
						
						if (data == 1){
							var con = confirm('장바구니에 등록되었습니다.\n장바구니로 이동하시겠습니까?');
							if (con == true) {
								location.href="cart.sh";
							}
						} else if (data == -1) {
							alert('장바구니 등록에 실패하였습니다.');
						} else if (data == 2) {
							var con = confirm('장바구니에 동일한 상품이 있습니다.\n상품 수량을 변경하시겠습니까?');
							if (con == true) {
								location.href="cartUpdate.sh?item_num=<%=itemBean.getItem_num() %>&cart_count=" + $('#quantity').val();
							}
						} else {
							alert('알 수 없는 오류 발생!\n오류가 지속된다면 문의부탁바랍니다.');
						}
						
					},
					error : function(request, status, error) {
					}
				});
			} else {
				alert('로그인 후 이용해주세요.');
			}
			
		});
		
		$('#buy').on('click',function(){ 
			if('<%=id%>' != 'null' ) {
				$.ajax({
					url : 'cartCheck.sh',
					type : 'get',
					success : function(data) {
						if (data < 0){
							alert('장바구니에 담겨있는 상품도 함께 주문됩니다.\n원치 않으실 경우 장바구니를 비워주세요.');
						} else {
							$.ajax({
								url : 'cartInsert.sh',
								type : 'get',
								data : {
									"item_num" : <%=itemBean.getItem_num()%>,
									"quantity" : $('#quantity').val(),
									"item_price" : <%=itemBean.getItem_price()%>,
									"cart_img" : '<%=itemBean.getItem_img()%>',
									"cart_item_name" : '<%=itemBean.getItem_name()%>'
								},
								success : function(data) {
									
									if (data == 1){
										alert('해당상품이 주문됩니다.');
										location.href="checkout.sh";
									} else {
										alert('알 수 없는 오류가 발생하였습니다.\n오류가 지속된다면 문의부탁바랍니다.');
									}
									
								},
								error : function(request, status, error) {
								}
							});
						
						}
					},
					error : function(request, status, error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} else {
				alert('로그인 후 이용해주세요.');
			}
		});
	});
</script>
<style>
 .div0525{float:right !important;
 			} 
</style>
</head>
<body>
	<header>
		<jsp:include page="/inc/header.jsp" />
	</header>
	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image:  url(./images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">
					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Product Detail</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- 카카오톡 상담 -->
<jsp:include page="../inc/kakaoChat.jsp"/>
<!-- 카카오톡 상담 End -->
	
	<section class="ftco-section">
		<div class="container">
			<div class="row">
<div class="container1">
	<span id="sd"><img src="./itemUpload/<%=itemBean.getItem_img() %>" style="width: 500px; height: 500px;"></span>
  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt.jpg"  id="sd">
  </div>
  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt3.jpg"  id="sd">
  </div>
  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt4.jpg"  id="sd">
  </div>
  <div class="mySlides">
    <div class="numbertext"></div>
      <img src="./images/tt5.jpg"  id="sd">
  </div>
  
  <!-- Next and previous buttons -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>
</div>
				
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3><span style="color: red;"><%=itemBean.getItem_amount() == 0 ? "[품절]" : "" %> </span><%=itemBean.getItem_name() %></h3>
					<p class="price">
						<span><%=NumberFormat.getInstance().format(itemBean.getItem_price()) %> 원</span>
					</p>
					<p><%=itemBean.getItem_info() %></p>
					<div class="col-md-12 mb-3" style="padding: 0 !important; margin: 0 !important;">
						<div class="roundbox"  style="text-align: center;">
							<span style="font-size: 13px; margin: 0;">아로마</span><br>	
							<a><%=itemBean.getItem_favor_aroma() %></a> 
						</div>
						<div class="roundbox">
							<span style="font-size: 13px; margin: 0;">산미</span><br>
							<a><%=itemBean.getItem_favor_acidity() %></a>
						</div>
						<div class="roundbox">
							<span style="font-size: 13px; margin: 0;">씁쓸함</span><br>
							<a><%=itemBean.getItem_favor_bitterness() %></a>
						</div>
						<div class="roundbox">
							<span style="font-size: 13px; margin: 0;">바디감</span><br>
							<a><%=itemBean.getItem_favor_body() %></a>
						</div>
						<div class="roundbox">
							<span style="font-size: 13px; margin: 0;">달콤함</span><br>
							<a><%=itemBean.getItem_favor_sweetness() %></a>
						</div>
					</div>
					<div class="mt-4" style="margin-left; 0 !important; padding-left: 0 !important;">
						<div class="col-md-6">
							<div class="form-group d-flex"></div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3" style="padding-left: 0 !important; padding-right: 0 !important;">
							<div class="input-group mb-3">
                    
<!--               <span class="input-group-btn ml-2"> -->
                    <button type="button" class="quantity-left-minus btn input-group-btn">
                     	<i class="icon-minus"></i>
                    </button>&nbsp;
                   <input type="text" id="quantity" name="quantity"  class="quantity form-control input-number" value="1" min="1" max="100"/>&nbsp;
                    <button type="button" class="quantity-right-plus btn input-group-btn" >
                       <i class="icon-plus"></i>
                   </button>
<!--                  </span> -->
                      </div>
						</div>
					</div>
					<%
					   if (itemBean.getItem_amount() != 0) {
					       %>
					       <p>
		                        <a id="cart" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" style="margin-right: 5px !important;">Add to Cart</a>
		                        <a id="buy" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3" style="margin-right: 5px !important;">BUY</a>
		                    </p>  <!-- <== song 190618 추가 -->
					       <%
					   }
					%>
		<div class="row1">
		

					
				</div>
			</div>
		</div>
	</section>
						<section class="ftco-menu mb-5 pb-5" >
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-top: -100px;">
								<a class="nav-link active"  data-toggle="pill"
									href="#v-pills-0" role="tab" aria-controls="v-pills-0" id="btn1"
									aria-selected="true" style="width: 200px; text-align: center;">상세정보</a> 
								<a class="nav-link"  data-toggle="pill" href="#v-pills-1" id="btn2"
									role="tab" aria-controls="v-pills-1" aria-selected="false" style="width: 200px; text-align: center;">상품후기</a>
								<a class="nav-link"  data-toggle="pill"   id="btn3" href="#v-pills-2"
									role="tab" aria-controls="v-pills-2" aria-selected="false" style="width: 200px; text-align: center;" >상품Q&A</a>  
								
							<%  
										if(id != null && id.equals("admin")) { %>
											<a class="nav-link"  href="itemModify.em?item_num=<%=itemBean.getItem_num() %>" id="btn4"
												role="tab" aria-controls="v-pills-2" aria-selected="false" style="width: 200px; text-align: center; 
												color: white !important;">상품정보 수정 / 삭제</a>
								<%  	} 
									%>
							</div>
						</section>
							
	<section class="ftco-section" id="ft1">
		<div class="row rows" >
			<div class="col-md-12 ftco-animate">
					
					<table class="table">
						<tr>
							<td><img src="./itemUpload/<%=itemBean.getItem_content() %>"></td>
						</tr>
					</table>
				</div>
			</div>
	</section>
	
<!-- review -->
<section class="ftco=section" id="ft2">
		<div class="container">
			<div class="row d-flex">
			<div class="blog-entry align-self-stretch" style="margin: auto;">
	<section class="ftco=section" id="ac1">
		<div class="container">
					<table class="table thead-light" id="ac11">
                <tr>
                  <td><a data-toggle="collapse">번호</a></td>
                  <td><a data-toggle="collapse">제목 </a></td>
                  <td><a data-toggle="collapse">작성자</a></td>
                  <td><a data-toggle="collapse">작성일</a></td>
                  
                  
                  </tr>
                 <%
										if (reviewList != null && listCount > 0) {
											for (int i = 0; i < reviewList.size(); i++) {
												System.out.println("싱글페이지:"+ reviewList.size());
												System.out.println(reviewList.get(i).getReview_re_lev());
									%>
									
								<tr>
<%-- 									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.size() - i %></a></td> --%>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=(listCount-i)-((nowPage-1)*10) %></a></td>
									<% 
									int wid = 0;
										if(reviewList.get(i).getReview_re_lev()>0){
											System.out.println(reviewList.get(i).getReview_re_lev());
										wid = reviewList.get(i).getReview_re_lev()*10;
											%>
											<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>" style="width=<%=wid %> ">[RE]:<%=reviewList.get(i).getReview_subject() %> </a></td>
									<%	}else{
									%>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=reviewList.get(i).getReview_subject() %> </a></td>
									<%} %>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=reviewList.get(i).getReview_user_id() %></a></td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=reviewList.get(i).getReview_date() %></a></td>
								</tr>
								<tr>
								<td id="collapse<%=i %>" class="panel-collapse collapse in" colspan="4">
											<% if(id!= null){
											if(id.equals(reviewList.get(i).getReview_user_id())||id.equals("admin")){ %>
											<div class="panel-body">
											<%
											   if(reviewList.get(i).getReview_img() != null) {
											       %><p><img src="./itemUpload/<%=reviewList.get(i).getReview_img() %>"></p><%
											   }
											%>
											
												<b><%=reviewList.get(i).getReview_content() %></b>
												<section class="ftco=section div0525" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate " style="max-width:100% !important;">
															<a href="reviewModifyForm.re?review_num=<%=reviewList.get(i).getReview_num() %>&review_item_num=<%=reviewList.get(i).getReview_item_num() %>" class="btn btn-primary btn-outline-primary" >수정</a> 
															<a href="reviewDeletePro.re?review_re_ref=<%=reviewList.get(i).getReview_re_ref() %>&review_item_num=<%=reviewList.get(i).getReview_item_num() %>" class="btn btn-primary btn-outline-primary"  onclick="delconfirm2('<%=reviewList.get(i).getReview_re_ref() %>','<%=reviewList.get(i).getReview_item_num() %>')">삭제</a>
														</div>
													</div>
												</section>
												
<!-- 															id가 "admin"이고 답글인 경우 답글폼 숨기기  -->
										<% if(id.equals("admin")){ 
											if(reviewList.get(i).getReview_re_lev()==0){
											%>
													<section class="ftco-section" style="width: 100% !important;">
		<div class="col-md-5" id="mail" style="max-width: 100% !important;">
			<form  action="ReviewReplyProAction.re" method="post"
				class="contact-form" >
				<input type="hidden" class="form-control"value="<%=reviewList.get(i).getReview_subject() %>"
								name="review_reply_subject" id="review_reply_subject" required="required">
								<input type="hidden" class="form-control"value="<%=reviewList.get(i).getReview_num() %>"
								name="review_num" id="review_reply_subject" required="required">
								<input type="hidden" class="form-control"value="<%=reviewList.get(i).getReview_item_num() %>"
								name="review_item_num" id="review_reply_subject" required="required">
					
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">REVIEW 답글</h2>
				</div>
				<table style="width: 100%; text-align: left;">
					<div class="row">
					<tr>
						<!-- 						<div class="col-md-6"> -->
						<div class="form-group">
							<input type="text" class="form-control" value="<%=id %>"
								name="review_reply_writer" id="review_reply_writer" readonly="readonly">
						</div>
						<!-- 						</div> -->
					</tr>
					
					</div>
				</table>
				<table style="width: 100%; text-align: center;">
					
							
					<tr>
						<td> <div class="form-group">
                <textarea name="review_reply_content" id="review_reply_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div></td>
					</tr>
					<!-- 					제목과 내용은 필수입력으로 메세지 띄우기 -->
					<tr style="display: inline-block;">
						<td colspan="2"><input type="button"
							class="btn btn-primary py-3 px-4" style="color: black;"
							id="reset" value="취소" /> <input type="submit"
							class="btn btn-primary py-3 px-4" style="color: black;" id="save"
							value="등록" /></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<% }else{
		%><b><%=reviewList.get(i).getReview_content() %></b><%
	}
											
											}else{
											%>
									<div class="panel-body">
												 
												</div>
												<%	
												}
										
												%>		
											</div>
											<%}else{
												%><b>작성자만 볼 수 있습니다.</b>
											<% }
											}else{%>
											<b>로그인 후 이용 가능합니다.</b>
											<%} %>
										</td>
								</tr>
								
								
								<%
									}
											}	
								%>
							</table>
						</div>
					</section>
					<a href="reviewWriteForm.re?item_num=<%=itemBean.getItem_num() %>"  class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>
			
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
							<% 
							if(startPage<1){
								%>
								<li><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&page=<%=nowPage-1 %>'>&lt;</a></li>
							<%
							}
							
							for(int i = startPage; i<=endPage;i++){ 
								if(i==nowPage){%>
								<li class="active"><a><%=i %></a></li>
								<%
							}else{
								%>
							
									<li ><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&page=<%=i %>'><%=i %></a></li>
									
									<%} 
									
							if(endPage < maxPage){
								%>
								<li class="active"><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&page=<%=nowPage+1 %>'>&gt;</a></li>
							<%
							}
						}
							%>
								</ul>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
	</section>
				
<!-- QNA -->
	<section class="ftco=section" id="ft3">
		<div class="container">
			<div class="row d-flex">
				<div class="blog-entry align-self-stretch" style="margin: auto;">
					<section class="ftco=section" id="ac1">
						<div class="container">
							<table class="table thead-light" id="ac1">
								<tr>
									<td><a data-toggle="collapse">번호</a></td>
									<td><a data-toggle="collapse">제목 </a></td>
									<td><a data-toggle="collapse">작성자</a></td>
									<td><a data-toggle="collapse">작성일</a></td>
									</tr>
									<% 
										if (qnaList != null && listCount2 > 0) {
											for (int a = 0; a < qnaList.size(); a++) {
												System.out.println("싱글페이지:"+ qnaList.size());
												System.out.println(qnaList.get(a).getQna_re_lev());
									%>
									
								<tr>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=a %>"><%=(listCount2-a)-((nowPage2-1)*10) %></a></td>
									<% 
									int wid2 = 0;
										if(qnaList.get(a).getQna_re_lev()>0){
											System.out.println(qnaList.get(a).getQna_re_lev());
										wid2 = qnaList.get(a).getQna_re_lev()*10;
											%>
											<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse1<%=a %>" style="width=<%=wid2 %> ">[RE]:<%=qnaList.get(a).getQna_subject() %> </a></td>
									<%	}else{
									%>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse1<%=a %>"><%=qnaList.get(a).getQna_subject() %> </a></td>
									<%} %>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse1<%=a %>"><%=qnaList.get(a).getQna_writer() %></a></td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse1<%=a %>"><%=qnaList.get(a).getQna_date() %></a></td>
								</tr>
								<tr>
								<td id="collapse1<%=a %>" class="panel-collapse collapse in" colspan="4">
											<% if(id!=null){
											if(id.equals("admin")||id.equals(qnaList.get(a).getQna_writer())){ %>
											<div class="panel-body">
												<b><%=qnaList.get(a).getQna_content() %></b>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525" style="max-width:100% !important;">
															<a href="qnaModifyForm.qna?qna_num=<%=qnaList.get(a).getQna_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;">수정</a> 
															<a href="qnaDeletePro.qna?qna_re_ref=<%=qnaList.get(a).getQna_re_ref() %>&qna_item_num=<%=qnaList.get(a).getQna_item_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;" onclick="delconfirm('<%=qnaList.get(a).getQna_re_ref() %>','<%=qnaList.get(a).getQna_item_num() %>')">삭제</a>
														</div>
													</div>
												</section>
<!-- 												id가 "admin"이고 답글인 경우 답글폼 숨기기 -->
										<% if(id.equals("admin")){ 
											if(qnaList.get(a).getQna_re_lev()==0){
											%>
												<section class="ftco-section">
													<div class="col-md-5" id="mail" style="max-width: 100% !important;">
														<form id="frm" action="QnaReplyProAction.qna" method="post"
															class="contact-form" style="width: 100%;">
															<input type="hidden" class="form-control"value="<%=qnaList.get(a).getQna_subject() %>"
																			name="qna_reply_subject" id="qna_reply_subject" required="required">
																			<input type="hidden" class="form-control"value="<%=qnaList.get(a).getQna_num() %>"
																			name="qna_num" id="qna_reply_subject" required="required">
																			<input type="hidden" class="form-control"value="<%=qnaList.get(a).getQna_item_num() %>"
																			name="qna_item_num" id="qna_reply_subject" required="required">
																
															<div class="col-lg-12 text-center">
																<h2 class="section-heading text-uppercase">QNA 답글</h2>
															</div>
															<table style="width: 100%; text-align: left;">
																<div class="row">
																<tr>
																	<!-- 						<div class="col-md-6"> -->
																	<div class="form-group">
																		<input type="text" class="form-control" value="<%=id %>"
																			name="qna_reply_writer" id="qna_reply_writer" readonly="readonly">
																	</div>
																	<!-- 						</div> -->
											
																</tr>
															</table>
															<table style="width: 100%; text-align: center;">
																<tr>
																	<td> <div class="form-group">
											                			<textarea name="qna_reply_content" id="qna_reply_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
											              				</div>
											              			</td>
																</tr>
																<!-- 					제목과 내용은 필수입력으로 메세지 띄우기 -->
																<tr style="display: inline-block;">
																	<td colspan="2"><input type="button"
																		class="btn btn-primary py-3 px-4" style="color: black;"
																		id="reset" value="취소" /> <input type="submit"
																		class="btn btn-primary py-3 px-4" style="color: black;" id="save"
																		value="등록" /></td>
																</tr>
															</table>
														</form>
													</div>
												</section>
												
											<% }else{
											}
											}else{
												%>
												<div class="panel-body">
												 
												</div>
												<%	
												}
										
												%>		
											</div>
											<%}else{
												%><b>작성자만 볼 수 있습니다.</b>
											<% }
											}else{%>
											<b>로그인 후 이용 가능합니다.</b>
											<%} %>
										</td>
								</tr>
							<%	 }
							 } %>
							</table>
						</div>
					</section>
					<a href="qnaWriteForm.qna?item_num=<%=itemBean.getItem_num() %>"  class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>
			
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
							<% 
							if(startPage<1){
								%>
								<li><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=nowPage-1 %>'>&lt;</a></li>
							<% }
							
								for(int i = startPage2; i<=endPage2;i++){ 
									if(i==nowPage2){%>
									<li class="active"><a><%=i %></a></li>
							<%
							 }else{
								%>
							
									<li ><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=i %>'><%=i %></a></li>
									
									<%} 
									
							if(endPage2 < maxPage2){
								%>
								<li class="active"><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=nowPage+1 %>'>&gt;</a></li>
							<%
							}
							}
										
							%>
								</ul>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
	</section>
<section style="margin-top: 10rem;">
		<div class="container" >
			<div class="row" >
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services" >
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-choices" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Easy to Order</h3>
							
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-delivery-truck" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Fastest Delivery</h3>
							
						</div>
					</div>
				</div>
				<div class="col-md-4" style="margin-top: 30px; width: 80%;">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5" style="border: 1px solid #FAFAFA;">
							<span class="flaticon-coffee-bean" style="color: #FAFAFA;"></span>
						</div>
						<div class="media-body">
							<h3 class="heading" style="color: #FAFAFA;">Quality Coffee</h3>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-section img">
		<jsp:include page="/inc/footer.jsp" />
	</footer>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>
	<script src="./js/jquery.bxslider.min.js"></script>
</body>
</html>