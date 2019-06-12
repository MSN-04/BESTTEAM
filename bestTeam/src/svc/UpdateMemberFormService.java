package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class UpdateMemberFormService {

	public UserBean getUpdateForm(String id) throws Exception{
		UserBean userBean = null;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		userBean = userDAO.getUserInfo(id);
		
		close(con);
		return userBean;
	}

}
