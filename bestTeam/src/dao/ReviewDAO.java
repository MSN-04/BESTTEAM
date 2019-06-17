package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import vo.BlogBean;
import vo.ItemBean;
import vo.ReviewBean;
import vo.UserBean;

import static db.JdbcUtil.*;

public class ReviewDAO {
	// -------------------------------------------------------------------
	// 싱글톤 디자인 패턴을 활용하여 1개의 인스턴스를 생성하여 공유
	private ReviewDAO() {}
	private static ReviewDAO instance;
	public static ReviewDAO getInstance() {
		// BoardDAO 객체를 저장하는 변수 instance 가 null 일 때만 인스턴스 생성
		if(instance == null) {
			instance = new ReviewDAO();
		}
		
		return instance;
	}
	// -------------------------------------------------------------------
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void setConnection(Connection con) {
		this.con = con; // Service 클래스로부터 전달받은 DB 연결 객체(Connection 객체)를 멤버변수에 저장
	}
	
	
	
	// 글 등록 처리 : insertArticle() => BoardBean 객체 전달받음 => 실행 결과 레코드 수를 리턴
	public int insertArticle(ReviewBean reviewBean) {
		int num=0;
		int insertCount = 0;
		int user_id=0;
		
			
		
		
		String sql="select MAX(review_num) from REVIEW";
		
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}
		
		sql = "INSERT INTO REVIEW VALUES(?,?,?,?,?,?,?,now(),?)";
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, reviewBean.getReview_item_num());
			pstmt.setString(3, reviewBean.getReview_user_id());
			pstmt.setString(4, reviewBean.getReview_content());
			pstmt.setInt(5, reviewBean.getReview_readcount());
			pstmt.setFloat(6, reviewBean.getReview_rate());
			pstmt.setString(7, reviewBean.getReview_img());
			pstmt.setString(8, reviewBean.getReview_subject());
			insertCount = pstmt.executeUpdate(); // INSERT 실행 결과를 int 타입으로 리턴 받음
			
			
	        
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("INSERT 에러 : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt); // 자원 반환
		}
		
		return insertCount;
		
	}
	
	
	// 글 목록 갯수 구하기
	public int selectListCount() {
//		System.out.println("selectListCount()");
		
		int listCount = 0;
		
		// SELECT 구문 사용하여 게시물 수 카운트하여 listCount 에 저장
		String sql = "SELECT count(*) FROM REVIEW";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt("count(*)"); // 조회된 목록 갯수 저장
			}
			
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectListCount() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	// 글 목록 가져오기
	public ArrayList<ReviewBean> selectArticleList(int page, int limit) {
//		System.out.println("selectArticleList()");
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean reviewBean = null;
		
		
		
		String sql = "SELECT * FROM REVIEW ORDER BY review_num desc limit ? , ?";
		// => 참조글번호 내림차순 & 답글순서번호 오름차순 정렬
		// => 지정 row 번호부터 10개 조회
		
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (page - 1) * 10; // 읽기 시작할 row 번호
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				reviewBean = new ReviewBean();
				
				reviewBean.setReview_num(rs.getInt("review_num"));
				reviewBean.setReview_item_num(rs.getInt("review_item_num"));
				reviewBean.setReview_user_id(rs.getString("review_user_id"));
				reviewBean.setReview_content(rs.getString("review_content"));
				reviewBean.setReview_readcount(rs.getInt("review_readcount"));
				reviewBean.setReview_rate(rs.getFloat("review_rate"));
				reviewBean.setReview_img(rs.getString("review_img"));
				reviewBean.setReview_date(rs.getDate("review_date"));
				reviewBean.setReview_subject(rs.getString("review_subject"));
				
				
				
				articleList.add(reviewBean); // ArrayList 객체에 레코드 단위로 저장
				
//				System.out.println(rs.getInt("board_num"));
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectArticleList() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}


	// 글번호(board_num) 에 해당하는 레코드 정보 조회 => BoardBean 객체에 저장하여 리턴
	public ReviewBean selectArticle(int review_num) {
		ReviewBean reviewBean = null;
		
		String sql = "SELECT * FROM REVIEW WHERE review_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewBean = new ReviewBean();
				
				reviewBean.setReview_item_num(rs.getInt("review_item_num"));
				reviewBean.setReview_user_id(rs.getString("review_user_id"));
				reviewBean.setReview_content(rs.getString("review_content"));
				reviewBean.setReview_readcount(rs.getInt("review_readcount"));
				reviewBean.setReview_rate(rs.getFloat("review_rate"));
				reviewBean.setReview_img(rs.getString("review_img"));
				reviewBean.setReview_date(rs.getDate("review_date"));
				reviewBean.setReview_subject(rs.getString("review_subject"));
				reviewBean.setReview_num(rs.getInt("review_num"));
			}
			
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectArticle() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
				
		return reviewBean;
	}
	
	
	// 게시물 조회수 업데이트 => 기존 readcount 값을 1 증가시킨 후 결과값을 리턴
	public int updateReadcount(int review_num) {
		int updateCount = 0;
		
		// board_num 에 해당하는 레코드의 board_readcount 값을 1 증가시키기
		String sql = "UPDATE REVIEW SET review_readcount=review_readcount+1 WHERE review_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			updateCount = pstmt.executeUpdate();
//			System.out.println(updateCount);
		} catch (SQLException e) {
			System.out.println("selectArticle() 실패! : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	
	
	// 게시물 작성자 본인 확인 - 게시물 번호와 입력된 패스워드를 읽어와서 확인 후 true/false 리턴
	public void isArticleBoardWriter(int blog_num) {
//		System.out.println("BoardDAO - isArticleBoardWriter");
		// 전체 레코드에서 글번호(board_num) 이 일치하는 레코드 찾기
		// => 조회된 레코드에서 패스워드(board_pass) 가 전달받은 패스워드와 일치하면 isWriter 변수를 true 변경
		
		
		String sql = "SELECT * FROM blog WHERE blog_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, blog_num);
			rs = pstmt.executeQuery();
			
			
			
		} catch (SQLException e) {
			System.out.println("isArticleBoardWriter() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
	}

	// 글 수정
	public int updateArticle(ReviewBean article) {
		int updateCount = 0;
		
		// BoardBean 객체의 board_num 에 해당하는 레코드를 수정
		// => 글제목(board_subject), 글내용(content) 수정
		String sql = "UPDATE REVIEW SET review_subject=?,review_content=?,review_img=? WHERE review_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getReview_subject());
			pstmt.setString(2, article.getReview_content());
			pstmt.setString(3, article.getReview_img());
			pstmt.setInt(4, article.getReview_num());
			updateCount = pstmt.executeUpdate();
			System.out.println(updateCount);
		} catch (SQLException e) {
			System.out.println("updateArticle() 실패! : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}


	public int deleteArticle(int review_num) {
		int deleteCount=0;
		
		String sql="delete from REVIEW where review_num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			deleteCount=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle() 실패!"+e.getMessage());
		}finally {
			close(pstmt);
		}
		
		
		return deleteCount;
	}
	
	// 글쓰기 페이지에서 글쓴이 정보 가져오기
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
}




















