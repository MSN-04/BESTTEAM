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
		System.out.println("세션id : " + id);
		
//		String name = request.getParameter("name");
//		String phone = request.getParameter("phone");
//		String phone2 = request.getParameter("phone2");
//		String postcode = request.getParameter("postcode");
//		String address = request.getParameter("address");
//		String detailAddress = request.getParameter("detailAddress");
//		String Email = request.getParameter("Email");
//		String shipnum = "123"; // 아직 구현되지 않음
//		Date buydate = new Date(System.currentTimeMillis()); // 고민중..
//		int total = Integer.parseInt(request.getParameter("total"));
		
		String name = "홍길동";
		String phone = "01012345678";
		String phone2 = "01043219876";
		String postcode = "12345";
		String address = "붉은 길 위에 동전 하나";
		String detailAddress = "그건바로 홍길동전";
		String Email = "hongGil@mail.com";
		String shipnum = "1345121";
		Date buydate = new Date(System.currentTimeMillis());
		int total = 50000;
		
		BuyBean buyBean = new BuyBean(id, name, address + detailAddress, phone, phone2, buydate, shipnum, postcode, Email, total );
		
		CheckoutProService checkoutProService = new CheckoutProService();
		boolean isInsertSuccess = checkoutProService.insertBuy(buyBean);
		
		if (isInsertSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("MypageProAction.us"); // mypage.us로 수정해야함
		} else {
			out.println("<script>");
			out.println("alert('오류가 발생하였습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		System.out.println("CheckoutProAction");
		
		return forward;
	}

}
