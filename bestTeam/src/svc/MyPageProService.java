package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
import dao.UserFavorDAO;
import vo.FavorBean;
import vo.UserBean;

public class MyPageProService {

	public UserBean getMypage(String id) throws Exception {
		UserBean userBean = new UserBean();
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		userBean = userDAO.getUserInfo(id);
		
		close(con);
			
		
		return userBean;
	}
	
	//취향정보 가져오는 메서드
	public FavorBean getMyFavor(String id) throws Exception{
		FavorBean favorBean = new FavorBean();
		
		Connection con = getConnection();
		UserFavorDAO userFavorDAO = UserFavorDAO.getInstance();
		userFavorDAO.setConnection(con);
		
		favorBean = userFavorDAO.getFavor(id);
		
		close(con);
		
		return favorBean;
	}

	public UserBean getUserInfo(UserBean userBean) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
