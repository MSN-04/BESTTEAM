package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class MyPageProService {

	public UserBean getMypage(String id) {
		UserBean userBean = new UserBean();
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		userBean = userDAO.getUserInfo(id);
		
		close(con);
			
		
		return userBean;
	}

}
