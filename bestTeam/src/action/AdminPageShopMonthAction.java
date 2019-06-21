package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminPageShopMonthService;
import vo.ActionForward;

public class AdminPageShopMonthAction implements Action {

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
		
		String year = request.getParameter("year");
//		String year = "2019";
		AdminPageShopMonthService adminPageShopMonthService = new AdminPageShopMonthService();
		List<Map<String, Integer>> salesList = adminPageShopMonthService.showChart(year);
		
//		System.out.println("salesList.get(0).values() :: " + salesList.get(0).values());
		
		request.setAttribute("salesList", salesList);
		
		forward = new ActionForward();
		forward.setPath("/member/adminPageShopMonth.jsp");
		
		return forward;
	}

}
