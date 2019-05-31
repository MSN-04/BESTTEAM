package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CheckoutFormService;
import vo.ActionForward;
import vo.BuyItemBean;
import vo.CartBean;

public class CheckoutFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CheckoutFormAction 시작");
		
		// 0.
		ActionForward forward = new ActionForward();
		
		// 1. user의 장바구니 상품 목록 - DAO에서 받아오기
		String id = (String) request.getAttribute("id");
		
		CheckoutFormService checkoutFormService = new CheckoutFormService();
		ArrayList<BuyItemBean> cartItems = checkoutFormService.getCartItems(id);
		
		// 2.
		request.setAttribute("cartItems", cartItems);
		
		// 3.
		forward.setPath("/shop/checkout.jsp");
		
		System.out.println("CheckoutFormAction 끝");
		
		// 4.
		return forward;
	}
}
