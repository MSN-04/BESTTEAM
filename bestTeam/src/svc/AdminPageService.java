package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.UserDAO;
import vo.QnaBean;
import vo.UserBean;

public class AdminPageService {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public int getListCount() {
		
		int listCount = 0; 
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		listCount = userDAO.allUserCount();
		   
		close(con);
		
		return listCount;
	}

	public ArrayList<UserBean> getUserList(int page, int limit) {
		ArrayList<UserBean> allUserList = new ArrayList<UserBean>();

		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		allUserList = userDAO.getAllUserList(page, limit);
		
		close(con);
		return allUserList;
	}

	

}
