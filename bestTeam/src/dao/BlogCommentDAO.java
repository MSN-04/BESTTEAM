package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BlogCommentBean;


public class BlogCommentDAO {
private BlogCommentDAO() {}
private static BlogCommentDAO instance;

Connection con;
PreparedStatement pstmt;
ResultSet rs;

public static BlogCommentDAO getInstance() {
	if(instance ==null) {
		instance = new BlogCommentDAO();
	}
	return instance;
	}

//댓글 등록 메소드
public void setConnection(Connection con) {
	this.con = con;
	}
	//댓글 등록 메소드
	public int insertComment(BlogCommentBean commentBean) {
		int insertCount = 0;
		
		String sql = "INSERT INTO comment_blog(comment_num,comment_content,comment_writer,comment_date,comment_blog_num) VALUES(null,?,?,NOW(),?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, commentBean.getComment_content());
			pstmt.setString(2, commentBean.getComment_writer());
			pstmt.setInt(3, commentBean.getComment_blog_num());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("CommentDAO에서 댓글등록 실패!");
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertCount;
		
	}
	
	//댓글 수정 메소드
	public int updateComment(BlogCommentBean commentBean) {
		int updateCount = 0;
		
		String sql ="UPDATE comment_blog SET comment_content=? WHERE comment_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, commentBean.getComment_content());
			pstmt.setInt(2, commentBean.getComment_num());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return updateCount;
	}
	
	//댓글 삭제 메소드
	
	public int deleteComment(int comment_num, String comment_writer) {
		int deleteCount = 0;
		
		String sql = "DELETE FROM comment_blog WHERE comment_num=? AND comment_writer=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			pstmt.setString(2, comment_writer);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteCount;
	}
	
	//댓글 갯수 매소드
	public int countComment(int comment_blog_num)throws SQLException{
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM comment_blog WHERE comment_blog_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, comment_blog_num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt(1);
		}
		close(pstmt);
		return count;
	}
	
	//댓글 리스트 메소드
	public ArrayList<BlogCommentBean> listComment(int comment_blog_num) throws SQLException{
		ArrayList<BlogCommentBean> list = new ArrayList<>();
		String sql ="SELECT * FROM comment_blog WHERE comment_blog_num=? ORDER BY comment_num ASC";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, comment_blog_num);
		rs = pstmt.executeQuery();
		while(rs.next()){
			BlogCommentBean commentBean = new BlogCommentBean();
			commentBean.setComment_num(rs.getInt("comment_num"));
			commentBean.setComment_content(rs.getString("comment_content"));
			commentBean.setComment_writer(rs.getString("comment_content"));
			commentBean.setComment_date(rs.getDate("comment_date"));
			commentBean.setComment_blog_num(rs.getInt("comment_blog_num"));
			list.add(commentBean);
		}
		close(pstmt);
		return list;
	}
	
	
}































