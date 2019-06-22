<%@page import="vo.QnaBean"%>
<%@page import="vo.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//UserBean qnapage = (UserBean)request.getAttribute("userBean");
QnaBean qnabean = (QnaBean)request.getAttribute("article");
//	UserBean userbean = new UserBean();
int qnaNum = qnabean.getQna_num();
int item_num = qnabean.getQna_item_num();

request.setAttribute("qna_num", qnaNum);
String qnaSubject = qnabean.getQna_subject();
String qnaWriter = qnabean.getQna_writer();
String qnaContent = qnabean.getQna_content();

System.out.println("qna_modify.jsp에서 : "+qnaContent);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A ─ Cafe Tinkervell</title>

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
<!---------------------- 스마트 에디터 가져오는 영역 시작 ---------------------->
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="<%=ctx%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
	
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
	var oEditors = [];
	
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
		    elPlaceHolder: "ir1",// textarea id로 변경해야 함 [id = ir1(155번째줄)]
		    sSkinURI: "<%=ctx%>/se2/SmartEditor2Skin.html",
		    fCreator: "createSEditor2",
// 		    fOnAppLoad : function(){
// 				oEditors.getById["ir1"].exec("PASTE_HTML", ['<span style="color: #999;" id="placeholder">이미지 퀵 에디터는 Microsoft Edge 또는 Window Explorer에서만 지원됩니다.</span>']);
// 		    }
		});
	
		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // textarea id 변경해야 함 [id = ir1(155번째줄)]
			
			if ( $("#subject").val() == "" ) {
                alert('제목을 입력하세요.');
                return false;
            } else if (ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>' || ir1 == "<br>") {
                alert('내용을 입력하세요');
                return false;
            } else if (ir1.length > 1000) {
                alert('글자수 최대 길이는 1000자 입니다.\n 현재 글자 수 : ' + ir1.length );
                return false;
            }
			
			$("#frm").submit(); // form id로 변경해야 함 [id = frm(146)]
		});
		
		$("#reset").click(function() {
            if (confirm("정말 다시쓰겠습니까? 작업 내용이 모두 사라집니다.") == true) {
                oEditors.getById["ir1"].exec("SET_IR", [""]);
            } else {
                return;
            }
        });
		
	});
	 
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
		var sHTML = '<img src="<%=ctx%>/itemUpload/'+filepath+'" style="max-width: 100%; height: auto; margin: 10px;">';
	    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);  // textarea id 변경해야 함 [id = ir1(155번째줄)]
	}
	
// 	oEditors.getById["ir1"].exec("PASTE_HTML", ['기본텍스트입니다.']); // placeholder
	
</script>
<!---------------------- 스마트 에디터 가져오는 영역 끝 ---------------------->
<style type="text/css">
.frmTitle {
	border: 0.1px solid #ccc;
	padding: 5px;
	color: white;
	background: rgba(0, 0, 0, 0);
	width: 100%;
}

.td0525 {
	width: 20% !important;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/inc/header.jsp"></jsp:include>
	</header>
	<!-- END nav -->

	<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(./images/bg_3.jpg);" >
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Qna Modify</h1>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section">
		<div class="col-md-9" id="mail">
			<form id="frm" action="qnaModifyPro.qna" method="post"
				class="contact-form">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">QNA Moidfy</h2>
				</div>
				<table style="width: 100%; text-align: left;">
					<div class="row">
					<tr>
						<!-- 						<div class="col-md-6"> -->
						<div class="form-group">
							<input type="text" class="form-control" value="<%=qnaWriter %>"
								name="qna_name" readonly="readonly">
								<input type="hidden" class="form-control" value="<%=qnaNum %>"
								name="qna_num" >
								<input type="hidden" class="form-control" value="<%=item_num %>"
								name="item_num" >
						</div>
						<!-- 						</div> -->

					</tr>
				</table>
				<table style="width: 100%; text-align: center;">
					<tr>
						<div class="form-group">
							<input type="text" class="form-control" value="<%=qnaSubject %>" maxlength="50"
								name="qna_subject" id="subject" required="required">
						</div>
					</tr>
					<tr>
						<td><textarea rows="10" cols="30"  name="qna_content"
								style="width: 100%; height: 650px;" required="required"
								class="frmTitle" ><%=qnaContent %>
								</textarea></td>
					</tr>
					<!-- 					제목과 내용은 필수입력으로 메세지 띄우기 -->
					<tr style="display: inline-block;">
						<td colspan="2"><input type="reset"
							class="btn btn-primary py-3 px-4" style="color: black;"
							id="reset" value="취소" /> <input type="submit"
							class="btn btn-primary py-3 px-4" style="color: black;" id="save"
							value="수정" /></td>
					</tr>
				</table>
			</form>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>

</body>
</html>