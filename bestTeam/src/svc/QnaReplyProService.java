package svc;



import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.QnaReplyDAO;
import vo.QnaBean;

import static db.JdbcUtil.*;

//Qna답글 등록 요청에 대한 비즈니스 로직을 구현하는 클래스
public class QnaReplyProService {

	//답변 등록 서비스로직
	public boolean insertReply(QnaBean qnaBean, int new_qna_re_ref) throws Exception{
		System.out.println("QnaReplyInsertProService");
		
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		QnaReplyDAO qnaReplyDAO = QnaReplyDAO.getInstance(); 
		qnaReplyDAO.setConnection(con);
		
		//답변 등록결과를 insertResult에 저장
		int insertResult = qnaReplyDAO.insertReply(qnaBean, new_qna_re_ref);
		
		if(insertResult > 0) {//insertResult가 0보다크면
			commit(con);
			isInsertSuccess = true;
		}else {
			rollback(con);
		}
		
		return isInsertSuccess;
	}
	
	//답변 수정 서비스로직
	public int updateReply(QnaBean qnaBean)throws Exception{
		int isUpdateReply = 0;
		
		Connection con = getConnection();
		QnaReplyDAO qnaReplyDAO = QnaReplyDAO.getInstance(); 
		qnaReplyDAO.setConnection(con);
		
		isUpdateReply = qnaReplyDAO.updateReply(qnaBean);
		return isUpdateReply;
	}
	
	//답변 삭제 서비스로직
	public int deleteReply(int qna_reply_num) {
		int isDeleteReply = 0;
		
		Connection con = getConnection();
		QnaReplyDAO qnaReplyDAO = QnaReplyDAO.getInstance(); 
		qnaReplyDAO.setConnection(con);
		
		isDeleteReply = qnaReplyDAO.deleteReply(qna_reply_num);
		
		return isDeleteReply;
		
		
	}
}
