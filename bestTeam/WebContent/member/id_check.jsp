<%@page import="java.sql.Connection"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.JdbcUtil.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String id = request.getParameter("id");
	UserDAO userDAO = UserDAO.getInstance();
	int re = userDAO.checkId(id);
%>

<%=re %>
</head>
<body>

</body>
</html>