package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import static db.JdbcUtil.*;
import dao.QnaDAO;
import vo.UserBean;

public class QnaModifyFormService {
	
	public UserBean getUserInfo(String id) {
//		System.out.println("qnawriteFormService");
		UserBean userBean = null;
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		userBean = qnaDAO.getUserInfo(id);
		
		if(userBean==null) {
			rollback(con);
		}else {
			commit(con);
		}
		
		close(con);
		
		return userBean;
	}

}
