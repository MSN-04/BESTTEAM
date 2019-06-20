package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShopMainService;
import vo.ActionForward;
import vo.ItemBean;
import vo.PageInfo;

public class BestSellerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

ActionForward forward = null;
		
		ArrayList<ItemBean> itemList = new ArrayList<>(); 
		
		String taste = "all";
		String filter = "popular";
		int degree = 1;
		
		// 리스트 개수
		ShopMainService shopMainService = new ShopMainService();
		int listCount = shopMainService.getListCount(taste, degree);

		// 총 리스트 받아옴
		itemList = shopMainService.getItemList(1, 4, taste, filter, degree);

		request.setAttribute("itemList", itemList);
		
		forward = new ActionForward();
		forward.setPath("./index/index.jsp");
		
		return forward;
	}

}
