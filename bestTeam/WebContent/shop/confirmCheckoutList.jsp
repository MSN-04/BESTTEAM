<%@page import="vo.BuyBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 조회된 게시물 정보를 담은 ArrayList 객체(articleList)와 페이지 정보를 담은 PageInfo 객체(pageInfo)를
	// request.getAttribute() 메서드로 가져오기
	//out.println("여기는 confirmCheckoutList.jsp");
	ArrayList<BuyBean> buyList = (ArrayList<BuyBean>) request.getAttribute("buyList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int limit = pageInfo.getLimit();
	
	int number = 0;
	
	
	
	number = listCount - (nowPage - 1) * (limit);
	
	BuyBean buyBean=(BuyBean)request.getAttribute("BuyBean");
	//------------------------------------------------------
// 	System.out.println("confirmCheckoutList.jsp-->listCount :"+listCount);
// 	System.out.println("confirmCheckoutList.jsp-->nowPage :"+nowPage);
// 	System.out.println("confirmCheckoutList.jsp-->maxPage :"+maxPage);
// 	System.out.println("confirmCheckoutList.jsp-->startPage :"+startPage);
// 	System.out.println("confirmCheckoutList.jsp-->endPage :"+endPage);
	//System.out.println("confirmCheckoutList.jsp-->user_id :"+buyBean.getBuy_user_id());
// 	System.out.println("confirmCheckoutList.jsp--> buy_num:"+buyBean.getBuy_num());
// 	System.out.println("confirmCheckoutList.jsp--> buy_name:"+buyBean.getBuy_name());
// 	System.out.println("confirmCheckoutList.jsp--> buy_date:"+buyBean.getBuy_buydate());
// 	System.out.println("confirmCheckoutList.jsp-->buy_count:"+buyBean.getBuy_count());
// 	System.out.println("confirmCheckoutList.jsp--> buy_total:"+buyBean.getBuy_total());
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
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


<link rel="stylesheet" href="./css/flaticon.css">
<link rel="stylesheet" href="./css/icomoon.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

	<jsp:include page="/inc/header.jsp"></jsp:include>

	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">주문 목록</h1>
						<!-- 	            <p class="breadcrumbs"><span class="mr-2"><a href="./noticeList.no">Notice</a></span> </p> -->
					</div>

				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	    <section class="ftco-section">
      <div class="container" >
        <div class="row">
          <div class="container" style=" margin: 50px;">
<!--      <div class="col-xl-8 ftco-animate" style=" margin: auto;"> -->

          
<!-- box 1 -->          



		<form class="billing-form ftco-bg-dark p-3 p-md-5" style="overflow: auto;">
			<h3 class="mb-4 billing-heading">주문상품 목록</h3>
<!-- 			<div class="row align-items-end" > -->
			
			  			  <div class="cart-list">

              <table class="table">
                <thead class="thead-primary">
                  <tr class="text-center">
                    <th>주문번호</th>
 					<th>주문 상품</th>
                    <th>주문 날짜</th>   
                    <th>결제 금액</th>
                  </tr>
                </thead>
                <tbody>
                <%
							if (buyList != null && listCount > 0) {
								for (int i = 0; i < buyList.size(); i++) {
								//	int buy_num=buyList.get(i).getBuy_num();
								System.out.println("buyList.size():"+buyList.size());
						%>

                  
                  <tr class="text-center">
<!--                     <td class="product-remove"><a href="#"><span class="icon-close"></span></a></td> -->
                     <td class="product-num"><a href="confirm_checkout.sh?buy_num=<%=buyList.get(i).getBuy_num() %>&buy_ordernum=<%=buyList.get(i).getBuy_ordernum()%>">
                     <%=buyList.get(i).getBuy_ordernum() %>
                     </a></td>
                   <!--   <td class="image-prod"><div class="img" style="background-image:url();"></div></td> -->
                    
                    <td class="product-name">
                      <h3><%=buyList.get(i).getBuy_name() %><br> 상품 외<%=buyList.get(i).getBuy_count()-1 %>개</h3>
                    </td>
                    
                    <td class="price"><%=buyList.get(i).getBuy_buydate() %></td>
                    
                    <td class="price"><%=buyList.get(i).getBuy_total()+2500 %>&nbsp;원</td>
                    
   <%                 
//							out.println("buyList.get(i).getBuy_num():"+buyList.get(i).getBuy_num());
// 							out.println("buyList.get(i).getBuy_name()"+buyList.get(i).getBuy_name());
// 							out.println("buyList.get(i).getBuy_count()"+buyList.get(i).getBuy_count());
// 							out.println("buyList.get(i).getBuy_buydate()"+buyList.get(i).getBuy_buydate());
// 							out.println("buyList.get(i).getBuy_total()"+buyList.get(i).getBuy_total());
	%>
                  </tr>
                  <%}
								}
								
								%>
                

                </tbody>
              </table>
            </div>
            
		</form>
		<br><br>
		
<!--   ------------------------------------------------------------------------------------------------------------------------ -->


      


<!--   ------------------------------------------------------------------------------------------------------------------------ -->


	          

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
         <div class="row mt-5">
	          <div class="col text-center"> 
	             <div class="block-27"> 
	               <ul>
									<%
										if (nowPage <= 1) {
									%>
									<li><a>&lt;</a></li>
									<%
										} else {
									%>
									<li><a href="confirmCheckoutList.sh?page=<%=nowPage - 1%>">&lt;</a></li>
									<%
										}
										for (int a = startPage; a <= endPage; a++) {
											if (a == nowPage) {
									%><li class="active"><span><%=a%></span></li>
									<%
										} else {
									%><li><a href="confirmCheckoutList.sh?page=<%=a%>"><%=a%></a></li>
									<%
										}
										}
									%>
									<%
										if (nowPage >= maxPage) {
									%>
									<li><a>&gt;</a></li>
									<%
										} else {
									%>
									<li><a href="confirmCheckoutList.sh?page=<%=nowPage + 1%>">&gt;</a></li>
									<%
										}
									%>
								</ul> 
	            </div> 
	          </div> 
	         </div> 
      </div>
      
    </section> 

	<!--     <section class="ftco-section"> -->
	<!--       <div class="container"> -->
	<!--         <div class="row d-flex"> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_1.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_2.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_3.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_4.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_5.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--           <div class="col-md-4 d-flex ftco-animate"> -->
	<!--           	<div class="blog-entry align-self-stretch"> -->
	<!--               <a href="blog-single.html" class="block-20" style="background-image: url('./images/image_6.jpg');"> -->
	<!--               </a> -->
	<!--               <div class="text py-4 d-block"> -->
	<!--               	<div class="meta"> -->
	<!--                   <div><a href="#">Sept 28, 2018</a></div> -->
	<!--                   <div><a href="#">Admin</a></div> -->
	<!--                   <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	<!--                 </div> -->
	<!--                 <h3 class="heading mt-2"><a href="#">Coffee Testing Day</a></h3> -->
	<!--                 <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
	<!--               </div> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--         <div class="row mt-5"> -->
	<!--           <div class="col text-center"> -->
	<!--             <div class="block-27"> -->
	<!--               <ul> -->
	<!--                 <li><a href="#">&lt;</a></li> -->
	<!--                 <li class="active"><span>1</span></li> -->
	<!--                 <li><a href="#">2</a></li> -->
	<!--                 <li><a href="#">3</a></li> -->
	<!--                 <li><a href="#">4</a></li> -->
	<!--                 <li><a href="#">5</a></li> -->
	<!--                 <li><a href="#">&gt;</a></li> -->
	<!--               </ul> -->
	<!--             </div> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </section> -->

	<jsp:include page="/inc/footer.jsp"></jsp:include>



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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>

</body>
</html>
