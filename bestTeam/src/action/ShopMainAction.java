package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShopMainService;
import vo.ActionForward;
import vo.ItemBean;
import vo.PageInfo;

public class ShopMainAction implements Action {
 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		ArrayList<ItemBean> itemList = new ArrayList<>(); 
		int page = 1;
		int limit = 8;
		String taste = "all";
		String filter = "newest";
		int degree = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("taste") != null) {
			taste = request.getParameter("taste");
		}
		if (request.getParameter("filter") != null) {
			filter = request.getParameter("filter");
		}
		if (request.getParameter("degree") != null) {
			degree = Integer.parseInt(request.getParameter("degree"));
		}
		
		// 리스트 개수
		ShopMainService shopMainService = new ShopMainService();
		int listCount = shopMainService.getListCount(taste, degree);
		System.out.println("listCount : " + listCount);


		// 총 리스트 받아옴
		itemList = shopMainService.getItemList(page, limit, taste, filter, degree);
		
//		System.out.println("page : " + page);
//		System.out.println("limit : " + limit);
//		System.out.println("taste : " + taste);
//		System.out.println("filter : " + filter);
//		System.out.println("degree : " + degree);
//		System.out.println("itemList.size() : " + itemList.size());

		int maxPage = (listCount / limit) + 1;
		if (listCount % limit == 0) maxPage--;
//		int maxPage = (int)((double)listCount / limit+0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + limit - 1;
		
//		System.out.println("startPage :::: " + startPage);
//		System.out.println("maxPage :::: " + maxPage);
//		System.out.println("endPage :::: " + endPage);
		
		
		if (endPage > maxPage) endPage = maxPage;
		
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("itemList", itemList);
		
		forward = new ActionForward();
		forward.setPath("/shop/shop.jsp");
//		forward.setPath("/shop/shopTest.jsp");
		
		return forward;
	}

}
