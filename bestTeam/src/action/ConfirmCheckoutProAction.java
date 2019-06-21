package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyDAO;
import svc.ConfirmCheckoutListService;
import svc.ConfirmCheckoutProService;
import vo.ActionForward;
import vo.BuyBean;
import vo.BuyItemBean;



public class ConfirmCheckoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward=new ActionForward();
	
		ArrayList<BuyItemBean> orderInfoList=new ArrayList<BuyItemBean>();
		ArrayList<BuyBean> orderPersonList=new ArrayList<BuyBean>();
		int buy_num=Integer.parseInt(request.getParameter("buy_num"));
		
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");		
		
	//	System.out.println("action ->buy_num:"+buy_num);
		
	
				
		if(id==null){ //id 가 없을 때,
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('로그인 해 주세요')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 	
			
		}else {
			ConfirmCheckoutProService confirmCheckoutProService=new ConfirmCheckoutProService();
		//buyList=confirmCheckoutListService.selectConfirmCheckoutList(id);
	
		 orderInfoList= confirmCheckoutProService.getOrderInfoList(buy_num);
		 orderPersonList=confirmCheckoutProService.getOrderPersonList(id);
		
		
		
		request.setAttribute("orderInfoList", orderInfoList);
		request.setAttribute("orderPersonList",orderPersonList);  //buyList에 서비스에서 가져온걸 저장.
		forward.setPath("/shop/confirm_checkout.jsp");
	//	forward.setRedirect(true); // Redirect 방식
				
		}
		return forward;
	
		
	}

}
