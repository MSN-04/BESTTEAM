package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.noticeDeleteProService;
import vo.ActionForward;

public class noticeDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeDeleteProAction");
		
		// ActionForward 인스턴스 생성
		ActionForward forward = null;
		
		// 게시물 번호 파라미터 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// noticeDeleteProService 객체 생성 후 isArticleWriter() 메서드를 호출하여 본인 확인(파라미터로 글번호, 입력받은 패스워드 전달)
		noticeDeleteProService noticeDeleteProService = new noticeDeleteProService();
		boolean isRightUser = noticeDeleteProService.isArticleWriter(notice_num, request.getParameter("notice_pass"));
		
		// 본인 확인 결과 판별
		if(!isRightUser) {
			// 본인이 아닐 경우 자바스크립트를 사용하여 "삭제할 권한이 없습니다." 출력 후 이전 페이지
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('삭제할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// 본인일 경우 noticeDeleteProService 클래스의 removeArticle() 메서드를 호출하여 글 삭제 수행(매개변수로 글번호 전달) - boolean 타입 리턴
			boolean isDeleteSuccess = noticeDeleteProService.removeArticle(notice_num);
			
			// 글 삭제 여부 판별
			if(!isDeleteSuccess) {
			// 실패 시 자바스크립트 - "삭제실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('삭제할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
			// 성공 시 ActionForward 객체 생성, "noticeList.bo" 로 포워딩 시 파라미터로 page(form 태그 hidden 으로 전달된 파라미터) 전달
				forward = new ActionForward();
				forward.setPath("noticeList.no?page=" + request.getParameter("page"));
				forward.setRedirect(true);
			
		}
		
	}

		return forward;
	}
}
