<%@page import="vo.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
	QnaBean qnabean = new QnaBean();
int qnaNum = qnabean.getQna_num();
%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
b {
	font-size: 25px;
	font-color: gold;
}

.nav-link {
	backgound-color: #c49B63;
}

.nav-link active {
	backgound-color: #c49B63;
}

.ftco-menu {
	padding-top: 12em !important;
}

.pb-5, .py-5 {
	padding-bottom: 0 !important;
}

.mb-5, .my-5 {
	margin-bottom: 0 !important;
}

.table tbody tr td {
	text-align: left !important;
}
.div0525{float:right !important;}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


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

	<section class="ftco=section" id="ac1">
						<div class="container">
	<div class="col-md-8 ftco-animate div0525">
		<a href="QnaModifyForm.qna?qna_num=<%=qnaNum%>"
			class="btn btn-primary btn-outline-primary" style="float: right;">수정</a>
		<a href="QnaDeletePro.qna?qna_num=<%=qnaNum%>"
			class="btn btn-primary btn-outline-primary" style="float: right;"
			onclick="delconfirm('<%=qnaNum%>')">삭제</a>
	</div>
	</div>
	</section>
	
	
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
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>
</body>
</html>