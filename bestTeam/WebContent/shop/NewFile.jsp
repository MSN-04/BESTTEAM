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
	// String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우
	// ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
	QnaBean qnabean = new QnaBean();
// 	UserBean userbean = new UserBean();
	int qnaNum = qnabean.getQna_num();
	String qnaSubject = qnabean.getQna_subject();
	String qnaWriter = qnabean.getQna_writer();
	
	

	ArrayList<QnaBean> articleList = (ArrayList<QnaBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

	System.out.println("jsp에서 article.size: " + articleList.size());
	int listCount = pageInfo.getListCount();
	int nowwPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>


<section class="home-slider owl-carousel">

		<div class="slider-item"
			style="background-image: url(images/bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Qna</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="notice.jsp">Notice</a></span> <span><a
								href="qna.jsp">Q&A</a></span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco=section">
		<div class="container">
			<div class="row d-flex">
				<div class="blog-entry align-self-stretch">

					<!--     <p class="breadcrumbs">  -->
					<!-- 					<span class="mr-2"><a href="faq.jsp"><b>배송 관련</b> </a></span>| <span><a  -->
					<!-- 							href="faq2.jsp"> 결제 관련 </a></span>|<span><a href="faq3.jsp"> 교환/환불 관련 </a></span>  -->
					<!--  					</p> -->
					<section class="ftco-menu mb-5 pb-5">
						<div class="nav ftco-animate nav-pills justify-content-left"
							id="v-pills-tab" role="tablist" aria-orientation="vertical"
							style="margin-top: -100px;">

							<a class="nav-link active" data-toggle="pill" href="#v-pills-0"
								role="tab" aria-controls="v-pills-0" id="btn1"
								aria-selected="true" style="width: 200px; text-align: center;">배송관련</a>
							<a class="nav-link" data-toggle="pill" href="#v-pills-1"
								id="btn2" role="tab" aria-controls="v-pills-1"
								aria-selected="false" style="width: 200px; text-align: center;">결제/환불
								관련</a> <a class="nav-link" data-toggle="pill" href="#v-pills-2"
								role="tab" aria-controls="v-pills-2" id="btn3"
								aria-selected="false" style="width: 200px; text-align: center;">교환/반품
								관련</a>

						</div>
					</section>


					<section class="ftco=section" id="ac1">
						<%
							request.setCharacterEncoding("utf-8");
						%>
						<div class="container">
							<table class="table thead-light" id="ac1">
							<tr>
								<td><a data-toggle="collapse"
										href="#collapse1">번호</a></td>
									<td><a data-toggle="collapse"
										href="#collapse1">제목 </a>
										<div id="collapse1" class="panel-collapse collapse in">
											<div class="panel-body">
												<br> <b>A</b> &nbsp;&nbsp;
												<%-- 												<%=articleList.get(i).getQna_content()%> --%>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="QnaModifyForm.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;">수정</a> <a
																href="QnaDeletePro.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;"
																onclick="delconfirm('<%=qnaNum%>')">삭제</a>
														</div>
													</div>
												</section>
											</div></td>
											<td><a data-toggle="collapse" 
										href="#collapse1">작성자</a></td>
											<td><a data-toggle="collapse"
										href="#collapse1">작성일</a></td>
								</tr>
								<%
									if (articleList != null && listCount > 0) {
										for (int i = 0; i < 3; i++) {
											// articleList.size() ?
								%>
								
								<tr>
								<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">24</a></td>
									<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1"><%=qnaSubject %> </a>
										<div id="collapse1" class="panel-collapse collapse in">
											<div class="panel-body">
												<br> <b>A</b> &nbsp;&nbsp;
												<%-- 												<%=articleList.get(i).getQna_content()%> --%>
												<section class="ftco=section" id="ac1">
													<div class="container">
														<div class="col-md-8 ftco-animate div0525">
															<a href="QnaModifyForm.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;">수정</a> <a
																href="QnaDeletePro.qna?qna_num=<%=qnaNum%>"
																class="btn btn-primary btn-outline-primary"
																style="float: right;"
																onclick="delconfirm('<%=qnaNum%>')">삭제</a>
														</div>
													</div>
												</section>
											</div></td>
											<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1"><%=qnaWriter %></a></td>
											<td><a data-toggle="collapse" data-parent="#accordian"
										href="#collapse1">2019-05-31</a></td>
								</tr>
								<%
									}
									}
								%>
							</table>
						</div>
					</section>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
	</section>
					