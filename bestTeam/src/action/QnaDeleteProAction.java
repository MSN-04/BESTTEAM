package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.QnaDeleteProService;
import vo.ActionForward;

public class QnaDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("qnaDeleteProAction");
		
		ActionForward forward = null;
		
		// 게시물 번호 파라미터 가져오기
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int qna_item_num = Integer.parseInt(request.getParameter("qna_item_num"));
		System.out.println("qnaitemNum: "+qna_item_num);
		QnaDeleteProService qnaDeleteProService = new QnaDeleteProService();
		boolean isDeleteSuccess = qnaDeleteProService.removeArticle(qna_num);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('삭제할 권한이 없습니다.')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			System.out.println("qna_item_num : "+qna_item_num);
				forward = new ActionForward();
				forward.setPath("itemSingle.em?item_num="+qna_item_num);
//				forward.setRedirect(true);
			
		}
		
		return forward;
	}
}
