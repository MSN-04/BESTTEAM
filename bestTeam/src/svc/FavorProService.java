package svc;

import java.sql.Connection;

import dao.UserFavorDAO;
import vo.FavorBean;

import static db.JdbcUtil.*;

public class FavorProService {

	public boolean setFavor(FavorBean favorBean) {
		boolean isSetTaste = false;
		
		Connection con = getConnection();
		UserFavorDAO userFavorDAO = UserFavorDAO.getInstance();
		userFavorDAO.setConnection(con);
		
		int isSetFavorSuccess = userFavorDAO.setFavor(favorBean);
		
		if(isSetFavorSuccess>0) {
			commit(con);
			isSetTaste = true;
			
		} else {
			rollback(con);
		}
		close(con);
		return isSetTaste;
		
	}

	public boolean isUpdateFavor(String id) {
		boolean isUpdateFavor = false;
		
		Connection con = getConnection();
		UserFavorDAO userFavorDAO = UserFavorDAO.getInstance();
		userFavorDAO.setConnection(con);
		
		isUpdateFavor = userFavorDAO.isUpdateUser(id);
		
		close(con);
		
		return isUpdateFavor;
	}

	public boolean updateFavor(FavorBean favorBean) {
		boolean isSetUpdateFavor = false;
		
		Connection con = getConnection();
		UserFavorDAO userFavorDAO = UserFavorDAO.getInstance();
		userFavorDAO.setConnection(con);
		
		isSetUpdateFavor = userFavorDAO.updateFavor(favorBean);
		
		if(isSetUpdateFavor) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return isSetUpdateFavor;
	}
	
	

}
