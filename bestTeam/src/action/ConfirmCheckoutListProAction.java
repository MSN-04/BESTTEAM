package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyDAO;
import svc.ConfirmCheckoutListService;
import vo.ActionForward;
import vo.BuyBean;
import vo.PageInfo;
import vo.UserBean;

public class ConfirmCheckoutListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*  1: mypage에서 "주문조회"를 누르면 ConfirmCheckoutListProAction.sh 로 온다. 
		 *  2: user_id 로 조회해서 그 아이디에 맞는 목록들을 뽑아온다.
		 * //---> CheckoutList에 있는정보: 그 전 페이지(myPage)에서 user_id를 가져온다.
		 * 주문번호 :buy_num  ==>이걸로 상세페이지 가져옴!
 		 * 주문상품: buy_name(from BuyBean 첫번째 것만 이름 가져오기) 
		 * 주문날짜: buy_date(from BuyBean)
		 * 수량: buy_count (from BuyBean)
		 * 결제금액: buy_total(from BuyBean)총 결제금액 가져오기
		 * ---------------------------------------------
		 * */
//		System.out.println("ConfirmCheckoutListProAction 시작");
		ActionForward forward=new ActionForward();
		BuyBean buyBean=new BuyBean();	
		ArrayList<BuyBean> buyList=new ArrayList<BuyBean>();

		
//		session.setAttribute("buy_num", buyBean.getBuy_num());
//		int buy_num=(int) session.getAttribute("buy_num");  
//		int buy_num=buyBean.getBuy_num();     
		
		HttpSession session = request.getSession();
		String user_id=(String) session.getAttribute("id");		
		
		//System.out.println("action ->user_id:"+user_id);
		
		
		String pageS= request.getParameter("page");
		int page = 1;
		if (pageS != null) {
			page = Integer.parseInt(pageS);
		}
		int limit = 5;

				
		if(user_id==null){ //id 가 없을 때,
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('로그인 해 주세요')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 	

			
		}else {
		
			buyBean.setBuy_user_id(user_id);
		
			//	System.out.println("buyBean에 user_id 저장-->"+user_id);
			ConfirmCheckoutListService confirmCheckoutListService=new ConfirmCheckoutListService();
			buyList=confirmCheckoutListService.selectConfirmCheckoutList(user_id, page, limit);
		
			int listCount= confirmCheckoutListService.getBuyListCount(user_id);
			
			// 페이지 계산
			int maxPage = (int)((double)listCount / limit + 0.95); 
			int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1; 
			int endPage = startPage + 10 - 1; 
			
			if(endPage > maxPage) {
				endPage = maxPage; 
			}
			
			// 페이지 번호 관련 정보를 PageInfo 객체에 저장
			PageInfo pageInfo = new PageInfo();
			pageInfo.setPage(page);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setLimit(limit);
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("buyList",buyList);  //buyList에 서비스에서 가져온걸 저장.
			forward.setPath("/shop/confirmCheckoutList.jsp");
		//	forward.setRedirect(true); // Redirect 방식
				
		}
		return forward;
	
		
	}

}
