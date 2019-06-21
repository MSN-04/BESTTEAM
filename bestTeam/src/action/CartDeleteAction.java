package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CartDeleteService;
import vo.ActionForward;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
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
		String list = request.getParameter("list");
//		System.out.println("id :: " + id);
//		System.out.println("list :: " + list);
		String[] itemList = list.split(",");
		
		if (id != null) {
			CartDeleteService cartDeleteService = new CartDeleteService();
			boolean isDeleted = cartDeleteService.deleteCart(id, itemList);
			if (isDeleted) {
				out.println("0");
			} else {
				out.println("-1");
			}
		} else {
			out.println("-1");
		}
		
		return forward;
	}

}
