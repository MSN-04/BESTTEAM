package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class JoinProService {

	public boolean setJoin(UserBean userBean) throws Exception {
		System.out.println("JoinProService");
		boolean isJoinSuccess = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		isJoinSuccess = userDAO.userInsert(userBean);
		
		if(isJoinSuccess) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
			
		return isJoinSuccess;
	}

}
