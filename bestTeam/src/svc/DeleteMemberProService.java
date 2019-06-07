package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.UserBean;

public class DeleteMemberProService {

	public boolean deleteMember(UserBean userBean) {
		boolean isRightUser = false;
		boolean isDeleteSuccess = false;
		
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		isRightUser = userDAO.isRightUser(userBean);
		
		if(isRightUser) {
			isDeleteSuccess = userDAO.userDelete(userBean.getUser_id(), userBean.getUser_pass());
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isDeleteSuccess;
	}

}
