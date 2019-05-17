package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static db.JdbcUtil.*;


import vo.ItemBean;

public class ItemDAO {
	
	String sql;
	
	//-- 커넥션
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public void setConnection(Connection con) { // svc에서 보낸 커넥션을 DAO에 전달
		this.con = con;
	}
	
	//-- 싱글톤 디자인 패턴
	private ItemDAO() {}  // 1. 생성자 호출 잠금
	private static ItemDAO instance;  // 2. 인스턴스 생성
	public static ItemDAO getInstance() {  // 3. 인스턴스 호출 메서드
		if(instance == null) {
			instance = new ItemDAO(); // 4. 인스턴스 없을때만 새로 생성 
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
	public int updateItem(ItemBean itemBean) {
		int isUpdateSuccess = 0;
		
		sql = "SELECT * "
				+ "FROM item it INNER JOIN item_favor itf "
				+ "ON it.item_num = itf.item_favor_item_num "
				+ "WHERE it.item_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemBean.getItem_num());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				// item 테이블 UPDATE
				String sql1 = "UPDATE item "
						+ "SET item_name=?, item_info=?, item_img=?, "
						+ 	  "item_amount=?, item_content=?, item_price=?, item_date=?"
						+ "WHERE item_num=?";
				
				pstmt = con.prepareStatement(sql1);
				
				pstmt.setString(1, itemBean.getItem_name());
				pstmt.setString(2, itemBean.getItem_info());
				pstmt.setString(3, itemBean.getItem_img());
				pstmt.setInt(4, itemBean.getItem_amount());
				pstmt.setString(5, itemBean.getItem_content());
				pstmt.setInt(6, itemBean.getItem_price());
				pstmt.setDate(7, (Date) itemBean.getItem_date());
				pstmt.setInt(8, itemBean.getItem_num());
				pstmt.executeUpdate();
				
				isUpdateSuccess = 1;
				
				// item_favor 테이블 UPDATE
				String sql2 = "UPDATE item_favor "
						+ "SET item_favor_acidity=?, item_favor_bitterness=?, item_favor_body=?, "
						+ 	  "item_favor_sweetness=?, item_favor_aroma=?"
						+ "WHERE item_favor_item_num=?";
				
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1,itemBean.getItem_favor_acidity());
				pstmt.setInt(2, itemBean.getItem_favor_bitterness());
				pstmt.setInt(3, itemBean.getItem_favor_body());
				pstmt.setInt(4, itemBean.getItem_favor_sweetness());
				pstmt.setInt(5, itemBean.getItem_favor_aroma());
				pstmt.setInt(6, itemBean.getItem_num());
				
				isUpdateSuccess = 2;
			}
			
		} catch (SQLException e) {
			System.out.println("updateItem() 오류 "+e.getMessage());
		} finally {
			close(pstmt);
		}
		return isUpdateSuccess;
		
	}
	
	
	
	
	
	
	
	

}











