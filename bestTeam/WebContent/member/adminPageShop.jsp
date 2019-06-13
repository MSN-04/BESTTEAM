<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav>
		<a href="adminPageShopDay.us?month=<%=Calendar.getInstance().get(Calendar.MONTH)+1 %>" target="ifbox01">Day</a>
		<a href="adminPageShopMonth.us?year=<%=Calendar.getInstance().get(Calendar.YEAR) %>" target="ifbox01">Month</a>
	</nav>
	<iframe id="if01" name="ifbox01" width="1500px" height="500px">
	</iframe>
	
</body>
</html>