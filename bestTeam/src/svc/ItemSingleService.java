package svc;

import vo.ItemBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

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

//		System.out.println("ItemSingleService - getItem() 시작");
		
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
	
	

}
