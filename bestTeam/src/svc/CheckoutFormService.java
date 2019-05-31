package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BuyDAO;

import static db.JdbcUtil.*;  // DB 연결에 필수

import vo.BuyItemBean;

public class CheckoutFormService {
	
	// 1. 커넥션 객체 호출
	Connection con = getConnection();

    //-- cart에 담긴 상품목록 리턴
	public ArrayList<BuyItemBean> getCartItems(String id) throws Exception {
		System.out.println("CheckoutFormService - getCartItems() 시작");
		
		// 2. DAO 객체 호출, 커넥션 전달 - DB 연결
		BuyDAO shopDAO = BuyDAO.getInstance();
		shopDAO.setConnection(con);
		
		// 3. 장바구니 아이템들 저장
		ArrayList<BuyItemBean> cartItems = shopDAO.getCartItems(id);
		
		// 4. 커넥션 반환
		close(con);
		
		System.out.println("CheckoutFormService - getCartItems() 끝");
		
		// 5. 아이템들 리턴
		return cartItems;
	}

}
