package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DeleteMemberProService;
import vo.ActionForward;

public class DeleteMemberProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDeleteSuccess = false;
		
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		DeleteMemberProService deleteMemberProService = new DeleteMemberProService();
		isDeleteSuccess = deleteMemberProService.deleteMember(id, pass);
		
		
		
		return forward;
	}

}
