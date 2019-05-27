package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaBean;

public class QnaViewService {
	
	// 글 번호(qna_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
	public QnaBean e(int qna_num) throws Exception {
//		System.out.println("qnaViewService - getArticle()");
		QnaBean qnaBean = null;
		
		Connection con = getConnection();
		
		// qnaDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		// qnaDAO 객체의 selectArticle() 메서드를 호출하여 글번호(qna_num)를 전달 => qnaBean 객체 리턴받음
		qnaBean = qnaDAO.selectArticle(qna_num);
		
		// 게시물을 성공적으로 읽어왔을 때 조회수 증가 처리
		int updateCount = qnaDAO.updateReadcount(qna_num);
		   
		// updateCount 가 1일 경우 commit, 0일 경우 rollback 수행
		if(updateCount == 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return qnaBean;
	}

	public QnaBean getArticle(int qna_num) {
		// TODO Auto-generated method stub
		return null;
	}
}

