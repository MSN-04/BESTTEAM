package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class UpdateMemberFormService {

	public UserBean getUpdateForm(String id) throws Exception{
		System.out.println("getupdateForm");
		UserBean userBean = null;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		
		
		
			userBean = userDAO.getUserInfo(id);
			System.out.println("updateform 성공");
		
		close(con);
		return userBean;
	}

}
