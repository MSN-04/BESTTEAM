package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;

public class DeleteMemberProService {

	public boolean deleteMember(String id, String pass) {
		boolean isDeleteSuccess = false;
		
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		userDAO.userDelete(id, pass);
		
		return isDeleteSuccess;
	}

}
