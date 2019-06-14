package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminPageShopMonthService;
import vo.ActionForward;

public class AdminPageShopMonthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
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
