package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartService;
import vo.ActionForward;
import vo.CartBean;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		System.out.println("CartAction");
		ArrayList<CartBean> cartList = new ArrayList<>();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		CartService cartService = new CartService();
		cartList = cartService.cartList(id);
		
		request.setAttribute("cartList", cartList);
		
		forward = new ActionForward();
		forward.setPath("/shop/cart.jsp");
		
		return forward;
	}

}
