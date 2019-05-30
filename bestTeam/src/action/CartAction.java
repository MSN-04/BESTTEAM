package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartService;
import vo.ActionForward;
import vo.CartBean;
import vo.ItemBean;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartAction 시작");
		
		ActionForward forward = null;
		CartBean cartBean = null;
//		String id = request.getParameter("user_id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
//		String user_id = request.getParameter("user_id");
//		int item_num = );
//		int price = ;
//		int cart_count = ;
		
		System.out.println(request.getParameter("item_num"));
		
		cartBean = new CartBean();
		
		cartBean.setCart_item_num(Integer.parseInt(request.getParameter("item_num")));
		cartBean.setCart_user_id(id);
		cartBean.setCart_count(Integer.parseInt(request.getParameter("quantity")));
		cartBean.setPrice(Integer.parseInt(request.getParameter("item_price")) * Integer.parseInt(request.getParameter("quantity")));
		
		CartService cartService = new CartService();
		boolean isInsertSuccess = cartService.insertCart(cartBean);
		
		if(!isInsertSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('장바구니 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("cart.em?user_id=" + cartBean.getCart_user_id());
		}
		
		return forward;
	}

}
