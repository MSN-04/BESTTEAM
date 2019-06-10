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
import javax.servlet.http.HttpSession;

import org.w3c.dom.events.MutationEvent;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BlogCommentWriteProService;
import svc.BlogWriteProService;
import vo.ActionForward;
import vo.BlogCommentBean;
import vo.UserBean;

// XXXAction 클래스는 Action 인터페이스를 상속받아 추상메서드로 공통 메서드인 execute() 메서드를 구현한다
public class BlogCommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BlogCommentDeleteProAction()");
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		BlogCommentBean blogCommentBean = null;
		UserBean userBean = null;
		
		String name = request.getParameter("comment_writer");
		String id = session.getAttribute("id").toString();
		
		blogCommentBean = new BlogCommentBean(); 
		userBean = new UserBean();
		
		blogCommentBean.setComment_writer(userBean.getUser_name());
		blogCommentBean.setComment_blog_num(Integer.parseInt(request.getParameter("comment_blog_num")));
		blogCommentBean.setComment_content(request.getParameter("comment_content"));
		
		BlogCommentWriteProService blogCommentWriteProService = new BlogCommentWriteProService();
		userBean = blogCommentWriteProService.getUserInfo(name, id);
		
		boolean isWriteSuccess = blogCommentWriteProService.registArticle(blogCommentBean);
		
		// INSERT 수행 결과가 false 이면 자바 스크립트를 사용하여 "등록 실패" 메세지를 표시(alert())
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('댓글 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			forward = new ActionForward();
			forward.setPath("blog.bl");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}



