package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ItemDAO;

public class AdminPageItemDeleteService {
	
	private Connection con;

	public boolean deleteItemList(String[] itemList1, String[] itemList2) {
		boolean isDeleted = false;
		
		con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		isDeleted = itemDAO.deleteItemList(itemList1, itemList2);
		
		if (isDeleted) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleted;
	}
}
