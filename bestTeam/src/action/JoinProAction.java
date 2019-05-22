package action;

import java.io.PrintWriter;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.util.resources.cldr.aa.CalendarData_aa_ER;
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
		
		// 성별 계산
		String gender = "";
		int jumin2 = Integer.parseInt(request.getParameter("jumin2"));
		int sex = jumin2/1000000;
		if(sex%2==0) {
			gender="여";
		}else {
			gender="남";
		}
		
		// 나이 계산
		int year = Integer.parseInt(request.getParameter("jumin1"));
		year = year/10000;
		int age2 = (((Calendar.getInstance().get(Calendar.YEAR)-year)%100)+1);
		String age = Integer.toString(age2);
		
		
		System.out.println(age + " " + gender);
		userBean.setUser_id(request.getParameter("id"));
		userBean.setUser_pass(request.getParameter("pass"));
		userBean.setUser_name(request.getParameter("name"));
		userBean.setUser_age(age);
		userBean.setUser_gender(gender);
		userBean.setUser_address(request.getParameter("address1") +" "+ request.getParameter("address2"));
		userBean.setUser_phone(request.getParameter("phone"));
		userBean.setUser_email(request.getParameter("email"));
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
