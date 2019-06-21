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
//		String id = request.getParameter("user_id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int item_num = Integer.parseInt(request.getParameter("item_num"));
//		String user_id = request.getParameter("user_id");
//		int item_num = );
//		int price = ;
//		int cart_count = ;
		
		
		cartBean = new CartBean();
		cartBean.setCart_item_num(item_num);
		cartBean.setCart_user_id(id);
		cartBean.setCart_count(Integer.parseInt(request.getParameter("quantity")));
		cartBean.setCart_price(Integer.parseInt(request.getParameter("item_price")));
		cartBean.setCart_img(request.getParameter("cart_img"));
		cartBean.setCart_item_name(request.getParameter("cart_item_name"));
		
	//	System.out.println("id :: " + id);
	//	System.out.println("item_num :: " + request.getParameter("item_num"));
	//	System.out.println("quantity :: " +request.getParameter("quantity"));
	//	System.out.println("item_price :: " +request.getParameter("item_price"));
	//	System.out.println("cart_img :: " +request.getParameter("cart_img"));
	//	System.out.println("cart_item_name :: " +request.getParameter("cart_item_name"));
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		CartInsertService cartService = new CartInsertService();
		
		boolean isSameItem = cartService.isSameItem(id, item_num);
		if (isSameItem) {
		//	System.out.println("중복 아이템 존재");
			out.println(2);
		} else {
		
			boolean isInsertSuccess = cartService.insertCart(cartBean);
			
			if(!isInsertSuccess) {
				System.out.println("장바구니등록실패");
				out.println(-1); // 오류 메세지 다이얼로그 표시
			} else {
			//	System.out.println("장바구니등록성공");
				// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
	//			forward = new ActionForward();
	//			out.println("<script>"); // 자바스크립트 시작 태그
				out.println(1); // 오류 메세지 다이얼로그 표시
	//			out.println("</script>"); // 자바스크립트 종료 태그
	//			forward.setRedirect(true);
	//			forward.setPath("cart.sh");
			}
		}
		out.close();
		return forward;
	}

}
