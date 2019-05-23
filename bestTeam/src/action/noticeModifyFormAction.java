package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.noticeViewService;
import svc.noticeViewService;
import vo.ActionForward;
import vo.noticeBean;

public class noticeModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeModifyFormAction");
		
		ActionForward forward = new ActionForward();
		
		// URL 에 전달된 notice_num 파라미터 가져와서 int 타입 변수 notice_num 에 저장 => String -> int 형변환 필요
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// noticeDetailService 클래스의 getArticle() 메서드를 사용하여 원본글 가져와서 noticeBean 에 저장
		noticeViewService NoticeDetailService = new noticeViewService();
		noticeBean article = NoticeDetailService.getArticle(notice_num);
		
		// request 객체에 noticeBean 객체(article) 저장
		request.setAttribute("article", article);
		
		// ActionForward 객체의 setPath() 메서드를 사용하여 포워딩 경로를 "/notice/qna_notice_modify.jsp" 로 지정
		forward.setPath("./notice/notice_modify.jsp");
		
		return forward;
	}

}
