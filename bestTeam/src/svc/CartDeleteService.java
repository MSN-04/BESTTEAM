package svc;

import java.sql.Connection;
import dao.BuyDAO;

import static db.JdbcUtil.*;

public class CartDeleteService {
	
	private Connection con;
	
	public boolean updateCart(String id, int item_num, int cart_count) {
		boolean isUpdateSuccess = false;
		con = getConnection();
		BuyDAO buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		
		isUpdateSuccess = buyDAO.updateCart(id, item_num, cart_count);
		if (isUpdateSuccess) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return isUpdateSuccess;
	}

	public boolean deleteCart(String id, String[] itemList) {
		boolean isDeleted = false;
		
		con = getConnection();
		BuyDAO buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		
		isDeleted = buyDAO.deleteCart(id, itemList);
		if (isDeleted) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return isDeleted;
	}

}
