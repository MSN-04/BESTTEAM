package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import vo.ActionForward;
import vo.BuyBean;

public class CheckoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		PrintWriter out = response.getWriter();
		if (id == null) {
			out.println("<script>");
			out.println("alert('올바른 접근이 아닙니다!')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
		System.out.println("세션id : " + id);
		
		
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("mypage.us");
		
		System.out.println("CheckoutProAction");
		
		return forward;
	}

}
