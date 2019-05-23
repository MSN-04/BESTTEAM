package svc;

import java.sql.Connection;

import dao.UserFavorDAO;
import vo.FavorBean;

import static db.JdbcUtil.*;

public class TasteProService {

	public boolean setTaste(FavorBean favorBean) {
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

}
