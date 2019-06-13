package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaViewService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글 상세 내용 보기 작업에 대한 비즈니스 로직 처리를 위한 준비 작업 및 마무리 작업(실제 비즈니스 로직은 Service 클래스와 DAO 클래스에서 수행)
		
		// request 객체로부터 전달된 파라미터(qna_num, page) 가져와서 변수에 저장
		int qna_num = Integer.parseInt(request.getParameter("qna_num")); // String -> int 형변환 필요
		String page = request.getParameter("page");
		
		QnaViewService qnaDetailService = new QnaViewService();
		QnaBean article = qnaDetailService.getArticle(qna_num);
		
		  
		// 다른 페이지에서 page 번호를 전달받아 계속 유지하기 위해 request 객체의 setAttribute() 메서드로 전달
		request.setAttribute("page", page);
		// 글 상세 내용을 담고 있는 qnaBean 객체도 전달
		request.setAttribute("article", article);
		
		// Dispatch 방식으로 qna_view.jsp 페이지 포워딩
		ActionForward forward = new ActionForward();
		forward.setPath("./qna/qna_view.jsp"); // 이동할 jsp 페이지 지정
		
		return forward;
	}

}



