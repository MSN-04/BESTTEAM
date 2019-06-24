<%@page import="java.sql.Connection"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.JdbcUtil.*" %>


<%
	String phone = request.getParameter("phone");
	UserDAO userDAO = UserDAO.getInstance();
	int re = userDAO.checkPhone(phone);
%>

<%=re %>
