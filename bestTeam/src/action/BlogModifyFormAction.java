package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogDetailService;
import vo.ActionForward;
import vo.BlogBean;

public class BlogModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardModifyFormAction");
		
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		
		// URL 에 전달된 board_num 파라미터 가져와서 int 타입 변수 board_num 에 저장 => String -> int 형변환 필요
		int blog_num = Integer.parseInt(request.getParameter("blog_num"));
		
		// BoardDetailService 클래스의 getArticle() 메서드를 사용하여 원본글 가져와서 BoardBean 에 저장
		BlogDetailService blogDetailService = new BlogDetailService();
		BlogBean article = blogDetailService.getArticle(blog_num);
		
		// request 객체에 BoardBean 객체(article) 저장
		request.setAttribute("article", article);
		
		// ActionForward 객체의 setPath() 메서드를 사용하여 포워딩 경로를 "/board/qna_board_modify.jsp" 로 지정
		forward.setPath("./blog/blogModifyForm.jsp");
		
		return forward; // ActionForward 객체 리턴
	}

}
