package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ConfirmCheckoutListService;
import vo.ActionForward;
import vo.BuyBean;

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
		 * 
		 * 
		 * 
		 * */
		System.out.println("ConfirmCheckoutListProAction 시작");
		ActionForward forward=new ActionForward();
		BuyBean buyBean=new BuyBean();
		int buy_num=buyBean.getBuy_num();
		System.out.println("buy_num:"+buy_num);
		//BuyItemBean buyItemBean=new BuyItemBean();
		UserBean userBean=new UserBean();
		String user_id=userBean.getUser_id();
		System.out.println("user_id:"+user_id);
		UserBean myPage = (UserBean)request.getAttribute("userBean");
		System.out.println("mypage의 user_id:"+myPage.getUser_id());
		ArrayList<BuyBean> articleList=new ArrayList<BuyBean>();
				
		if(!user_id.equals(request.getAttribute(myPage.getUser_id()))){ //id 가 mypage의 아이디와 같지 않으면
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('본인만 조회 가능합니다.')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 	

		}else {// 서비스에서 confirmCheckoutListService 가져온다.
		ConfirmCheckoutListService confirmCheckoutListService=new ConfirmCheckoutListService();
		articleList=confirmCheckoutListService.selectConfirmCheckoutList(buy_num, user_id);
		request.setAttribute("articleList",articleList);  //articleList에 서비스에서 가져온걸 저장.
		
		
		forward.setPath("./confirmCheckoutList.sh");
		forward.setRedirect(true); // Redirect 방식
				
		}
		return forward;
	
		
	}

}
