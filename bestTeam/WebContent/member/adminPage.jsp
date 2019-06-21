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
<%@page import="com.google.gson.JsonObject"%>
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
		map.put("y", (int)(((double)ageList.get(i)/(double)listCount)*100)); 
		list.add(map);
	}
	String dataPoints = gsonObj.toJson(list);
	//연령별 전체 회원 분포 그래프
	
	//성별 전체 회원 분포 그래프
	int maleList = Integer.parseInt(request.getAttribute("maleList").toString());
	
	Gson gsonObj2 = new Gson();
	Map<Object,Object> map2 = null;
	List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
		map2 = new HashMap<Object,Object>(); map2.put("label", "남" ); map2.put("y", (int)(((double)(maleList)/(double)listCount)*100)); list2.add(map2);
		map2 = new HashMap<Object,Object>(); map2.put("label", "여" ); map2.put("y", (int)((((double)(listCount-maleList))/(double)listCount)*100)); list2.add(map2);
	String dataPoints2 = gsonObj2.toJson(list2);
	//성별 전체 회원 분포 그래프
	
	//연령별 구매수량
	ArrayList<Integer> ageBuyList = (ArrayList<Integer>)request.getAttribute("ageBuyList");
	
	Gson gsonObj3 = new Gson();
	Map<Object,Object> map3 = null;
	List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
	for(int i = 0; i < ageBuyList.size(); i++){
		map3 = new HashMap<Object,Object>(); 
		map3.put("label", i*10 +"대"); 
		map3.put("y", (ageBuyList.get(i))); 
		list3.add(map3);
	}
	String dataPoints3 = gsonObj3.toJson(list3);
	
	//연령별 구매수량 끝
	
	//성별 취향
	ArrayList<Integer> genderFavor = (ArrayList<Integer>)request.getAttribute("genderFavor");
	// 성별 취향 끝
	%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Admin Page ─ Cafe Tinkervell</title>
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
	
	// 그래프 3
	var chart3 = new CanvasJS.Chart("chartContainer3", {
		animationEnabled : true,
		title : {
		},
		legend : {
			verticalAlign : "center",
			horizontalAlign : "right"
		},
		data : [ {
			type : "column",
			showInLegend : false,
			indexLabel : "{y}개",
			indexLabelPlacement : "inside",
			legendText : "{label}: {y}개",
			toolTipContent : "<b>{label}</b>: {y}개",
			dataPoints :
			<%out.print(dataPoints3);%>
		} ]
	});
	chart3.render();
	
	// 그래프 4
	var chart4 = new CanvasJS.Chart("chartContainer4", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
		},
		subtitles: [{
		}], 
		axisX: {
		},
		axisY: {
			title: "남자",
			titleFontColor: "#4F81BC",
			lineColor: "#4F81BC",
			labelFontColor: "#4F81BC",
			tickColor: "#4F81BC"
		},
		axisY2: {
			title: "여자",
			titleFontColor: "#C0504E",
			lineColor: "#C0504E",
			labelFontColor: "#C0504E",
			tickColor: "#C0504E"
		},
		toolTip: {
			shared: true
		},
		legend: {
			cursor: "pointer",
			itemclick: toggleDataSeries
		},
		data: [{
			type: "column",
			name: "남자",
			showInLegend: true,      
			yValueFormatString: "#,##0.#",
			dataPoints: [
				{ label: "AROMA",  y: <%=genderFavor.get(0) %> },
				{ label: "ACIDITY", y: <%=genderFavor.get(1) %> },
				{ label: "SWEETNESS", y: <%=genderFavor.get(2) %> },
				{ label: "BITTERNESS",  y: <%=genderFavor.get(3) %> },
				{ label: "BODY",  y: <%=genderFavor.get(4) %> }
			]
		},
		{
			type: "column",
			name: "여자",
			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.#",
			dataPoints: [
				{ label: "AROMA", y: <%=genderFavor.get(5) %> },
				{ label: "ACIDITY", y: <%=genderFavor.get(6) %> },
				{ label: "SWEETNESS", y: <%=genderFavor.get(7) %> },
				{ label: "BITTERNESS", y: <%=genderFavor.get(8) %> },
				{ label: "BODY", y: <%=genderFavor.get(9) %> }
			]
		}]
	});
	chart4.render();
	
	function toggleDataSeries(e) {
		if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else {
			e.dataSeries.visible = true;
		}
		e.chart.render();
	}
	
}
</script>

</head>
<body>
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/coffeecup.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">관리자 페이지</h1>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-menu mb-5 pb-5"  id="go_top">
		<div class="containerm8">
			<div class="row d-md-flex">
				<div class="col-lg-12 ftco-animate p-md-5">

					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav ftco-animate nav-pills justify-content-center"
								id="v-pills-tab" role="tablist" aria-orientation="vertical" style="margin-bottom: 1rem;">

								<a class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" id="v-pills-0-tab" href="adminPage.us" style="width: 24%; text-align: center; margin-right: 0.5rem;"
								role="tab" aria-controls="v-pills-0" onmouseover="$('#v-degree-tab').hide()" 
								onmouseout="if(!$('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" aria-selected="true">
								전체 회원 정보</a> 
								<a class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" id="v-pills-1-tab" href="adminPageShop.us" style="width: 24%; text-align: center; margin-right: 0.5rem;"
								onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" 
								onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" aria-controls="v-pills-1" aria-selected="false">
								전체 상품 정보</a>
								<a class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" id="v-pills-1-tab" href="blogWriteForm.bl" style="width: 24%; text-align: center; margin-right: 0.5rem;"
								onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" 
								onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" aria-controls="v-pills-1" aria-selected="false">
								blog 글 작성</a>
								<a class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3 cart" id="v-pills-1-tab" href="noticeWriteForm.no" style="width: 24%; text-align: center; margin-right: 0.5rem;"
								onmouseover="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').css('display', '-webkit-box')" 
								onmouseout="if($('#v-pills-0-tab').hasClass('active')) $('#v-degree-tab').hide()" aria-controls="v-pills-1" aria-selected="false">
								notice 글 작성</a>
							</div>

						</div>
						
						<div class="col-md-12 d-flex align-items-center">

							<div class="tab-content ftco-animate" id="v-pills-tabContent" style="width: 100%;">

								<div class="tab-pane fade show active" id="v-pills-0"
									role="tabpanel" aria-labelledby="v-pills-0-tab">

		<!-- 리스트 -->
		<form class="billing-form ftco-bg-dark p-3 p-md-7895" style="overflow: auto;">
			<h3 class="mb-4 billing-heading" style="text-align: center;">전체 리스트</h3>
			
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
		
	          
	      <!-- 연령별 전체 회원 분포  그래프1-->
	       <div class="row mt-5 pt-3 d-flex" >
	          
	         <div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">연령별 전체 회원 분포</h3>
	          				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
          <!-- 연령별 전체 회원 분포 끝 -->
	      <!-- 성별 전체 회원 분포 그래프2 -->
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">성별 전체 회원 분포</h3>
	          				<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
	       <!-- 성별 전체 회원 분포 끝 -->
	       
	            </div>
          </div> 
	       
	       <!-- 연령별 구매 수량  그래프3-->
	       <div class="row mt-5 pt-3 d-flex" >
	          
	         <div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">연령별 구매 수량</h3>
	          				<div id="chartContainer3" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
          <!-- 연령별 구매 수량 끝 -->
	      <!-- 성별 구매 수량 그래프4 -->
	          	<div class="col-md-6 d-flex">
	          		<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">성별 취향 정보</h3>
	          				<div id="chartContainer4" style="height: 370px; width: 100%;"></div>
					</div>
	          	</div>
	       <!-- 성별 구매 수량 끝 -->
	          	
	     


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
