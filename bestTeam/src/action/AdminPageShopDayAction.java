package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminPageShopDayService;
import vo.ActionForward;

public class AdminPageShopDayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
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
