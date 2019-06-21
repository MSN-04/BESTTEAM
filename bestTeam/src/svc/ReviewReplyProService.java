package svc;



import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.QnaReplyDAO;
import dao.ReviewReplyDAO;
import vo.QnaBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

//Qna답글 등록 요청에 대한 비즈니스 로직을 구현하는 클래스
public class ReviewReplyProService {

	//답변 등록 서비스로직
	public boolean insertReply(ReviewBean reviewBean, int new_review_re_ref) throws Exception{
//		System.out.println("리뷰ReplyInsertProService");
		
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		ReviewReplyDAO reviewReplyDAO = ReviewReplyDAO.getInstance(); 
		reviewReplyDAO.setConnection(con);
		
		//답변 등록결과를 insertResult에 저장
		int insertResult = reviewReplyDAO.insertReply(reviewBean, new_review_re_ref);
		
		if(insertResult > 0) {//insertResult가 0보다크면
			commit(con);
			isInsertSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertSuccess;
	}
	
	//답변 수정 서비스로직
	public int updateReply(ReviewBean reviewBean)throws Exception{
		int isUpdateReply = 0;
		
		Connection con = getConnection();
		ReviewReplyDAO reviewReplyDAO = ReviewReplyDAO.getInstance(); 
		reviewReplyDAO.setConnection(con);
		
		isUpdateReply = reviewReplyDAO.updateReply(reviewBean);
		
		close(con);
		
		return isUpdateReply;
	}
	
	//답변 삭제 서비스로직
	public int deleteReply(int review_reply_num) {
		int isDeleteReply = 0;
		
		Connection con = getConnection();
		ReviewReplyDAO reviewReplyDAO = ReviewReplyDAO.getInstance(); 
		reviewReplyDAO.setConnection(con);
		
		isDeleteReply = reviewReplyDAO.deleteReply(review_reply_num);
		
		
		close(con);
		
		return isDeleteReply;
	}
}
