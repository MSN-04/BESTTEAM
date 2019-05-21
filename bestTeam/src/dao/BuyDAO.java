package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static db.JdbcUtil.*;


import vo.ItemBean;

public class BuyDAO {
	
	String sql;
	
	//-- 커넥션
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public void setConnection(Connection con) { // svc에서 보낸 커넥션을 DAO에 전달
		this.con = con;
	}
	
	//-- 싱글톤 디자인 패턴
	private BuyDAO() {}  // 1. 생성자 호출 잠금
	private static BuyDAO instance;  // 2. 인스턴스 생성
	public static BuyDAO getInstance() {  // 3. 인스턴스 호출 메서드
		if(instance == null) {
			instance = new BuyDAO(); // 4. 인스턴스 없을때만 새로 생성 
		}
		return instance;
	}

	//-- 아이템 조회해서 ItemBean 리턴 
	public ItemBean selectItem(int item_num) {
		ItemBean itemBean = new ItemBean();
		
		sql = "SELECT * "
				+ "FROM item it INNER JOIN item_favor itf "
				+ "ON it.item_num = itf.item_favor_item_num "
				+ "WHERE it.item_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				itemBean.setItem_num(item_num);
				itemBean.setItem_name(rs.getString("item_name"));
				itemBean.setItem_info(rs.getString("item_info"));
				itemBean.setItem_img(rs.getString("item_img"));
				itemBean.setItem_amount(rs.getInt("item_amount"));
				itemBean.setItem_content(rs.getString("item_content"));
				itemBean.setItem_price(rs.getInt("item_price"));
				itemBean.setItem_date(rs.getDate("item_date"));
				itemBean.setItem_favor_num(rs.getInt("item_favor_num"));
				itemBean.setItem_favor_item_num(rs.getInt("item_favor_item_num"));
				itemBean.setItem_favor_acidity(rs.getInt("item_favor_acidity"));
				itemBean.setItem_favor_bitterness(rs.getInt("item_favor_bitterness"));
				itemBean.setItem_favor_body(rs.getInt("item_favor_body"));
				itemBean.setItem_favor_sweetness(rs.getInt("item_favor_sweetness"));
				itemBean.setItem_favor_aroma(rs.getInt("item_favor_aroma"));
			}
			
		} catch (SQLException e) {
			System.out.println("selectItem() 오류 "+e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return itemBean;
	}

	//-- 조회된 아이템 수정
	public void updateItem(int item_num) {
		
		sql = "UPDATE item "
				+ "SET item_num=?, item_name=?, item_info=?, item_img=?, "
				+ 	  "item_amount=?, item_content=?, item_price=?, item_date=?"
				+ "WHERE item_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_num);
			
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("updateItem() 오류 "+e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
	}
	
	
	
	
	
	
	
	

}











