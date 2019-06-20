package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BlogCommentDAO;
import dao.QnaDAO;

import static db.JdbcUtil.*;

import vo.BlogCommentBean;
import vo.QnaBean;

public class BlogCommentListService {
	
	// 글 목록 갯수 구해서 리턴
	public int getListCount() throws Exception {
		System.out.println("blogCommentListService - getListCount()");
		
		int listCount = 0; // 글 목록 갯수
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		
		blogCommentDAO.setConnection(con);
		
		listCount = blogCommentDAO.selectListCount();
		   
//		System.out.println("게시물 갯수 : " + listCount);
		
		close(con);
		
		return listCount;
	}
	
	// 글 목록 조회 후 리턴
	public ArrayList<BlogCommentBean> getArticleList(int page, int limit) throws Exception {
//		System.out.println("blogCommentListService - getArticleList()");
		
		ArrayList<BlogCommentBean> article2 = null;
		
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con);

		article2 = blogCommentDAO.selectArticleList(page, limit);

		close(con);
		
		return article2;
		
	}
}


