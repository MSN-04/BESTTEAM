package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.noticeModifyProService;
import svc.noticeViewService;
import vo.ActionForward;
import vo.noticeBean;

public class noticeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeModifyProAction");
		
		ActionForward forward = new ActionForward();
		  
		// 파라미터로 전달된 글번호(notice_num) 가져오기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// noticeModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호 전달)
		noticeViewService NoticeViewService = new noticeViewService();
		noticeBean article = NoticeViewService.getArticle(notice_num);
		
		request.setAttribute("article", article);
		
		forward.setPath("./noticeList.no");
		
//		noticeModifyProService NoticeModifyProService = new noticeModifyProService();
//		boolean isModifySuccess = NoticeModifyProService.modifyArticle(article);
//			
//			article.setNotice_num(notice_num);
//			article.setNotice_subject(request.getParameter("notice_subject"));
//			article.setNotice_content(request.getParameter("notice_content"));
//			
		return forward;
	}

}





















