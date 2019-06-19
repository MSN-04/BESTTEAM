package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.ItemDAO;
import vo.ItemBean;

public class RecommendListService {

	private Connection con = null;


	public ArrayList<ItemBean> productList() {
		
		con = getConnection(); 
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		ArrayList<ItemBean> list = itemDAO.productList();
		
//		System.out.println("[RecommendListService] list :: " + list.size());
		close(con);
		
		return list;
	}


	public ArrayList<ItemBean> getRecommendList(HashMap<Integer, Integer> productList) {
		
		con = getConnection(); 
		
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		ArrayList<ItemBean> list = itemDAO.getRecommendList(productList);
		
		close(con);
		
		return list;
	}
	
	
}
