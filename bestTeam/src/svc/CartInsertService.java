package svc;

import java.sql.Connection;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.BuyDAO;
import vo.CartBean;

import static db.JdbcUtil.*;

public class CartInsertService {

	public boolean insertCart(CartBean cartBean) {
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		
		BuyDAO buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		int insertCount = buyDAO.insertCart(cartBean);
		
		if(insertCount > 0) {
			commit(con);
			isInsertSuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		// DB 접속 해제(Connection 자원 반환)
		close(con);
		
		return isInsertSuccess;
	}

	public boolean isSameItem(String id, int item_num) {
		boolean isSameItem = false;
		Connection con = getConnection();
		BuyDAO buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		
		isSameItem = buyDAO.isSameItem(id, item_num);
		
		close(con);
		
		return isSameItem;
	}
	
	

}
