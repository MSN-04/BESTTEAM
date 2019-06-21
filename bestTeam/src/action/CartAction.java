package action;

import java.io.PrintWriter;
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
		ArrayList<CartBean> cartList = new ArrayList<>();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (id == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용할 수 있습니다.')");
			out.println("location.href='login.us'");
			out.println("</script>");
		}
		
		CartService cartService = new CartService();
		cartList = cartService.cartList(id);
		
		request.setAttribute("cartList", cartList);
		
		forward = new ActionForward();
		forward.setPath("/shop/cart.jsp");
		
		return forward;
	}

}
