package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import static db.JdbcUtil.*;
import dao.QnaDAO;
import dao.ReviewDAO;
import vo.UserBean;

public class ReviewWriteFormService {
	
	public UserBean getUserInfo(String id) {
//		System.out.println("리뷰ㅜriteFormService");
		UserBean userBean = null;
		
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		userBean = reviewDAO.getUserInfo(id);
		
		if(userBean==null) {
			rollback(con);
		}else {
			commit(con);
		}
		
		close(con);
		
		return userBean;
	}

}
