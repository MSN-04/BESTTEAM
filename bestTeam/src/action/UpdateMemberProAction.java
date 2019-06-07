package action;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UpdateMemberProService;
import vo.ActionForward;
import vo.UserBean;

public class UpdateMemberProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updatememberProAction");
		ActionForward forward = null;
		
		boolean isUpdateSuccess = false;
		UserBean userBean = new UserBean();
		
		HttpSession session = request.getSession();
		
		String age = Integer.toString(((Calendar.getInstance().get(Calendar.YEAR)-(Integer.parseInt(request.getParameter("jumin1").substring(0, 2))))+1)%100);
		System.out.println(age);
		String id = session.getAttribute("id").toString();
//		String pass = request.getParameter("pass");
		userBean.setUser_id(request.getParameter("id"));
		userBean.setUser_pass(request.getParameter("pass2"));
		userBean.setUser_name(request.getParameter("name"));
		userBean.setUser_age(age);
		userBean.setUser_phone(request.getParameter("phone"));
		userBean.setUser_email(request.getParameter("email"));
		userBean.setUser_address(request.getParameter("address1") +" : "+ request.getParameter("address2"));
		userBean.setUser_gender("남");
		userBean.setUser_post(request.getParameter("post"));
		System.out.println("1");
		UpdateMemberProService updateMemberProService = new UpdateMemberProService();
		isUpdateSuccess = updateMemberProService.setUpdate(userBean, id);
		
		System.out.println("2");
		System.out.println(isUpdateSuccess);
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
			forward.setPath("Mypage.us");
		}
		
		return forward;
	}


}
