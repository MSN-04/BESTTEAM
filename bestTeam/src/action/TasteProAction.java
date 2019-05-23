package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.TasteProService;
import vo.ActionForward;
import vo.FavorBean;

public class TasteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("tasteactionforward");
		FavorBean favorBean = new FavorBean();
		favorBean.setUser_favor_aroma(Integer.parseInt(request.getParameter("COFFEE_AROMA")));
		favorBean.setUser_favor_acid(Integer.parseInt(request.getParameter("COFFEE_ACID")));
		favorBean.setUser_favor_sweet(Integer.parseInt(request.getParameter("COFFEE_SWEET")));
		favorBean.setUser_favor_bitter(Integer.parseInt(request.getParameter("COFFEE_BITTER")));
		favorBean.setUser_favor_body(Integer.parseInt(request.getParameter("COFFEE_BODY")));
		
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();
		if(id == null) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그인 하세요!')");
		out.println("location.href='login.us'");
		out.println("</script>");
		}
		favorBean.setUser_favor_user_id(id);
		
		
		TasteProService tasteProService = new TasteProService();
		boolean isSetTaste = tasteProService.setTaste(favorBean);
		
		if(!isSetTaste) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('취향설정에 실패했습니다!')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			
			forward.setPath("index.in");
		}
		
		return forward;
	}

}
