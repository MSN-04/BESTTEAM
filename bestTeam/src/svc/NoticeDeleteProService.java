package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;

public class NoticeDeleteProService {
	// 게시물 작성자 일치 여부 확인을 위해 게시물 번호와 패스워드를 전달받아 확인 작업 수행
//	public boolean isArticleWriter(int notice_num, String pass) throws Exception {
//		System.out.println("noticeDeleteProService - isArticleWriter()");
//		boolean isArticleWriter = false;
//		
//		// Connection 객체 가져오기
//		Connection con = getConnection();
//		
//		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
//		noticeDAO noticeDAO = noticeDAO.getInstance();
//		noticeDAO.setConnection(con);
//
//		isArticleWriter = noticeDAO.isArticlenoticeWriter(notice_num, pass); // 본인 확인(패스워드 일치여부 판별)
//		
//		close(con);
//		
//		return isArticleWriter;
//	}
   
	// 게시물 번호에 해당하는 글 삭제 작업 수행
	public boolean removeArticle(int notice_num) {
		boolean isRemoveSuccess = false;
		
		Connection con = getConnection();
		
		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		// noticeDAO 클래스의 deleteArticle() 메서드를 호출하여 번호 전달 후 게시물 삭제 수행 => 삭제 성공 여부(deleteSuccess) int형으로 리턴받음
		int deleteSuccess = noticeDAO.deleteArticle(notice_num);
		
		// 삭제 성공 여부 값(deleteSuccess) 가 0보다 크면 commit, isRemoveSuccess 를 true 로 변경
		if(deleteSuccess > 0) {
			commit(con);
			isRemoveSuccess = true;
		} else {
			// 0이면 rollback
			rollback(con);
		}
		
		// Connection 반환
		close(con);
		
		return isRemoveSuccess;
	}


	}

















