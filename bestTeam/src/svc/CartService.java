package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BuyDAO;

import static db.JdbcUtil.*;
import vo.CartBean;

public class CartService {
	
	private Connection con;
	private BuyDAO buyDAO;

	public ArrayList<CartBean> cartList(String id) {
		
		ArrayList<CartBean> cartList = null;
		con = getConnection();
		buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		
		cartList = buyDAO.getCartList(id);
		
		close(con);
		
		return cartList;
	}
	
	public int getCartCount (String id) {
		int cartCount = 0;
		con = getConnection();
		buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		
		cartCount = buyDAO.getCartCount(id);
		
		close(con);
		
		return cartCount;
	}
}
