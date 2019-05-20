package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.Out;

import svc.ItemModifyProService;
import vo.ActionForward;
import vo.UserBean;

public class ItemModifyProAction implements Action {
/* 아이템 수정 Action (<- FROM itemModifyPro.em )
 1. Session id 받아 userBean에 저장
 2. 수정확인 팝업창 띄우기
 2. ItemModifyProService - isAdmin(id) : isRightAdmin 리턴해줌. 관리자 계정확인
 3. ItemModifyProService - modifyItem(item) : isModifySuccess 리턴해줌. 아이템정보 수정 성공 확인
 4. 아이템정보 수정 성공 시 포워딩 경로 저장 : /shop/product-single.jsp 
 5. ActionForward forward 객체 리턴
 */
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemModifyProAction 시작");
		
		ActionForward forward = null;
		
		// 1.
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("id");
		System.out.println("sessionId : "+ sessionId);
		
		UserBean userBean = new UserBean();
		userBean.setUser_id(sessionId);

		// 2.
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		
		
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		
		// 2.
		ItemModifyProService itemModifyProService = new ItemModifyProService();
		boolean isAdmin = itemModifyProService.isAdmin(sessionId);
		
		if(isAdmin) {
			// 패스워드 일치 확인
			
		}
		
		return null;
	}

}
