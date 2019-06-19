package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AdminPageItemDeleteService;
import svc.CartDeleteService;
import svc.ItemDeleteProService;
import vo.ActionForward;

public class AdminPageItemDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;
		
		String list1 = request.getParameter("item_num_list");
		String list2 = request.getParameter("item_favor_num_list");
		String[] itemList1 = list1.split(",");
		String[] itemList2 = list2.split(",");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		AdminPageItemDeleteService adminPageItemDeleteService = new AdminPageItemDeleteService();
		boolean isDeleted = adminPageItemDeleteService.deleteItemList(itemList1, itemList2);
		
		if (isDeleted) {
			out.println("0"); // 성공
		} else { 
			out.println("-1"); // 실패
		}
		
		return forward;
		
	}

}
