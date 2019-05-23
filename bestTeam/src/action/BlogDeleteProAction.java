package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogDeleteProService;
import vo.ActionForward;

public class BlogDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BlogDeleteProAction");
		
		// ActionForward 인스턴스 생성
		ActionForward forward = null;
		
		// 게시물 번호 파라미터 가져오기
		int blog_num = Integer.parseInt(request.getParameter("blog_num"));
		
		BlogDeleteProService blogDeleteProService = new BlogDeleteProService();
		
		
		// 본인 확인 결과 판별
		
			boolean isDeleteSuccess = blogDeleteProService.removeArticle(blog_num);
			
			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('삭제실패.')"); // 오류 메세지 다이얼로그 표시
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
