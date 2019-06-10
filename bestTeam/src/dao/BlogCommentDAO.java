package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BlogCommentBean;
import vo.QnaBean;
import vo.UserBean;

public class BlogCommentDAO {
	private BlogCommentDAO() {
	}

	private static BlogCommentDAO instance;

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public static BlogCommentDAO getInstance() {
		if (instance == null) {
			instance = new BlogCommentDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 댓글 등록 메소드
	public int insertComment(BlogCommentBean blogCommentBean) {
		int insertCount = 0;

		String sql = "INSERT INTO blog_comment VALUES (null,?,?,now(),?)";

		try {
			pstmt = con.prepareStatement(sql);
//			con.setAutoCommit(false);
			
//			pstmt.setInt(1, blogCommentBean.getComment_num());
			pstmt.setString(1, blogCommentBean.getComment_content());
			pstmt.setString(2, blogCommentBean.getComment_writer());
			pstmt.setInt(3, blogCommentBean.getComment_blog_num());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("CommentDAO에서 댓글등록 실패!");
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return insertCount;

	}

	// 댓글쓰기 창에서 유저정보 가져오기
			public UserBean getUserInfo(String id) {
				UserBean userBean = null;
			    
			    String sql = "select * from user where user_id=?";
			    try {
			      pstmt = con.prepareStatement(sql);
			      pstmt.setString(1, id);
			      rs = pstmt.executeQuery();
			      
			      if(rs.next()) {
			        userBean = new UserBean();
			        
			        userBean.setUser_id(rs.getString("user_id"));
			        userBean.setUser_pass(rs.getString("user_pass"));
			        userBean.setUser_name(rs.getString("user_name"));
			        userBean.setUser_age(rs.getString("user_age"));
			        userBean.setUser_gender(rs.getString("user_gender"));
			        userBean.setUser_address(rs.getString("user_address"));
			        userBean.setUser_phone(rs.getString("user_phone"));
			        userBean.setUser_email(rs.getString("user_email"));
			        userBean.setUser_post(rs.getString("user_post"));
			        
			      }
			    } catch (SQLException e) {
			      e.printStackTrace();
			    } finally {
			      close(rs);
			      close(pstmt);
			    }
			    return userBean;
			}
			
	// 댓글 수정 메소드
	public int updateComment(BlogCommentBean commentBean) {
		int updateCount = 0;

		String sql = "UPDATE comment_blog SET comment_content=? WHERE comment_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, commentBean.getComment_content());
			pstmt.setInt(2, commentBean.getComment_num());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	// 댓글 삭제 메소드
	public int deleteComment(int comment_num) {
		int deleteCount = 0;

		String sql = "DELETE FROM comment_blog WHERE comment_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	// 댓글 갯수 매소드
	public int countComment(int comment_blog_num) throws SQLException {
		int count = 0;

		String sql = "SELECT COUNT(*) FROM comment_blog WHERE comment_blog_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, comment_blog_num);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			count = rs.getInt(1);
		}
		close(pstmt);
		return count;
	}

	// 댓글 목록 가져오기
	public ArrayList<BlogCommentBean> listComment(int blog_num) throws SQLException {
		ArrayList<BlogCommentBean> articleList = new ArrayList<>();
		String sql = "SELECT * FROM blog_comment WHERE comment_blog_num=? ORDER BY comment_num ASC";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, blog_num);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			BlogCommentBean commentBean = new BlogCommentBean();
			commentBean.setComment_num(rs.getInt("comment_num"));
			commentBean.setComment_content(rs.getString("comment_content"));
			commentBean.setComment_writer(rs.getString("comment_writer"));
			commentBean.setComment_date(rs.getDate("comment_date"));
			commentBean.setComment_blog_num(rs.getInt("comment_blog_num"));
			articleList.add(commentBean);
		}
		close(pstmt);
		return articleList;
	}

	// 댓글 목록 갯수 구하기
	public int selectListCount() {
		System.out.println("selectListCount()");
		int listCount = 0;

		// SELECT 구문 사용하여 게시물 수 카운트하여 listCount 에 저장
		String sql = "SELECT count(*) FROM blog_comment";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1); // 조회된 목록 갯수 저장
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<BlogCommentBean> selectArticleList(int page, int limit) {
		System.out.println("selectArticleList()");

		ArrayList<BlogCommentBean> article2 = new ArrayList<BlogCommentBean>();
		BlogCommentBean blogCommentBean = null;

		int startRow = (page - 1) * 10; // 읽기 시작할 row 번호

		String sql = "SELECT * FROM blog_comment where comment_num=? ORDER BY qna_num DESC,qna_num ASC LIMIT ?,10 ";
		// => 지정 row 번호부터 10개 조회

		try {
			pstmt = con.prepareStatement(sql);
			int comment_num = 0;
			pstmt.setInt(1, comment_num);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 1개 게시물 레코드 읽어와서 blogCommentBean 객체에 저장
				blogCommentBean = new BlogCommentBean();

				blogCommentBean.setComment_num(rs.getInt("comment_num"));
				blogCommentBean.setComment_content(rs.getString("comment_content"));
				blogCommentBean.setComment_writer(rs.getString("comment_writer"));
				blogCommentBean.setComment_date(rs.getDate("comment_date"));
				blogCommentBean.setComment_blog_num(rs.getInt("comment_blog_num"));

				article2.add(blogCommentBean); // ArrayList 객체에 레코드 단위로 저장

			}
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectArticleList() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return article2;
	}

	


}
