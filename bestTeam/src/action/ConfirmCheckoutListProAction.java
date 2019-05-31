package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.BuyBean;
import vo.BuyItemBean;
import vo.UserBean;

public class ConfirmCheckoutListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*  1: mypage에서 "주문조회"를 누르면 ConfirmCheckoutListPro.sh 로 온다. 
		 *  2: user_id 로 조회해서 그 아이디에 맞는 목록들을 뽑아온다.
		 * //---> CheckoutList에 있는정보: 그 전 페이지(myPage)에서 user_id를 가져온다.
		 * 주문번호 :buy_num  ==>이걸로 상세페이지 가져옴!
		 * 상품이미지: item_img (from BuyItemBean 첫번째 것 만 가져오기)
 		 * 주문상품: item_name(from BuyItemBean 첫번째 것만 이름 가져오기) + item_count(from BuyItemBean)갯수 가져오기
		 * 주문날짜: buy_orderdate(from BuyBean)
		 * 수량: item_count(from BuyItemBean)갯수 가져오기
		 * 결제금액: buy_total(from BuyBean)총 결제금액 가져오기
		 * ---------------------------------------------
		 * 
		 * 
		 * 
		 * */
		System.out.println("ConfirmCheckoutListProAction 시작");
		ActionForward forward=null;
		BuyBean buyBean=new BuyBean();
//		BuyItemBean buyItemBean=new BuyItemBean();
		UserBean userBean=new UserBean();
		
		
		return null;
	}

}
