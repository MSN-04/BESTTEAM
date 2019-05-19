package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD

import svc.ItemDeleteProService;
import vo.ActionForward;

public class ItemDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-----ItemDeleteProAction --------");
		
		ActionForward forward=null;
		int item_num=Integer.parseInt(request.getParameter("item_num"));
//		System.out.println("item_num : " + item_num);
		//ItemDeleteProService
		ItemDeleteProService itemdeleteproservice=new ItemDeleteProService();
		boolean isRightUser=itemdeleteproservice.isAdminWriter(request.getParameter("user_id"),request.getParameter("user_pass"));
		
		if(!isRightUser) {  //작성자본인(관리자)이 아닐경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('삭제할 권한이 없습니다.')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 		
		}else if(request.getParameter("user_id").equals("admin")&&request.getParameter("user_pass").equals("1234")) { //글 작성자 본인(관리자)일 경우
			boolean isDeleteSuccess=itemdeleteproservice.deleteItem(item_num);
			
			//---글 삭제 성공여부
			if(!isDeleteSuccess) {
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); 
				out.println("alert('삭제 오류발생')"); 
				out.println("history.back()"); 
				out.println("</script>"); 
			} else {
				
				forward = new ActionForward();
			//	forward.setPath("itemList.em?page=" + request.getParameter("page")); --->???
=======
import javax.servlet.http.HttpSession;

import svc.ItemDeleteProService;
import vo.ActionForward;

public class ItemDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-----ItemDeleteProAction --------");
		
		ActionForward forward=null;
		int item_num=Integer.parseInt(request.getParameter("item_num"));
		
		//ItemDeleteProService
		ItemDeleteProService itemdeleteproservice=new ItemDeleteProService();
		
		HttpSession session = request.getSession();
		
		String user_id = request.getParameter("user_id");
//		String user_pass = request.getParameter("user_pass");
//		boolean isRightUser=itemdeleteproservice.isAdminWriter(request.getParameter("user_id"),request.getParameter("user_pass"));
		
		if(! user_id.equals("admin")) {  //작성자본인(관리자)이 아닐경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('삭제할 권한이 없습니다.')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 		
//		}else if(user_id.equals("admin") && user_pass.equals("1234")) { //글 작성자 본인(관리자)일 경우
		}else {	
			boolean isDeleteSuccess=itemdeleteproservice.deleteItem(item_num);
			//---글 삭제 성공여부
			if(! isDeleteSuccess) {
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); 
				out.println("alert('삭제 오류발생')"); 
				out.println("history.back()"); 
				out.println("</script>"); 
//			} else {
				
				forward = new ActionForward();
				forward.setPath("shopMain.em");
>>>>>>> branch 'master' of https://github.com/MSN-04/BESTTEAM.git
				forward.setRedirect(true); // Redirect 방식
			}
			
		}

		return forward;
	}

}
