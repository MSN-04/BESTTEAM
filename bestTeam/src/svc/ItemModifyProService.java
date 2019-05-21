package svc;

import vo.ItemBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ItemDAO;

public class ItemModifyProService {

/* DB에서 해당 아이템의 정보를 가져와 전달하는 Service (<- FROM. ItemSingleAction )
 1. Connection - getConnection() : 커넥션 객체 생성   ( import static db.JdbcUtil.*; )
 2. ItemDAO - modifyItem(itemBean) : 아이템 정보 수정하고 isModifySuccess 리턴
 . Connection 객체 반환
 . ItemBean 리턴
 */
	
	// 1.
	Connection con = getConnection();

	public int modifyItem(ItemBean itemBean) {
		System.out.println("ItemModifyProService  - modifyItem() 시작");
		// 2.
		ItemDAO itemDAO = ItemDAO.getInstance();
		int isModifySuccess = itemDAO.updateItem(itemBean);

		return isModifySuccess;
	}
	
	
	public ItemBean getItem(int item_num) {
		System.out.println("ItemModifyProService  - getItem() 시작");
		
		// 1.
		
		// 2.
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		// 3.
		ItemBean itemBean = itemDAO.selectItem(item_num);
		
		// 4.
		close(con);
		
		System.out.println("ItemModifyProService - getItem() 끝");
		// 5.
		return itemBean;
	}


}
