package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartInsertService;
import vo.ActionForward;
import vo.CartBean;

public class CartInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//	System.out.println("CartInsertAction 시작");
		
		ActionForward forward = null;
		CartBean cartBean = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (id == null ) {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("location.href='index.in'");
			out.println("</script>");
			return null;
		} 
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		
		
		cartBean = new CartBean();
		cartBean.setCart_item_num(item_num);
		cartBean.setCart_user_id(id);
		cartBean.setCart_count(Integer.parseInt(request.getParameter("quantity")));
		cartBean.setCart_price(Integer.parseInt(request.getParameter("item_price")));
		cartBean.setCart_img(request.getParameter("cart_img"));
		cartBean.setCart_item_name(request.getParameter("cart_item_name"));
		
		CartInsertService cartService = new CartInsertService();
		
		boolean isSameItem = cartService.isSameItem(id, item_num);
		if (isSameItem) {
			out.println(2);
		} else {
		
			boolean isInsertSuccess = cartService.insertCart(cartBean);
			
			if(!isInsertSuccess) {
				out.println(-1); // 오류 메세지 다이얼로그 표시
			} else {
				// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
				out.println(1); // 오류 메세지 다이얼로그 표시
			}
		}
		out.close();
		return forward;
	}

}
