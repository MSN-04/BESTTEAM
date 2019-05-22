package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BlogDAO;
import vo.BlogBean;


public class BlogDetailService {
	
	// 글 번호(board_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
	public BlogBean getArticle(int blog_num) throws Exception {
//		System.out.println("BoardDetailService - getArticle()");
		BlogBean blogBean = null;
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
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
}























