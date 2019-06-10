package svc;

import vo.BlogCommentBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogCommentDAO;

public class BlogCommentWriteProService {
	
	public boolean registArticle(BlogCommentBean blogCommentBean) throws Exception {
		System.out.println("BlogCommentWriteProService");
		
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con); 
		int insertCount = blogCommentDAO.insertComment(blogCommentBean); // 글 등록 처리(결과를 int형으로 전달받음)
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		
		return isWriteSuccess;
	}
	
}







