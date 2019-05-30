package svc;

import vo.ItemBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import dao.ItemDAO;
import dao.ReviewDAO;

public class ItemSingleService {

/* DB에서 해당 아이템의 정보를 가져와 전달하는 Service (<- FROM. ItemSingleAction )
 1. Connection 객체 생성   ( import static db.JdbcUtil.*; )
 2. ItemDAO - setConnection()
 3. ItemDAO - selectArticle(item_num) : itemBean 리턴받아 저장
 4. Connection 객체 반환
 5. ItemBean 리턴
 */
	public ItemBean getItem(int item_num) {

		System.out.println("ItemSingleService - getItem() 시작");
		
		// 1.
		Connection con = getConnection();
		
		// 2.
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		// 3.
		ItemBean itemBean = itemDAO.selectItem(item_num);
		
		// 4.
		close(con);
		
		System.out.println("ItemSingleService - getItem() 끝");
		// 5.
		return itemBean;
	}
	
	public int getListCount() throws Exception {
//		System.out.println("BoardListService - getListCount()");
		
		int listCount = 0; // 글 목록 갯수
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		// BoardDAO 클래스의 selectListCount() 메서드를 호출하여 글 목록 갯수 얻어와서 변수에 저장
		listCount = reviewDAO.selectListCount();
		
		System.out.println("게시물 갯수 : " + listCount);
		
		// Connection 객체 반환
		close(con);
		
		return listCount;
	}
	
	// 글 목록 조회 후 리턴
	public ArrayList<ReviewBean> getArticleList(int page, int limit,int item_num) throws Exception {
		System.out.println("ReviewBean - getArticleList()");
		
		ArrayList<ReviewBean> reviewList = null;
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);

		// BoardDAO 클래스의 selectArticleList() 메서드를 호출하여 글 목록 가져와서 ArrayList 객체에 저장
		// => 매개변수로 page, limit 전달
		
		reviewList = reviewDAO.selectArticleList(page, limit, item_num);

		// Connection 객체 반환
		close(con);
		
		return reviewList;
		
	}

}
