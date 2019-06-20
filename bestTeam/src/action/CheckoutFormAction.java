package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CheckoutFormService;
import svc.MyPageProService;
import vo.ActionForward;
import vo.BuyItemBean;
import vo.UserBean;

public class CheckoutFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//System.out.println();
	//	System.out.println("CheckoutFormAction 시작");
		
		// 0.
		ActionForward forward = new ActionForward();
		ArrayList<BuyItemBean> cartItems = null;
		UserBean userBean = null;
		
		// 1. 결제화면에 띄워줄 상품, user 정보 - DAO에서 받아오기
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") == null) { 
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인해주세요')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			String id = (String) session.getAttribute("id");
		//	System.out.println("id = "+id);

			// (1) user의 장바구니 상품 목록
			CheckoutFormService checkoutFormService = new CheckoutFormService();
			cartItems = checkoutFormService.getCartItems(id);
			
			
			// (2)  user의 회원정보
			MyPageProService mypageProService = new MyPageProService();
			userBean = mypageProService.getMypage(id);
			
			// 2.
			request.setAttribute("cartItems", cartItems);
			request.setAttribute("userBean", userBean);
			
			// 3.
			forward.setPath("/shop/checkout.jsp");
			
		//	System.out.println("CheckoutFormAction 끝");
			
		}
		
		// 4.
		return forward;
	}

}
