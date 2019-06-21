package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDeleteProService;
import vo.ActionForward;

public class ReviewDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// ActionForward 인스턴스 생성
		ActionForward forward = null;
		
		// 게시물 번호 파라미터 가져오기
		int review_re_ref = Integer.parseInt(request.getParameter("review_re_ref"));
		int review_item_num = Integer.parseInt(request.getParameter("review_item_num"));
		int review_re_lev =Integer.parseInt(request.getParameter("review_re_lev"));
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		
		
		// 본인 확인 결과 판별
		
			boolean isDeleteSuccess = reviewDeleteProService.removeArticle(review_re_ref,review_re_lev);
			
			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('삭제실패.')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>");
			}else {
				forward=new ActionForward();
				forward.setPath("itemSingle.em?item_num="+review_item_num);
				forward.setRedirect(true);
			}
		
		return forward;
	}

}
