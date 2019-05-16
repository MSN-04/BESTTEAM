package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.JoinProService;
import vo.ActionForward;
import vo.UserBean;

public class JoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("JoinProAction");
		ActionForward forward = null;
		boolean isJoinSuccess = false;
		UserBean userBean = new UserBean();
		
		userBean.setUser_id(request.getParameter("id"));
		userBean.setUser_pass(request.getParameter("pass"));
		userBean.setUser_name(request.getParameter("name"));
		userBean.setUser_age(request.getParameter("age"));
		userBean.setUser_phone(request.getParameter("phone"));
		userBean.setUser_email(request.getParameter("email"));
		userBean.setUser_address(request.getParameter("address1") +" "+ request.getParameter("address2"));
		userBean.setUser_gender("남");
		userBean.setUser_post(request.getParameter("post"));
		
		JoinProService joinProService = new JoinProService();
		isJoinSuccess = joinProService.setJoin(userBean);
		
		if(!isJoinSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("login.us");
		}
		
		
		return forward;
	}

}
