package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaViewService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("qnaModifyProAction");
		
		ActionForward forward = new ActionForward();
		  
		// 파라미터로 전달된 글번호(qna_num) 가져오기
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		// qnaModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호 전달)
		QnaViewService qnaViewService = new QnaViewService();
		QnaBean article = qnaViewService.getArticle(qna_num);
		
		request.setAttribute("article", article);
		
		forward.setPath("./qnaList.qna");
		
//		qnaModifyProService QnaModifyProService = new qnaModifyProService();
//		boolean isModifySuccess = QnaModifyProService.modifyArticle(article);
//			
//			article.setQna_num(qna_num);
//			article.setQna_subject(request.getParameter("qna_subject"));
//			article.setQna_content(request.getParameter("qna_content"));
//			
		return forward;
	}

}





















