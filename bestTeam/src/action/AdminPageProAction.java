package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXP;

import svc.AdminPageService;
import vo.ActionForward;
import vo.PageInfo;
import vo.UserBean;

public class AdminPageProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		ArrayList<UserBean> allUserList = new ArrayList<UserBean>(); 
		int page = 1;
		int limit = 8;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인하세요!')");
			out.println("location.href='history.back();'");
			out.println("</script>");
		}else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다!')");
			out.println("location.href='history.back();'");
			out.println("</script>");

		}
		
		// 리스트 개수
		AdminPageService adminPageService = new AdminPageService();
		int listCount = adminPageService.getListCount();

		
		int maxPage = (int)((double)listCount / limit+0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		// 리스트 받아옴
		allUserList = adminPageService.getUserList(startPage, endPage);
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo adminPageInfo = new PageInfo();
		adminPageInfo.setEndPage(endPage);
		adminPageInfo.setListCount(listCount);
		adminPageInfo.setMaxPage(maxPage);
		adminPageInfo.setPage(page);
		adminPageInfo.setStartPage(startPage);
		
		// 데이터 분석
		ArrayList<Integer> ageList = new ArrayList<Integer>();
		ageList = adminPageService.getAgeList();
		
		int maleList = adminPageService.getMaleList();
		
		ArrayList<Integer> ageBuyList = new ArrayList<Integer>();
		ageBuyList = adminPageService.getAgeBuyList();
		
		ArrayList<Integer> genderFavor = new ArrayList<Integer>();
		genderFavor = adminPageService.getGenderFavor();
		
		request.setAttribute("adminPageInfo", adminPageInfo);
		request.setAttribute("allUserList", allUserList);
		request.setAttribute("ageList", ageList);
		request.setAttribute("maleList", maleList);
		request.setAttribute("ageBuyList", ageBuyList);
		request.setAttribute("genderFavor", genderFavor);
		
		forward = new ActionForward();
		forward.setPath("/member/adminPage.jsp");
		
		return forward;
	}

}
