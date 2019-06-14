package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogCommentDeleteProService;
import svc.BlogDeleteProService;
import vo.ActionForward;

public class BlogCommentDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BlogCommentDeleteProAction");
		ActionForward forward = null;
		
		System.out.println("blog_num :: " + request.getParameter("comment_blog_num"));
		System.out.println("comment_num :: " + request.getParameter("comment_num"));
		// 게시물 번호 파라미터 가져오기
		int blog_num = Integer.parseInt(request.getParameter("comment_blog_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		BlogCommentDeleteProService blogCommentDeleteProService = new BlogCommentDeleteProService();
		
		
		// 본인 확인 결과 판별
		
			boolean isDeleteSuccess = blogCommentDeleteProService.removeArticle(comment_num);
			
			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('댓글 삭제에 실패하였습니다.')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>");
			}else {
				forward=new ActionForward();
				forward.setPath("blog.bl");
				forward.setRedirect(true);
			}
		
		return forward;
	}

}
