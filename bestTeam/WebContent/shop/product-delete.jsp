<%@page import="vo.ItemBean"%>
<%@page import="dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> delete</h1>
<%
//item_num파라미터 가져오기
//ItemDAO idao=new ItemDAO();
int item_num=Integer.parseInt(request.getParameter("item_num"));
//ItemBean ib=new ItemBean();
//ib=idao.selectItem(item_num);    //selectItem에서 다 가져와서 ib에 담기
%>
<div class="container">
<form id="del" action="itemDeletePro.em" method="post" enctype="multipart/form-data">
<table border="1">

<tr>
<td>관리자 아이디</td><td><input type="text" name="user_id" required="required"></td>
</tr>
<tr>
<td>비밀번호 확인</td><td><input type="password" name="user_pass" required="required"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="삭제하기" >
</td>
</tr>
</table>
</form>
</div>
</body>
</html>