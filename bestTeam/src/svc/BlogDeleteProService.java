package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogDAO;

public class BlogDeleteProService {
	
	
	public boolean removeArticle(int blog_num) {
		boolean isRemoveSuccess=false;
		
		Connection con = getConnection();
		
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
















