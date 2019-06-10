package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogCommentDAO;
import dao.BlogDAO;
import vo.BlogBean;
import vo.BlogCommentBean;

public class BlogCommentModifyProService {
	
	public boolean modifyComment(BlogCommentBean blogCommentBean) {
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
//		BlogCommentBean bcBean = new BlogCommentBean();
		blogCommentDAO.setConnection(con); 
		int updateCount = blogCommentDAO.updateComment(blogCommentBean); // 글 수정 처리(결과를 int형으로 전달받음)
		
		// insertCount 가 0보다 크면 트랜잭션 Commit, 아니면 트랜잭션 Rollback 수행
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isModifySuccess;
	}

	
}























