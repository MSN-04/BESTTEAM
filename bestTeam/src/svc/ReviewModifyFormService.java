package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ItemDAO;
import dao.ReviewDAO;
import vo.ItemBean;
import vo.ReviewBean;


public class ReviewModifyFormService {
	
	// 글 번호(board_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
	public ItemBean getItem(int item_num) {

		System.out.println("ReviewModifyService - getItem() 시작");
		
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
}























