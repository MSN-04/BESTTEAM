package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class UpdateMemberProService {

	public boolean setUpdate(UserBean userBean) throws Exception {
		boolean isUpdate = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		userDAO.userUpdate(userBean);
		
		return false;
	}

}
