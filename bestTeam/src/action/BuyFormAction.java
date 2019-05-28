package action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemSingleService;
import svc.MyPageProService;
import vo.ActionForward;
import vo.BuyBean;
import vo.CartBean;
import vo.ItemBean;
import vo.UserBean;

public class BuyFormAction implements Action {

	/*  buy.sh  ->  checkout.jsp 로 이동
	 1. cart_count 받아 checkout.jsp 페이지에 구매수량 띄우기
	 2. item_num 받아 checkout.jsp 페이지에 상품정보 띄우기
	 
	 -  주문 완료 ==>  BuyProAction.java 에서 사용
	 	-> cart, cart_item 데이터를 buy, buy_item 에 복사, 주문일자 추가 
	 	-> cart, cart_item 테이블 삭제
	 	-> confirm_checkout.jsp 로 이동
	 
	*/
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 0.
		ActionForward forward = null;
		
		// 1.
		
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		int cart_count = Integer.parseInt(request.getParameter("cart_count")); 
		request.setAttribute("cart_count", cart_count);  // * 구매 수량 보냄
		
		
		// 2.
		ItemSingleService itemSingleService = new ItemSingleService();
		ItemBean itemBean = itemSingleService.getItem(item_num);
		request.setAttribute("itemBean", itemBean);  // * 상품 정보 보냄
		
		
		// 4. 경로지정
		forward.setPath("/shop/checkout.jsp");
		
		// 5.
		return forward;
		
	}

}
