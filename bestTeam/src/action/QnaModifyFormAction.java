package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaViewService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// URL 에 전달된 qna_num 파라미터 가져와서 int 타입 변수 qna_num 에 저장 => String -> int 형변환 필요
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		// qnaDetailService 클래스의 getArticle() 메서드를 사용하여 원본글 가져와서 qnaBean 에 저장
		QnaViewService qnaDetailService = new QnaViewService();
		QnaBean article = qnaDetailService.getArticleToModifyForm(qna_num);
		
		// request 객체에 qnaBean 객체(article) 저장
		request.setAttribute("article", article);
		
		// ActionForward 객체의 setPath() 메서드를 사용하여 포워딩 경로를 "/qna/qna_qna_modify.jsp" 로 지정
		forward.setPath("./shop/qna_modify.jsp?qna_num="+qna_num);
		
		return forward;
	}

}
