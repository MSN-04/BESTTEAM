package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BlogDAO;
import vo.BlogBean;

import static db.JdbcUtil.*;

public class BlogListService {
	
	// 글 목록 갯수 구해서 리턴
	public int getListCount() throws Exception {
//		System.out.println("BoardListService - getListCount()");
		
		int listCount = 0; // 글 목록 갯수
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con);
		
		// BoardDAO 클래스의 selectListCount() 메서드를 호출하여 글 목록 갯수 얻어와서 변수에 저장
		listCount = blogDAO.selectListCount();
		
		System.out.println("게시물 갯수 : " + listCount);
		
		// Connection 객체 반환
		close(con);
		
		return listCount;
	}
	
	// 글 목록 조회 후 리턴
	public ArrayList<BlogBean> getArticleList(int page, int limit) throws Exception {
//		System.out.println("BoardListService - getArticleList()");
		
		ArrayList<BlogBean> articleList = null;
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con);

		// BoardDAO 클래스의 selectArticleList() 메서드를 호출하여 글 목록 가져와서 ArrayList 객체에 저장
		// => 매개변수로 page, limit 전달
		articleList = blogDAO.selectArticleList(page, limit);

		// Connection 객체 반환
		close(con);
		
		return articleList;
		
	}
}




















