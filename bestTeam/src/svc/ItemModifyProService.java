package svc;

import vo.ItemBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ItemDAO;
import dao.UserDAO;

public class ItemModifyProService {

/* DB에서 해당 아이템의 정보를 가져와 전달하는 Service (<- FROM. ItemSingleAction )
 1. Connection - getConnection() : 커넥션 객체 생성   ( import static db.JdbcUtil.*; )
 2. ItemDAO - modifyItem(itemBean) : 아이템 정보 수정하고 isModifySuccess 리턴
 . Connection 객체 반환
 . ItemBean 리턴
 */
	
	// 1.
	Connection con = getConnection();

	// 2.
	public int modifyItem(ItemBean itemBean) {
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		int isModifySuccess = itemDAO.updateItem(itemBean);
		
		return isModifySuccess;
	}


}
