package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import svc.ItemModifyProService;
import vo.ActionForward;

public class ItemModifyProAction implements Action {
/* 아이템 수정 Action (<- FROM itemModifyPro.em )
 1. Session id 저장
 2. ItemModifyProService - isAdmin(id) : isRightAdmin 리턴해줌. 관리자 계정확인
 3. ItemModifyProService - modifyItem(item) : isModifySuccess 리턴해줌. 아이템정보 수정 성공 확인
 4. 아이템정보 수정 성공 시 포워딩 경로 저장 : /shop/product-single.jsp 
 5. ActionForward forward 객체 리턴
 */
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		// 1.
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// 2.
		ItemModifyProService itemModifyProService = new ItemModifyProService();
		boolean isRightAdmin = itemModifyProService.isAdmin(id);
		
		if(isRightAdmin) {
			// 패스워드 일치 확인
		}
		
		return null;
	}

}
