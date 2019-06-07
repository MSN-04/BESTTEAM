package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.events.MutationEvent;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BlogCommentWriteProService;
import svc.BlogWriteProService;
import vo.ActionForward;
import vo.BlogCommentBean;

// XXXAction 클래스는 Action 인터페이스를 상속받아 추상메서드로 공통 메서드인 execute() 메서드를 구현한다
public class BlogCommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Controller -> Action -> Service -> DAO -> Service -> Action -> Controller
		System.out.println("BlogCommentWriteProAction()");
		
		ActionForward forward = null;
		BlogCommentBean blogCommentBean = null;
		
		
		blogCommentBean = new BlogCommentBean(); // 글 쓰기 데이터를 저장할 BoardBean 객체
		
		blogCommentBean.setComment_writer(request.getParameter("comment_writer"));
		
		
		// 실제 비즈니스 로직 처리를 담당할 Service 클래스(XXXAction => XXXService) 인스턴스를 생성하여
		// 처리 담당 메서드를 호출(매개변수로 BoardBean 객체 전달)
		BlogCommentWriteProService blogCommentWriteProService = new BlogCommentWriteProService();
		boolean isWriteSuccess = blogCommentWriteProService.registArticle(blogCommentBean);
		
		// INSERT 수행 결과가 false 이면 자바 스크립트를 사용하여 "등록 실패" 메세지를 표시(alert())
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('게시물 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, boardList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("blog.bl");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}




















