package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;
import vo.NoticeBean;


public class NoticeModifyProService {
	
	public boolean modifyArticle(NoticeBean article) {
		boolean isModifySuccess = false;
		
		// DB 작업 전 DB 접속을 위해 JdbcUtil 클래스의 static 메서드 getConnection() 를 호출하여 DB 접속
		Connection con = getConnection();
		
		// 싱글톤 디자인 패턴으로 생성된 noticeDAO 인스턴스를 얻어오기
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con); // Connection 객체를 noticeDAO 객체에 전달
		int updateCount = noticeDAO.updateArticle(article); // 글 수정 처리(결과를 int형으로 전달받음)
		
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

