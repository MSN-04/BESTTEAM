package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

import static db.JdbcUtil.*;

public class ShopMainService {
	private Connection con = null;

	public int getListCount(String taste, int degree) throws Exception {
		int listCount = 0;
		
		con = getConnection(); 
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		listCount = itemDAO.selectListCount(taste, degree);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<ItemBean> getItemList(int page, int limit, String taste, String filter, int degree) {
		ArrayList<ItemBean> itemList = null;
		
		con = getConnection();
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		itemList = itemDAO.selectItemList(page, limit, taste, filter, degree);
		
		close(con);
		
		return itemList;
	}

}
