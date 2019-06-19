<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<%  
    ArrayList<ItemBean> itemList = (ArrayList<ItemBean>)request.getAttribute("itemList");
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

	<div class="shop-subcategory text text-center mb-5"
		style="margin-bottom: 0 !important;">
		<% if (itemList != null) { 
        for (int i = 0 ; i < itemList.size() && i < 4 ; i++) {
    %>
		<div class="col-md-3" style="padding: 1rem;">
			<div class="menu-entry">
				<a href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>"
					class="img" target="_blank"
					style="background-image: url(./itemUpload/<%=itemList.get(i).getItem_img() %>); height: 200px;"></a>
<!-- 				                   style="background-image: url(./itemUpload/부산.jpg); height: 200px; width: 200px;"></a> -->
<!-- 				<div class="text text-center pt-4"> -->
<%-- 					<h3><%=itemList.get(i).getItem_name() %></h3> --%>
<!-- 					<p class="price"> -->
<%-- 						<span><%=itemList.get(i).getItem_price() %>원</span> --%>
<!-- 					</p> -->
<!-- 				</div> -->
			</div>
		</div>
		<%  } 
    } %>
	</div>

</body>
</html>