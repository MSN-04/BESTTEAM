package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaWriteFormService;
import svc.QnaWriteProService;
import svc.ReviewWriteFormService;
import vo.ActionForward;
import vo.UserBean;

public class ReviewWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		UserBean userBean = new UserBean();
		String id = "";
		HttpSession session = request.getSession();
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		 
		
		if(session.getAttribute("id")==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인하세요')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			id = session.getAttribute("id").toString();
		}
		
		ReviewWriteFormService reviewWriteFormService = new ReviewWriteFormService();
		userBean = reviewWriteFormService.getUserInfo(id);
		if(userBean == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보를 가져오지 못했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			request.setAttribute("userBean", userBean);
			forward = new ActionForward();
			forward.setPath("/shop/qna_write2.jsp?item_num="+item_num);
		}
		
		return forward;
	}

}
