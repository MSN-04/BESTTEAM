package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QnaDAO;
import svc.QnaReplyProService;
import svc.ReviewReplyProService;
import vo.ActionForward;
import vo.QnaBean;
import vo.ReviewBean;

public class ReviewReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewBean reviewBean = new ReviewBean();
		ActionForward forward = null;
		HttpSession session = request.getSession();
		System.out.println("ReviewReplyProAction");
		String writer = request.getParameter("review_reply_writer");
		String id = (String)session.getAttribute("id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		int review_item_num = Integer.parseInt(request.getParameter("review_item_num"));
		ReviewReplyProService reviewReplyInsertProService = new ReviewReplyProService();
		
		reviewBean.setReview_item_num(review_item_num);
		reviewBean.setReview_user_id(writer);
		reviewBean.setReview_subject(request.getParameter("review_reply_subject"));
		reviewBean.setReview_content(request.getParameter("review_reply_content"));
		
		boolean isInsertSuccess = reviewReplyInsertProService.insertReply(reviewBean, review_num);
		
		
		if(!isInsertSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('답글 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, qnaList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => qnaList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("itemSingle.em?item_num="+review_item_num);
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
