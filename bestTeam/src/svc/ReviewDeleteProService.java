package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogDAO;
import dao.ReviewDAO;

public class ReviewDeleteProService {
	
	
	public boolean removeArticle(int review_re_ref) {
		boolean isRemoveSuccess=false;
		
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);

		int deleteSuccess=reviewDAO.deleteArticle(review_re_ref);
		
		if(deleteSuccess>0) {
			commit(con);
			isRemoveSuccess=true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isRemoveSuccess;
	}
}
















