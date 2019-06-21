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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(id == null) {
			out.println("<script>");
			out.println("alert('로그인 하세요!')");
			out.println("location.href='login.us'");
			out.println("</script>");
			return null;
		}
		
		favorBean.setUser_favor_user_id(id);
		
		
		FavorProService favorProService = new FavorProService();
		boolean isUpdateFavor = favorProService.isUpdateFavor(id);
		
		if(isUpdateFavor) {
			boolean isUpdateSetFavor = favorProService.updateFavor(favorBean);
			
			if(!isUpdateSetFavor) {
				out.println("<script>");
				out.println("alert('취향설정에 실패했습니다!')");
				out.println("location.href='login.us'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('취향설정이 완료되었습니다')");
				out.println("</script>");
				forward = new ActionForward();
				
				forward.setPath("Mypage.us");
			}
			
		}else {
			boolean isSetFavor = favorProService.setFavor(favorBean);
			
			if(!isSetFavor) {
				out.println("<script>");
				out.println("alert('취향설정에 실패했습니다!')");
				out.println("location.href='login.us'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('취향설정이 완료되었습니다')");
				out.println("</script>");
				forward = new ActionForward();
				
				forward.setPath("Mypage.us");
			}
		}
		
		return forward;
	}

}
