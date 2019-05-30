package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import com.sun.mail.imap.protocol.Item;
import com.sun.xml.internal.ws.Closeable;

import vo.BuyItemBean;

public class BuyDAO {
	
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private BuyDAO() {};
	
	private static BuyDAO instance;
	
	public static BuyDAO getInstance() {
		
		if(instance == null) {
			instance = new BuyDAO();
		}
		return instance;
		
	}
	
	// 커넥션 받아서 DB 연결
	public void setConnection(Connection con) {
		this.con = con;
	}

	//-- 장바구니의 아이템들 리턴
	public ArrayList<BuyItemBean> getCartItems(String id) {
		
		System.out.println("BuyDAO - getCartItems() 시작");
		ArrayList<BuyItemBean> cartItems = new ArrayList<>();
		BuyItemBean buyItemBean = new BuyItemBean();
		
		String sql = "SELECT * FROM cart c JOIN item i ON (c.cart_item_num = i.item_num) WHERE c.cart_user_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 1개 아이템 정보 가져와 저장
				buyItemBean = new BuyItemBean();
				
				buyItemBean.setItem_buy_num(rs.getInt("item_buy_num"));
				buyItemBean.setItem_count(rs.getInt("item_count"));
				buyItemBean.setItem_img(rs.getString("item_img"));
				buyItemBean.setItem_name(rs.getString("item_name"));
				buyItemBean.setItem_num(rs.getInt("item_num"));
				buyItemBean.setItem_price(rs.getInt("item_price"));
				
				
				cartItems.add(buyItemBean);
			}
			
			System.out.println("BuyDAO - getCartItems() 성공");
			
		} catch (SQLException e) {
			System.out.println("BuyDAO - getCartItems() 실패");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cartItems;
	}
	

}
