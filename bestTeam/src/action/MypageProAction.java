package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageProService;
import vo.ActionForward;
import vo.FavorBean;
import vo.UserBean;

public class MypageProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean userBean = null;
		FavorBean favorBean = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 하세요!')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			String id = session.getAttribute("id").toString();
			MyPageProService mypageProService = new MyPageProService();
			userBean = mypageProService.getMypage(id);
			request.setAttribute("userBean", userBean);
			favorBean = mypageProService.getMyFavor(id);
			request.setAttribute("favorBean", favorBean);
			
			forward = new ActionForward();
			forward.setPath("./member/mypage.jsp");
			
		}
		
		return forward;
	}

}
