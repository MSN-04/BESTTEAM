package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BlogCommentListService;
import svc.BlogDetailService;
import vo.ActionForward;
import vo.BlogBean;
import vo.BlogCommentBean;
import vo.PageInfo;
import vo.UserBean;

public class BlogDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글 상세 내용 보기 작업에 대한 비즈니스 로직 처리를 위한 준비 작업 및 마무리 작업(실제 비즈니스 로직은 Service 클래스와 DAO 클래스에서 수행)
		
		// request 객체로부터 전달된 파라미터(board_num, page) 가져와서 변수에 저장
		HttpSession session = request.getSession();
		BlogCommentBean blogCommentBean = null;
		UserBean userBean = null;
		
		int blog_num = Integer.parseInt(request.getParameter("blog_num")); // String -> int 형변환 필요
		String page = (String)request.getAttribute("page");
		
		BlogDetailService blogDetailService = new BlogDetailService();
		BlogBean article = blogDetailService.getArticle(blog_num);
		ArrayList<BlogCommentBean> articleList = blogDetailService.getCommentList(blog_num);
		
		// 다른 페이지에서 page 번호를 전달받아 계속 유지하기 위해 request 객체의 setAttribute() 메서드로 전달
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		request.setAttribute("articleList", articleList);
		request.setAttribute("userBean", userBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./blog/blog-single.jsp");
		return forward;
	}

}

