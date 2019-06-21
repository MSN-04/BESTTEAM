<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<%
	ArrayList<ItemBean> list = (ArrayList<ItemBean>)request.getAttribute("list");
%>

<style type="text/css">
	.col-md-3 {
		display: inline-block;
	}
	.shop-subcategory {
 		display: flex; 
		padding: 10px;
	}
</style>
<link rel="stylesheet" href="./css/style.css">
</head>
<body style="background: transparent;">

	<div class="shop-subcategory text text-center mb-5" style="margin-bottom: 0 !important;">
	<% if (list != null) { 
// 		System.out.println("list.size() :: " + list.size());
		for (int i = 0 ; i < list.size() && i < 4 ; i++) {
	%> 

		<!-- 									 	<a>여기에 추천상품...</a> -->
		<div class="col-md-3" style="padding: 1rem;">
			<div class="menu-entry">
				<a href="itemSingle.em?item_num=<%=list.get(i).getItem_num() %>" class="img" target="_blank"
					style="background-image: url(./itemUpload/<%=list.get(i).getItem_img() %>); height: 200px;"></a>
<!-- 					style="background-image: url(./itemUpload/부산.jpg); height: 200px;"></a> -->
				<div class="text text-center pt-4">
					<h3><%=list.get(i).getItem_name() %></h3>
					<p class="price">
						<span><%=NumberFormat.getInstance().format(list.get(i).getItem_price()) %>원</span>
					</p>
				</div>
			</div>
		</div>
	<% 	} 
	} else {
		%>
		
			<div style="display: block; margin: auto;">
				<p style="color: #aaa; margin: auto; font-size: 30px; font-style: oblique; font-family: serif;">로그인 후 취향을 등록하시면 원두를 추천해 드립니다!</p>
				<p>
					<a href="taste.us" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3"" target="_top" style="border: 1px solid #999; margin-top: 6px; padding: 11px 19px !important; ">Get Now</a>
				</p>
			</div>
		<%
	}%>
	</div>
	
</body>
</html>