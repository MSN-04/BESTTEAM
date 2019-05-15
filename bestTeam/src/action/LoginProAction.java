package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginProService;
import vo.ActionForward;
import vo.UserBean;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LogionProAtion()");
		
		ActionForward forward = null;
		UserBean userBean = new UserBean();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		userBean.setUser_id(id);
		userBean.setUser_pass(password);
		
		LoginProService loginProService = new LoginProService();
		boolean isRightUser = loginProService.isRightUser(userBean);
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 틀렸습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			forward.setRedirect(true);
			forward.setPath("index.in");
		}
		
		return forward;
	}

}
