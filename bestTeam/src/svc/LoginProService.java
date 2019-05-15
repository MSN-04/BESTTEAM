package svc;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

import static db.JdbcUtil.*;

public class LoginProService {

	public boolean isRightUser(UserBean userBean) throws Exception {
		System.out.println("LoginproService");
		Connection con = null;
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		System.out.println(userBean.getUser_id()+ userBean.getUser_pass());
		boolean isRightUser = userDAO.isRightUser(userBean);
		
		close(con);
		return isRightUser;
	}

}
