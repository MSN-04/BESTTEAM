package svc;

import java.sql.Connection;

import dao.ItemDAO;
import vo.ItemBean;

import static db.JdbcUtil.*;

public class ItemRegisterProService {

	public boolean registItem(ItemBean itemBean) {
		boolean isRegistSuccess = false;
		
		Connection con = getConnection();
		
		ItemDAO buyDAO = ItemDAO.getInstance();
		buyDAO.setConnection(con);
		int insertCount = buyDAO.registItem(itemBean);
		
		if(insertCount > 0) {
			commit(con);
			isRegistSuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		// DB 접속 해제(Connection 자원 반환)
		close(con);
		
		return isRegistSuccess;
	}
	
	

}
