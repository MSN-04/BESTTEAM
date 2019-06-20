<%@page import="java.text.NumberFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/cart.css">
<%
	ArrayList<ItemBean> itemList = (ArrayList<ItemBean>)request.getAttribute("itemList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	//	System.out.println("listCount : " + listCount);
// 	System.out.println("nowPage : " + nowPage);
// 	System.out.println("maxPage : " + maxPage);
// 	System.out.println("startPage : " + startPage);
// 	System.out.println("endPage : " + endPage);
// 		System.out.println("itemList.size() ::: " + itemList.size());
	
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteBtn3nd").hide(); //숨기기
		$("#deleteBtn2nd").hide(); //숨기기
		$(".checkDelete").hide();

		$('#deleteBtn1st').on('click', function() {
			$("#deleteBtn1st").hide(); //숨기기
			$("#deleteBtn2nd").show(); //보이기
			$("#deleteBtn3nd").show(); //보이기
			$(".checkDelete").show();

		});
		
		$('#deleteBtn3nd').on('click', function() {
			$("#deleteBtn2nd").hide(); //숨기기
			$("#deleteBtn1st").show(); //보이기
			$("#deleteBtn3nd").hide(); //보이기
			$(".checkDelete").hide();

		});

		$(function() {
			//전체선택 체크박스 클릭
			$("#checkAll").click(function() {
				//만약 전체 선택 체크박스가 체크된상태일경우
				if ($("#checkAll").prop("checked")) {
					//해당화면에 전체 checkbox들을 체크해준다
					$("input[type=checkbox]").prop("checked", true);
					// 전체선택 체크박스가 해제된 경우
				} else {
					//해당화면에 모든 checkbox들의 체크를해제시킨다.
					$("input[type=checkbox]").prop("checked", false);
				}
			})
		})
		$('#deleteBtn2nd').on('click', function() {

			var a = confirm("선택하신 상품을 목록에서 삭제하시겠습니까?");

			if (a) {
				
				var list1 = new Array();
				var list2 = new Array();
				
				for (var i = 0; i < <%=itemList.size()%> ; i++) {
					if ($('.cb' + i).is(":checked") == true) {
// 						alert('1 :: ' + $('.cb' + i).val());
// 						alert('2 :: ' + $('.cbf' + i).val());
						list1.push($('.cb' + i).val());
						list2.push($('.cbf' + i).val());
					}
				}
				

				list1 = list1 + ""; // Object를 String으로 변환
				list2 = list2 + "";
				
// 				alert(list1);
// 				alert(list2);
				
				if (list1 != "" && list2 != "") {
					$.ajax({
						url : 'adminPageItemListDelete.us',
						type : 'get',
						data : { // 값 넘길 때 String으로 넘겨야 함.. getParameter로 받기 때문!
							"item_num_list" : list1,
							"item_favor_num_list" : list2
						},
						success : function(data) {
							if (data == 0) {
								alert('선택하신 상품이 목록에서 삭제되었습니다.');
								location.reload();
							} else if (data == -1) {
								alert('삭제 실패!');
							}
						},
						error : function(request, status, error) {
							alert('error');
						}
					});
				} else {
					alert('선택된 상품이 없습니다.');
				}
			}
		});

	});
</script>

<title>adminPageItemList</title>
<style type="text/css">
	.trtd>td {
		padding: 10px 0 !important;
	}
</style>
</head>
<body style="background: transparent;">
<!-- 	<secion> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-12 ftco-animate"> -->
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th><input class="checkDelete" type="checkbox"
									id="checkAll"></th>
								<th>번호</th>
								<th>사진</th>
								<th>상품명</th>
								<th>상품 가격</th>
								<th>재고량</th>
							</tr>
						</thead>
						<tbody>
							<!-- 상품 시작 -->
							<% 
                	if (itemList != null) {
                		if (itemList.size() != 0) {
	                		for (int i = 0 ; i < itemList.size() ; i++) { 
// 	                			System.out.println("Item_favor_num() :: " + itemList.get(i).getItem_favor_num());
	                		%>
							<tr class="text-center trtd">
								<td class="product-remove">
									<input type="checkbox" value="<%=itemList.get(i).getItem_num() %>" class="checkDelete cb<%=i %>" name="checkOne">
									<input type="hidden" value="<%=itemList.get(i).getItem_favor_num() %>" class="cbf<%=i %>">
								</td>
								<td class="product-num"><a><%=i+1 %></a></td>
								<td class="image-prod"><a target="_blank"
									href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>">
										<div class="img"
											style="background-image:url(./itemUpload/<%=itemList.get(i).getItem_img() %>);"></div>
								</a></td>
								<td class="product-name"><a target="_blank"
									href="itemSingle.em?item_num=<%=itemList.get(i).getItem_num() %>"><h3><span style="color: red;"><%=itemList.get(i).getItem_amount() == 0 ? "[품절]" : "" %></span><%=itemList.get(i).getItem_name() %></h3></a>
								</td>

								<td class="price"><%=NumberFormat.getInstance().format(itemList.get(i).getItem_price()) %>
									원</td>
								<td class="price"> <%=itemList.get(i).getItem_amount() %>
								</td>

							</tr>
							<% }	
                		} 
                 }%>
							<!-- 상품 끝 -->
						</tbody>
					</table>
					
					
					<div class="col text-center">
					<div class="block-27">
						<ul>
							<% if(nowPage <= 1) { %>
							<li><a>&lt;</a></li>
							<% } else { %>
							<li><a href= "adminPageItemList.us?page=<%=nowPage-1 %>" >&lt;</a></li>
							<% } 
							int a = 0;
							if (nowPage > 3) {
							    %><li><a href= "adminPageItemList.us?page=<%=startPage %>" ><%=startPage %></a></li><%
								%> . . . . <%
								a = nowPage - 2;
							}
							else a = startPage;
							for (  ; a < endPage - 1 && a <= nowPage + 2; a++) {
								if(a == nowPage) {
									%><li class="active"><span><%=a %></span></li><%
								} else {
									%><li><a href= "adminPageItemList.us?page=<%=a %>" ><%=a %></a></li><%
								}
							}
							if ( a < endPage - 1) {
								%> . . . . <%
								%><li><a href= "adminPageItemList.us?page=<%=endPage-1 %>" ><%=endPage-1 %></a></li><%
							} else {
								if(a == nowPage) {
									%><li class="active"><span><%=a %></span></li><%
								} else {
									%><li><a href= "adminPageItemList.us?page=<%=endPage-1 %>" ><%=endPage-1 %></a></li><%
								}
							}
							%>
							<% if(nowPage == maxPage) { %>
							<li class="active"><span><%=a+1 %></span></li>
							<li><a>&gt;</a></li>
							<% } else { %>
						    <li><a href= "adminPageItemList.us?page=<%=endPage %>" ><%=endPage %></a></li>
							<li><a href= "adminPageItemList.us?page=<%=nowPage+1 %>" >&gt;</a></li>
							<% } %>
						</ul>
					</div>
					</div>
					
					
					<% if (itemList.size() != 0) { %>
					<div style="text-align: right; margin-top: 1rem;">
						<a class="btn btn-primary btn-outline-primary" id="deleteBtn1st" style="font-size: 17px;">삭제할 상품 선택하기</a> 
						<a class="btn btn-best btn-outline-primary" id="deleteBtn2nd" style="font-size: 17px;">선택한 상품 삭제</a>
						<a class="btn btn-best btn-outline-primary" id="deleteBtn3nd" style="font-size: 17px;">상품 선택 취소</a>
					</div>
					<% } %>


				</div>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	</secion> -->
</body>
</html>