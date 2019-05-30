package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;
import vo.BuyBean;
import vo.BuyItemBean;
import vo.UserBean;

public class ConfirmCheckoutProAction implements Action {
	
	//------ CheckoutList에서  해당 게시물을 클릭하면  ---> ConfirmCheckoutProAction으로 온다.
	
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ConfirmCheckoutProAction 시작");
		ActionForward forward=null;
		BuyItemBean buyItemBean=null;
		BuyBean buyBean=null;
		UserBean userBean=null;
		
		int buy_num=buyBean.getBuy_num();
		
		
		
		
		
		
		return null;
	}

}
