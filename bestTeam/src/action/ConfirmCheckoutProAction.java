package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ConfirmCheckoutProService;
import vo.ActionForward;
import vo.BuyBean;
import vo.BuyItemBean;

public class ConfirmCheckoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 ConfirmCheckoutProAction ");
		
		/* 
		 * BuyDAO 에서 --> public ArrayList<BuyItemBean> getCartItems(String id) 메서드 호출하기 
		 * 
		 * */
		
		int buy_num=Integer.parseInt(request.getParameter("buy_num"));
		System.out.println("ConfirmCheckoutProAction 에서 buy_num-->"+buy_num);
		int buy_item_buy_num=(int) request.getAttribute("buy_item_buy_num");
		System.out.println("ConfirmCheckoutProAction 에서 buy_item_buy_num-->"+buy_item_buy_num);
		
		String page=request.getParameter("page");
		
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");		
		
		
		
		ArrayList<BuyItemBean> cartItems=(ArrayList<BuyItemBean>)request.getAttribute("cartItems");
		//BuyItemBean buyItemBean=request.getAttribute("BuyItemBean");
		
		
		ConfirmCheckoutProService confirmCheckoutProService=new ConfirmCheckoutProService();
		BuyBean buyArticle=confirmCheckoutProService.getBuyArticle(buy_num);
		BuyItemBean buyItemArticle=confirmCheckoutProService.getBuyItemArticle(buy_item_buy_num);
		
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("./shop/confirm_checkout.jsp");
		return forward;
	}

}
