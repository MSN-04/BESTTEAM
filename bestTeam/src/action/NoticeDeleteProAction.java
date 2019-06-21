package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.NoticeDeleteProService;
import vo.ActionForward;

public class NoticeDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
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
		
		// 게시물 번호 파라미터 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		NoticeDeleteProService noticeDeleteProService = new NoticeDeleteProService();
		
		boolean isDeleteSuccess = noticeDeleteProService.removeArticle(notice_num);
		
		if(!isDeleteSuccess) {
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('삭제할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			forward = new ActionForward();
			forward.setPath("noticeList.no");
			forward.setRedirect(true);
		}
		
		return forward;
	}
}
