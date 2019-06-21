package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartUpdateService;
import vo.ActionForward;

public class CartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String item_num = request.getParameter("item_num");
		String cart_count = request.getParameter("cart_count");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (item_num != null && id != null && cart_count != null) {
			CartUpdateService cartUpdateService = new CartUpdateService();
			boolean isUpdateSuccess = cartUpdateService.updateCart(id, Integer.parseInt(item_num), Integer.parseInt(cart_count));
			if (isUpdateSuccess) {
			//	System.out.println("CartUpdateAction 성공");
				out.println("<script>");
				out.println("var con = confirm('장바구니가 수정되었습니다.\\n장바구니로 이동하시겠습니까?')");
//				out.println("confirm('장바구니가 수정되었습니다.\n장바구니로 이동하시겠습니까?')");
				out.println("if (con) {location.href='cart.sh';} else { history.back(); };");
			//	System.out.println("c");
//				out.println("history.back()");
				out.println("</script>");
//				forward = new ActionForward();
//				forward.setPath("cart.sh");
//				forward.setRedirect(true);
				
			} else {
				out.println("<script>");
				out.println("alert('업데이트에 오류가 발생하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		out.close();
		
		return forward;
	}

}
