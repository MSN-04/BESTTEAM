package svc;

import java.sql.Connection;

import dao.NoticeDAO;
import vo.NoticeBean;

// JdbcUtil 클래스의 static 메서드를 클래스명 없이 메서드명으로만으로도 호출 가능하도록 import 하기 위해 import static 사용
// => import static 패키지명.클래스명.메서드명 또는 메서드명 대신 모든 메서드를 포함하도록 * 사용
import static db.JdbcUtil.*; // JdbcUtil 클래스의 모든 static 메서드를 이름만으로 접근 가능(JdbcUtil.close() -> close() 만으로 호출 가능)

// 글쓰기 요청에 대한 비즈니스 로직을 구현하는 Service 클래스 => DAO 객체를 통해 DB 작업을 수행
public class NoticeWriteProService {
	
	public boolean registArticle(NoticeBean noticeBean) throws Exception {
//		System.out.println("noticeWriteProService");
		
//		System.out.println("getNotice_writer" + NoticeBean.getNotice_writer());
//		System.out.println("getNotice_num" +NoticeBean.getNotice_num());
//		System.out.println("getNotice_subject" +NoticeBean.getNotice_subject());
//		System.out.println("getNotice_content" +NoticeBean.getNotice_content());
		
		// 작업 수행 성공 여부를 리턴할 boolean 타입 변수 선언
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		
		// 싱글톤 디자인 패턴으로 생성된 noticeDAO 인스턴스를 얻어오기
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con); // Connection 객체를 noticeDAO 객체에 전달
		int insertCount = noticeDAO.insertArticle(noticeBean); // 글 등록 처리(결과를 int형으로 전달받음)
		     
		// insertCount 가 0보다 크면 트랜잭션 Commit, 아니면 트랜잭션 Rollback 수행
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true; // 성공 표시
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isWriteSuccess;
	}
	
}



