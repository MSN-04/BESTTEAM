package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.noticeModifyProService;
import vo.ActionForward;
import vo.noticeBean;

public class noticeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeModifyProAction");
		
		// ActionForward 선언
		ActionForward forward = null;
		  
		// 파라미터로 전달된 글번호(notice_num) 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// noticeModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호 전달)
		noticeModifyProService NoticeModifyProService = new noticeModifyProService();
//		boolean isRightUser = NoticeModifyProService.isArticleWriter(notice_num);
				
//		System.out.println("isRightUser = " + isRightUser);
		
		// 패스워드 일치 여부 판별		
//		if(!isRightUser) {
			// 패스워드가 일치하지 않을 경우
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("alert('수정할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
//			out.println("history.back()"); // 이전 페이지로 돌아가기
//			out.println("</script>"); // 자바스크립트 종료 태그
//		} else {
			// 패스워드가 일치할 경우
			// noticeBean 객체 생성 후 글번호, 글제목, 글내용 저장
			// noticeModifyService 클래스의 modifyArticle() 메서드를 호출하여 글 수정 작업 수행(매개변수로 noticeBean 객체 전달) - boolean 타입 리턴
			noticeBean article = new noticeBean();
			article.setNotice_num(notice_num);
			article.setNotice_subject(request.getParameter("notice_subject"));
			article.setNotice_content(request.getParameter("notice_content"));
			
			boolean isModifySuccess = NoticeModifyProService.modifyArticle(article);
			
			// 글 수정 성공 여부 판별
			if(!isModifySuccess) {
				// 글 수정 실패 시 자바스크립트를 사용하여 "수정 실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('수정 실패!')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
				System.out.println("글 수정 성공!");
				// 글 수정 성공 시
				forward = new ActionForward();
				// noticeDetail.bo 서블릿 주소로 포워딩 => 주소 뒤에 파라미터로 글번호(notice_num) 전달 => Redirect 방식
				forward.setPath("noticeDetail.bo?notice_num=" + notice_num + "&page=1");
				forward.setRedirect(true);
			}
			
		
		
		return forward;
	}

}





















