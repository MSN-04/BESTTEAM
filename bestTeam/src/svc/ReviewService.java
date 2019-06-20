package svc;

import vo.BlogBean;
import vo.ItemBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogDAO;
import dao.ItemDAO;
import dao.ReviewDAO;

public class ReviewService {

/* DB에서 해당 아이템의 정보를 가져와 전달하는 Service (<- FROM. ItemSingleAction )
 1. Connection 객체 생성   ( import static db.JdbcUtil.*; )
 2. ItemDAO - setConnection()
 3. ItemDAO - selectArticle(item_num) : itemBean 리턴받아 저장
 4. Connection 객체 반환
 5. ItemBean 리턴
 */
	public ItemBean getItem(int item_num) {

//		System.out.println("ReviewService - getItem() 시작");
		
		// 1.
		Connection con = getConnection();
		
		// 2.
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		// 3.
		ItemBean itemBean = itemDAO.selectItem(item_num);
		
		// 4.
		close(con);
		
//		System.out.println("ItemSingleService - getItem() 끝");
		// 5.
		return itemBean;
	}
	public ReviewBean getArticle(int review_num) throws Exception {
//		System.out.println("BoardDetailService - getArticle()");
		ReviewBean reviewBean = null;
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		// BoardDAO 객체의 selectArticle() 메서드를 호출하여 글번호(board_num)를 전달 => BoardBean 객체 리턴받음
		reviewBean = reviewDAO.selectArticle(review_num);
		
		// 게시물을 성공적으로 읽어왔을 때 조회수 증가 처리
//		int updateCount = reviewDAO.updateReadcount(review_num);
//		
//		// updateCount 가 1일 경우 commit, 0일 경우 rollback 수행
//		if(updateCount == 1) {
//			commit(con);
//		} else {
//			rollback(con);
//		}
		
		// Connection 객체 반환
		close(con);
		
		return reviewBean;
	}

}
