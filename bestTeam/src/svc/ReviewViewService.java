package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.NoticeDAO;
import dao.ReviewDAO;
import vo.NoticeBean;
import vo.ReviewBean;

public class ReviewViewService {
	
	// 글 번호(notice_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
//	public ReviewBean getArticle(int review_num) throws Exception {
////		System.out.println("reviewViewService - getArticle()");
//		ReviewBean reviewBean = null;
//		
//		Connection con = getConnection();
//		
//		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
//		ReviewDAO reviewDAO = ReviewDAO.getInstance();
//		reviewDAO.setConnection(con);
//		
//		// noticeDAO 객체의 selectArticle() 메서드를 호출하여 글번호(notice_num)를 전달 => noticeBean 객체 리턴받음
//		reviewBean = reviewDAO.selectArticle(review_num);
//		
//		// 게시물을 성공적으로 읽어왔을 때 조회수 증가 처리
//		int updateCount = reviewDAO.updateReadcount(review_num);
//		   
//		// updateCount 가 1일 경우 commit, 0일 경우 rollback 수행
//		if(updateCount == 1) {
//			commit(con);
//		} else {
//			rollback(con);
//		}
//		
//		close(con);
//		
//		return reviewBean;
//	}

}

