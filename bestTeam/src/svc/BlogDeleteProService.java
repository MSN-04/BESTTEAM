package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogDAO;

public class BlogDeleteProService {
	
	
	public boolean removeArticle(int blog_num) {
		boolean isRemoveSuccess=false;
		
		Connection con = getConnection();
		
		// BoardDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con);

		int deleteSuccess=blogDAO.deleteArticle(blog_num);
		
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
















