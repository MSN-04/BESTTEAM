<%@page import="dao.ReviewDAO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int review_num = Integer.parseInt(request.getParameter("review_num"));
	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	int rea = reviewDAO.updateReadcount(review_num);
%> 


<%=rea %>