package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.FavorProService;
import vo.ActionForward;
import vo.FavorBean;

public class FavorProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		FavorBean favorBean = new FavorBean();
		favorBean.setUser_favor_aroma(Integer.parseInt(request.getParameter("COFFEE_AROMA")));
		favorBean.setUser_favor_acidity(Integer.parseInt(request.getParameter("COFFEE_ACID")));
		favorBean.setUser_favor_sweetness(Integer.parseInt(request.getParameter("COFFEE_SWEET")));
		favorBean.setUser_favor_bitterness(Integer.parseInt(request.getParameter("COFFEE_BITTER")));
		favorBean.setUser_favor_body(Integer.parseInt(request.getParameter("COFFEE_BODY")));
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id == null) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그인 하세요!')");
		out.println("location.href='login.us'");
		out.println("</script>");
		}
		
		favorBean.setUser_favor_user_id(id);
		
		
		FavorProService favorProService = new FavorProService();
		boolean isUpdateFavor = favorProService.isUpdateFavor(id);
		
		if(isUpdateFavor) {
			boolean isUpdateSetFavor = favorProService.updateFavor(favorBean);
			
			if(!isUpdateSetFavor) {
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
			
		}else {
			boolean isSetFavor = favorProService.setFavor(favorBean);
			
			if(!isSetFavor) {
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
		}
		
		return forward;
	}

}
