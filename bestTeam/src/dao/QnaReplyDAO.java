package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.QnaBean;

//Qna답글DAO
public class QnaReplyDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public QnaReplyDAO() {}
	
	private static QnaReplyDAO instance; //싱글톤 패턴을 위한 인스턴스
	
	public static QnaReplyDAO getInstance() { 
		
		if(instance == null) {
			instance = new QnaReplyDAO();
		}
		
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	//qna답글 등록 메서드
		public int insertReply(QnaBean qnaBean, int new_qna_re_ref) {
			int result = 0; //리턴할 결과를 저장할 변수
			
			//해당 게시물의 기존 답글 순번을 1씩 증가시키는 쿼리(답글간의 순서)
			
//			String sql = "UPDATE qna SET qna_re_seq = qna_re_seq+1 WHERE qna_re_ref =? AND qna_re_seq > ?";
			
			String sql1 = "INSERT INTO qna VALUES(null,?,?,?,?,NOW(),?,1,1,'admin')";
			
			
			try {
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, qna_re_ref);
//				pstmt.setInt(2, qna_re_seq);
				
//				pstmt.executeUpdate();
	   
//				qna_re_seq = qna_re_seq +1;
//				qna_re_lev = qna_re_lev +1;
				
				pstmt = con.prepareStatement(sql1);
//				pstmt.setInt(1, qnaBean.getQna_num());
				pstmt.setInt(1, qnaBean.getQna_item_num());
				pstmt.setString(2, qnaBean.getQna_writer());
				pstmt.setString(3, qnaBean.getQna_subject());
				pstmt.setString(4, qnaBean.getQna_content());
				pstmt.setInt(5, new_qna_re_ref);
//				pstmt.setInt(6, qna_re_lev);
//				pstmt.setInt(7, qna_re_seq);
				
				result = pstmt.executeUpdate();


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(rs != null){ try{ rs.close(); }catch(SQLException se){ } }
				if(pstmt != null){ try{ pstmt.close(); }catch(SQLException se){ } }
			}

			return result;
		}
		
		//답글 수정 메소드
		public int updateReply(QnaBean qnaBean ) {
			int updateResult = 0;
			
			String sql = "UPDATE qna SET qna_content=? WHERE qna_writer=? AND qna_re_ref=?,qna_re_seq=?"; 
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, qnaBean.getQna_content());
				pstmt.setString(2, qnaBean.getQna_writer());
				pstmt.setInt(3, qnaBean.getQna_re_ref());
				pstmt.setInt(4, qnaBean.getQna_re_seq());
				updateResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return updateResult;
		}
		
		//답변 삭제 메소드
		public int deleteReply(int qna_reply_num) {
			int deleteResult = 0;
			
			String sql = "DELETE FROM qna WHERE qna_num=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qna_reply_num);
				deleteResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return deleteResult;
		}
}
