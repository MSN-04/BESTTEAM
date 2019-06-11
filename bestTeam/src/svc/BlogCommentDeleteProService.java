package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BlogCommentDAO;
import dao.BlogDAO;

public class BlogCommentDeleteProService {

	public boolean removeArticle(int comment_num) {
		boolean isRemoveSuccess=false;
		
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con);

		int deleteSuccess=blogCommentDAO.deleteComment(comment_num);
		
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
