package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemSingleService;
import svc.ReviewService;
import vo.ActionForward;
import vo.ItemBean;

public class ReviewProAction implements Action {

/*  DB에서 꺼낸 아이템 정보를 전달받아 product-single 페이지로 이동하는 Action (<- FROM itemSingle.em )
 1. url로 전달된 item_num 받기
 2. ItemSingleService - getItem() : 아이템 정보 꺼내서 ItemBean article 객체에 저장
 3. request 객체에 article 저장
 4. 포워딩 경로 지정  :  /shop/product-single.jsp
 5. ActionForward forward 객체 리턴
*/
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ItemSingleAction 시작");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (id == null) {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("location.href='index.in'");
			out.println("</script>");
			return null;
		} 
		
		// 1.
		int item_num = Integer.parseInt(request.getParameter("item_num"));
//		System.out.println(item_num);
		
		// 2.
		ReviewService reviewService = new ReviewService();
		ItemBean itemBean = reviewService.getItem(item_num);
		
		// 3.
		request.setAttribute("itemBean", itemBean);
			
		// 4.
		forward.setPath("./shop/reviewWriteForm.jsp");
		
		
		// 5.
		return forward;
	}

}
