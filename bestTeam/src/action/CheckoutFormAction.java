package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CheckoutService;
import vo.ActionForward;
import vo.BuyItemBean;
import vo.CartBean;

public class CheckoutFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CheckoutAction 시작");
		
		// 0.
		ActionForward forward = new ActionForward();
		
		// 1. user의 장바구니 상품 목록 - DAO에서 받아오기
		String id = (String) request.getAttribute("id");
		
		CheckoutService checkoutService = new CheckoutService();
		ArrayList<BuyItemBean> cartItems = checkoutService.getCartItems(id);
		
		// 2.
		request.setAttribute("cartItems", cartItems);
		
		// 3.
		forward.setPath("/shop/checkout.jsp");
		
		System.out.println("CheckoutAction 끝");
		
		// 4.
		return forward;
	}

}
