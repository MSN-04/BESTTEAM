package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ForgotAccountProService;
import vo.ActionForward;

public class ForgotAccountProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println("action에서: "+phone);
		ForgotAccountProService forgotAccountProService = new ForgotAccountProService();
		String getId = forgotAccountProService.getId(email,phone);
		request.setAttribute("id", getId);
		
		
		if(getId!=null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원님의 아이디는"+getId+" 입니다')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 아이디가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("ForgotAccount.us");
		}
		return forward;
	}

}
