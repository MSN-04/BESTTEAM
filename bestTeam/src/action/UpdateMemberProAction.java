package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UpdateMemberProService;
import vo.ActionForward;
import vo.UserBean;

public class UpdateMemberProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		boolean isUpdateSuccess = false;
		UserBean userBean = new UserBean();
		
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		String pass = request.getParameter("pass");
		userBean.setUser_id(request.getParameter("id"));
		userBean.setUser_pass(request.getParameter("new_pass"));
		userBean.setUser_name(request.getParameter("name"));
		userBean.setUser_age(request.getParameter("age"));
		userBean.setUser_phone(request.getParameter("phone"));
		userBean.setUser_email(request.getParameter("email"));
		userBean.setUser_address(request.getParameter("address1") +" "+ request.getParameter("address2"));
		userBean.setUser_gender("남");
		userBean.setUser_post(request.getParameter("post"));
		
		UpdateMemberProService updateMemberProService = new UpdateMemberProService();
		isUpdateSuccess = updateMemberProService.setUpdate(userBean, id, pass);
		
		if(!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보 수정 실패!')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			request.setAttribute("userBean", userBean);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("MypageProAction.us");
		}
		
		return forward;
	}


}
