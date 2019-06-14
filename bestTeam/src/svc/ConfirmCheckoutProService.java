package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BuyDAO;
import vo.BuyBean;
import vo.BuyItemBean;

public class ConfirmCheckoutProService {

	
	//주문 정보 조회
	public ArrayList<BuyItemBean> getOrderInfoList(int buy_num)throws Exception {
		ArrayList<BuyItemBean> orderInfoList=null;
		
		System.out.println("ConfirmCheckoutProService - getOrderInfoList");
		Connection con= getConnection();
		
		BuyDAO buydao=BuyDAO.getInstance();   //buydao의 인스턴스 가져 옴
		buydao.setConnection(con);
		//System.out.println("ConfirmCheckoutListService-- buy_num:"+buy_num);
	//	System.out.println("ConfirmCheckoutProService-- buy_num:"+buy_num);
		
		// 매개변수로 마이페이지에 접속한 user_id 와 그 아이디로부터 주문번호 buy_num을 가져온다. 
		orderInfoList=buydao.getOrderInfoList(buy_num);
	//	buy_num=buydao.selectBuy_num();
		close(con);
		
		return orderInfoList;
		
	}
	
	
	//주문자 정보 조회
	public ArrayList<BuyBean> getOrderPersonList(String id)throws Exception {
		
		ArrayList<BuyBean> orderPersonList=null;
		
		System.out.println("ConfirmCheckoutProService - getOrderPersonList");
		Connection con= getConnection();
		
		BuyDAO buydao=BuyDAO.getInstance();   //buydao의 인스턴스 가져 옴
		buydao.setConnection(con);
		//System.out.println("ConfirmCheckoutListService-- buy_num:"+buy_num);
	//	System.out.println("ConfirmCheckoutProService-- id:"+id);
		
		// 매개변수로 마이페이지에 접속한 user_id 와 그 아이디로부터 주문번호 buy_num을 가져온다. 
		orderPersonList=buydao.getOrderPersonList(id);
	//	buy_num=buydao.selectBuy_num();
		close(con);
		
		return orderPersonList;
	}

}
