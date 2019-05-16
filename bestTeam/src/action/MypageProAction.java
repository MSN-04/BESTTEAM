package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageProService;
import vo.ActionForward;
import vo.UserBean;

public class MypageProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean userBean = null;
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		
		if(id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 하세요!')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			MyPageProService mypageProService = new MyPageProService();
			userBean = mypageProService.getMypage(id);
			request.setAttribute("userBean", userBean);
			forward = new ActionForward();
			forward.setPath("mypage.us");
			
		}
		
		return forward;
	}

}
