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
			
			sql = "insert into buy(buy_num,buy_user_id,buy_address,buy_phone,buy_phone2,buy_shipnum,buy_post,buy_name,buy_buydate,buy_total,buy_email,buy_count,buy_ordernum) "
					+ "values("+num+",?,?,?,?,?,?,?,?,?,?,"+count+",?)";
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
			pstmt.setString(11, buyBean.getBuy_ordernum()); // ordernum
			
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

	public ArrayList<CartBean> getCartList(String id) {
		ArrayList<CartBean> cartList = new ArrayList<>();
		CartBean cartBean = null;
		
		try {
			sql = "select * from cart where cart_user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				cartBean = new CartBean();
				cartBean.setCart_num(rs.getInt("cart_num"));
				cartBean.setCart_item_num(rs.getInt("cart_item_num"));
				cartBean.setCart_user_id(rs.getString("cart_user_id"));
				cartBean.setCart_count(rs.getInt("cart_count"));
				cartBean.setCart_price(rs.getInt("cart_price"));
				cartBean.setCart_img(rs.getString("cart_img"));
				cartBean.setCart_item_name(rs.getString("cart_item_name"));
				cartList.add(cartBean);
			}
			
		} catch (SQLException e) {
			System.out.println("getCartList 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return cartList;
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
          pstmt.setInt(5, cartBean.getCart_price());
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

	public boolean isSameItem(String id, int item_num) {
		boolean isSame = false;
		sql = "select * from cart where cart_user_id = ? and cart_item_num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, item_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isSame = true;
			}
			
		} catch (SQLException e) {
			System.out.println("isSameItem 실패! ( " + e.getMessage() + " )");
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isSame;
	}
	
	public boolean updateCart(String id, int item_num, int cart_count) {
		boolean isUpdated = false;
		sql = "update cart set cart_count = ? where cart_user_id = ? and cart_item_num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_count);
			pstmt.setString(2, id);
			pstmt.setInt(3, item_num);
			
			if (pstmt.executeUpdate() > 0) {
				isUpdated = true;
			}
			
		} catch (SQLException e) {
			System.out.println("updateCart 실패! ( " + e.getMessage() + " )");
		} finally {
			close(pstmt);
		}
		
		return isUpdated;
	}
	
	public boolean deleteCart(String id, String[] itemList) {
		boolean isDeleteCart = false;
		sql = "delete from cart where cart_user_id = ? and cart_item_num = ?";
		try {
			for (int i = 0 ; i < itemList.length ; i++) {
				pstmt = con.prepareStatement(sql);		
				pstmt.setString(1, id);
				pstmt.setInt(2, Integer.parseInt(itemList[i]));
				if (pstmt.executeUpdate() > 0) {
					isDeleteCart = true;
				} else {
					isDeleteCart = false;
					break;
				}
			}
			
		} catch (SQLException e) {
			System.out.println("deleteCartList 실패! ( " + e.getMessage() + " )");
		} finally {
			close(pstmt);
		}
		
		return isDeleteCart;
	}
	
	/*-------------------------------------- 미송 ---------------------------------------*/
	
		//-- 장바구니의 아이템들 리턴
	public ArrayList<BuyItemBean> getCartItems(String id) {
		
		System.out.println("1. BuyDAO getCartItems() 시작");
		System.out.println("id = "+id);
		
		ArrayList<BuyItemBean> cartItems = new ArrayList<>();
		BuyItemBean buyItemBean = new BuyItemBean();
		
		String sql = "SELECT * FROM cart c JOIN item i ON (c.cart_item_num = i.item_num) WHERE c.cart_user_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			System.out.println("2. select 문 실행");
			
			while(rs.next()) {
				System.out.println("3. while 문 실행");
				
				// 1개 아이템 정보 가져와 저장
				buyItemBean = new BuyItemBean();
				
				buyItemBean.setItem_buy_num(rs.getInt("cart_item_num"));
					System.out.println("cart_item_num : "+rs.getInt("cart_item_num"));
				
				buyItemBean.setItem_count(rs.getInt("cart_count"));
					System.out.println("cart_count : "+rs.getInt("cart_count"));
				
				buyItemBean.setItem_img(rs.getString("item_img"));
				buyItemBean.setItem_name(rs.getString("item_name"));
				buyItemBean.setItem_num(rs.getInt("item_num"));
				buyItemBean.setItem_price(rs.getInt("item_price"));
				
				System.out.println("4. "+ buyItemBean.getItem_name());
				
				cartItems.add(buyItemBean);
				System.out.println("5. cartItems에 butItemBean 추가");
			}
			
			System.out.println("6. BuyDAO getCartItems() 성공");
			
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

	
	
	/*-------------------------------------- 영비 ---------------------------------------*/
		public ArrayList<BuyBean> selectConfirmCheckoutList(String user_id){
		System.out.println("BuyDAO --selectConfirmCheckoutList ");
		
		ArrayList<BuyBean> buyList=new ArrayList<>();
		
		//UserBean userBean=null;
		
		try {
			String sql="select buy_user_id from buy where buy_user_id=?";  //buy 테이블에서 buy_user_id가져옴
			buyList=new ArrayList<>();
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
							BuyBean buyBean=new BuyBean();
							buyBean.setBuy_num(rs.getInt("buy_num"));
							buyBean.setBuy_buydate(rs.getDate("buy_buydate"));
							buyBean.setBuy_count(rs.getInt("buy_count"));
							buyBean.setBuy_name(rs.getString("buy_name"));
							buyBean.setBuy_total(rs.getInt("buy_total"));
							buyBean.setBuy_user_id(user_id);
							buyList.add(buyBean);
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
		return buyList;
	}
	
		//영비 -- 글 목록 개수 구하기
	public int selectBuyListCount() {
		System.out.println("dao--> selectBuyListCount()");
		int buyListCount=0;
		String sql="select count(*) from buy ";
		
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				buyListCount=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("dao - selectListCount 에러:"+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return buyListCount;
		
	}
	
	//---------- 영비--> 주문 상세 내역 조회
	// 주문상품조회: cart에서 가져오기-->상품 이미지(buy_item_img)/상품이름(buy_item_name)/ 가격 (buy_item_price)/ 갯수(buy_item_count) / 가격(buy_item_price)
	
	//주문자 정보: buy 에서 가져오기--> 주문번호(buy_num) / 주문자 / 주문일자 / 



}
