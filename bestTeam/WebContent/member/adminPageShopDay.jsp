<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	List<Map<String, Integer>> salesList = (List<Map<String, Integer>>)request.getAttribute("salesList");
	String sale = "";
	
	String month = request.getParameter("month");
	
	for (int i = 0 ; i < salesList.size() ; i++) {
// 		System.out.println("salesList.get(" + i + ").values() :: " + salesList.get(i).values());
// 		System.out.println("salesList.get(" + i + ").keySet() :: " + salesList.get(i).keySet());
		map = new HashMap<Object, Object>();
		map.put("label", salesList.get(i).keySet().toString().substring(1,salesList.get(i).keySet().toString().length()-1));
		map.put("y",Integer.parseInt(salesList.get(i).values().toString().substring(1,salesList.get(i).values().toString().length()-1)));
		list.add(map);
	}

	// label : 날짜 , y : 매출액
// 	for (int i = 1; i <= 31; i++) {
// 		map = new HashMap<Object, Object>();
// 		map.put("label", i);
// 		map.put("y", 50 + i * 2);
// 		list.add(map);
// 	}

	String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <link rel="stylesheet" href="./css/style.css"> -->

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var chart = new CanvasJS.Chart("chartContainer", {
			theme : "light2",
			title : {
				text : "일별 매출"
			},
			subtitles : [ {
				text : <%=month%>+"월"
			} ],
			axisY : {
				title : "매출액",
				suffix : "원",
				includeZero : false
			},
			data : [ {
				type : "column",
				toolTipContent : "<b>{label}</b>: {y}원",
				dataPoints :
				<%out.print(dataPoints);%>
			} ]
		});
		chart.render();
	}
// 	$(document).ready(function(){
// 		$('#month').on('click',function(){
// 			alert($('#month').val());
// 			alert('a');
// 		});
		
// 	});
	function showChart() {
// 		alert($('#month').val());
		location.href="adminPageShopDay.us?month=" + $('#month').val();
	}
</script>
</head>
<body>
	<div style="padding: 1rem; background: white; text-align: center; ">
		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		<div style="margin: 20px 0;">
			<select id="month">
			<% if (month != null) {
				int mint = Integer.parseInt(month);
				for(int i = 1 ; i <= 12 ; i++) {
					if(mint == i) {
						%><option selected="selected"><%=i %></option><%
					} else {
					%><option><%=i %></option><%
					}
				}
			} %>
			</select>월
			<input type="button" id="show" value="보기" onclick="showChart();">
		</div>
	</div>
	
</body>
</html>            