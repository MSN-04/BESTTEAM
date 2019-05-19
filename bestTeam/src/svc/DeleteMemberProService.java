package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;

public class DeleteMemberProService {

	public boolean deleteMember(String id, String pass) {
		int isRightUser = 0;
		boolean isDeleteSuccess = false;
		
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		isRightUser = userDAO.isUpdateUser(id, pass);
		
		if(isRightUser>0) {
			isDeleteSuccess = userDAO.userDelete(id, pass);
		}
		
		
		userDAO.userDelete(id, pass);
		
		return isDeleteSuccess;
	}

}
