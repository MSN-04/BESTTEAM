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
/*      	.col-md-8 { border: 1px solid aqua; }  */
     	.col-md-8 {
     		flex: auto;
     		margin: auto;
     		max-width: 80%;
     	} 
    
/*     	.col-md-8 { background-color: #000; } */
    	.col-md-8 img { width: 100%; } /* 폼에 들어가는 사진 크기 조정(반드시 필요) */
    	.col-md-8 p { /* 자동 개행 */
    		word-wrap: break-word; 
    		white-space: pre-wrap; 
    		word-break: break-all;
    	}
    	.row {
    		flex-wrap: nowrap;
    	}
    	
/*     	@media screen and (max-width: 991px) */
    	.hide-menu {
    		display: none;
    	}
    	
	 	.side-small-menu {
	 		position: fixed;
	 	}
	 	.side-small-menu path {
	 		border: 1px solid white;
 	 		fill: rgb(190,190,190); 
	 	}
    	.side-small-menu {
			padding: 0;
			list-style: none;
			list-style-image: none;
			top: 155px;
			transform: translateY(-35px) translateX(-20px);
		}
		.side-small-menu>li {
			display: list-item;
			text-align: -webkit-match-parent;
		}
		.side-small-menu button {
			-webkit-tap-highlight-color: transparent;
			background: rgba(0,0,0,0);
			cursor: pointer;
			box-sizing: border-box;
			border-style: outset;
			border-width: 0;
		} 
		
	 	.fadeIn {
			visibility : visible;
			opacity: 1;
			transition : visibility 0s 0s, opacity .3s 0s;
	 	}
	 	
	 	.fadeOut {
			visibility : hidden;
			opacity: 0;
	 		transition : visibility 0s .3s, opacity .3s 0s; 
	 	}
	 	.up-button {
	 		position: fixed;
	 		right: 16px;
	 		bottom: 16px;
	 		z-index: 50;
	 		width: 40px;
	 		height: 40px;
	 		border-radius: 50%;
	 		background-color: #242424;
	 		background-image: url("https://assets.website-files.com/5c330a4a121342bde4045c5d/5c35885e1c5d6080565a921c_chevrons-up-white.svg");
	 		background-position: 50% 46%;
	 		background-size: 20px;
	 		background-repeat: no-repeat;
	 		transition: all 400ms cubic-bezier(.215, .61, .355, 1);
	 	}
	 	.w-inline-block {
	 		max-width: 100%;
	 	}
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       if( num >= 700 ){  // 스크롤을 36이상 했을 때
					$('.side-small-menu').removeClass('fadeOut').addClass('fadeIn');
					$('#goTop').css({
		       			'transform' : 'translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg)',
		       			'opacity' : '1'
		       		});
		       }else{
		    	   $('.side-small-menu').removeClass('fadeIn').addClass('fadeOut');
		    	   $('#goTop').css({
		       			'transform' : 'translate3d(0px, 0px, 0px) scale3d(0, 0, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg)',
		       			'opacity' : '0'
		       		});
		       }
		 	 });
			
			$(window).resize(function(){
				if ($(window).width() < 1210 ) {
					$('.side-small-menu').addClass('hide-menu');
				} else {
					$('.side-small-menu').removeClass('hide-menu');
				}
			});
			
			$('#goTop').click( function() {
				$( 'html, body' ).animate( { scrollTop : 750 }, 400, "swing" );
				return false;
			} );
			
		});
	</script>
  </head>
  <body>
  	<header>
  		<jsp:include page="../inc/header.jsp"/>
  	</header>
    <!-- END nav -->
    
    <!-- 맨 위로 -->
	<a href="#" class="up-button w-inline-block" id="goTop" style="display: block; transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d; opacity: 1;"></a>
    
    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(../images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Blog Details</h1>
	            <p class="breadcrumbs">
<!-- 	            <span class="mr-2"> <a href="index.jsp">Home</a></span>  -->
	            <span class="mr-2"><a href="blog.jsp">Blog</a></span> <span>Blog Details</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container" >
        <div class="row">
<!-- 왼쪽 작은 메뉴 시작 -->
    		<ul class="side-small-menu" >
    			<li>
<!--     				<div  style="background-size: cover; background-repeat: no-repeat; background-image: url(../images/moon.jpg); width: 80px; height: 80px; margin-bottom: 10px; "></div> -->
    				<div style="font-size: 23px; font-style: italic; font-family: -webkit-pictograph; margin-bottom: 3px;">Writer</div>
    				<div>
	    				<p style="font-weight: bold;margin-bottom: 1px;line-height: 10px;">Moon</p>
	    				<p>Team Leader</p>
    				</div>
    			</li>
    			<li style="border: 1px inset #343a40;margin: 10px 0 20px 0;"></li>
				<li style="margin-bottom: 6px;"> <!-- 박수 -->
					<button>
						<span>
							<svg style="width: 29px; height: 29px; vertical-align: bottom;" >
								<g>
									<path d="M13.739 1l.761 2.966L15.261 1z"></path>
									<path d="M16.815 4.776l1.84-2.551-1.43-.471z"></path>
									<path d="M10.378 2.224l1.84 2.551-.408-3.022z"></path>
									<path d="M22.382 22.622c-1.04 1.04-2.115 1.507-3.166 1.608.168-.14.332-.29.492-.45 2.885-2.886 3.456-5.982 1.69-9.211l-1.101-1.937-.955-2.02c-.315-.676-.235-1.185.245-1.556a.836.836 0 0 1 .66-.16c.342.056.66.28.879.605l2.856 5.023c1.179 1.962 1.379 5.119-1.6 8.098m-13.29-.528l-5.02-5.02a1 1 0 0 1 .707-1.701c.255 0 .512.098.707.292l2.607 2.607a.442.442 0 0 0 .624-.624L6.11 15.04l-1.75-1.75a.998.998 0 1 1 1.41-1.413l4.154 4.156a.44.44 0 0 0 .624 0 .44.44 0 0 0 0-.624l-4.152-4.153-1.172-1.171a.998.998 0 0 1 0-1.41 1.018 1.018 0 0 1 1.41 0l1.172 1.17 4.153 4.152a.437.437 0 0 0 .624 0 .442.442 0 0 0 0-.624L8.43 9.222a.988.988 0 0 1-.291-.705.99.99 0 0 1 .29-.706 1 1 0 0 1 1.412 0l6.992 6.993a.443.443 0 0 0 .71-.501l-1.35-2.856c-.315-.676-.235-1.185.246-1.557a.85.85 0 0 1 .66-.16c.342.056.659.28.879.606L20.628 15c1.573 2.876 1.067 5.545-1.544 8.156-1.396 1.397-3.144 1.966-5.063 1.652-1.713-.286-3.463-1.248-4.928-2.714zM12.99 6.976l2.562 2.562c-.497.607-.563 1.414-.155 2.284l.265.562-4.257-4.257a.98.98 0 0 1-.117-.445c0-.267.104-.517.292-.706a1.023 1.023 0 0 1 1.41 0zm8.887 2.06c-.375-.557-.902-.916-1.486-1.011a1.738 1.738 0 0 0-1.342.332c-.376.29-.61.656-.712 1.065a2.1 2.1 0 0 0-1.095-.562 1.776 1.776 0 0 0-.992.128l-2.636-2.636a1.883 1.883 0 0 0-2.658 0 1.862 1.862 0 0 0-.478.847 1.886 1.886 0 0 0-2.671-.012 1.867 1.867 0 0 0-.503.909c-.754-.754-1.992-.754-2.703-.044a1.881 1.881 0 0 0 0 2.658c-.288.12-.605.288-.864.547a1.884 1.884 0 0 0 0 2.659l.624.622a1.879 1.879 0 0 0-.91 3.16l5.019 5.02c1.595 1.594 3.515 2.645 5.408 2.959a7.16 7.16 0 0 0 1.173.098c1.026 0 1.997-.24 2.892-.7.279.04.555.065.828.065 1.53 0 2.969-.628 4.236-1.894 3.338-3.338 3.083-6.928 1.738-9.166l-2.868-5.043z"></path>
								</g>
							</svg>
							<span style="vertical-align: bottom; margin-left: 8px;"> 1 </span>
						</span>
					</button>
				</li>
<!-- 				<li> -->
<!-- 					<button> -->
<!-- 						<span> -->
<!-- 							<svg width="29" height="29" > -->
<!-- 								<g> -->
<!-- 									<path d="M19.385 4h-9.77A2.623 2.623 0 0 0 7 6.615V23.01a1.022 1.022 0 0 0 1.595.847l5.905-4.004 5.905 4.004A1.022 1.022 0 0 0 22 23.011V6.62A2.625 2.625 0 0 0 19.385 4zM21 23l-5.91-3.955-.148-.107a.751.751 0 0 0-.884 0l-.147.107L8 23V6.615C8 5.725 8.725 5 9.615 5h9.77C20.275 5 21 5.725 21 6.615V23z"></path> -->
<!-- 								</g> -->
<!-- 							</svg> -->
<!-- 						</span> -->
<!-- 					</button> -->
<!-- 				</li> -->
				<li> <!-- 트위터 -->
					<button>
						<span>
							<a href="http://twitter.com/share?url=<%=request.getRequestURL() %>&text=Cafe%20ThinkerBell%20에서의%20포스팅을%20확인해보세요" target="_blank">
								<svg width="29" height="29" >
									<g>
										<path d="M22.053 7.54a4.474 4.474 0 0 0-3.31-1.455 4.526 4.526 0 0 0-4.526 4.524c0 .35.04.7.082 1.05a12.9 12.9 0 0 1-9.3-4.77c-.39.69-.61 1.46-.65 2.26.03 1.6.83 2.99 2.02 3.79-.72-.02-1.41-.22-2.02-.57-.01.02-.01.04 0 .08-.01 2.17 1.55 4 3.63 4.44-.39.08-.79.13-1.21.16-.28-.03-.57-.05-.81-.08.54 1.77 2.21 3.08 4.2 3.15a9.564 9.564 0 0 1-5.66 1.94c-.34-.03-.7-.06-1.05-.08 2 1.27 4.38 2.02 6.94 2.02 8.31 0 12.86-6.9 12.84-12.85.02-.24.01-.43 0-.65.89-.62 1.65-1.42 2.26-2.34-.82.38-1.69.62-2.59.72a4.37 4.37 0 0 0 1.94-2.51c-.84.53-1.81.9-2.83 1.13z"></path>
									</g>
								</svg>
							</a>
						</span>
					</button>
				</li>
				<li> <!-- 페이스북 -->
					<button>
						<span>
							<a href="http://www.facebook.com/share.php?u=<%=request.getRequestURL() %>" target="_blank">
								<svg width="29" height="29" >
									<g>
										<path d="M23.209 5H5.792A.792.792 0 0 0 5 5.791V23.21c0 .437.354.791.792.791h9.303v-7.125H12.72v-2.968h2.375v-2.375c0-2.455 1.553-3.662 3.741-3.662 1.049 0 1.95.078 2.213.112v2.565h-1.517c-1.192 0-1.469.567-1.469 1.397v1.963h2.969l-.594 2.968h-2.375L18.11 24h5.099a.791.791 0 0 0 .791-.791V5.79a.791.791 0 0 0-.791-.79"></path>
									</g>
								</svg>
							</a>
						</span>
					</button>
				</li>
			</ul>
<!-- 왼쪽 작은 메뉴 끝 -->
          <div class="col-md-8 ftco-animate" >
            <h2 class="mb-3">"커피는 일어나고 있는 어떤 현상이다"</h2>
					<p>제 1차 세계대전 이후 절망과 허무에 몸부림치는 청년 예술가들을 일컬어 ‘잃어버린 세대The Lost Generation’라 처음 명명한 미국의 시인이자 소설가, 거트루드 스타인. 그녀는 실험적인 언어로 《3인의 생애》,《텐더 버턴스》 등 미국 문학에 큰 영향을 끼친 주요 저서들을 남겼을 뿐 아니라 생전에 피카소, 마티스 같은 세기적 작가들을 발굴하고 전폭적으로 지원하는 선구자적인 일을 했습니다.</p>
					<p>
              <img src="../images/image_1.jpg" alt="" class="img-fluid">
            </p>
            <p>파리 플뢰리스 거리 27번지에 위치한 그녀의 아파트는 젊은 예술가들이 끊임없이 드나드는 문화교류의 장이었다고 하지요.</p>
            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
            <p>우디 앨런의 영화 〈미드나잇 인 파리〉에는 당대 예술가의 작품을 신랄하게 비평하는 스타인의 모습이 생생이 담겨 있습니다. 그러한 그녀는 예술적 안목이 까다롭기로 소문난 헤밍웨이가 인정하는 커피 애호가였다고 하는데요. 그녀가 얼마나 커피를 사랑했는지 아래의 글에서 배어 나옵니다.</p>
            <p>
              <img src="../images/image_2.jpg" alt="" class="img-fluid">
            </p>
					
            <p>“커피는 단지 음료가 아니라 그 이상의 무엇이다. 커피는 일어나고 있는 어떤 현상이다. 커피는 시간을 주지만, 단순히 물리적인 시간을 말하는 것이 아니라, 본연의 자신이 될 수 있는 기회를 준다는 의미다. 그러므로 한 잔 더 마시기를…”</p>
            <p>스타인이 커피에 관해 남긴 문장을 읽고 있노라면 그녀의 철학적 사유에 대한 감탄과 더불어 깊은 여운이 남습니다. 커피를 마시는 시간은 스타인의 말처럼 단순히 물리적인 시간의 의미를 넘어 우리가 존재로서 자기 확인을 하게끔 이끄는 성찰의 시간, ‘어떤 현상’을 선사하지요. 그러므로 우리 함께 한 잔 더 마시기를….</p>
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">로스팅</a>
                <a href="#" class="tag-cloud-link">핸드드립</a>
                <a href="#" class="tag-cloud-link">융드립</a>
                <a href="#" class="tag-cloud-link">에스프레소</a>
              </div>
            </div>
            
            <div class="about-author d-flex">
              <div class="bio align-self-md-center mr-5">
                <img src="../images/person_5.jpg" alt="Image placeholder" class="img-fluid mb-4" width="300px" height="300px">
              </div>
              <div class="desc align-self-md-center">
                <h3>전주연</h3>
                <p>커피의 향은 피아노 선율과 같다고 생각하여 한 소절 한 소절 건반을 누르는 마음으로 원두를 마주합니다. 단순히 마시는 것이 아닌 보고 듣고 느끼는 커피를 내립니다. 2019 월드 챔피언십 바리스타 경연대회에서 우승을 거머쥐었으며 현재 한남동에서 'Cafe Rdo'를 운영중입니다.</p>
              </div>
            </div>


            <div class="pt-5 mt-5">
              <h3 class="mb-5">코멘트 6개</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/person_1.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>권경민</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/person_1.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>송주영</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                     <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>

                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="../images/person_2.png" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>문세웅</h3>
                        <div class="meta">June 27, 2018 at 2:21pm</div>
                       <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                        <p><a href="#" class="reply">Reply</a></p>
                      </div>


                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="../images/person_3.png" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                       <h3>이기홍</h3>
                        <div class="meta">June 27, 2018 at 2:21pm</div>
                         <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                        <p><a href="#" class="reply">Reply</a></p>
                      </div>

                        <ul class="children">
                          <li class="comment">
                            <div class="vcard bio">
                              <img src="../images/person_3.png" alt="Image placeholder">
                            </div>
                            <div class="comment-body">
                              <h3>권경민</h3>
                              <div class="meta">June 27, 2018 at 2:21pm</div>
                               <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                            <p><a href="#" class="reply">Reply</a></p>
                            </div>
                      </li>
                        </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/person_1.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>지이듬</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                     <p>도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다. 도움이 되는 정보네요. 잘 읽었습니다.</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">코멘트 남기기</h3>
                <form action="#">
                  <div class="form-group">
                    <label for="name">이름 *</label>
                    <input type="text" class="form-control" id="name">
                  </div>
<!--                   <div class="form-group"> -->
<!--                     <label for="email">이메일 *</label> -->
<!--                     <input type="email" class="form-control" id="email"> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <label for="website">웹사이트</label> -->
<!--                     <input type="url" class="form-control" id="website"> -->
<!--                   </div> -->

                  <div class="form-group">
                    <label for="message">내용</label>
                    <textarea name="" id="message" cols="30" rows="2" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="작성 완료" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>

          </div> <!-- .col-md-8 -->
          
<!--           <div class="col-md-4 sidebar ftco-animate"> -->
<!--             <div class="sidebar-box"> -->
<!--               <form action="#" class="search-form"> -->
<!--                 <div class="form-group"> -->
<!--                 	<div class="icon"> -->
<!-- 	                  <span class="icon-search"></span> -->
<!--                   </div> -->
<!--                   <input type="text" class="form-control" placeholder="Search..."> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <div class="categories"> -->
<!--                 <h3>카테고리</h3> -->
<!--                 <li><a href="#">원두 <span>(12)</span></a></li> -->
<!--                 <li><a href="#">로스팅 <span>(22)</span></a></li> -->
<!--                 <li><a href="#">핸드드립 <span>(37)</span></a></li> -->
<!--                 <li><a href="#">융드립 <span>(42)</span></a></li> -->
<!--                 <li><a href="#">드리퍼 <span>(14)</span></a></li> -->
<!--                 <li><a href="#">강배전 <span>(140)</span></a></li> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>최근에 올라온 글</h3> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_1.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> 관리자</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_2.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> 관리자</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_3.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> 관리자</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>태그</h3> -->
<!--               <div class="tagcloud"> -->
<!--                 <a href="#" class="tag-cloud-link">로스팅</a> -->
<!--                 <a href="#" class="tag-cloud-link">핸드로스팅</a> -->
<!--                 <a href="#" class="tag-cloud-link">생두</a> -->
<!--                 <a href="#" class="tag-cloud-link">융드립</a> -->
<!--                 <a href="#" class="tag-cloud-link">드리퍼</a> -->
<!--                 <a href="#" class="tag-cloud-link">홈로스팅</a> -->
<!--                 <a href="#" class="tag-cloud-link">원두선별법</a> -->
<!--                 <a href="#" class="tag-cloud-link">원두보관기간</a> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>Paragraph</h3> -->
<!--               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
<!--             </div> -->
<!--           </div> -->

        </div>
      </div>
    </section> <!-- .section -->
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
    
  </body>
</html>