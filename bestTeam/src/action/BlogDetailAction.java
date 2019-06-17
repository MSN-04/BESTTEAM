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
		System.out.println("BlogDetailAction");
		
		// request 객체로부터 전달된 파라미터(board_num, page) 가져와서 변수에 저장
		HttpSession session = request.getSession();
		BlogCommentBean blogCommentBean = null;
		UserBean userBean = null;
		
		int blog_num = Integer.parseInt(request.getParameter("blog_num")); // String -> int 형변환 필요
		String page = (String)request.getAttribute("page");
		
//		String name = request.getParameter("userBean_name");
//		String id = session.getAttribute("id").toString();
		
		System.out.println("id" + ":::" );
		
		BlogDetailService blogDetailService = new BlogDetailService();
		BlogBean article = blogDetailService.getArticle(blog_num);
		ArrayList<BlogCommentBean> articleList = blogDetailService.getCommentList(blog_num);
//		blogDetailService.getUserInfo(id);
		
		// 다른 페이지에서 page 번호를 전달받아 계속 유지하기 위해 request 객체의 setAttribute() 메서드로 전달
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		request.setAttribute("articleList", articleList);
		request.setAttribute("userBean", userBean);
		
		// ------------------------리스트 불러오기
//		int page = 1;
//		int limit = 10;
//		
//		// 페이지 번호 파라미터가 있을 경우 가져오기
//		if(request.getParameter("page") != null) {
//			page0 = Integer.parseInt(request.getParameter("page0"));
//		}
//		
//		BlogCommentListService blogCommentListService = new BlogCommentListService();
//		
//		int listCount = blogCommentListService.getListCount(); // 총 게시물 목록 수 가져오기
//		
//		article2 = blogCommentListService.getArticleList(page, limit); // 게시물 목록 가져오기(페이지 번호에 해당하는 목록을 limit 개수만큼 가져오기)
//		
//		// 페이지 계산
//		int maxPage = (int)((double)listCount / limit + 0.95); // 총 페이지 수 계산(올림처리를 위해 + 0.95)
//		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 표시할 시작 페이지) 번호
//		int endPage = startPage + 10 - 1; // 현재 페이지에 표시할 마지막 페이지 번호
//		
//		if(endPage > maxPage) { // 마지막 페이지 번호가 최대 페이지 번호보다 클 경우
//			endPage = maxPage; // 마지막 페이지 번호를 최대 페이지 번호로 대체
//		}
//		
//		// 페이지 번호 관련 정보를 PageInfo 객체에 저장
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setPage(page);
//		pageInfo.setMaxPage(maxPage);
//		pageInfo.setStartPage(startPage);
//		pageInfo.setEndPage(endPage);
//		pageInfo.setListCount(listCount);
//		pageInfo.setLimit(limit);
//		
//		// PageInfo 객체와 ArrayList 객체를 request 객체의 setAttribute() 메서드를 사용하여 저장
//		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("article2", article2);
		
		//------------------------------------
		
		ActionForward forward = new ActionForward();
		forward.setPath("./blog/blog-single.jsp"); // 이동할 jsp 페이지 지정
		return forward;
	}

}

