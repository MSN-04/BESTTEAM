package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import static db.JdbcUtil.*;
import dao.BlogCommentDAO;
import dao.BlogDAO;
import dao.NoticeDAO;
import dao.QnaDAO;
import vo.BlogBean;
import vo.BlogCommentBean;
import vo.NoticeBean;
import vo.UserBean;


public class BlogDetailService {
	
	private static final BlogCommentBean BlogCommentBean = null;


	// 글 번호(board_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
	public BlogBean getArticle(int blog_num) throws Exception {
//		System.out.println("BlogDetailService - getArticle()");
		BlogBean blogBean = null;
		
		Connection con = getConnection();
		
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con);
		
		// BoardDAO 객체의 selectArticle() 메서드를 호출하여 글번호(board_num)를 전달 => BoardBean 객체 리턴받음
		blogBean = blogDAO.selectArticle(blog_num);
		
		// 게시물을 성공적으로 읽어왔을 때 조회수 증가 처리
		int updateCount = blogDAO.updateReadcount(blog_num);
		
		// updateCount 가 1일 경우 commit, 0일 경우 rollback 수행
		if(updateCount == 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		// Connection 객체 반환
		close(con);
		
		return blogBean;
	}

	public UserBean getUserInfo(String id) {
		UserBean userBean = new UserBean();
		
		Connection con = getConnection();
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con);
		
		userBean = blogDAO.getUserInfo(id);
		
		if(userBean==null) {
			rollback(con);
		} else {
			commit(con);
		}
		
		return userBean;
	}
	
	// 댓글 목록 조회 후 리턴
	public ArrayList<BlogCommentBean> getCommentList(int blog_num) throws Exception {
		System.out.println("CommentListService - getArticleList()");
//		System.out.println(blog_num);
		ArrayList<BlogCommentBean> articleList = new ArrayList<BlogCommentBean>();
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con);

		articleList = blogCommentDAO.listComment(blog_num);
		close(con);
		
		return articleList;
		
	}
	

}













