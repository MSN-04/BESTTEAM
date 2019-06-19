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
			out.println("alert('로그인 할 수 없습니다')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 되었습니다')");
			out.println("location.href = document.referrer;");
			out.println("</script>");
			
		}
		return null;
	}

}
