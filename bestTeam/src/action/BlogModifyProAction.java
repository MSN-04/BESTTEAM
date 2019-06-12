package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogModifyProService;
import vo.ActionForward;
import vo.BlogBean;

public class BlogModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardModifyProAction");
		
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		
		// 파라미터로 전달된 글번호(board_num) 가져오기
		int blog_num = Integer.parseInt(request.getParameter("blog_num"));
		
		// BoardModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호, 입력받은 패스워드 전달)
		BlogModifyProService blogModifyProService = new BlogModifyProService();
				
			BlogBean article = new BlogBean();
			article.setBlog_num(blog_num);
			article.setBlog_subject(request.getParameter("blog_subject"));
			article.setBlog_content1(request.getParameter("blog_content1"));
			article.setBlog_writer(request.getParameter("blog_writer"));
			article.setBlog_file(request.getParameter("blog_file"));
			article.setBlog_content(request.getParameter("blog_content"));
			
			boolean isModifySuccess = blogModifyProService.modifyArticle(article);
			
			// 글 수정 성공 여부 판별
			if(!isModifySuccess) {
				// 글 수정 실패 시 자바스크립트를 사용하여 "수정 실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('수정 실패!')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
				System.out.println("글 수정 성공!");
				// 글 수정 성공 시
				forward=new ActionForward();
				// boardDetail.bo 서블릿 주소로 포워딩 => 주소 뒤에 파라미터로 글번호(board_num) 전달 => Redirect 방식
				forward.setPath("blog-single.bl?blog_num=" + blog_num + "&page=1");
				forward.setRedirect(true);
			}
			
//		}
		
		return forward;
	}

}





















