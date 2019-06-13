package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

import dao.UserDAO;
import vo.QnaBean;
import vo.Rserve_C;
import vo.Rserve_S;
import vo.UserBean;

public class AdminPageService {

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

	public ArrayList<Integer> getAgeList() {
		ArrayList<Integer> ageList = new ArrayList<Integer>();
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		ageList = userDAO.getAgeList();
		
		close(con);
		
		return ageList;
	}

	public int getMaleList() {
		int maleList = 0;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		maleList = userDAO.getMaleList();
		
		close(con);
		
		return maleList;
	}

	public ArrayList<Integer> getAgeBuyList() {
		ArrayList<Integer> ageBuyLists = new ArrayList<Integer>();;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		ageBuyLists = userDAO.getAgeBuyList();
		
		close(con);
		
		return ageBuyLists;
	}

	public ArrayList<Integer> getGenderFavor() {
		ArrayList<Integer> genderFavor = new ArrayList<Integer>();;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		genderFavor = userDAO.getGenderFavor();
		
		close(con);
		
		return genderFavor;
	}


	

}
