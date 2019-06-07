package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BuyDAO;

import static db.JdbcUtil.*;

import vo.BuyBean;

public class ConfirmCheckoutListService {
	
	//상품 목록 조회
	public ArrayList<BuyBean> selectConfirmCheckoutList(String user_id) throws Exception{
		ArrayList<BuyBean> articleList=null;
		
		System.out.println("ConfirmCheckoutListService - selectConfirmCheckoutList");
		Connection con= getConnection();
		
		BuyDAO buydao=BuyDAO.getInstance();   //buydao의 인스턴스 가져 옴
		buydao.setConnection(con);
		//System.out.println("ConfirmCheckoutListService-- buy_num:"+buy_num);
		System.out.println("ConfirmCheckoutListService-- user_id:"+user_id);
		
		// 매개변수로 마이페이지에 접속한 user_id 와 그 아이디로부터 주문번호 buy_num을 가져온다. 
		articleList=buydao.selectConfirmCheckoutList(user_id);
	//	buy_num=buydao.selectBuy_num();
		close(con);
		
		
		
		return articleList;
	}

}
