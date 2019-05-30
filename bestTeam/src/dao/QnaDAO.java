package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.QnaBean;
import vo.UserBean;

public class QnaDAO {
	// -------------------------------------------------------------------
	// 싱글톤 디자인 패턴을 활용하여 1개의 인스턴스를 생성하여 공유
	private QnaDAO() {
	}
	private static QnaDAO instance;

	public static QnaDAO getInstance() {
		// qnaDAO 객체를 저장하는 변수 instance 가 null 일 때만 인스턴스 생성
		if (instance == null) {
			instance = new QnaDAO();
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

	// 글 등록 처리 : insertArticle() => QnaBean 객체 전달받음 => 실행 결과 레코드 수를 리턴
	public int insertArticle(QnaBean qnaBean) {
		// 현재 전체 게시물 마지막 번호를 찾아서 + 1(새로운 게시물 번호 계산)
		int num = 0;
		int insertCount = 0;

		String sql = "SELECT MAX(qna_num) FROM qna";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
				// 최대 게시물 번호 + 1
			}

			sql = "INSERT INTO qna VALUES(?,'Tinkervell',?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
//			pstmt.setString(1, qnaBean.getQna_writer());
			pstmt.setString(2, qnaBean.getQna_subject());
			pstmt.setString(3, qnaBean.getQna_content());
			insertCount = pstmt.executeUpdate();
			// INSERT 실행 결과를 int 타입으로 리턴 받음

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
		System.out.println("selectListCount()");

		int listCount = 0;

		// SELECT 구문 사용하여 게시물 수 카운트하여 listCount 에 저장
		String sql = "SELECT count(*) FROM qna";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1); // 조회된 목록 갯수 저장
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
	public ArrayList<QnaBean> selectArticleList(int page, int limit) {
		System.out.println("selectArticleList()");

		ArrayList<QnaBean> articleList = new ArrayList<QnaBean>();
		QnaBean qnaBean = null;

		int startRow = (page - 1) * 10; // 읽기 시작할 row 번호

		String sql = "SELECT * FROM qna ORDER BY qna_num DESC,qna_num ASC LIMIT ?,10";
		// => 지정 row 번호부터 10개 조회

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 1개 게시물 레코드 읽어와서 qnaBean 객체에 저장
				qnaBean = new QnaBean();

				qnaBean.setQna_num(rs.getInt("qna_num"));
				qnaBean.setQna_writer(rs.getString("qna_writer"));
				qnaBean.setQna_subject(rs.getString("qna_subject"));
				qnaBean.setQna_content(rs.getString("qna_content"));
				qnaBean.setQna_date(rs.getDate("qna_date"));

				articleList.add(qnaBean); // ArrayList 객체에 레코드 단위로 저장

//				System.out.println(rs.getInt("qna_num"));
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

	// 글번호(qna_num) 에 해당하는 레코드 정보 조회 => qnaBean 객체에 저장하여 리턴
	public QnaBean selectArticle(int qna_num) {
		QnaBean qnaBean = null;

		String sql = "SELECT * FROM qna WHERE qna_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
//			pstmt.setString(2, Qna_subject);
//			pstmt.setString(3, Qna_content);
//			pstmt.setInt(4, x);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				qnaBean = new QnaBean();

				qnaBean.setQna_num(rs.getInt("qna_num"));
				qnaBean.setQna_writer(rs.getString("qna_writer"));
				qnaBean.setQna_subject(rs.getString("qna_subject"));
				qnaBean.setQna_content(rs.getString("qna_content"));
				qnaBean.setQna_date(rs.getDate("qna_date"));
			}

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectArticle() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return qnaBean;
	}

	// 글쓰기 페이지에서 글쓴이 정보 가져오기
			public ArrayList getUserInfo(String id) {
			    
				ArrayList beans = new ArrayList<>();
				UserBean userBean = null;
			    QnaBean qnaBean = null;
			    
			    String sql = "select * from user where user_id=?";
			    try {
			      pstmt = con.prepareStatement(sql);
			      pstmt.setString(1, id);
			      rs = pstmt.executeQuery();
			      
			      if(rs.next()) {
			        userBean = new UserBean();
			        
			        userBean.setUser_id(rs.getString("user_id"));
//			        userBean.setUser_pass(rs.getString("user_pass"));
			        userBean.setUser_name(rs.getString("user_name"));
//			        userBean.setUser_age(rs.getString("user_age"));
//			        userBean.setUser_gender(rs.getString("user_gender"));
//			        userBean.setUser_address(rs.getString("user_address"));
			        userBean.setUser_phone(rs.getString("user_phone"));
			        userBean.setUser_email(rs.getString("user_email"));
//			        userBean.setUser_post(rs.getString("user_post"));
			        
			        qnaBean = new QnaBean();
			        
			        qnaBean.setQna_num(rs.getInt("qna_num"));
			        qnaBean.setQna_writer(rs.getString("qna_writer"));
			        qnaBean.setQna_subject(rs.getString("qna_subject"));
			        qnaBean.setQna_content(rs.getString("qna_content"));
			        qnaBean.setQna_date(rs.getDate("qna_date"));
			        
			        beans.add(userBean);
					beans.add(qnaBean);
			      }
			    } catch (SQLException e) {
			      e.printStackTrace();
			    } finally {
			      close(rs);
			      close(pstmt);
			    }
			    return beans;
			  }
	 //게시물 조회수 업데이트 => 기존 readcount 값을 1 증가시킨 후 결과값을 리턴
	public int updateReadcount(int qna_num) {
		int updateCount = 0;

		// qna_num 에 해당하는 레코드의 qna_readcount 값을 1 증가시키기
		String sql = "UPDATE qna SET qna_readcount=qna_readcount+1 WHERE qna_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
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
	public boolean isArticleqnaWriter(int qna_num) {
//		System.out.println("QnaDAO - isArticleqnaWriter");
		// 전체 레코드에서 글번호(qna_num) 이 일치하는 레코드 찾기
		// => 조회된 레코드에서 패스워드(qna_pass) 가 전달받은 패스워드와 일치하면 isWriter 변수를 true 변경
		boolean isWriter = false;
		
		String sql = "SELECT * FROM qna WHERE qna_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("isArticleqnaWriter() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isWriter;
	}

	// 글 수정
	public int updateArticle(QnaBean article) {
		int updateCount = 0;

		// qnaBean 객체의 qna_num 에 해당하는 레코드를 수정
		String sql = "UPDATE qna SET qna_subject=?,qna_content=? WHERE qna_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getQna_subject());
			pstmt.setString(2, article.getQna_content());
			pstmt.setInt(3, article.getQna_num());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateArticle() 실패! : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	public int deleteArticle(int qna_num) {
		int deleteCount=0;
		
		String sql="delete from qna where qna_num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			deleteCount=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle() 실패!"+e.getMessage());
		}finally {
			close(pstmt);
		}
		
		
		return deleteCount;
	}


}
