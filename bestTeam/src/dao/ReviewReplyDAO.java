package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.QnaBean;
import vo.ReviewBean;

//Qna답글DAO
public class ReviewReplyDAO {
	
	
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public ReviewReplyDAO() {}
	
	private static ReviewReplyDAO instance; //싱글톤 패턴을 위한 인스턴스
	
	public static ReviewReplyDAO getInstance() { 
		
		if(instance == null) {
			instance = new ReviewReplyDAO();
		}
		
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//review답글 등록 메서드
		public int insertReply(ReviewBean reviewBean, int new_review_re_ref) {
			int result = 0; //리턴할 결과를 저장할 변수
			int num = 0;
			//해당 게시물의 기존 답글 순번을 1씩 증가시키는 쿼리(답글간의 순서)
			
			
			String sql="select MAX(review_num) from REVIEW";
			String sql1 = "INSERT INTO REVIEW VALUES(?,?,?,?,null,NOW(),?,?,1,1,'admin')";
			
			try {
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					num=rs.getInt(1)+1;
				}
				
				pstmt = con.prepareStatement(sql1);
				pstmt.setInt(1, num);
				pstmt.setInt(2, reviewBean.getReview_item_num());
				pstmt.setString(3, reviewBean.getReview_user_id());
				pstmt.setString(4, reviewBean.getReview_content());
				pstmt.setString(5, reviewBean.getReview_subject());
				pstmt.setInt(6, new_review_re_ref);
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
		public int updateReply(ReviewBean reviewBean ) {
			int updateResult = 0;
			
			String sql = "UPDATE REVIEW SET review_content=? WHERE review_user_id=? AND review_re_ref=?,review_re_seq=?"; 
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, reviewBean.getReview_content());
				pstmt.setString(2, reviewBean.getReview_user_id());
				pstmt.setInt(3, reviewBean.getReview_re_ref());
				pstmt.setInt(4, reviewBean.getReview_re_seq());
				updateResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return updateResult;
		}
		
		//답변 삭제 메소드
		public int deleteReply(int review_reply_num) {
			int deleteResult = 0;
			
			String sql = "DELETE FROM REVIEW WHERE review_num=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, review_reply_num);
				deleteResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return deleteResult;
		}
}
