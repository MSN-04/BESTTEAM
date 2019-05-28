package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemDeleteProService;
import vo.ActionForward;

public class ItemDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-----ItemDeleteProAction --------");
		
		ActionForward forward=null;
		
		System.out.println("item_num :: " + request.getParameter("item_num"));
		System.out.println("item_favor_num::"+request.getParameter("item_favor_num"));
		
		int item_num=Integer.parseInt(request.getParameter("item_num"));
		int item_favor_num=Integer.parseInt(request.getParameter("item_favor_num"));
		System.out.println("ItemDeleteProAction - item_num : "+item_num);
		System.out.println("ItemDeleteProAction - item_favor_num : "+item_favor_num);
		//ItemDeleteProService
		ItemDeleteProService itemdeleteproservice=new ItemDeleteProService();
		System.out.println("user_id :: " +request.getParameter("user_id"));
		System.out.println("user_pass :: " +request.getParameter("user_pass"));
		boolean isRightUser= itemdeleteproservice.isAdminWriter(request.getParameter("user_id"), request.getParameter("user_pass"));
		System.out.println("ItemDeleteProAction- isRightUser: "+isRightUser);
		
		if(!isRightUser) {  //작성자본인(관리자)이 아닐경우
			System.out.println("ItemDeleteProAction --a");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('삭제할 권한이 없습니다.')"); 
			out.println("history.back()"); // 
			out.println("</script>"); 		
		}else if(request.getParameter("user_id").equals("admin")&&request.getParameter("user_pass").equals("1234")) { //글 작성자 본인(관리자)일 경우
			boolean isDeleteSuccess=itemdeleteproservice.deleteItem(item_num,item_favor_num);

			System.out.println("ItemDeleteProAction --b");
			//---글 삭제 성공여부
			if(!isDeleteSuccess) {
				System.out.println("ItemDeleteProAction --c");
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); 
				out.println("alert('삭제 오류발생')"); 
				out.println("history.back()"); 
				out.println("</script>"); 
			} else {
				System.out.println("ItemDeleteProAction --d");
				System.out.println("삭제 성공--");
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); 
				out.println("alert('삭제 되었습니다.')"); 
				out.println("location.href='./shopMain.em'"); 
				out.println("</script>"); 
				forward = new ActionForward();
				forward.setPath("./shopMain.em");
				forward.setRedirect(true); // Redirect 방식
			}
			
		}

		return forward;
	}

}
