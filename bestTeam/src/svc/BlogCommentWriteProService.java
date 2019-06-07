package svc;

import vo.BlogCommentBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogCommentDAO;

public class BlogCommentWriteProService {
	
	public boolean registArticle(BlogCommentBean blogCommentBean) throws Exception {
		System.out.println("BlogCommentWriteProService");
		
		// 작업 수행 성공 여부를 리턴할 boolean 타입 변수 선언
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con); 
		int insertCount = blogCommentDAO.insertComment(blogCommentBean); // 글 등록 처리(결과를 int형으로 전달받음)
		
		// insertCount 가 0보다 크면 트랜잭션 Commit, 아니면 트랜잭션 Rollback 수행
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		// DB 접속 해제(Connection 자원 반환)
		close(con);
		
		return isWriteSuccess;
	}
	
}







