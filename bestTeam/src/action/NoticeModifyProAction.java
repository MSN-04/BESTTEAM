package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeModifyProService;
import svc.NoticeViewService;
import vo.ActionForward;
import vo.BlogBean;
import vo.NoticeBean;

public class NoticeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("noticeModifyProAction");
		
		ActionForward forward = new ActionForward();
		  
		// 파라미터로 전달된 글번호(notice_num) 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// noticeModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호 전달)
		NoticeModifyProService noticeModifyProService = new NoticeModifyProService();
		
		
		NoticeBean article = new NoticeBean();
		article.setNotice_num(notice_num);
		article.setNotice_subject(request.getParameter("notice_subject"));
		article.setNotice_content(request.getParameter("notice_content"));
		article.setNotice_writer(request.getParameter("notice_writer"));
		article.setNotice_file(request.getParameter("notice_file"));
		
		boolean isModifySuccess = noticeModifyProService.modifyArticle(article);
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('수정 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
		//	System.out.println("글 수정 성공!");
			forward=new ActionForward();
			// noticeDetail.no 서블릿 주소로 포워딩 => 주소 뒤에 파라미터로 글번호 전달 => Redirect 방식
			forward.setPath("noticeDetail.no?notice_num=" + notice_num + "&page=1");
			forward.setRedirect(true);
		}
		
//	}
		return forward;
	}

}


