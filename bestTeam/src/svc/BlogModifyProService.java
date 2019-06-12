package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogDAO;
import vo.BlogBean;

public class BlogModifyProService {
	
	public boolean modifyArticle(BlogBean article) {
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		BlogDAO blogDAO = BlogDAO.getInstance();
		blogDAO.setConnection(con); // Connection 객체를 boardDAO 객체에 전달
		int updateCount = blogDAO.updateArticle(article); // 글 수정 처리(결과를 int형으로 전달받음)
		
		// insertCount 가 0보다 크면 트랜잭션 Commit, 아니면 트랜잭션 Rollback 수행
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		// DB 접속 해제(Connection 자원 반환)
		close(con);
		
		return isModifySuccess;
	}
	
}























