package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.NoticeViewService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("NoticeModifyFormAction");
		
		ActionForward forward = new ActionForward();
		
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
		
		// URL 에 전달된 notice_num 파라미터 가져와서 int 타입 변수 notice_num 에 저장 => String -> int 형변환 필요
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		
		// noticeDetailService 클래스의 getArticle() 메서드를 사용하여 원본글 가져와서 noticeBean 에 저장
		NoticeViewService noticeDetailService = new NoticeViewService();
		NoticeBean article = noticeDetailService.getArticle(notice_num);
		
		// request 객체에 noticeBean 객체(article) 저장
		request.setAttribute("article", article);
		
		// ActionForward 객체의 setPath() 메서드를 사용하여 포워딩 경로를 "/notice/qna_notice_modify.jsp" 로 지정
		forward.setPath("./notice/notice_modify.jsp");
		
		return forward;
	}

}
