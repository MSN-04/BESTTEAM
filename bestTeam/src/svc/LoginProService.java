package svc;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

import static db.JdbcUtil.*;

public class LoginProService {

	public boolean isRightUser(UserBean userBean) throws Exception {
		boolean isRightUser = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		
		isRightUser = userDAO.isRightUser(userBean);

		if(isRightUser) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return isRightUser;
	}

}
 