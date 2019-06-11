package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogCommentModifyProService;
import svc.BlogModifyProService;
import vo.ActionForward;
import vo.BlogBean;
import vo.BlogCommentBean;

public class BlogCommentModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardModifyProAction");
		
		ActionForward forward = new ActionForward();
		
		int blog_num = Integer.parseInt(request.getParameter("blog_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		BlogCommentModifyProService blogCommentModifyProService = new BlogCommentModifyProService();
		
		
			BlogCommentBean blogCommentBean = new BlogCommentBean();
			blogCommentBean.setComment_num(comment_num);
			blogCommentBean.setComment_content(request.getParameter("comment_content"));
			
			boolean isModifySuccess = blogCommentModifyProService.modifyComment(blogCommentBean);
			
			
			
			// 댓글 수정 성공 여부 판별
			if(!isModifySuccess) {
				// 댓글 수정 실패 시 자바스크립트를 사용하여 "수정 실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('댓글 수정에 실패하였습니다.')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
				System.out.println("댓글이 성공적으로 수정되었습니다.");
				// 댓글 수정 성공 시
				forward=new ActionForward();
				forward.setPath("blog-single.bl?blog_num=" + blog_num + "&page=1");
				forward.setRedirect(true);
			}
			
		
		return forward;
	}

}




