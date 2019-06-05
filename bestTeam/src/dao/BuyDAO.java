package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import vo.BuyBean;
import vo.BuyItemBean;
import vo.CartBean;
import vo.ItemBean;
import vo.UserBean;

public class BuyDAO {
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs;
	private String sql = null;

	private BuyDAO() {}

	private static BuyDAO instance;

	public static BuyDAO getInstance() {

		if (instance == null) {
			instance = new BuyDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	/*-------------------------------------- 주영 ---------------------------------------*/
	public boolean insertBuy(BuyBean buyBean) {
		int num = 1;
		int count = 0;
		boolean isInsertSuccess = false;
		ArrayList<BuyItemBean> itemList = new ArrayList<>();
		String id = buyBean.getBuy_user_id();
		
		sql = "select max(buy_num) from buy";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "select count(*) from cart where cart_user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, buyBean.getBuy_user_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into buy(buy_num,buy_user_id,buy_address,buy_phone,buy_phone2,buy_shipnum,buy_post,buy_name,buy_buydate,buy_total,buy_email,buy_count) values("+num+",?,?,?,?,?,?,?,?,?,?,"+count+")";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // id
			pstmt.setString(2, buyBean.getBuy_address()); // address
			pstmt.setString(3, buyBean.getBuy_phone()); // phone
			pstmt.setString(4, buyBean.getBuy_phone2()); // phone2
			pstmt.setString(5, buyBean.getBuy_shipnum()); // shipnum
			pstmt.setString(6, buyBean.getBuy_post()); // post
			pstmt.setString(7, buyBean.getBuy_name()); // name
			pstmt.setDate(8, buyBean.getBuy_buydate()); // buydate
			pstmt.setInt(9, buyBean.getBuy_total()); // total
			pstmt.setString(10, buyBean.getBuy_email()); // email
			
			if (pstmt.executeUpdate() > 0) {
				itemList = getCartItem(id, num); // 카트내용 가져오기
				if (insertBuyItem(itemList) > 0 ) { ; // buy_item에 값 넣기
					isInsertSuccess = true;
				}
			} else {
				return isInsertSuccess;
			}
		
		} catch (SQLException e) {
			System.out.println("insertBuy 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isInsertSuccess;
	}
	
	public ArrayList<BuyItemBean> getCartItem(String buy_user_id, int buy_num) {
		ArrayList<BuyItemBean> itemList = new ArrayList<>();
		BuyItemBean buyItemBean = null;
		
		try {
			// 카트에서 값 가져오기
			sql = "select * from cart where cart_user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, buy_user_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				buyItemBean = new BuyItemBean(
						rs.getInt("cart_item_num"), 
						buy_num, 
						rs.getString("cart_item_name"), 
						rs.getInt("cart_price"), 
						rs.getInt("cart_count"), 
						rs.getString("cart_img"));
				itemList.add(buyItemBean);
			}
			
		} catch (SQLException e) {
			System.out.println("getCartItem 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return itemList;
	}
	
	public int insertBuyItem (ArrayList<BuyItemBean> itemList) {
		int isinsertBuyItemSuccess = 0;
		int num = 0;
		try {
			sql = "select max(buy_item_num) from buy_item";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "insert into buy_item(buy_item_buy_num,buy_item_name,buy_item_price,buy_item_count,buy_item_img,buy_item_item_num) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			for (int i = 0 ; i < itemList.size() ; i++) {
//				pstmt.setInt(1, num);
				pstmt.setInt(1, itemList.get(i).getItem_buy_num());
				pstmt.setString(2, itemList.get(i).getItem_name());
				pstmt.setInt(3, itemList.get(i).getItem_price());
				pstmt.setInt(4, itemList.get(i).getItem_count());
				pstmt.setString(5, itemList.get(i).getItem_img());
				pstmt.setInt(6, itemList.get(i).getItem_num());
				if (pstmt.executeUpdate() > 0) {
					isinsertBuyItemSuccess++;
				}
			}
			
			
		} catch (SQLException e) {
			System.out.println("insertBuyItem 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isinsertBuyItemSuccess;
	}

	public boolean deleteCart(String id) {
		boolean isDeleteCart = false;
		sql = "delete from cart where cart_user_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			if (pstmt.executeUpdate() > 0) {
				isDeleteCart = true;
			}
			
		} catch (SQLException e) {
			System.out.println("deleteCart 실패! ( " + e.getMessage() + " )");
		} finally {
			close(pstmt);
		}
		
		return isDeleteCart;
	}

	
	
	
	
	
	/*-------------------------------------- 미송 ---------------------------------------*/
	
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
	
	/*-------------------------------------- 기홍 ---------------------------------------*/
	
	public int insertCart(CartBean cartBean) {
		int num = 0;
        int insertCount = 0;
        
        String sql="select max(cart_num) from cart";
        
        try {
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
        	  num = rs.getInt(1) + 1;
          }
          
          sql = "INSERT INTO cart VALUES(?, ?, ?, ?, ?, ?, ?)";
          
          pstmt = con.prepareStatement(sql);
          pstmt.setInt(1, num);
          pstmt.setInt(2, cartBean.getCart_item_num());
          pstmt.setString(3, cartBean.getCart_user_id());
          pstmt.setInt(4, cartBean.getCart_count());
          pstmt.setInt(5, cartBean.getPrice());
          pstmt.setString(6, cartBean.getCart_img());
          pstmt.setString(7, cartBean.getCart_item_name());
          
          
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
//	        e.printStackTrace();
	        System.out.println("isRegistSuccess() 실패! : " + e.getMessage());
	      } finally {
	        close(rs);
	        close(pstmt);
	      }
	      
	      return false;
	    }
	
	/*-------------------------------------- 영비 ---------------------------------------*/
		public ArrayList<BuyBean> selectConfirmCheckoutList(String user_id){
		System.out.println("BuyDAO --selectConfirmCheckoutList ");
		
		ArrayList<BuyBean> selectConfirmCheckoutList=new ArrayList<>();
		BuyBean buyBean=null;
		//UserBean userBean=null;
		
		try {
			String sql="select buy_user_id from buy where buy_user_id=?";  //buy 테이블에서 buy_user_id가져옴
			selectConfirmCheckoutList=new ArrayList<>();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user_id);   //buy_user_id에 접속한 user_id넣는다.
			System.out.println("user_id:"+user_id);
		//	System.out.println("buy_user_id:"+buyBean.getBuy_user_id());
			rs=pstmt.executeQuery();
			
					
					try {
						sql="select * from buy where buy_user_id=? order by buy_num desc"; 
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1,user_id);
						rs=pstmt.executeQuery();
						
						while(rs.next()) {
							buyBean.setBuy_num(rs.getInt("buy_num"));
							buyBean.setBuy_buydate(rs.getDate("buy_date"));
							buyBean.setBuy_count(rs.getInt("buy_count"));
							buyBean.setBuy_name(rs.getString("buy_name"));
							buyBean.setBuy_total(rs.getInt("buy_total"));
							buyBean.setBuy_user_id(user_id);
							selectConfirmCheckoutList.add(buyBean);
						}
						
					}catch(SQLException e) {
						e.printStackTrace();
						System.out.println("selectConfirmCheckoutList 에러1:"+e);
					}

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectConfirmCheckoutList 에러2:"+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return selectConfirmCheckoutList;
	}
	
	public int selectBuy_num() {
		int buy_num=0;
		String sql="select buy_num from buy where buy_num=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,buy_num);
			rs=pstmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("dao - selectBuynum 에러:"+e);
		}
		return buy_num;
		
	}
	
}
