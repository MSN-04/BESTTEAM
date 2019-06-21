package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.JoinProService;
import svc.UpdateMemberFormService;
import vo.ActionForward;
import vo.UserBean;

public class UpdateMemberFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		UserBean userBean = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용할 수 있습니다.')");
			out.println("location.href='login.us'");
			out.println("</script>");
			return null;
		}
		
		UpdateMemberFormService updateMemberFormService = new UpdateMemberFormService();
		userBean = updateMemberFormService.getUpdateForm(id);
		
		if(userBean == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용할 수 있습니다.')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			request.setAttribute("userBean", userBean);
			
			forward = new ActionForward();
			forward.setPath("update_member.us");
		}
		
		return forward;
	}

	
}
