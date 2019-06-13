package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.NoticeBean;

public class NoticeDAO {
	// -------------------------------------------------------------------
	// 싱글톤 디자인 패턴을 활용하여 1개의 인스턴스를 생성하여 공유
	private NoticeDAO() {}
	private static NoticeDAO instance;
	public static NoticeDAO getInstance() {
		// noticeDAO 객체를 저장하는 변수 instance 가 null 일 때만 인스턴스 생성
		if (instance == null) {
			instance = new NoticeDAO();
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

	// 글 등록 처리 : insertArticle() => NoticeBean 객체 전달받음 => 실행 결과 레코드 수를 리턴
	public int insertArticle(NoticeBean noticeBean) {
		// 현재 전체 게시물 마지막 번호를 찾아서 + 1(새로운 게시물 번호 계산)
		int num = 0;
		int insertCount = 0;

		String sql = "SELECT MAX(notice_num) FROM notice";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
				// 최대 게시물 번호 + 1
			}

			sql = "INSERT INTO notice VALUES(?,'admin',?,?,0,'a',now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); // 계산된 새 게시물 번호
//			pstmt.setString(2, noticeBean.getNotice_writer());
			pstmt.setString(2, noticeBean.getNotice_subject());
			pstmt.setString(3, noticeBean.getNotice_content());
//			pstmt.setInt(5, noticeBean.getNotice_readcount());
//			pstmt.setString(6, noticeBean.getNotice_file());
//			pstmt.setDate(7, noticeBean.getNotice_date()); 
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
		String sql = "SELECT count(*) FROM notice";

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
	public ArrayList<NoticeBean> selectArticleList(int page, int limit) {
		System.out.println("selectArticleList()");

		ArrayList<NoticeBean> articleList = new ArrayList<NoticeBean>();
		NoticeBean noticeBean = null;

		int startRow = (page - 1) * 10; // 읽기 시작할 row 번호

		String sql = "SELECT * FROM notice ORDER BY notice_num DESC,notice_num ASC LIMIT ?,10";
		// => 지정 row 번호부터 10개 조회

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 1개 게시물 레코드 읽어와서 noticeBean 객체에 저장
				noticeBean = new NoticeBean();

				noticeBean.setNotice_num(rs.getInt("notice_num"));
				noticeBean.setNotice_writer(rs.getString("notice_writer"));
				noticeBean.setNotice_subject(rs.getString("notice_subject"));
				noticeBean.setNotice_content(rs.getString("notice_content"));
				noticeBean.setNotice_readcount(rs.getInt("notice_readcount"));
//				NoticeBean.setNotice_file(rs.getString("notice_file"));
				noticeBean.setNotice_date(rs.getDate("notice_date"));

				articleList.add(noticeBean); // ArrayList 객체에 레코드 단위로 저장

//				System.out.println(rs.getInt("notice_num"));
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

	// 글번호(notice_num) 에 해당하는 레코드 정보 조회 => noticeBean 객체에 저장하여 리턴
	public NoticeBean selectArticle(int notice_num) {
		NoticeBean noticeBean = null;

		String sql = "SELECT * FROM notice WHERE notice_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				noticeBean = new NoticeBean();

				noticeBean.setNotice_num(rs.getInt("notice_num"));
				noticeBean.setNotice_writer(rs.getString("notice_writer"));
				noticeBean.setNotice_subject(rs.getString("notice_subject"));
				noticeBean.setNotice_content(rs.getString("notice_content"));
				noticeBean.setNotice_readcount(rs.getInt("notice_readcount"));
				noticeBean.setNotice_file(rs.getString("notice_file"));
				noticeBean.setNotice_date(rs.getDate("notice_date"));
			}

		} catch (SQLException e) {
			System.out.println("selectArticle() 실패! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}

		return noticeBean;
	}

	// 게시물 조회수 업데이트 => 기존 readcount 값을 1 증가시킨 후 결과값을 리턴
	public int updateReadcount(int notice_num) {
		int updateCount = 0;

		// notice_num 에 해당하는 레코드의 notice_readcount 값을 1 증가시키기
		String sql = "UPDATE notice SET notice_readcount=notice_readcount+1 WHERE notice_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			updateCount = pstmt.executeUpdate();
//			System.out.println(updateCount);
		} catch (SQLException e) {
			System.out.println("selectArticle() 실패! : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	
	// 리스트에서 이전글 가져오기
//		public int getBefore(int notice_num) {
//			int preNum = 0;
//
//
//			String sql = "select notice_num, notice_subject from notice where notice_num=(select max(notice_num) from notice where notice_num < ?)";
//
//			try {
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, notice_num);
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) {
//					preNum = rs.getInt("notice_num");
//				}
//
//			} catch (SQLException e) {
//				System.out.println("selectArticle() 실패! : " + e.getMessage());
//			} finally {
//				close(rs);
//				close(pstmt);
//			}
//
//			return notice_num;
//		}
	
	
//	// 게시물 작성자 본인 확인 - 게시물 번호와 입력된 패스워드를 읽어와서 확인 후 true/false 리턴
//	public boolean isArticlenoticeWriter(int notice_num, String pass) {
////		System.out.println("NoticeDAO - isArticlenoticeWriter");
//		// 전체 레코드에서 글번호(notice_num) 이 일치하는 레코드 찾기
//		// => 조회된 레코드에서 패스워드(notice_pass) 가 전달받은 패스워드와 일치하면 isWriter 변수를 true 변경
//		boolean isWriter = false;
//		
//		String sql = "SELECT * FROM notice WHERE notice_num=?";
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, notice_num);
//			rs = pstmt.executeQuery();
//			
//		} catch (SQLException e) {
//			System.out.println("isArticlenoticeWriter() 실패! : " + e.getMessage());
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return isWriter;
//	}

	// 글 수정
	public int updateArticle(NoticeBean noticeBean) {
		int updateCount = 0;

		// noticeBean 객체의 notice_num 에 해당하는 레코드를 수정
		String sql = "UPDATE notice SET notice_subject=?,notice_content=? WHERE notice_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeBean.getNotice_subject());
			pstmt.setString(2, noticeBean.getNotice_content());
			pstmt.setInt(3, noticeBean.getNotice_num());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateArticle() 실패! : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	public int deleteArticle(int notice_num) {
		int deleteCount=0;
		
		String sql="delete from notice where notice_num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			deleteCount=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle() 실패!"+e.getMessage());
		}finally {
			close(pstmt);
		}
		
		
		return deleteCount;
	}

}
