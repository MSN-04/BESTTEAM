package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageProService;
import vo.ActionForward;
import vo.BuyBean;
import vo.UserBean;

public class BuyCheckboxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/* buy.sh (checkout.jsp) 에서 회원정보입력 체크박스 선택시 
		   => 세션에서 user_id 받아 유저 정보 띄우기  
		 */
		
		
		// 0.
		ActionForward forward = null;
				
		int userChecked = Integer.parseInt(request.getParameter("userChecked"));  // 배송정보 회원정보 입력 체크 여부
		
		// 1. 회원정보입력 체크박스 선택 (O)
		if(userChecked > 0) {  
			HttpSession session = request.getSession();
			
			if(session.getAttribute("id") != null) {
				String id = session.getAttribute("id").toString();
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요합니다')");
				out.println("history.back()");
				out.println("</script>");
				
			} else {  // 로그인 되어 있을 때
				String id = session.getAttribute("id").toString();
				
				MyPageProService mypageProService = new MyPageProService();
				UserBean userBean = mypageProService.getMypage(id); 
				
				request.setAttribute("userBean", userBean);  // * 구매자 정보 보냄
			}
			
		} 
//		else { // 2. 회원정보입력 체크박스 선택 (X) : 배송정보(주소, 연락처), 결제정보 form으로 입력받기 ==>  BuyProAction.java 에서 사용
//			
//			BuyBean buyBean = new BuyBean();
//			String buy_address = request.getParameter("address1") + " " + request.getParameter("address2");
//			
//			buyBean.setBuy_name(request.getParameter("name"));
//			buyBean.setBuy_phone(request.getParameter("phone"));
//			buyBean.setBuy_phone2(request.getParameter("phone2"));
//			buyBean.setPost( request.getParameter("post"));
//			buyBean.setBuy_address(buy_address);
//			// ** 새로운 배송정보 저장
//		}
		
		// 3. 경로지정
		forward = new ActionForward();
		forward.setPath("/shop/checkout.jsp");
		
		// 4.
		return forward;
	}

}
