<%@page import="vo.ItemBean"%>
<%@page import="vo.UserBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script language="javascript">
	function delconfirm(num) {
		var message = confirm("이 게시글을 삭제하시겠습니까?");
		if (message == true) {
			location.href = "./QnaDeletePro.qna?num=" + num;
		} else
			alert("취소되었습니다");
		return false;
	}
</script>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
System.out.println(id);
//	qna
// String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우
// ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
QnaBean qnabean = new QnaBean();
//	UserBean userbean = new UserBean();
int qnaNum = qnabean.getQna_num();
String qnaSubject = qnabean.getQna_subject();
String qnaWriter = qnabean.getQna_writer();


ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>) request.getAttribute("qnaList");
PageInfo pageInfo2 = (PageInfo) request.getAttribute("pageInfo2");
//	System.out.println("jsp에서 qnaList.size: " + qnaList.size());
int listCount2 = pageInfo2.getListCount();
int nowPage2 = pageInfo2.getPage();
int maxPage2 = pageInfo2.getMaxPage();
int startPage2 = pageInfo2.getStartPage();
int endPage2 = pageInfo2.getEndPage();
int pageSize = 5;
int pageBlock =3;
int pageCount = listCount2/pageSize+(listCount2%pageSize==0?0:1);
//	int pageCount2 = listCount2/pageSize+(listCount2%pageSize==0?0:1);

	ItemBean itemBean = (ItemBean) request.getAttribute("itemBean");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
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

.div0525 {
	float: right !important;
}
</style>

<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(index) {
		$('#ac1').show();
		$('#ac2').hide();
		$('#ac3').hide();
	});

	$(document).ready(function(index) {
		$('#btn1').click(function() {

			$('#ac1').show();
			$('#ac2').hide();
			$('#ac3').hide();
			var offset = $('#btn1').offset();

		});
	});

	$(document).ready(function(index) {
		$('#btn2').click(function() {
			$('#ac1').hide();
			$('#ac2').show();
			$('#ac3').hide();
			var offset = $('#btn2').offset();

		});
	});

	$(document).ready(function(index) {
		$('#btn3').click(function() {
			$('#ac1').hide();
			$('#ac2').hide();
			$('#ac3').show();
			var offset = $('#btn3').offset();

		});
	});
</script>
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
	<section class="ftco=section" id="ac1">
						<div class="container">
							<table class="table thead-light" id="ac1">
								<tr>
									<td><a data-toggle="collapse">번호</a></td>
									<td><a data-toggle="collapse">제목 </a></td>
									<td><a data-toggle="collapse">작성자</a></td>
									<td><a data-toggle="collapse">작성일</a></td>
									</tr>
									<%
										if (qnaList != null && listCount2 > 0) {
											for (int i = 0; i < qnaList.size(); i++) {
												System.out.println("싱글페이지:"+ qnaList.size());
												System.out.println(qnaList.get(i).getQna_re_lev());
									%>
									
								<tr>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.size() - i %></a></td>
									<% 
									int wid = 0;
										if(qnaList.get(i).getQna_re_lev()>0){
											System.out.println(qnaList.get(i).getQna_re_lev());
										wid = qnaList.get(i).getQna_re_lev()*10;
											%>
											<td><img src="./images/level.gif" width="<%=wid %>" height="10"><img src="./images/re.gif"><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.get(i).getQna_subject() %> </a></td>
									<%	}else{
									%>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.get(i).getQna_subject() %> </a></td>
									<%} %>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.get(i).getQna_writer() %></a></td>
									<td><a data-toggle="collapse" data-parent="#accordian" href="#collapse<%=i %>"><%=qnaList.get(i).getQna_date() %></a></td>
								</tr>
								<tr>
								<td id="collapse<%=i %>" class="panel-collapse collapse in" colspan="4">
											<div class="panel-body">
												<b><%=qnaList.get(i).getQna_content() %></b>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="qnaModifyForm.qna?qna_num=<%=qnaList.get(i).getQna_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;">수정</a> 
															<a href="qnaDeletePro.qna?qna_num=<%=qnaList.get(i).getQna_num() %>&qna_item_num=<%=qnaList.get(i).getQna_item_num() %>" class="btn btn-primary btn-outline-primary" style="float: right;" onclick="delconfirm('<%=qnaList.get(i).getQna_num() %>','<%=qnaList.get(i).getQna_item_num() %>')">삭제</a>
														</div>
													</div>
												</section>
												
												<%
												if(id.equals("admin")){
													%>
													<section class="ftco-section">
		<div class="col-md-5" id="mail">
			<form id="frm" action="QnaReplyProAction.qna" method="post"
				class="contact-form" style="width: 100%;">
				<input type="hidden" class="form-control"value="<%=qnaList.get(i).getQna_subject() %>"
								name="qna_reply_subject" id="qna_reply_subject" required="required">
								<input type="hidden" class="form-control"value="<%=qnaList.get(i).getQna_num() %>"
								name="qna_num" id="qna_reply_subject" required="required">
								<input type="hidden" class="form-control"value="<%=qnaList.get(i).getQna_item_num() %>"
								name="qna_item_num" id="qna_reply_subject" required="required">
					
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">QNA 답글</h2>
				</div>
				<table style="width: 100%; text-align: left;">
					<div class="row">
					<tr>
						<!-- 						<div class="col-md-6"> -->
						<div class="form-group">
							<input type="text" class="form-control" value="<%=id %>"
								name="qna_reply_writer" id="qna_reply_writer" readonly="readonly">
						</div>
						<!-- 						</div> -->

					</tr>
				</table>
				<table style="width: 100%; text-align: center;">
					
							
					<tr>
						<td> <div class="form-group">
                <textarea name="qna_reply_content" id="qna_reply_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div></td>
					</tr>
					<!-- 					제목과 내용은 필수입력으로 메세지 띄우기 -->
					<tr style="display: inline-block;">
						<td colspan="2"><input type="button"
							class="btn btn-primary py-3 px-4" style="color: black;"
							id="reset" value="취소" /> <input type="submit"
							class="btn btn-primary py-3 px-4" style="color: black;" id="save"
							value="등록" /></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
													<%
													
												}
												
												%>
											</div>
										</td>
								</tr>
								
								
								<%
									}
									}
								%>
							</table>
						</div>
					</section>
<!-- 					<br> -->
<!-- 					<br> -->
<!-- 					<table class="table thead-light"> -->
<!-- 					<tr>Q & A</tr> -->
<!-- 						<tr> -->
<!-- 							<th>번호</th> -->
<!-- 							<th>제목</th> -->
<!-- 							<th>날짜</th> -->
<!-- 							<th>글쓴이</th> -->
<!-- 							<th>조회수</th> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>2</td> -->
<!-- 							<td><a href="#"><img alt="key" src="./images/zzzz.png"  id="imim">상품 관련 문의입니다.</a></td> -->
<!-- 							<td>19.04.23</td> -->
<!-- 							<td>admin</td> -->
<!-- 							<td>3</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>1</td> -->
<!-- 							<td><a href="#"><img alt="key" src="./images/zzzz.png"  id="imim">상품 관련 문의입니다.</a></td> -->
<!-- 							<td>19.04.23</td> -->
<!-- 							<td>admin</td> -->
<!-- 							<td>21</td> -->
<!-- 						</tr> -->

<!-- 					</table> -->
					<a href="qnaWriteForm.qna?item_num=<%=itemBean.getItem_num() %>"  class="btn btn-primary btn-outline-primary" style="float: right;">글쓰기</a>
			
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
							<% 
// 							for(int a = startPage2; a<=endPage2;a++){
						
							
							if(startPage2<1){
								%>
								<li><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=nowPage2-1 %>'>&lt;</a></li>
							<%
							}
							
							for(int i = startPage2; i<=endPage2;i++){ 
								if(i==nowPage2){%>
								<li class="active"><a><%=i %></a></li>
								<%
							}else{
								%>
							
<%-- 									<li ><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=i %>#v-pills-2'><%=i %></a></li> --%>
									<li ><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=i %>'><%=i %></a></li>
									<%} 
									
							if(endPage2 < maxPage2){
								%>
								<li class="active"><a href='itemSingle.em?item_num=<%=itemBean.getItem_num() %>&pageNum=<%=nowPage2+1 %>'>&gt;</a></li>
							<%
							}
// 							
						}
							%>
								</ul>
				</div>
			</div>
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