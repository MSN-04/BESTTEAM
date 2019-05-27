package dao;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemDAO {
	
	private Connection con;
	private PreparedStatement pstmt =null;
	private ResultSet rs;
	private String sql = null;
	
	private ItemDAO() {}
	
	private static ItemDAO instance ;
	
	public static ItemDAO getInstance() {
		
		if(instance ==null) {
			instance = new ItemDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}



	
	/*-------------------------------------- 주영-------------- ------------------------*/
	public int selectListCount(String taste, int degree) {
		int listCount = 0;
		if (taste.equals("all")) {
			sql = "select count(*) from item";
		} else {
			sql = "select count(*) from item_favor where " + taste + "=" + degree;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				listCount = rs.getInt("count(*)");
			}
			
			System.out.println("ItemDAO - selectItem() 성공");
			
		} catch (SQLException e) {

			System.out.println("ItemDAO - selectItem() 오류 "+e.getMessage());
			System.out.println("selectListCount 실패! (" + e.getMessage() + ")");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<ItemBean> selectItemList(int page, int limit, String taste, String filter, int degree) {
		ArrayList<ItemBean> itemList = null;
		ItemBean itemBean = null;
		String sqlFilter = null;
		
		if (filter.equals("newest")) {
			sqlFilter = "item_date desc, item_num desc";
		} else if (filter.equals("popular")) {
			sqlFilter = "item_sold desc, item_date desc";
		} else if (filter.equals("lowPrice")) {
			sqlFilter = "item_price asc, item_date desc";
		} else if (filter.equals("highPrice")) {
			sqlFilter = "item_price desc, item_date desc";
		}
		
		if (taste.equals("all")) {
			sql = "select * from item inner join item_favor on item.item_num = item_favor.item_favor_item_num order by " + sqlFilter + " limit ?, ? ";
		} else {
			sql = "select * from item inner join item_favor on item.item_num = item_favor.item_favor_item_num where item_favor."+ taste + "=" + degree + " order by " + sqlFilter + " limit ?, ?";
		}
		
		
		
		try {
			itemList = new ArrayList<>();
			pstmt = con.prepareStatement(sql);
			int startRow = (page-1) * 8;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			System.out.println("sql : " + sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				itemBean = new ItemBean();
				itemBean.setItem_amount(rs.getInt("item_amount"));
				itemBean.setItem_content(rs.getString("item_content"));
				itemBean.setItem_date(rs.getDate("item_date"));
				itemBean.setItem_img(rs.getString("item_img"));
				itemBean.setItem_info(rs.getString("item_info"));
				itemBean.setItem_name(rs.getString("item_name"));
				itemBean.setItem_num(rs.getInt("item_num"));
				itemBean.setItem_price(rs.getInt("item_price"));
				itemBean.setItem_favor_acidity(rs.getInt("item_favor_acidity"));
				itemBean.setItem_favor_bitterness(rs.getInt("item_favor_bitterness"));
				itemBean.setItem_favor_body(rs.getInt("item_favor_body"));
				itemBean.setItem_favor_item_num(rs.getInt("item_favor_item_num"));
				itemBean.setItem_favor_sweetness(rs.getInt("item_favor_sweetness"));
				itemBean.setItem_favor_aroma(rs.getInt("item_favor_aroma"));
				itemList.add(itemBean);
				
			}
			
//			System.out.println("selectItemList 성공!");
			
		} catch (SQLException e) {
			System.out.println("selectItemList 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return itemList;
	}
	
	/*-------------------------------------- 미송 --------------------------------------*/


	//-- 아이템 조회해서 ItemBean 리턴 
		public ItemBean selectItem(int item_num) {
			ItemBean itemBean = new ItemBean();
			
			sql = "SELECT * "
					+ "FROM item em INNER JOIN item_favor emf "
					+ "ON em.item_num = emf.item_favor_item_num "
					+ "WHERE em.item_num=?";
			
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
					itemBean.setItem_sold(rs.getInt("item_sold"));
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
		
		
	//-- 아이템 수정하고 결과 리턴
		public int updateItem(ItemBean itemBean) {
			System.out.println("updateItem() 시작");
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			
			int isUpdateSuccess = 0;
			
			sql = "SELECT * FROM item em INNER JOIN item_favor emf ON em.item_num = emf.item_favor_item_num WHERE em.item_num=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, itemBean.getItem_num());
				rs = pstmt.executeQuery();
				System.out.println("SELECT 완료");
				if(rs.next()) {
					// item 테이블 UPDATE
					String sql1 = "UPDATE item SET item_name=?, item_info=?, item_img=?, item_amount=?, item_content=?, item_price=?, item_date=now() WHERE item_num=?";
					
					pstmt1 = con.prepareStatement(sql1);
					
					pstmt1.setString(1, itemBean.getItem_name());
					pstmt1.setString(2, itemBean.getItem_info());
					pstmt1.setString(3, itemBean.getItem_img());
					pstmt1.setInt(4, itemBean.getItem_amount());
					pstmt1.setString(5, itemBean.getItem_content());
					pstmt1.setInt(6, itemBean.getItem_price());
					pstmt1.setInt(7, itemBean.getItem_num());
					int num1 = pstmt1.executeUpdate();
					
					isUpdateSuccess = 1;
					
					System.out.println("item 테이블 UPDATE 완료 : " + num1);
					
					// item_favor 테이블 UPDATE
					String sql2 = "UPDATE item_favor SET item_favor_acidity=?, item_favor_bitterness=?, item_favor_body=?, item_favor_sweetness=?, item_favor_aroma=?  WHERE item_favor_num=?";
					
					pstmt2 = con.prepareStatement(sql2);
					
					pstmt2.setInt(1,itemBean.getItem_favor_acidity());
					pstmt2.setInt(2, itemBean.getItem_favor_bitterness());
					pstmt2.setInt(3, itemBean.getItem_favor_body());
					pstmt2.setInt(4, itemBean.getItem_favor_sweetness());
					pstmt2.setInt(5, itemBean.getItem_favor_aroma());
					pstmt2.setInt(6, itemBean.getItem_favor_num());
					int num2 = pstmt2.executeUpdate();
					
					System.out.println("item_favor 테이블 UPDATE 완료 : " + num2);
					
					isUpdateSuccess = 2;
				}
				
			} catch (SQLException e) {
				System.out.println("updateItem() 오류 "+e.getMessage());
			} finally {
				close(pstmt);
				close(pstmt1);
				close(pstmt2);
			}
			return isUpdateSuccess;
			
		}
	
		/*-------------------------------------- 기홍 --------------------------------------*/
		
		
		public int registItem(ItemBean itemBean) {
	        int num = 0;
	        int f_num = 0;
	        int insertCount = 0;
	        
	        String sql="select max(item_num) from item";
	        
	        try {
	          pstmt = con.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          
	          if(rs.next()) {
	          num = rs.getInt(1) + 1;
	          }
	          
	          sql = "INSERT INTO item VALUES(?, ?, now(), ?, ?, ?, ?, ?, ?)";
	        
	          pstmt = con.prepareStatement(sql);
	          pstmt.setInt(1, num);
	          pstmt.setString(2, itemBean.getItem_name());
	          pstmt.setString(3, itemBean.getItem_info());
	          pstmt.setString(4, itemBean.getItem_img());
	          pstmt.setInt(5, itemBean.getItem_amount());
	          pstmt.setInt(6, itemBean.getItem_price());
	          pstmt.setString(7, itemBean.getItem_content());
	          pstmt.setInt(8, 0);
	          
	          pstmt.executeUpdate();
	          
	          sql="select max(item_favor_num) from item_favor";
	          
	          pstmt = con.prepareStatement(sql);
	          rs = pstmt.executeQuery();
	          
	          if(rs.next()) {
	            f_num = rs.getInt(1) + 1;
	          }
	          
	          sql = "INSERT INTO item_favor VALUES(?, ?, ?, ?, ?, ?, ?)";
	          
	          pstmt = con.prepareStatement(sql);
	          pstmt.setInt(1, f_num);
	          pstmt.setInt(2, num);
	          pstmt.setInt(3, itemBean.getItem_favor_aroma());
	          pstmt.setInt(4, itemBean.getItem_favor_acidity());
	          pstmt.setInt(5, itemBean.getItem_favor_sweetness());
	          pstmt.setInt(6, itemBean.getItem_favor_bitterness());
	          pstmt.setInt(7, itemBean.getItem_favor_body());

	          insertCount = pstmt.executeUpdate();
	        } catch (SQLException e) {
	          System.out.println("INSERT 에러 : " + e.getMessage());
	        } finally {
	          close(rs);
	          close(pstmt);
	        }
	        
	        return insertCount;
	        
	      }
		
		public boolean isRegistSuccess(ItemBean itemBean) {
		      sql = "SELECT * FROM item WHERE item_num=?";
		      
		      try {
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, itemBean.getItem_num());
		        rs = pstmt.executeQuery();
		        
		        if(rs.next()) {
		          return true;
		        }
		        
		      } catch (SQLException e) {
//		        e.printStackTrace();
		        System.out.println("isRegistSuccess() 실패! : " + e.getMessage());
		      } finally {
		        close(rs);
		        close(pstmt);
		      }
		      
		      return false;
		    }
		
		/*-------------------------------------- 영비 --------------------------------------*/
		
		public int deleteItem(int item_num,int item_favor_num) {
		    int deleteItemCnt=0;
		    System.out.println("dao시작");
		    sql="delete from item where item_num=?";
		    try {
		      pstmt = con.prepareStatement(sql);
		      pstmt.setInt(1, item_num);		      
		      pstmt.executeUpdate();
		      
//		      if(item_num==item_favor_num) {
		    	  System.out.println("item_num 과 item_favor_num 같음");
		    	  sql="delete from item_favor where item_favor_num=?";
		    	  pstmt=con.prepareStatement(sql);
		    	  pstmt.setInt(1,item_favor_num);
		    	  deleteItemCnt=pstmt.executeUpdate();
//		      }
		    } catch (SQLException e) {
		      System.out.println("updateItem() 오류 "+e.getMessage());
		      System.out.println("deleteItemdao 에서 오류:"+e);
		    } finally {
		      close(pstmt);
		    }
		    return deleteItemCnt;
		    
		  }
		
	
}
