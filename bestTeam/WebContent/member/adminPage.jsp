<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Rserve_C"%>
<%@page import="vo.FavorBean"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="vo.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
// 	String id = session.getAttribute("id").toString();
// 	Rserve_C rc = (Rserve_C)session.getAttribute("rs");
// 	String s = rc.returnRClass();
// 	System.out.println(s);
	
	ArrayList<UserBean> allUserList = (ArrayList<UserBean>)request.getAttribute("allUserList");
	PageInfo adminPageInfo = (PageInfo)request.getAttribute("adminPageInfo");
	int listCount = adminPageInfo.getListCount(); //전체 회원 수
	int nowPage = adminPageInfo.getPage(); // 현재 페이지
	int maxPage = adminPageInfo.getMaxPage(); // 페이지 수
	int startPage = adminPageInfo.getStartPage(); // 현재 페이지 첫번째 행 번호
	int endPage = adminPageInfo.getEndPage(); // 현재 페이지 마지막행 번호
	System.out.println(listCount);
	//연령별 전체 회원 분포 그래프
	ArrayList<Integer> ageList = (ArrayList<Integer>)request.getAttribute("ageList");
	
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	
	for(int i = 0; i < ageList.size(); i++){
		map = new HashMap<Object,Object>(); 
		map.put("label", i*10 +"대(" + i*10 + "~" + ((i*10)+9) + "세" ); 
		map.put("y", ((double)ageList.get(i)/(double)listCount)*100); 
		list.add(map);
	}
	String dataPoints = gsonObj.toJson(list);
	//연령별 전체 회원 분포 그래프
	
	//성별 전체 회원 분포 그래프
	int maleList = Integer.parseInt(request.getAttribute("maleList").toString());
	
	Gson gsonObj2 = new Gson();
	Map<Object,Object> map2 = null;
	List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
		map2 = new HashMap<Object,Object>(); map2.put("label", "남" ); map2.put("y", ((double)(maleList)/(double)listCount)*100); list2.add(map2);
		map2 = new HashMap<Object,Object>(); map2.put("label", "여" ); map2.put("y", (((double)(listCount-maleList))/(double)listCount)*100); list2.add(map2);
	String dataPoints2 = gsonObj2.toJson(list2);
	//성별 전체 회원 분포 그래프
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
<link rel="stylesheet" href="./css/shop.css">

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
// 페이지 넘김


// 그래프
window.onload = function() {
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled : true,
		title : {
		},
		legend : {
			verticalAlign : "center",
			horizontalAlign : "right"
		},
		data : [ {
			type : "pie",
			showInLegend : true,
			indexLabel : "{y}%",
			indexLabelPlacement : "inside",
			legendText : "{label}: {y}%",
			toolTipContent : "<b>{label}</b>: {y}%",
			dataPoints :
			<%out.print(dataPoints);%>
		} ]
	});
	chart.render();

// 그래프 2
	var chart2 = new CanvasJS.Chart("chartContainer2", {
		animationEnabled : true,
		title : {
		},
		legend : {
			verticalAlign : "center",
			horizontalAlign : "right"
		},
		data : [ {
			type : "pie",
			showInLegend : true,
			indexLabel : "{y}%",
			indexLabelPlacement : "inside",
			legendText : "{label}: {y}%",
			toolTipContent : "<b>{label}</b>: {y}%",
			dataPoints :
			<%out.print(dataPoints2);%>
		} ]
	});
	chart2.render();
}
</script>

</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">관리자 페이지</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="./index.jsp">Home</a></span> 
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-menu mb-5 pb-5"  id="go_top">
		<div class="container">
			<div class="row d-md-flex">
				<div class="col-lg-12 ftco-animate p-md-5">

					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-bottom: 1rem;">

								<a class="nav-link" id="v-pills-0-tab" href="shopMain.em?taste=all" 
								role="tab" aria-controls="v-pills-0" onmouseover="$('#v-degree-tab').hide()" 
								onmouseout="if(!$('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" aria-selected="true">
								전체 회원 정보</a> 
								<a class="nav-link" id="v-pills-1-tab" href="shopMain.em?taste=item_favor_aroma" 
								onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" 
								onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" aria-controls="v-pills-1" aria-selected="false">
								전체 상품 정보</a>
							</div>

						</div>
						
						<div class="col-md-12 d-flex align-items-center">

							<div class="tab-content ftco-animate" id="v-pills-tabContent" style="width: 100%;">

								<div class="tab-pane fade show active" id="v-pills-0"
									role="tabpanel" aria-labelledby="v-pills-0-tab">

		<!-- 리스트 -->
		<form class="billing-form ftco-bg-dark p-3 p-md-5" style="overflow: auto;">
			<h3 class="mb-4 billing-heading">전체 리스트</h3>
			
			 <div class="cart-list">

              <table class="table">
                <thead class="thead-primary">
                  <tr class="text-center">
                    <th>No</th>
                    <th>ID</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th>성별</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>Email</th>
                  </tr>
                </thead>
                <tbody>
                <%	
                	if(allUserList != null && listCount > 0) {
	                	for(int i = 0; i < allUserList.size(); i++){
	            %>    		
	                		
                  <tr class="text-center">
                    <td><%=allUserList.get(i).getUser_num() %></td>
                    <td><%=allUserList.get(i).getUser_id() %></td>
                    <td><%=allUserList.get(i).getUser_name() %></td>
                    <td><%=allUserList.get(i).getUser_age() %></td>
                    <td><%=allUserList.get(i).getUser_gender() %></td>
                    <td><%=allUserList.get(i).getUser_address() %></td>
                    <td><%=allUserList.get(i).getUser_phone() %></td>
                    <td><%=allUserList.get(i).getUser_email() %></td>
                  </tr><!-- END TR-->
				
				<%		
						}
                		
                	}
                %>
                </tbody>
              </table>
            </div>
            
		</form>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<% if(nowPage <= 1) { %>
							<li><a>&lt;</a></li>
							<% } else { %>
							<li><a href= "adminPage.us?page=<%=nowPage-1 %>">&lt;</a></li>
							<% } 
							for (int a = startPage ; a <= endPage; a++) {
								if(a == nowPage) {
									%><li class="active"><span><%=a %></span></li><%
								} else {
									%><li><a href="adminPage.us?page=<%=a %>"><%=a %></a></li><%
								}
							}
							%>
							<% if(nowPage >= maxPage) { %>
							<li><a>&gt;</a></li>
							<% } else { %>
							<li><a href="adminPage.us?page=<%=nowPage+1 %>">&gt;</a></li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		<!-- 리스트 끝 -->
		<br><br>
		
	          
	      <!-- 통계 그래프 -->
	       <div class="row mt-5 pt-3 d-flex" >
	          
	         <div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">연령별 전체 회원 분포</h3>
	          				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
          <!-- 통계 그래프 끝 -->
	      <!-- 통계 차트 -->
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">성별 전체 회원 분포</h3>
	          				<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
	       <!-- 통계 차트 끝 -->
	       
	            </div>
          </div> 
	       
	       <!-- 통계 그래프 -->
	       <div class="row mt-5 pt-3 d-flex" >
	          
	         <div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">연령별 구매 수량</h3>
	          			
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
          <!-- 통계 그래프 끝 -->
	      <!-- 통계 차트 -->
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">성별 구매 수량</h3>
	          			
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
	       <!-- 통계 차트 끝 -->
	          	
	     


								</div>
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



</body>
</html>
