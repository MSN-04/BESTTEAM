package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminPageShopDayService;
import vo.ActionForward;

public class AdminPageShopDayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (id == null || !id.equals("admin") ) {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("location.href='index.in'");
			out.println("</script>");
			return null;
		} 
		
		String month = request.getParameter("month");
//		String month = "6";
		AdminPageShopDayService adminPageShopDayService = new AdminPageShopDayService();
		List<Map<String, Integer>> salesList = adminPageShopDayService.showChart(month);
		
//		System.out.println("salesList.get(0).values() :: " + salesList.get(0).values());
		
		request.setAttribute("salesList", salesList);
		
		forward = new ActionForward();
		forward.setPath("/member/adminPageShopDay.jsp");
		
		return forward;
	}

}
