package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaWriteFormService;
import svc.QnaWriteProService;
import svc.ReviewService;
import svc.ReviewWriteFormService;
import vo.ActionForward;
import vo.ItemBean;
import vo.UserBean;

public class ReviewWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		UserBean userBean = new UserBean();
		ItemBean itemBean = new ItemBean();
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
		ReviewService reviewService = new ReviewService();
		userBean = reviewWriteFormService.getUserInfo(id);
		itemBean = reviewService.getItem(item_num);
		if(userBean == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보를 가져오지 못했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			request.setAttribute("userBean", userBean);
			request.setAttribute("itemBean", itemBean);
			forward = new ActionForward();
			forward.setPath("/shop/reviewWriteForm.jsp?item_num="+item_num);
		//	System.out.println("리뷰롸이트액션끝");
		}
		
		return forward;
	}

}
