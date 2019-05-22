<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mail = request.getParameter("email");
	UserDAO userDAO = UserDAO.getInstance();
	int re = userDAO.checkMail(mail);
%> 

<%=re %>