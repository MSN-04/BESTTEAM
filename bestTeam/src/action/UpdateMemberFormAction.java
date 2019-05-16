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
		System.out.println("updateFormAction");
		ActionForward forward = null;
		UserBean userBean = null;
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		
		UpdateMemberFormService updateMemberFormService = new UpdateMemberFormService();
		userBean = updateMemberFormService.getUpdateForm(id);
		
		if(userBean == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 하세요!')");
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
