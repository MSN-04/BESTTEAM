package action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CheckoutProService;
import vo.ActionForward;
import vo.BuyBean;

public class CheckoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (id == null) {
			out.println("<script>");
			out.println("alert('올바른 접근이 아닙니다!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;
		}
//		System.out.println("세션id : " + id);
		
		String buyer_name = request.getParameter("buyer_name");
		String buyer_phone = request.getParameter("buyer_phone");
		String buyer_phone2 = request.getParameter("buyer_phone2");
		String buyer_postcode = request.getParameter("buyer_postcode");
		String buyer_address = request.getParameter("buyer_address");
		String buyer_detailAddress = request.getParameter("buyer_detailAddress");
		String buyer_Email = request.getParameter("buyer_Email");
		
//		String shipnum = "123"; // 아직 구현되지 않음
//		Date buydate = new Date(System.currentTimeMillis()); // 고민중..
//		int total = Integer.parseInt(request.getParameter("total"));
		
//		System.out.println("buyer_name :: " + buyer_name);
//		System.out.println("buyer_phone :: " + buyer_phone);
//		System.out.println("buyer_phone2 :: " + buyer_phone2);
//		System.out.println("buyer_postcode :: " + buyer_postcode);
//		System.out.println("buyer_address :: " + buyer_address);
//		System.out.println("buyer_detailAddress :: " + buyer_detailAddress);
//		System.out.println("buyer_Email :: " + buyer_Email);
//		
		
		String imp_uid = request.getParameter("imp_uid");
		String paid_amount = request.getParameter("paid_amount"); // 결제금액
		String status = request.getParameter("status");
		String orderName = request.getParameter("orderName");
		String orderNum = request.getParameter("merchant_uid");
//		
//		System.out.println("imp_uid :: " + imp_uid);
//		System.out.println("merchant_uid :: " + orderNum);
//		System.out.println("paid_amount :: " + paid_amount);
//		System.out.println("status :: " + status);
//		System.out.println("orderName :: " + orderName);
//		
//		System.out.println("");
		
//		String name = "홍길동";
//		String phone = "01012345678";
//		String phone2 = "01043219876";
//		String postcode = "12345";
//		String address = "붉은 길 위에 동전 하나";
//		String detailAddress = "그건바로 홍길동전";
//		String Email = "hongGil@mail.com";
		String shipnum = "1345121";
		Date buydate = new Date(System.currentTimeMillis());
		int total = Integer.parseInt(paid_amount);
		
		BuyBean buyBean = new BuyBean(id, buyer_name, buyer_address + buyer_detailAddress, 
				buyer_phone, buyer_phone2, buydate, shipnum, buyer_postcode, buyer_Email, total, orderNum );
		
		CheckoutProService checkoutProService = new CheckoutProService();
		boolean isInsertSuccess = checkoutProService.insertBuy(buyBean);
		
		if (isInsertSuccess) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("MypageProAction.us"); // mypage.us로 수정해야함
		} else {
			out.println("<script>");
			out.println("alert('오류가 발생하였습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
//		System.out.println("CheckoutProAction");
		
		return forward;
	}

}
